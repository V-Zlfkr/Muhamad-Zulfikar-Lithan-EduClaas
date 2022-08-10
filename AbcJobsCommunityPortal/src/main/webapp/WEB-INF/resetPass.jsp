<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/resetPass/style.css">
    <title>Reset Password</title>
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
                <p>Reset Password</p>
            </div>
            <div class="text-2">
                <p>You have passed our verification! Here you could reset your password and set a new one. Cheers!</p>
            </div>
            <div class="form-container">
                <form action="/resetPassSuccess" method="post" onsubmit="return passCheck()">

                    <input readonly type="hidden" name="uid" value="${resetPassData.uid}"/>

                    <input readonly type="hidden" name="fname" id="fname-update" value="${resetPassData.fname}"/>

                    <input readonly type="hidden" name="lname" id="lname-update" value="${resetPassData.lname}"/>

                    <input readonly type="hidden" name="username" id="username-update" value="${resetPassData.username}"/>

                    <input readonly type="hidden" name="email" id="email-update" value="${resetPassData.email}"/>

                    <input readonly type="hidden" name="contact" id="contact-update" value="${resetPassData.contact}"/>

                    <input readonly type="hidden" name="address" id="address-update" value="${resetPassData.address}"/>

                    <input readonly type="hidden" name="role" id="role-update" value="${resetPassData.role}"/>

                    <input type="password" name="password" id="password" placeholder="New Password" required="required"/>

                    <input type="password" name="confirmPass" id="confirmPass" placeholder="Confirm New Password" required="required"/>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <input type="submit" value="Reset Password" id="submit"/>

                </form>
            </div>
            <div class="hyperlink-1">
                <a href="/login">Back to Login Page</a>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">

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