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



<%

    String guestbookName = request.getParameter("guestbookName");

    if (guestbookName == null) {

        guestbookName = "default";

    }

    pageContext.setAttribute("guestbookName", guestbookName);

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

    to include your name with greetings you post.</p>

<%

    }

%>



<%

    ObjectifyService.register(Entry.class);

    List<Entry> entries = ObjectifyService.ofy().load().type(Entry.class).list();

    Collections.sort(entries);

    if (entries.isEmpty()) {

%>

<p>Guestbook '${fn:escapeXml(guestbookName)}' has no messages.</p>

<%

} else {

%>

<p>Messages in Guestbook '${fn:escapeXml(guestbookName)}'.</p>

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



<form action="/ofysign" method="post">

    <div><input type="submit" name="newPost" value="Create a New Post" ></div>

</form>



</body>


</html>