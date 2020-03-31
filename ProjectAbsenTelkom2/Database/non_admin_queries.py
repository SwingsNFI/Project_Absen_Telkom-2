from test1.models import *
from django.utils import timezone

# --login siswa
# SELECT id_siswa, nama_siswa, email_siswa, id_kelas FROM tbl_siswa WHERE id_siswa ='$id' AND password_siswa='$pass';

id_siswa = "20181"
password_siswa = "oiuqirmhjc"

Tbl_siswa.objects.get(id_siswa__exact=id_siswa, password_siswa__exact=password_siswa)

# siswa absen
# Ingat untuk menggunakan id_acara

id_nama_acara = "1"
id_siswa = "20181"

# INSERT INTO tbl_absen(id_acara, id_siswa) VALUES ((SELECT id_acara FROM tbl_acara WHERE id_nama_acara = $id_nama_acara AND waktu_acara >= DATE(NOW()) ORDER BY waktu_acara ASC LIMIT 1), '$id_siswa')
insert = Tbl_absen()
insert.id_acara = Tbl_acara.objects.filter(id_nama_acara__exact=id_acara, waktu_acara__gte=timezone.now().date())[0]
insert.id_siswa = Tbl_siswa(id_siswa=id_siswa)
insert.save()

# INSERT INTO tbl_absensi_ami(id_jampel, id_acara, id_siswa, kehadiran, kerapihan, kebersihan) VALUES ('$id_jampel', (SELECT id_acara FROM tbl_acara WHERE id_nama_acara = '3' AND waktu_acara >= DATE(NOW()) ORDER BY waktu_acara ASC LIMIT 1), '$id_siswa', '$kehadiran', '$kerapihan', '$kebersihan');
insert = Tbl_absen_ami()
insert.id_jampel = Tbl_jampel(id_jampel=1)
insert.id_acara = Tbl_acara.objects.filter(id_nama_acara__exact=3, waktu_acara__gte=timezone.now().date())[0]
insert.id_siswa = Tbl_siswa(id_siswa=id_siswa)
insert.kehadiran = True
insert.kerapihan = True
insert.kebersihan = True
insert.save()

# --login guru
# SELECT id_guru, nama_guru, hak_akses FROM tbl_guru WHERE id_guru ='$id' AND password_guru='$pass';

id_guru = "30123"
password_guru = "24cc4cc0f3b6c3c562bf7ecab4cb70a44b8779f9114582312667f24b12f34740"

Tbl_guru.objects.get(id_guru__exact=id_guru, password_guru__exact=password_guru)

# --absen siwa
# SELECT * FROM tbl_absen
# INNER JOIN tbl_siswa ON tbl_siswa.id_siswa = tbl_absen.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# WHERE tbl_acara.id_nama_acara = '1'
# AND tbl_absen.waktu_absensi BETWEEN DATE(NOW()) AND DATE(DATE_ADD(NOW(), INTERVAL 1 DAY))
# AND tbl_siswa.id_kelas = 'X1';

id_nama_acara = "1"
id_kelas = "X1"

Tbl_absen.objects.select_related("id_acara", "id_siswa").filter(id_acara__id_nama_acara=id_nama_acara, waktu_absensi__range=(timezone.now().date(), timezone.now().date() + timezone.timedelta(1)), id_siswa__id_kelas=id_kelas)

# --Hitung total poin siswa selama 7 hari yang lalu sampai hari ini
SELECT (SELECT COUNT(*) FROM tbl_absen 
INNER JOIN tbl_acara ON tbl_absen.id_acara = tbl_acara.id_acara 
WHERE EXISTS (SELECT * FROM tbl_validasi WHERE tbl_absen.id_absen = tbl_validasi.id_absen) 
AND id_siswa="20181" AND waktu_acara between CURDATE()-7 and CURDATE()) 
+ 
( SELECT COUNT(*) FROM tbl_absensi_ami 
INNER JOIN Tbl_acara ON tbl_absensi_ami.id_acara = tbl_acara.id_acara
WHERE kehadiran=1 AND kerapihan=1 AND kebersihan=1 
AND id_siswa="20181" AND waktu_acara between CURDATE()-7 and CURDATE()) AS Poin
;



