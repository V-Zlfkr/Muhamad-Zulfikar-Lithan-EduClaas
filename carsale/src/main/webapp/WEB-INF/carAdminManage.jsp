<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Car Management</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/carAdminManage/style.css">
</head>
<body>

    <jsp:include page="headerAdmin.jsp"></jsp:include>

    <section class="main-container">
        <div class="table-container">
            <h2>List of Posted Car</h2>
            <table>
                <tr>
                    <th>Car ID</th>
                    <th>Model</th>
                    <th>Brand</th>
                    <th>Registration Year</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="data" items="${listCarData}">
                <tr>
                    <td>#${data.getId()}</td>
                    <td>${data.getModel()}</td>
                    <td>${data.getBrand()}</td>
                    <td>${data.getYear()}</td>
                    <td>$${data.getPrice()}</td>
                    <td>${data.getStatus()}</td>
                	<c:if test="${data.getStatus() == 'ACTIVE'}">
                		<td>
                        	<button onclick="window.location.href='/list/carmanage/${data.getId()}/deactive'">Deactivate</button>
                   		</td>
                	</c:if>  
                	<c:if test="${data.getStatus() == 'DEACTIVE'}">
                		<td>
                        	<button onclick="window.location.href='/list/carmanage/${data.getId()}/active'">Activate</button>
                   		</td>
                	</c:if>  
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="search-container">
            <h2>Search Car ID</h2>
            <form action="/list/carmanage/search" method="get">
                <input type="number" name="searchKey" required="required"/>
                <button type="submit">Find Now</button>
            </form>
        </div>
    </section>
</body>
</html>