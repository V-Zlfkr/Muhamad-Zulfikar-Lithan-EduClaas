<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Homepage</title>
    <link rel="icon" type="image/image" href="${pageContext.servletContext.contextPath}/WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/homePage/style.css">
</head>

<body>
    <%if(session.getAttribute("sessionUserRole").equals("USER")) {%>
    <jsp:include page="headerUser.jsp"/>
    <%} %>
    
    <%if(session.getAttribute("sessionUserRole").equals("ADMIN")) {%>
    <jsp:include page="headerAdmin.jsp"/>
    <%} %>

    <section class="main-content-container">
        <div class="search-container">
            <div class="search-box">
                <h2 class="search-title">Search Car</h2>
                <form action="/home/search" method="get" class="search-form">
                    <input name="searchKey" type="text" placeholder="Model, Brand, or Price" />
                </form>
                <p class="search-description">*By entering car's model, brand, and price. We listed it on the same page.
                    All data has been distributed from the trusted owner with accurate information.</p>
            </div>
        </div>
        <div class="car-list-container">
            <div class="list-title-container">
                <h1 class="list-title">Car List</h1>
            </div>
            <div class="list-container">
                <div class="row">
                <c:forEach var="data" items="${carData}">
                    <div class="column">
                        <div class="card">
                            <img src="${pageContext.servletContext.contextPath}/image/homepage/Car-Image-Placeholder-01.png" alt="image-placeholder">
                            <p style="color: rgb(172, 172, 172);">#${data.getId()}</p>
                            <p>${data.getModel()}</p>
                            <p>${data.getBrand()}</p>
                            <p>${data.getYear()}</p>
                            <button onclick="window.location.href='/detail/car/${data.getId()}'">Car Details</button>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
    </section>
</body>

</html>