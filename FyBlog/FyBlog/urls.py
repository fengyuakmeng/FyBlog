"""FyBlog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.contrib.sitemaps import views as sitemap_views
from django.conf import settings
from blog.rss import LatestPostFeed
from blog.sitemap import PostSitemap
from django.conf.urls.static import static
from blog.views import *
import blog.urls
from blog.views import index
import login.urls
import user.urls
import comment.urls
from django.views.static import serve
from FyBlog.settings import MEDIA_ROOT

urlpatterns = [
    path('',index,name='index_site'),
    path('admin/', admin.site.urls),
    path('blog/',include(blog.urls)),
    path('login/',include(login.urls)),
    path('user/',include(user.urls)),
    path('mdeditor/', include('mdeditor.urls')),
    path('media/', serve, {"document_root": MEDIA_ROOT}),
    path('comment/',include(comment.urls)),
    path('rss/',LatestPostFeed(),name = 'rss'),
    path('sitemap.xml/',sitemap_views.sitemap,{'sitemaps':{'posts':PostSitemap}}),
]
if settings.DEBUG:
    # statikc files (images, css, javascript, etc.)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)