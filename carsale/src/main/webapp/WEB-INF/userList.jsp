<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Users List</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/userList/style.css">
</head>
<body>

    <jsp:include page="headerAdmin.jsp"></jsp:include>

    <section class="main-container">
        <div class="table-container">
            <h2>List of Users</h2>
            <table>
                <tr>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>E-Mail</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="data" items="${listData}">
                <tr>
                    <td>${data.getId()}</td>
                    <td>${data.getFname()} ${data.getLname()}</td>
                    <td>${data.getUname()}</td>
                    <td>${data.getEmail()}</td>
                    <td>
                        <button onclick="window.location.href='/detail/user/${data.getId()}'">Update</button>
                        <button onclick="window.location.href='/list/user/${data.getId()}/delete'">Delete</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="search-container">
            <h2>Search User ID</h2>
            <form action="/list/user/search" method="get">
                <input type="text" name="searchId" required="required"/>
                <button type="submit">Find Now</button>
            </form>
            <button onclick="window.location.href='/list/user'">Reset List</button>
        </div>
    </section>
</body>
</html>