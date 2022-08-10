<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/resetPassEmail/style.css">
    <title>Email Check</title>
</head>
<body>
    <section class="email-confirmation-section">
        <div class="box-container">
            <div class="logo-container">
                <a href="/">
                    <img src="img/Logo-02.png" alt="logo">
                </a>
            </div>
            <div class="text-1">
                <p>Reset Password?</p>
            </div>
            <div class="text-2">
                <p>Don't worry! By submitting your e-mail, we will send a verification code to your e-mail.<br>Cheers!</p>
            </div>
            <div class="form-container">
                <form action="/resetPassEmailCode" method="post">

                    <input type="email" name="email" id="email" placeholder="E-mail Address" required="required"/>

                    <input type="submit" value="Confirm" id="submit"/>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                </form>
            </div>
            <div class="hyperlink-1">
                <a href="/login">Back to Login Page</a>
            </div>
        </div>
    </section>
</body>
</html>