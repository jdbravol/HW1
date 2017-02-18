<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
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
    <%

        String guestbookName = request.getParameter("guestbookName");
        if (guestbookName == null) {
            guestbookName = "default";
        }

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        ObjectifyService.register(User.class);
        List<User> usersSubcribed = ObjectifyService.ofy().load().type(User.class).list();

        if (user != null) {
            pageContext.setAttribute("log", "Login");
            if(usersSubcribed.contains(user)){
                pageContext.setAttribute("sub", "Unsubscribe");
                pageContext.setAttribute("sub", "Unsubscribe");
            }
            else{
                pageContext.setAttribute("sub", "Subscribe");
                pageContext.setAttribute("subs", "/subscribe");
            }
        }
        else{
            pageContext.setAttribute("log", "Logout");
        }

    %>

    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">fn:escapeXml(log)</a>
    <a href="/blog" class="button">Write</a>
    <a href="/posts.jsp" class="button">Posts</a>

    <a href="/unsubcribe" class="button">Unsubscribe</a>

    <a href="/subcribe" class="button">Subscribe</a>


</section>

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

<p> The last 5 Entries in The Blog are:  ${fn:escapeXml(guestbookName)} </p>

<%
    int number;
    if (entries.size()<5){
        number = entries.size();
    }
    else{
        number = 5;
    }
    for (int i = 0; i<number;i++) {
        Entry entry = entries.get(i);
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