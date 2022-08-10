<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="ud" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/viewAllUser/style.css">
    <title>All Users</title>
</head>
<body>
    <!-- HEADER NAVBAR SECTION -->
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

    <!-- TABLE SECTION -->
    <section class="table-section">
        <header class="header-container">
            <h3>
                Lists of Registered Users
            </h3>
        </header>
        <div class="table-container">
            <table class="table-class">
                <tr>
                	<th>UID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Update</th>
                </tr>
                <ud:forEach var="detail" items="${user}">
                <tr>
                	<td>${detail.uid}</td>
                    <td>${detail.fname} ${detail.lname}</td>
                    <td>${detail.username}</td>
                    <td>${detail.email}</td>
                    <td>${detail.address}</td>
                    <td>${detail.contact}</td>
                    <td><a href="update/${detail.uid}">Update</a></td>
                </tr>
                </ud:forEach>
            </table>
        </div>
    </section>
    <section class="delete-container">
    	<div class="delete-header">	
    		<h1>Delete User</h1>
    	</div>
    	<div class="form-container">
    		<form action="/deleteUser">
    			<label for="field">Enter User ID Below</label>
    			<input type="text" name="deleteUserData" id="field" placeholder="User ID" onkeydown="enter_two()"/>
                <button id="delete-button" onclick="window.location.href='/deleteUser';">Delete</button>
    		</form>
    	</div>
    </section>
</body>
<script type="text/javascript">

function enter_two() {
	if(event.key === 'Enter') {
        window.location.href='/deleteUser';
    }
}

function enter() {
    if(event.key === 'Enter') {
        window.location.href='/search';
    }
}
</script>
</html>