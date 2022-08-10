<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Register</title>
    <link rel="icon" type="image/image" href="WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="css/registrationPage/style.css">
</head>
<body>
    <header>
        <a href="/"><img src="image/logo/CarSaleLogoCircle2-01.png" alt="logo" id="logo-1"></a>
        <p class="register-title">Register with ABC Car Sale</p>
        <p class="sign-in-title">Already a member?</p>
        <button class="header-btn" id="btn-1" onclick="window.location.href='/login'">SIGN IN</button>
    </header>
    <section class="registration-form">
        <img src="image/registrationPage/RegistrationBg.jpg" alt="registration-bg" id="registration-bg">
        <h1 id="create-acc-title">Create Account</h1>
        <form:form action="/registration/save" method="post" onsubmit="return passCheck()" modelAttribute="saveUserData">

            <form:input path="fname" type="text" required="required" placeholder="First Name" id="input-1" class="identical-input" pattern="[a-zA-Z ]*" title="Please enter alphabets only."/>

            <form:input path="lname" type="text" required="required" placeholder="Last Name" id="input-2" class="identical-input" pattern="[a-zA-Z ]*" title="Please enter alphabets only."/>

            <form:input path="uname" type="text" required="required" placeholder="Username" id="input-3" pattern="[a-zA-Z0-9 ]*" minlength="4" maxlength="10" title="Username must be 4 - 10 characters" name="uname"/>

            <form:input path="email" type="email" required="required" placeholder="Email" id="input-4" name="email"/>

            <form:input path="password" type="password" required="required" placeholder="Password" id="input-5" class="identical-input" pattern="[a-zA-Z0-9]*" title="Please enter alphabets and numeric only."/>

            <input type="password" required="required" placeholder="Confirm Password" id="input-6" class="identical-input"/>

            <button type="submit" id="submit">Register</button>

        </form:form>
        	<p class="warning-msg">${error}</p>
    </section>
    <footer>
        <p>Copyright &#169; 2022 ABC Car Sale</p>
    </footer>
</body>
<script>
    var passCheck = function() {
        var password = document.getElementById('input-5').value;
        var confirmPass = document.getElementById('input-6').value;
        if (password != confirmPass) {
            window.alert("Password not match!");
            return false;
        }
        else {
            return true;
        }
    }
</script>
</html>