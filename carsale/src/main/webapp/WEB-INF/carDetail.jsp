<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Car ID</title>
    <link rel="icon" type="image/image" href="WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/cardDetail/style.css">
</head>
<body>
    <%if(session.getAttribute("sessionUserRole").equals("USER")) {%>
    <jsp:include page="headerUser.jsp"/>
    <%} %>
    
    <%if(session.getAttribute("sessionUserRole").equals("ADMIN")) {%>
    <jsp:include page="headerAdmin.jsp"/>
    <%} %>

    <section class="car-detail-container">
        <img src="${pageContext.servletContext.contextPath}/image/carDetail/Car-Image-Placeholder-01.png" alt="car-img">

        <!-- Car ID -->
        <p id="car-id" class="display">#${carData.getId()}</p>

        <!-- Car Model -->
        <h1 id="car-model" class="display">${carData.getModel()}</h1>

        <!-- Car Brand -->
        <p id="car-brand" class="display">${carData.getBrand()}</p>

        <!-- Car Registration Year -->
        <p id="car-registration" class="display">${carData.getYear()}</p>

        <!-- Car Description -->
        <textarea id="car-desc" class="display" disabled>${carData.getDescription()}</textarea>
 
        <!-- Car Price -->
        <h1 id="car-price" class="display">$${carData.getPrice()}</h1>
    </section>
    <section class="bid-container">
        <h1 id="bid-title">Bid List</h1>
        <table>
            <tr>
                <th>Bid ID</th>
                <th>Price</th>
                <th>Username</th>
                <th>Date</th>
            </tr>
            <c:forEach var="dataList" items="${listBidData}">
            <tr>
                <td>#${dataList.getId()}</td>
                <td>$${dataList.getBidPrice()}</td>
                <td>${dataList.getUser().getUname()}</td>
                <td>${dataList.getSaveDate()}</td>
            </tr>
            </c:forEach>
        </table>

		<%if(session.getAttribute("sessionUserRole").equals("USER")) {%>
        <!-- Bid Form Can Only Be Accessed by User -->
        <form:form action="/detail/car/${carData.getId()}/save" method="post" modelAttribute="saveModelData">
            <h1>Start Bid</h1>
            <form:input path="bidPrice" type="number" placeholder="Enter your bid $..." required="required"/>
            <button type="submit">Bid Now</button>
        </form:form>
        <%} %>

		<%if(session.getAttribute("sessionUserRole").equals("ADMIN")) {%>
        <!-- Warning Message For Admin Access -->
        <div class="admin-msg-container">
            <p>Permission to Bid is Prohibited for Admin Role</p>
        </div>
        <%} %>
    </section>
</body>
</html>