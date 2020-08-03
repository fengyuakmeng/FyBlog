from django.contrib import admin
from django.urls import path,include,re_path
from django.conf import settings
from django.conf.urls.static import static
import login.views as views
import forget_password.urls


urlpatterns = [
    path('',views.login.as_view(),name = "login"),
    re_path(r'register_status/$',views.type_judge.as_view(),name='register_status'),
    path('register/',views.type_judge.as_view(),name='register'),
    path('logout/',views.logout,name="logout"),
    path("forget_password/",include(forget_password.urls)),


]