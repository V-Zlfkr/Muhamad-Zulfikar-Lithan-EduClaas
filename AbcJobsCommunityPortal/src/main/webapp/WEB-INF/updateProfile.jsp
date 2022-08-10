<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/component/header-color.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/updateProfile/style.css">
    <title>Update Profile</title>
</head>
<body>

    <!-- NAVBAR -->
    <% if(session.getAttribute("sessionRole").equals("USER")) {%>
        <!-- HEADER NAVBAR SECTION -->
        <jsp:include page="component/header-user.jsp" />
        <!-- /NAVBAR -->
        <%} %>
        
        
        <% if(session.getAttribute("sessionRole").equals("ADMIN")) {%>
        <!-- HEADER NAVBAR SECTION -->
        <jsp:include page="component/header-admin.jsp" />
        <!-- /NAVBAR -->
        <%} %>
    <!-- /NAVBAR -->

    <!-- UPDATE INPUT -->
    <section class="update-section">
        <div class="box-container">
            <div class="header-edit">
                <h1>Edit Profile</h1>
            </div>
            <div id="box-element"></div>
            <form action="dataUpdate" method="get">

            	<label for="uid-update" id="label-1">User ID (Read-Only)</label>
                <input readonly type="text" name="uid" id="uid-update" value="${updateprofile.uid}"/>
            
                <label for="fname-update" id="label-2">First Name</label>
                <input type="text" name="fname" id="fname-update" value="${updateprofile.fname}"/>
                <!-- <input type="text" name="fname" id="fname-update" value="First Name"/> -->

                <label for="lname-update" id="label-3">Last Name</label>
                <input type="text" name="lname" id="lname-update" value="${updateprofile.lname}"/>
                <!-- <input type="text" name="lname" id="lname-update" value="Last Name"/> -->

                <label for="username-update" id="label-4">Username</label>
                <input type="text" name="username" id="username-update" value="${updateprofile.username}"/>
                <!-- <input type="text" name="username" id="username-update" value="Username"/> -->
                
                <label for="email-update" id="label-5">E-mail (Read-Only)</label>
                <input readonly type="email" name="email" id="email-update" value="${updateprofile.email}"/>

                <label for="contact-update" id="label-6">Contact</label>
                <input type="text" name="contact" id="contact-update" value="${updateprofile.contact}"/>
                <!-- <input type="text" name="contact" id="contact-update" value="Contact"/> -->

                <label for="address-update" id="label-7">Address</label>
                <input type="text" name="address" id="address-update" value="${updateprofile.address}"/>
                <!-- <input type="text" name="address" id="address-update" value="Address"/> -->
                
                <label for="password-update" id="label-8">Password (Read-Only)</label>
                <input readonly type="password" name="password" id="password-update" value="${updateprofile.password}"/>

                <input readonly type="hidden" name="role" id="role-update" value="${updateprofile.role}"/>

                <input type="submit" value="Save" id="submit"/>

            </form>
        </div>
    </section>

</body>
</html>