<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/loginPage/style.css">
    <title>Sign In</title>
</head>
<body>
    <section class="login-section">
        <div class="box-container">
            <div class="bg-banner">
                <img src="img/Login Banner-01-01.png" alt="img-banner">
            </div>
            <div class="header-logo">
                <a href="/">
                    <img src="img/Logo-02.png" alt="logo">
                </a>
            </div>
            <div class="text-1">
                <p>Login</p>
            </div>
            <div class="text-2">
                <p>Welcome to ABC Community</p>
                <p id="error-msg">${error}</p>
            </div>
            <div class="form-container">
                <!-- <sf:form action="/loginCheck" method="post" modelAttribute="login"> -->

                <form action="login" method="post">

                    <input type="email" name="email" id="email" placeholder="E-mail Address" required="required"/>

                    <input type="password" name="password" id="password" placeholder="Password" required="required" pattern="[a-zA-Z0-9]*" title="Please enter alphabets and numeric only."/>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <input type="submit" value="Sign In" id="submit">

                </form>

                <!-- </sf:form> -->
            </div>
            <div class="hyperlink-1">
                <a href="/resetPassEmail">Forgot Password?</a>
            </div>
            <div class="text-3">
                <p>Not a member, yet?</p>
            </div>
            <div class="hyperlink-2">
                <a href="/register">Create an account</a>
            </div>
        </div>
    </section>
</body>
</html>