<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-11-7
  Time: 下午6:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
   <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.4.2.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
              $(".shouye").click(function(){
                  location.href="../index.html";
              })
        })
    </script>
</head>
<body>
<div class="header">
    <div class="login">
        <div class="u">
            <select>
                <option>用户名</option>
                <option>E-mail</option>
            </select>
            <input type="text">
            <input type="checkbox">自动登录
            <span>找回密码</span>
        </div>
        <div class="u">
            <span class="loginfont">密码:</span><span class="in"><input type="text"></span><span class="loginfont"><input type="button" value="登录"></span>
            <span class="zhuce">注册</span>
        </div>
    </div>
    <div class="search">
        <div>
            <span class="searchlog">
                <img src="images/favicon.ico"></span>
            <span class="in">
                <input type="text"></span>
            <select>
                <option>帖子</option>
                <option>用户</option>
            </select>
            <span class="zhuce"><input type="button" value="搜索"></span>
        </div>
    </div>
    <div class="nav">
        <span class="shouye" ></span>
        <span class="nav1">
            <span class="n1" id="zuixindongtai">最新动态</span>
            <span class="n1"id="tonghua">童话故事</span>
            <span class="n1" id="donghua">阿狸动画</span>
            <span class="n1" id="luntan">后援论坛</span>
            <span class="n1" id="sucai">素材下载</span>
            <span class="n1" id="zhoubian">阿狸周边</span>
        </span>
        <span class="nav2">
            <span class="nav21">快捷导航</span>
        </span>
    </div>
</div>
<div class="leftmenu">
    <div class="menutitle"><span class="menufont">用户管理</span></div>
    <div class="menuitem"><span class="menufont"> <g:link  action="create" controller="users">创建用户</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="users">用户列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">图书管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="book">创建图书</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="book">图书列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">素材管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="material">创建素材</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="material">素材列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">动态管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="dynamic">创建动态</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="dynamic">动态列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">童话故事管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="fairyTale">创建童话故事</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="fairyTale">童话故事列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">动画管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="animation">创建动画</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="animation">动画列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">公告管理</span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="create" controller="notice">创建公告</g:link></span></div>
    <div class="menuitem"><span class="menufont"><g:link  action="list" controller="notice">公告列表</g:link></span></div>
    <div class="menutitle"><span class="menufont">退出系统</span></div>
    <div class="menuitem"><span class="menufont">注销</span></div>
</div>
    <g:layoutBody/>
<div class="footer">footer</div>
</body>
</html>