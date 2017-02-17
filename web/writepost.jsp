<html>
<!--	<head>
	   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	</head>
-->
	<body>
		<header>
			<div class="logo"></div>
			<div class="title"></div>
		</header>
		<section class="menu">
			<div class="login"></div>
			<div class="make"></div>
			<div class="allPosts"></div>
			<div class="subscribe"></div>
		</section>

		<section class="postWriter">
			<form action="/sign" method="post">
                <td align="right"> <b> Title: </b> </td>
                <div>
                    <input type="text" name="title" size="75">
                </div>

                <td align="right"> <b> Entry: </b> </td>
                <div>
                    <textarea name="title" cols="75" rows="7"></textarea>
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