<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@page import="webapp.Entry" %>


<html>

<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<body>
    <header>
    <div class="logo"></div>
        <img class="png" src="/images/logo.png">
    <div class="title"></div>
        <h1>The Blog</h1>
    </header>
<section class="menu">
    <div class="login">
        <a href="/login" class="button">Login</a>
    </div>
    <div class="make">
        <a href="/blog" class="button">Write</a>
    </div>
    <div class="allPosts">
        <a href="/posts" class="button">Posts</a>
    </div>
    <div class="subscribe">
        <a href="/subcribe" class="button">Subscribe</a>
    </div>
    <div class="unsubscribe">
        <a href="/unsubcribe" class="button">Unsubscribe</a>
    </div>
</section>
</body>

</html>