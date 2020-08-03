from django.contrib import admin
from django.urls import path,include,re_path
from blog.views import *
from comment.views import PostView


urlpatterns = [
    path("post/",PostView.as_view(),name='comment_post')
]