from test1.models import *

##INSERT

#kelas
# INSERT INTO tbl_kelas (id_kelas, nama_kelas) VALUES ('id_kelas', 'nama_kelas')

id_kelas = 'id_kelas'
nama_kelas = 'nama_kelas'

#ini force INSERT
Tbl_kelas.objects.create(id_kelas=id_kelas, nama_kelas=nama_kelas)

# yg dibawa ini vvv jadi INSERT (kalau pk nya belom ada di database)
# atau UPDATE (kalau pk nya udah ada di database)
# buat INSERT pakai yang force insert ^^^

# insert = Tbl_kelas()
# insert.id_kelas = id_kelas
# insert.nama_kelas = nama_kelas
# insert.save()

#siswa
# INSERT INTO tbl_siswa (id_siswa, id_kelas, nama_siswa, email_siswa, password_siswa) VALUES ('id_siswa', 'id_kelas', 'nama_siswa', 'email_siswa', 'password_siswa')

id_siswa = 'id_siswa'
id_kelas = 'id_kelas'
nama_siswa = 'nama_siswa'
email_siswa = 'email_siswa'
password_siswa = 'password_siswa'

#ini force INSERT
Tbl_siswa.objects.create(id_siswa=id_siswa, id_kelas=Tbl_kelas.objects.get(id_kelas=id_kelas), nama_siswa=nama_siswa, email_siswa = email_siswa, password_siswa = password_siswa)

# insert = Tbl_siswa()
# insert.id_siswa = id_siswa
# insert.id_kelas = Tbl_kelas.objects.get(id_kelas=id_kelas)
# insert.nama_siswa = nama_siswa
# insert.email_siswa = email_siswa
# insert.password_siswa = password_siswa
# insert.save()

#akses
# INSERT INTO tbl_akses (id_akses, nama_akses) VALUES ('id_akses', 'nama_akses')

id_akses = 'id_akses'
nama_akses = 'nama_akses'

Tbl_akses.objects.create(id_akses=id_akses, nama_akses=nama_akses)

# insert = Tbl_akses()
# insert.id_akses = id_akses
# insert.nama_akses = nama_akses
# insert.save()

#guru
# INSERT INTO tbl_guru (id_guru, nama_guru, email_guru, password_guru, id_akses) VALUES ('id_guru', 'nama_guru', 'email_guru', 'password_guru', 'id_akses')

id_guru = 'id_guru'
nama_guru = 'nama_guru'
email_guru = 'email_guru'
password_guru = 'password_guru'
id_akses = 'id_akses'

Tbl_guru.objects.create(id_guru=id_guru, nama_guru=nama_guru, email_guru=email_guru, password_guru=password_guru, id_akses=id_akses)

# insert = Tbl_guru()
# insert.id_guru = id_guru
# insert.nama_guru = nama_guru
# insert.email_guru = email_guru
# insert.password_guru = password_guru
# insert.id_akses = id_akses
# insert.save()

#kategori
# INSERT INTO tbl_kategori (id_kategori, nama_kategori) VALUES ('id_kategori', 'nama_kategori')

id_kategori = 'id_kategori'
nama_kategori = 'nama_kategori'

Tbl_kategori.objects.create(id_kategori=id_kategori, nama_kategori=nama_kategori)

# insert = Tbl_kategori()
# insert.nama_kategori = id_kategori
# insert.nama_kategori = nama_kategori
# insert.save()

#nama acara
# INSERT INTO tbl_nama_acara (id_nama_acara, id_kategori, nama_acara) VALUES ('id_nama_acara', 'id_kategori', 'nama_acara')

id_nama_acara = 'id_nama_acara'
id_kategori = 'id_kategori'
nama_acara = 'nama_acara'

Tbl_kategori.objects.create(id_nama_acara=id_nama_acara, nama_kategori=nama_kategori, nama_acara=nama_acara)

# insert = Tbl_nama_acara()
# insert.id_nama_acara = id_nama_acara
# insert.id_kategori = id_kategori
# insert.nama_acara = nama_acara
# insert.save()

#acara
# INSERT INTO tbl_acara (id_acara, id_nama_acara, waktu_acara) VALUES ('id_acara', 'id_nama_acara', 'waktu_acara')

id_acara = 'id_acara'
id_nama_acara = 'id_nama_acara'
waktu_acara = 'waktu_acara'

Tbl_acara.objects.create(id_acara=id_acara, id_nama_acara=id_nama_acara, waktu_acara=waktu_acara)

# insert = Tbl_acara()
# insert.id_acara = id_acara
# insert.id_nama_acara = id_nama_acara
# insert.waktu_acara = waktu_acara
# insert.save()

