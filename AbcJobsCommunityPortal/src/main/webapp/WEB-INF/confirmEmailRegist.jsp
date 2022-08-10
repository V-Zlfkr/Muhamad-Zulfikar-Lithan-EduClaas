<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/confirmEmailRegist/style.css">
    <title>Email Confirmation</title>
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
                <p>One Step Closer</p>
            </div>
            <div class="text-2">
                <p>Please Verify Your Email</p>
            </div>
            <div class="text-3">
                <p>Thank you for joining us.<br>Please do confirmation by entering verification code sent to your email.</p>
            </div>
        </section>
        <section class="form-container">
            <form action="/thankYou" method="get" modelAttribute="data">
                <div class="input-1">
                    <input type="text" placeholder="4-Digits Number Verification Code" pattern="[0-9]*" minlength="4" maxlength="4" required="required" title="Please enter `Number` valid code"/>
                </div>
                <div class="input-2">
                    <input type="submit" value="Verify">
                </div>
            </form>
        </section>
    </section>
</body>
</html>