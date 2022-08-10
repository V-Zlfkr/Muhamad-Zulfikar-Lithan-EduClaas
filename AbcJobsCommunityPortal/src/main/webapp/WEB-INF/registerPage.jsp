<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/registerPage/style.css">
    <title>Registration</title>
</head>
<body>
    <section class="register-section">
        <div class="box-container">
            <div class="header-logo">
                <a href="/">
                    <img src="img/Logo-02.png" alt="header-logo">
                </a>
            </div>
            <div class="bg-img">
                <img src="img/stephen-walker-onIXxjH56AA-unsplash.png" alt="background-image">
            </div>
            <div class="shape-1"></div>
            <div class="header-form">
                <h3>Create your account</h3>
            </div>
            <div class="form-container">
                <sf:form action="/registerSuccess" method="post" modelAttribute="data" onsubmit="return passCheck()">

                    <sf:input type="text" id="firstname" path="fname" name="firstname" placeholder="First Name" required="required" pattern="[a-zA-Z ]*" title="Please enter alphabets only."/>

                    <sf:input type="text" id="lastname" path="lname" name="lastname" placeholder="Last Name" pattern="[a-zA-Z ]*" title="Please enter alphabets only."/>

                    <sf:input type="text" id="username" path="username" name="username" placeholder="Username" required="required" pattern="[a-zA-Z0-9 ]*" minlength="4" maxlength="10" title="Username must be 4 - 10 characters"/>

                    <sf:input type="email" id="email" path="email" name="email" placeholder="Email" required="required"/>

                    <sf:input type="text" id="address" path="address" name="address" placeholder="Address" required="required" pattern="[a-zA-Z0-9 ]*" title="Please enter valid address with alphanumeric only."/>

                    <sf:input type="number" id="contact" path="contact" name="contact" placeholder="Contact Number" required="required" title="Please enter number only."/>

                    <sf:input type="password" id="password" path="password" name="password" placeholder="Password" required="required" pattern="[a-zA-Z0-9]*" title="Please enter alphabets and numeric only."/>

                    <input type="password" id="confirmPass" name="confirmPass" placeholder="Confirm Password" required="required"/>

                    <input type="submit" value="Submit" id="submit"/>
                    
                </sf:form>
            </div>
            <div class="back">
                <a href="/">Back to Landing</a>
            </div>
            <div class="text-1">
                <p>Already a member?</p>
            </div>
            <div class="text-2">
                <p><a href="/login">Sign In</a></p>
            </div>
        </div>
    </section>
</body>
<script>

    var passCheck = function() {
        var password = document.getElementById('password').value;
        var confirmPass = document.getElementById('confirmPass').value;
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