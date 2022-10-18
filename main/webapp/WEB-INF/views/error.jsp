<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/styles.css">
	<link rel="icon" type="image/jpg" href="images/my-logo.jpg"  sizes="16x16">
    <title>Ooops! Error Occurred</title>
</head>

<body>

	<header>
		<div class="header-content clearfix">
			<h1>Employment System</h1>
		</div>
		<nav class="header-nav">
			<ul class="nav-links">
				<li><a href="redirect:/home" onclick="self.opener.reload(); self.close();">Home</a></li>
			</ul>
		</nav>
	</header>


    <main>
        <section>
            <div class="section-header"><h2> Oops!  You encountered an error. </h2></div>
        </section>
    </main>


	<footer>
		<div class="clear-float"></div>
		<p id="datetime"></p>
		<script>
			document.getElementById("datetime").innerHTML = Date();
		</script>
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</footer>
    


</body>
</html> 