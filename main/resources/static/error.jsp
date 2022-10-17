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
				<li><a href="/home">Home</a></li>
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
            	<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
	</header>


    <main>
        <section>
            <div class="section-header"><h2> Oops!  You encountered an error. </h2></div>
            <p><a href="/">Go Home</a></p>
        </section>
    </main>


	<footer>
		<nav class="footer-nav">
			<ul class="nav-links clearfix">
				<li><a href="redirect:/home">Home</a></li>
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
            	<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
		<div class="clear-float"></div>
		<p id="datetime"></p>
		<script>
			document.getElementById("datetime").innerHTML = Date();
		</script>
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</footer>
    


</body>
</html> 