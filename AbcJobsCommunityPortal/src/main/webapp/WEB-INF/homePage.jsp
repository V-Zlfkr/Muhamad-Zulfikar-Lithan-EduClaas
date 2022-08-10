<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/homePage/style.css">
    <title>Homepage</title>
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



    <section class="card-1">
        <div class="invis-box" onclick="window.location.href='/userUpdate/${sessionValid}'">
            <div class="profile-icon-2">
                <img src="img/profile-user.png" alt="icon">
            </div>
            <div class="text-2">
                <p>${sessionFname} ${sessionLname}</p>
            </div>
        </div>
        <div class="button-1">
            <button onclick="window.location.href='/userUpdate/${sessionValid}'">View Profile</button>
        </div>
        <div class="button-2">
            <button onclick="window.location.href='/logout'">Log Out</button>
        </div>
    </section>
    <section class="card-2">
        <div class="text-3">
            <p>Topic Suggestions</p>
        </div>
        <div class="text-4">
            <p>Most recently discussed on our forum</p>
        </div>
    </section>
</body>
</html>