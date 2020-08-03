from django.contrib import admin
from django.urls import path,include,re_path
from django.conf import settings
from django.conf.urls.static import static
import forget_password.views as views



urlpatterns = [
    path('',views.forget_password.as_view(),name="forget_password"),
    path('choose/',views.choose.as_view(),name='choose'),
    path('checking/',views.checking.as_view(),name="checking"),
    path('complate/',views.complate.as_view(),name="complate"),


]