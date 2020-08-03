from django.contrib import admin
from config.models import Link,SideBar,VisitNumber,DayNumber,Userip

# Register your models here.


@admin.register(Link)
class LinkAdmin(admin.ModelAdmin):
    list_display = ('title', 'href', 'status', 'weight', 'created_time')
    fields = ('title','href','status','weight')

    # def save_model(self, request, obj, form, change):
    #     obj.owner = request.user
    #     return super(LinkAdmin, self).save_model(request,obj,form,change)


@admin.register(SideBar)
class SideBarAdmin(admin.ModelAdmin):
    list_display = ('title', 'display_type', 'content', 'created_time','weight')
    fields = ('title','display_type', 'status','content','weight','class_name')

    # def save_model(self, request, obj, form, change):
    #     obj.owner = request.user
    #     return super(SideBarAdmin, self).save_model(request,obj,form,change)


@admin.register(VisitNumber)
class VisitNumberAdmin(admin.ModelAdmin):
    list_display = ("count",)

@admin.register(DayNumber)
class DayNumberAdmin(admin.ModelAdmin):
    list_display = ('day','count')


@admin.register(Userip)
class UseripAdmin(admin.ModelAdmin):
    list_display = ('ip', 'count')