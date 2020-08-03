from config.models import SideBar


class SessionMiddleware:
    def __init__(self,get_response):
        self.get_response = get_response


    def __call__(self,request):
        if request.COOKIES.get('sessionid'):
            pass
        else:
            login_sidebar = SideBar.objects.get(pk=5)
            login_sidebar.status = 1
            login_sidebar.save()
        response = self.get_response(request)

        return response