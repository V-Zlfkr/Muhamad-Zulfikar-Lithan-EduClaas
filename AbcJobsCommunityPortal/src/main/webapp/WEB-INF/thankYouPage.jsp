<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/thankYouPage/style.css">
    <title>Welcome</title>
</head>
<body>
    <section class="box-container">
        <div class="header-content">
            <p>Welcome to the Community</p>
        </div>
        <div class="main-content">
            <img src="img/Tick.png" alt="tick-logo">
        </div>
        <div class="footer-content">
            <p>Thank you for joining our community.<br>Exploration awaits, you will be redirected to login page, <i>automatically...</i></p>
        </div>
    </section>
</body>
<script type="text/javascript">

setTimeout(function () {
	   window.location.href= '/login';
	},2000);

</script>
</html>