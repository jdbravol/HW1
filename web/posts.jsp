<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@page import="webapp.Entry" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>

<body>
<header>
    <img class="png" src="/images/logo.png">
    <h1>The Blog</h1>
</header>
<section class="menu">
    <a href="/login" class="button">Login</a>
    <a href="/blog" class="button">Write</a>
    <a href="/posts" class="button">Posts</a>
    <a href="/subcribe" class="button">Subscribe</a>
    <a href="/unsubcribe" class="button">Unsubscribe</a>
</section>

<%

    String blogName = request.getParameter("blogName");
    if (blogName == null) {
        blogName = "default";
    }

    pageContext.setAttribute("blogName", blogName);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();

    if (user != null) {
        pageContext.setAttribute("user", user);
%>

<p>Hello, ${fn:escapeXml(user.nickname)}! (You can
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
} else {
%>
<p>Hello!
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
    to post in your name.</p>
<%
    }
%>
<%

    ObjectifyService.register(Entry.class);
    List<Entry> entries = ObjectifyService.ofy().load().type(Entry.class).list();
    Collections.sort(entries);
    if (entries.isEmpty()) {
%>
<p>The Blog '${fn:escapeXml(guestbookName)}' has no entries.</p>
<%
} else {
%>

<p>Entries in The Blog '${fn:escapeXml(guestbookName)}'.</p>

<%
    for (Entry entry : entries) {
        pageContext.setAttribute("entry_content", entry.getContent());
        pageContext.setAttribute("entry_user", entry.getUser());
        pageContext.setAttribute("entry_title", entry.getTitle());
        pageContext.setAttribute("entry_date", entry.getDate());

%>

<p><b>${fn:escapeXml(entry_user.nickname)}</b> wrote </p>
<p><b>${fn:escapeXml(entry_title)}</b></p>
<p> at ${fn:escapeXml(entry_date)} : </p>
<blockquote>${fn:escapeXml(entry_content)}</blockquote>

<%
        }
    }
%>
</body>


</html>