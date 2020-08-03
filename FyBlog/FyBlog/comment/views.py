from django.shortcuts import render
from django.views import View
from django.db.models import Q
from django.shortcuts import HttpResponse
from login.models import User
from comment.models import Comment
from blog.models import Post
import json
import queue
import time
import datetime
import FyBlog.settings as setting

import re

# Create your views here.

class Node:
    def __init__(self,id,data,user_id="",avatars_url="",value="",parent_id=0,user="",comment_time=""):
        self.value = value
        self.data = data
        self.id = id
        self.comment_time = comment_time
        self.avatars_url = avatars_url
        self.user = user
        self.user_id = user_id
        self.children = []
        self.parent_id = parent_id

    def to_json(self):
        res = {}
        res['id'] = self.id
        res['user_id'] = self.user_id
        res['data'] = self.data
        res['user'] = self.user
        res['value'] = self.value
        res['avatars_url'] = self.avatars_url
        res['parent_id'] = self.parent_id
        res['comment_time'] = self.comment_time
        res['children'] = []
        if self.children == []:
            pass
        else:
            for child in self.children:
                res['children'].append(child.to_json())
        return res

    def add_children(self,children):
        self.children.append(children)

    def get_value(self,value):
        return self.data

    def set_user(self,value):
        self.user = value

    def traversal(self,Node):
        if Node.children is None:
            return

    def search(self,parents_id):
        if self.id == parents_id:
            return self
        if not self.children:
            return None
        else:
            for child in self.children:
                current = child.search(parents_id)
                if current:
                    return current
            return None


    def return_parent_id(self):
        return self.parent_id


class PostView(View):

    def __init__(self,**kwargs):
        super().__init__(**kwargs)
        self.stop = False
        self.reply_id_queue = queue.Queue(maxsize=0)

    def get(self,request):
        post_id = request.GET.get('post_id')
        _comment = Comment.objects.filter(status=Comment.STATUS_NORMAL).filter(target_id=post_id).filter(comment_parent_id=0)
        _reply = Comment.objects.filter(status=Comment.STATUS_NORMAL).filter(target_id=post_id).filter(~Q(comment_parent_id=0)).order_by("comment_parent_id")
        root_node = Node(id=0,data="",value="root")
        for commobj in _comment:
            id = commobj.id
            avatars_url =commobj.comment_user.avatars.url
            user = commobj.comment_user.nick
            user_id = commobj.comment_user.id
            parents_id = commobj.comment_parent_id
            comment_text = commobj.comment_text
            comment_time = commobj.created_time
            comment_time = comment_time.strftime("%Y/%m/%d %H:%M")
            root_node.add_children(Node(id=id,data=comment_text,value="评论",user=user,avatars_url=avatars_url,comment_time=comment_time,user_id=user_id))

        while not self.stop:
            for _replyobj in _reply:
                id = _replyobj.id
                self.reply_id_queue.put(id)
            while not self.reply_id_queue.empty():
                reply_id = self.reply_id_queue.get()
                replyobj = _reply.get(id=reply_id)
                id = replyobj.id
                avatars_url =  replyobj.comment_user.avatars.url
                current_parent_id = replyobj.comment_parent_id
                reply_text = replyobj.comment_text
                reply_user = replyobj.comment_user.nick
                user_id = replyobj.comment_user.id
                comment_time = replyobj.created_time
                comment_time = comment_time.strftime("%Y/%m/%d %H:%M")
                current_node = root_node.search(current_parent_id)
                if current_node:
                    current_node.add_children(Node(id = id,data= reply_text,value="回复",parent_id = current_parent_id,user=reply_user,avatars_url= avatars_url,comment_time=comment_time,user_id=user_id))
            self.stop = True

        return HttpResponse(json.dumps(root_node.to_json()), content_type="application/json")
    def post(self,request):
        """
        当request请求进入时，先判断传来的comment是否为空，或者是否超过字符上限
        之后通过正则表达式匹配nick和comment_parent_id判断是否为回复还是评论
        之后将评论或者是回复保存进数据库
        :param request:
        :return HttpResponse:
        """
        nick = request.POST.get('nick')
        comment = request.POST.get('comment')
        print("评论内容为："+comment+".")
        post_id = request.POST.get('post_id')
        if len(comment) > 120:
            data = {
                "msg": "最多输入120个字符！",
                "status": False
            }
            return HttpResponse(json.dumps(data), content_type="application/json")
        if comment.isspace() or len(comment) == 0:
            data = {
                "msg": "输入不能为空！",
                "status": False
            }
            return HttpResponse(json.dumps(data), content_type="application/json")
        if request.session.get("is_login"):
            pattern_nick = "(?<=[@]).*?(?=[:])"
            pattern = re.compile(pattern_nick)
            reply_nick_list = pattern.findall(comment)
            comment_parent_id = request.POST.get('comment_parent_id')
            users = User.objects.get(nick=nick)
            post = Post.objects.get(pk=post_id)
            if reply_nick_list and comment_parent_id:  # 回复逻辑部分
                reply_nick = reply_nick_list[0]
                replied_user = User.objects.filter(nick=reply_nick)
                CommentObj = Comment()
                CommentObj.comment_user = users
                CommentObj.comment_text = comment
                CommentObj.target = post
                CommentObj.comment_parent_id = comment_parent_id
                CommentObj.save()
                data = {
                    "msg": "回复成功！",
                    "status": True,
                }
                return HttpResponse(json.dumps(data), content_type="application/json")
            else: #评论逻辑部分
                CommentObj = Comment()
                CommentObj.comment_user = users
                CommentObj.comment_text = comment
                CommentObj.target = post
                CommentObj.save()
                data = {
                    "msg": "发表成功！",
                    "status": True
                }
                return HttpResponse(json.dumps(data), content_type="application/json")
        else:
            data = {
                "msg": "请先登录！",
                "status": False
            }
            return HttpResponse(json.dumps(data), content_type="application/json")


