<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/resetPassEmailCode/style.css">
    <title>Email Verification</title>
</head>
<body>
    <section class="box-container">
        <section class="logo-container">
            <div class="logo-box">
                <a href="/">
                    <img src="img/Logo-02.png" alt="header-logo">
                </a>
            </div>
        </section>
        <section class="content-header-container">
            <div class="text-1">
                <p>E-mail Verification</p>
            </div>
            <div class="text-2">
                <p>We want to make sure that it's really you.<br>We already sent verification code to your e-mail, if it didn't show up, please wait.</p>
            </div>
        </section>
        <section class="form-container">
            <form action="/resetPass" method="get">
                <div class="input-1">
                    <input type="text" placeholder="4-Digits Number Verification Code" pattern="[0-9]*" minlength="4" maxlength="4" required="required" title="Please enter `Number` valid code"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
                <div class="input-2">
                    <input type="submit" value="Verify">
                </div>
            </form>
        </section>
    </section>
</body>
</html>