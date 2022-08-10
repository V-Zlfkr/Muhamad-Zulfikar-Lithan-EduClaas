<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Login</title>
    <link rel="icon" type="image/image" href="WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="css/loginPage/style.css">
</head>
<body>
    <header>
        <a href="/"><img src="image/logo/CarSaleLogoCircle2-01.png" alt="logo" id="logo-1"></a>
        <p class="sign-in-title">Sign in to ABC Car Sale</p>
        <button class="header-btn" id="btn-1" onclick="window.location.href='/login'">LOGIN</button>
        <button class="header-btn" id="btn-2" onclick="window.location.href='/registration'">REGISTER</button>
    </header>
    <section class="login-form">
        <h1 id="title">Sign In</h1>
        <form action="login" method="post">
            <input name="uname" type="text" required="required" placeholder="Username" id="input-1"/>
            <input name="password" type="password" required="required" placeholder="Password" id="input-2"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" id="submit">Login</button>
        </form>
        <p class="warning-msg">${error}</p>
    </section>
</body>
</html>