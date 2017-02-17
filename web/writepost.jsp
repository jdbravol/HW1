<html>
	<head>
	   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	</head>
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
		  	  Title <br>
		  	  <div><input type="text" name="title"></div> <br>
		  	  Entry <br>
		  	  <div><input type="text" name="entry"></div> <br>
		      <div class="myButton"><input type="submit" value="Post"></div>
		      <div class="myButton" value="Cancel"></div>
	      	  <input type="hidden" name="blog" value="${fn:escapeXml(blog)}"/>
    	  </form>
		</section>
	</body>
</html>