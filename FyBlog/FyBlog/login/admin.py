from django.contrib import admin
from login.models import User
from login.models import EmailPro
# Register your models here.


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('id','username', 'nick', 'status', 'sex','birthday')
    fields = ('username', 'password', 'status', 'nick','birthday','sex','uid','avatars')
    list_display_links = ['username']

@admin.register(EmailPro)
class EmailProAdmin(admin.ModelAdmin):
    list_display = ("email",'status',"send_type","send_time")
    fields = ("email","code","send_type","status")