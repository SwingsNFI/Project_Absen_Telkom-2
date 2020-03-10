from django.urls import path
from . import views

urlpatterns = [
    path('', views.to_login_views, name="to_login"),
    path('to_login_guru_views', views.to_login_guru_views, name="to_login_guru"),
]