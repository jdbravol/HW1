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

		<section class="postWriter">
            <form action="/Blog" method="post">
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
                    <input type="submit"  value = "post">
                </div>
                <td></td>
                <td>
                    <input type="submit" value="Cancel">
                </td>
                <input type="hidden" name="blogName" value="default"/>
    	  </form>
		</section>
	</body>
</html>