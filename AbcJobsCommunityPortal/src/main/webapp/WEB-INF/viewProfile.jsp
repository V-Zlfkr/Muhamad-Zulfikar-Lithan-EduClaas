<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="su" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/component/header-bw.css">
    <link rel="stylesheet" href="css/viewProfile/style.css">
    <title>View</title>
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



    <!-- BIO CONTENT -->
    <section class="bio-container">
        <div class="profile-img">
            <img src="img/profile-user.png" alt="profile-image">
        </div>
        <su:forEach var="user" items="${singleUser}">
        	<div class="text-2">
            	<p>${user.fname} ${user.lname}</p>
        	</div>
       		<div class="text-3">
            	<p>Email :</p>
        	</div>
        	<div class="text-4">
            	<p>${user.email}</p>
        	</div>
        	<div class="text-5">
            	<p>Username :</p>
        	</div>
        	<div class="text-6">
            	<p>${user.username}</p>
        	</div>
        </su:forEach>
        <div class="text-7">
            <p>Bio</p>
        </div>
        <div class="follow-button">
            <button id="edit">Follow</button>
        </div>
    </section>
</body>
</html>