<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/component/header-color.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/userUpdate/style.css">
    <title>Dashboard</title>
</head>
<body>

    
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



    <section class="section-1-profile">
        <div class="profile-picture-box">
            <img src="${pageContext.servletContext.contextPath}/img/profile-user.png" alt="">
        </div>
        <div class="fullname-profile">
            <p>${updateprofile.fname} ${updateprofile.lname}</p>
        </div>
        <div class="username-profile">
            <p>${updateprofile.username}</p>
        </div>
    </section>
    <section class="section-2-profile">
        <div class="title-1">
            <p>Dashboard</p>
        </div>
        <div class="email-profile">
            <h1>Email</h1>
            <p>${updateprofile.email}</p>
        </div>
        <div class="contact-profile">
            <h1>Contact</h1>
            <p>${updateprofile.contact}</p>
        </div>
        <div class="address-profile">
            <h1>Address</h1>
            <p>${updateprofile.address}</p>
        </div>
    </section>
    <section class="section-2-profile">
        <div class="title-2">
            <p>Edit Profile Setting</p>
        </div>
        <div class="box-container">
            <div class="title-3">
                <h1>Edit Panel</h1>
            </div>
            <form action="applyUpdate" method="get">

                <input readonly type="hidden" name="uid" id="uid-update" value="${updateprofile.uid}"/>
            
                <label for="fname-update" id="label-1">First Name</label>
                <input type="text" name="fname" id="fname-update" value="${updateprofile.fname}"/>

                <label for="lname-update" id="label-2">Last Name</label>
                <input type="text" name="lname" id="lname-update" value="${updateprofile.lname}"/>

                <label for="username-update" id="label-3">Username</label>
                <input type="text" name="username" id="username-update" value="${updateprofile.username}"/>
                
                <input readonly type="hidden" name="email" id="email-update" value="${updateprofile.email}"/>

                <label for="contact-update" id="label-4">Contact</label>
                <input type="text" name="contact" id="contact-update" value="${updateprofile.contact}"/>

                <label for="address-update" id="label-5">Address</label>
                <input type="text" name="address" id="address-update" value="${updateprofile.address}"/>
                
                <input readonly type="hidden" name="password" id="password-update" value="${updateprofile.password}"/>

                <input readonly type="hidden" name="role" id="role-update" value="${updateprofile.role}"/>

                <input type="submit" value="Save" id="submit"/>

            </form>
        </div>
    </section>
</body>
</html>