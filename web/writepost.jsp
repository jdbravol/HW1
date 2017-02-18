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
                <input type="hidden" name="blogName" value="default"/>
    	  </form>
		</section>
	</body>
</html>