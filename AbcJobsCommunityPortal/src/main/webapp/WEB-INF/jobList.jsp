<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/jobList/style.css">
    <title>Job List | ABC</title>
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


    <section class="list-container">
        <ul>
            <jl:forEach var="list" items="${jobAttribute}">
            <li>
                <div class="card-select" onclick="window.location.href='talent/${list.job_id}'"></div>
                <img src="img/jobListPic/JobListPic-01.jpg" alt="joblistpic">
                <textarea name="list-title" class="list-title" disabled>${list.job_title}</textarea>
                <input type="text" readonly class="jobcompany" value="${list.job_company}" disabled/>
                <input type="text" readonly class="joblocation" value="${list.job_location}" disabled/>   
            </li>
            </jl:forEach>
        </ul>
    </section>
</body>
</html>