# --cek absen yang udah di validasi
# SELECT * FROM tbl_absen WHERE id_absen IN (SELECT id_absen FROM tbl_validasi);


# --cek absen

# --daftar nama siswa dan kehadiran dan validasi  
SELECT
    tbl_siswa.nama_siswa,
    tbl_kelas.nama_kelas,
    IF(tbl_absen.id_absen IS NOT NULL,"HADIR","TIDAK HADIR") AS Kehadiran,
    IF(tbl_absen.id_absen IS NOT NULL,IF(tbl_validasi.id_validasi IS NOT NULL,"Telah divalidasi","Belum divalidasi"), '-') AS Validasi,
    IF(tbl_absen.waktu_absensi IS NOT NULL, tbl_absen.waktu_absensi, "-") AS waktu_absensi
FROM tbl_siswa
LEFT JOIN tbl_absen ON tbl_siswa.id_siswa = tbl_absen.id_siswa AND tbl_absen.id_acara = '$id_acara'
LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
INNER JOIN tbl_kelas ON tbl_siswa.id_kelas = tbl_kelas.id_kelas
WHERE tbl_siswa.id_kelas = '$id_kelas';

# --insert
# INSERT INTO tbl_absen(id_acara, id_siswa) VALUES ('$id_acara', '$id_siswa');
# INSERT INTO tbl_validasi(id_absen, id_guru) VALUES ('$id_absen', '$id_guru');





# Laporan ( SQL Version ut MariaDB )
SELECT  main_query.id_siswa,main_query.nama_siswa
     , COUNT(CASE WHEN main_query.id_nama_acara =  1 THEN id_siswa END) Ibadah_Jumat
     , COUNT(CASE WHEN main_query.id_nama_acara =  2 THEN id_siswa END) Thafiz
     , COUNT(CASE WHEN main_query.id_nama_acara =  4 THEN id_siswa END) Upacara
     , COUNT(CASE WHEN main_query.id_nama_acara =  5 THEN id_siswa END) Pramuka
  FROM (SELECT tbl_siswa.id_siswa,tbl_acara.id_nama_acara,tbl_siswa.nama_siswa FROM tbl_siswa
LEFT JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara WHERE tbl_validasi.id_validasi IS NOT NULL
       ) main_query
 GROUP BY main_query.id_siswa


# Untuk absen ami gw sediakan di tempat terpisah tapi kalo mau munculin seluruh list nama siswa untuk absen ami
SELECt nama_siswa FROm tbl_siswa WHERE id_kelas = "X1";




# Test Only, Please Ignore. 

# # Yg ini pivot tapi untuk tabel lain
# SELECT nama_pekerja
#      , SUM(CASE WHEN id_tipe =  1 THEN gaji END) Gaji_Ob
#      , SUM(CASE WHEN id_tipe =  2 THEN gaji END) Gaji_Coder
#   FROM (SELECT *
#           FROM pekerja
#        ) pekerja
#  GROUP BY nama_pekerja

# # Yg ini pivot juga untuk tabel lain ditambah wherenya
# SELECT nama_pekerja
#      , COUNT(CASE WHEN id_tipe =  1 THEN gaji END) Gaji_Ob
#      , COUNT(CASE WHEN id_tipe =  2 THEN gaji END) Gaji_Coder
#   FROM (SELECT *
#           FROM pekerja WHERE id_pekerja <10
#        ) pekerja
#  GROUP BY nama_pekerja

# # IAHSIUDGEUILrhoeathi Improve 
# SELECT tbl_acara.id_nama_acara, tbl_siswa.id_siswa, COUNT(tbl_validasi.id_validasi) FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# GROUP BY tbl_acara.id_nama_acara, tbl_siswa.id_siswa

# SELECT tbl_siswa.id_siswa, COUNT(tbl_validasi.id_validasi) FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# GROUP BY tbl_siswa.id_siswa


# SELECT id_siswa
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  1 THEN gaji END) Ibadah_Jumat
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  2 THEN gaji END) Thafiz
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  4 THEN gaji END) Upacara
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  5 THEN gaji END) Pramuka
#   FROM (SELECT *
#           FROM pekerja WHERE id_pekerja <10
#        ) pekerja
#  GROUP BY nama_pekerja



