from django.shortcuts import render
from .models import *
from django.http import HttpResponse

# Create your views here.
def to_login_views(request):
    return render(request, 'login/Loginsiswa.html', {})

def to_login_guru_views(request):
    return HttpResponse("<h1>LOGIN GURU<h1>")





# def bla_view(request, *args, **kwargs): # pake _view agar lebih mudah dibaca # args dan kwargs itu untuk pemasukan argument fleksibel
#     return render(request, "bla/bla.html", {}) # bisa pake folder di templates