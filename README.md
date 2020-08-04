# FyBlog

基于python3.6和django2.0的个人博客系统

## 主要功能
1.文章评论、发布、修改、草稿、删除,编辑文章支持markdown

2.分类和标签的修改创建和删除

3.用户资料与头像的修改

4.侧边栏功能

## 项目运行
 
### 安装第三方运行库

    pip3 install -r requirement.txt
    
### 创建数据库
    ALTER DATABASE fyblog DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci 

### 配置数据库

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




