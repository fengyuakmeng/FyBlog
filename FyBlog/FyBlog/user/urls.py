from django.urls import path,include,re_path
import user.views as views


urlpatterns = [
    path("<int:user_id>",views.IndexView.as_view(),name="user_index"),
    path('edit/<int:user_id>',views.EditView.as_view(),name="user_edit"),
]