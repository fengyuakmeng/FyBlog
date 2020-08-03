from django.contrib import admin
from django.urls import path,include,re_path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.sitemaps import views as sitemap_views
from blog.views import *
from blog.rss import LatestPostFeed
from blog.sitemap import PostSitemap

urlpatterns = [
   path('index/',IndexView.as_view(),name="index"),
   path('post_detail/<int:post_id>',PostView.as_view(),name='post_detail'),
   path('category/<int:category_id>',CategoryView.as_view(),name='category'),
   path('achieved/',AchieveViews.as_view(),name="achieved"),
   re_path(r'tag/$',TagView.as_view(),name='tag'),
   re_path(r'^search/$',SearchView.as_view(),name='search'),

]