#jampel
# INSERT INTO tbl_jampel (id_jampel, nama_jampel, waktu_jampel) VALUES ('id_jampel', 'nama_jampel', 'waktu_jampel')

id_jampel = 'id_jampel'
nama_jampel = 'nama_jampel'
waktu_jampel = 'waktu_jampel'

Tbl_jampel.objects.create(id_jampel=id_jampel, nama_jampel=nama_jampel, waktu_jampel=waktu_jampel)

# insert = Tbl_jampel()
# insert.id_jampel = id_jampel
# insert.nama_jampel = nama_jampel
# insert.waktu_jampel = waktu_jampel
# insert.save()



##UPDATE
# hati hati kalau update
# jika id nya berubah dan belum ada di database maka dia INSERT

#kelas
# UPDATE tbl_kelas SET nama_kelas='$nama_kelas' WHERE id_kelas='$id_kelas';

update = Tbl_kelas.objects.get(id_kelas=id_kelas)
update.nama_kelas = nama_kelas
update.save()

#siswa
# UPDATE tbl_siswa SET id_kelas='$id_kelas', nama_siswa='$nama_siswa', email_siswa='$email_siswa', password_siswa='$password_siswa' WHERE id_siswa='$id_siswa';

update = Tbl_siswa.objects.get(id_siswa=id_siswa)
update.id_kelas = Tbl_kelas.objects.get(id_kelas=id_kelas)
update.nama_siswa = nama_siswa
update.email_siswa = email_siswa
update.password_siswa = password_siswa
update.save()

#akses
# UPDATE tbl_akses SET nama_akses='$nama_akses' WHERE id_akses='$id_akses';

update = Tbl_akses.objects.get(id_akses=id_akses)
update.nama_akses = nama_akses
update.save()

#guru
# UPDATE tbl_guru SET nama_guru='$nama_guru', email_guru='$email_guru', password_guru='$password_guru', id_akses='$id_akses' WHERE id_guru='$id_guru';

update = Tbl_guru.objects.get(id_guru=id_guru)
update.nama_guru = nama_guru
update.email_guru = email_guru
update.password_guru = password_guru
update.id_akses = id_akses
update.save()

#kategori
# UPDATE tbl_kategori SET nama_kategori='$nama_kategori' WHERE id_kategori='$id_kategori';

update = Tbl_kategori.objects.get(id_kategori=id_kategori)
update.nama_kategori = nama_kategori
update.save()

#nama acara
# UPDATE tbl_nama_acara SET id_kategori='$id_kategori', nama_acara='$nama_acara' WHERE id_nama_acara='$id_nama_acara';

update = Tbl_nama_acara.objects.get(id_nama_acara=id_nama_acara)
update.id_kategori = id_kategori
update.nama_acara = nama_acara
update.save()

#acara
# UPDATE tbl_acara SET id_nama_acara='$id_nama_acara', waktu_acara='$waktu_acara' WHERE id_acara='$id_acara';

update = Tbl_acara.objects.get(id_acara=id_acara)
update.id_nama_acara = id_nama_acara
update.waktu_acara = waktu_acara
update.save()

#jampel
# UPDATE tbl_jampel SET nama_jampel='$nama_jampel', waktu_jampel='$waktu_jampel' WHERE id_jampel='$id_jampel';

update = Tbl_jampel.objects.get(id_jampel=id_jampel)
update.nama_jampel = nama_jampel
update.waktu_jampel = waktu_jampel
update.save()



##DELETE

#kelas
# DELETE FROM tbl_kelas WHERE id_kelas='$id_kelas';

Tbl_kelas.objects.get(id_kelas=id_kelas).delete()

#siswa
# DELETE FROM tbl_siswa WHERE id_siswa='$id_siswa';

Tbl_siswa.objects.get(id_siswa=id_siswa).delete()

#akses
# DELETE FROM tbl_akses WHERE id_akses='$id_akses';

Tbl_akses.objects.get(id_akses=id_akses).delete()

#guru
# DELETE FROM tbl_guru WHERE id_guru='$id_guru';

Tbl_guru.objects.get(id_guru=id_guru).delete()

#kategori
# DELETE FROM tbl_kategori WHERE id_kategori='$id_kategori';

Tbl_kategori.objects.get(id_kategori=id_kategori).delete()

#nama acara
# DELETE FROM tbl_nama_acara WHERE id_nama_acara='$id_nama_acara';

Tbl_nama_acara.objects.get(id_nama_acara=id_nama_acara).delete()

#acara
# DELETE FROM tbl_acara WHERE id_acara='$id_acara';

Tbl_acara.objects.get(id_acara=id_acara).delete()

#jampel
# DELETE FROM tbl_jampel WHERE id_jampel='$id_jampel';

Tbl_jampel.objects.get(id_jampel=id_jampel).delete()