# SELECT tbl_siswa.id_siswa
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  1 THEN id_siswa END) Ibadah_Jumat
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  2 THEN id_siswa END) Thafiz
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  4 THEN id_siswa END) Upacara
#      , COUNT(CASE WHEN tbl_acara.id_nama_acara =  5 THEN id_siswa END) Pramuka
#   FROM (SELECT * FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
#        ) tbl_siswa
#  GROUP BY tbl_siswa.id_siswa


# # Join
# SELECT COUNT(*) AS Acara1 FROM tbl_validasi 
# INNER JOIN tbl_absen ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# WHERE tbl_absen.id_siswa = "20181" AND tbl_acara.id_nama_acara = "1"
# UNION SELECT COUNT(*) AS Acara2 FROM tbl_validasi 
# INNER JOIN tbl_absen ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# WHERE tbl_absen.id_siswa = "20181" AND tbl_acara.id_nama_acara = "2"
# UNION SELECT COUNT(*) AS Acara3 FROM tbl_validasi 
# INNER JOIN tbl_absen ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# WHERE tbl_absen.id_siswa = "20181" AND tbl_acara.id_nama_acara = "3"



# SELECT COUNT(*) FROM tbl_validasi 
# LEFT JOIN tbl_absen ON tbl_absen.id_absen = tbl_validasi.id_absen
# LEFT JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# LEFT JOIN tbl_siswa ON tbl_siswa.id_siswa = tbl_absen.id_siswa
# WHERE tbl_absen.id_siswa IN( SELECT id_siswa FROM tbl_siswa) 
# GROUP BY tbl_absen.id_siswa
# ORDER BY tbl_absen.id_siswa
# ;

# SELECT COUNT(*) FROM tbl_siswa
# INNER JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# INNER JOIN tbl_nama_acara ON tbl_nama_acara.id_nama_acara = tbl_acara.id_nama_acara
# INNER JOIN tbl_validasi ON tbl_validasi.id_absen = tbl_absen.id_absen

# WHERE tbl_validasi.id_validasi IS NOT NULL

# GROUP BY tbl_acara.id_acara
# ;

# SELECT tbl_acara.id_nama_acara, COUNT(tbl_validasi.id_validasi) FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_absen.id_siswa = tbl_siswa.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
# GROUP BY tbl_acara.id_nama_acara
# ;




# --belom bener ini cuman ngetest
# SELECT
#     tbl_siswa.nama_siswa,
#     tbl_kelas.nama_kelas,
#     IF(tbl_validasi.id_validasi IS NOT NULL,"HADIR","TIDAK HADIR") AS kehadiran
# FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_siswa.id_siswa = tbl_absen.id_siswa AND tbl_absen.id_acara = '$id_acara'
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen
# INNER JOIN tbl_kelas ON tbl_siswa.id_kelas = tbl_kelas.id_kelas
# INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara;

# SELECT
#     tbl_siswa.id_siswa,
#     tbl_siswa.nama_siswa,
#     IF(tbl_validasi.id_absen IN(SELECT tbl_absen.id_absen 
#         FROM tbl_absen
#         INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
#         WHERE tbl_acara.id_acara = '1')
#     ,"HADIR","TIDAK HADIR") AS acara1,
#     IF(tbl_validasi.id_absen IN(SELECT tbl_absen.id_absen 
#         FROM tbl_absen
#         INNER JOIN tbl_acara ON tbl_acara.id_acara = tbl_absen.id_acara
#         WHERE tbl_acara.id_acara = '2')
#     ,"HADIR","TIDAK HADIR") AS acara2
# FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_siswa.id_siswa = tbl_absen.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen;

# SELECT
#     tbl_siswa.id_siswa,
#     tbl_siswa.nama_siswa,
#     IF( ,"HADIR","TIDAK HADIR") AS acara1
# FROM tbl_siswa
# LEFT JOIN tbl_absen ON tbl_siswa.id_siswa = tbl_absen.id_siswa
# LEFT JOIN tbl_validasi ON tbl_absen.id_absen = tbl_validasi.id_absen;