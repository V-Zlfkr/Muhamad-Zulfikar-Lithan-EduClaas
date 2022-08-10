<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk Option</title>
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/jobHome/style.css">
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


    <section id="buttons">
        <button id="button-1" onclick="window.location.href='/talentlist'">Job Vacancy List</button>
        <button id="button-2" onclick="window.location.href='/talentpost'">Post a New Job Vacancy</button>
    </section>
</body>
</html>