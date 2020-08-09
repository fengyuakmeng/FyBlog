# FyBlog

基于python3.6和django2.0的个人博客系统

## 主要功能
1.文章评论、发布、修改、草稿、删除,编辑文章支持markdown

2.分类和标签的修改创建和删除

3.用户资料与头像的修改

4.侧边栏功能

## 1.项目运行
 
### 1.1 安装第三方运行库

    pip3 install -r requirement.txt  
    
    
    
#### pip官方库安装mysqlclient会报错，建议从[此处](https://www.lfd.uci.edu/~gohlke/pythonlibs/#mysqlclient)下载对应的wheel文件安装


    
### 1.2 创建数据库
    ALTER DATABASE fyblog DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci 

### 1.3 配置数据库

在```settings.py```文件下

```DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'fyblog',
        'USER': 'root',
        'PASSWORD': 'PASSWORD',
        'HOST': 'HOST',
        'PORT': '3306'
    }
}
```

### 1.4 收集静态文件

    python manage.py collectstatic
  


