<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="java.util.List" %>
<html>
	<head>
	   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	</head>
	<body>
        <section>
        <header>
            <img class="png" src="/images/logo.png" >
            <h1>The Blog</h1>
        </header>
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
            }
        %>
        <section class="menu">
            <a href="<%= userService.createLoginURL(request.getRequestURI()) %>" class="button">Login</a>
            <a href="/blog" class="button">Write</a>
            <a href="/posts.jsp" class="button">Posts</a>
            <a href="/unsubcribe" class="button">Unsubscribe</a>
            <a href="/Subcribe" class="button">Subscribe</a>
        </section>

		<section class="postWriter">
            <form action="/blog" method="post">
            <td align="right"> <b> Title: </b> </td>
                <div>
                    <input type="text" name="title" size="75">
                </div>
                <td align="right"> <b> Entry: </b> </td>
                <div>
                    <textarea name="content" cols="75" rows="7"></textarea>
                </div>
                <td></td>
                <div>
                    <input type="submit" value = "post">
                </div>
            </form>

                <td></td>
                <input type="hidden" name="blogName" value="default"/>
    	  </form>
		</section>
	</body>
</html>