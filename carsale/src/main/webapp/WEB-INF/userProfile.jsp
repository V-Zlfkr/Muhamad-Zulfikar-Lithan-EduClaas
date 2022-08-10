<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Profile</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/userProfile/style.css">
</head>
<body>
    
    <%if(session.getAttribute("sessionUserRole").equals("USER")) {%>
    <jsp:include page="headerUser.jsp"/>
    <%} %>
    
    <%if(session.getAttribute("sessionUserRole").equals("ADMIN")) {%>
    <jsp:include page="headerAdmin.jsp"/>
    <%} %>

    <section class="main-container">
        <div class="display-section">
            <img src="${pageContext.servletContext.contextPath}/image/userProfile/Profile-Img-Placeholder-01.jpg" alt="profile-img-placeholder">
            <div class="detail-container">
                <h2>${userData.getFname()} ${userData.getLname()}</h2>
                <p>${userData.getUname()}</p>
                <p>${userData.getEmail()}</p>
            </div>
        </div>
        <div class="form-container">
            <form action="/detail/user/${sessionUserId}/save" method="post">

                <!-- <input type="hidden" required="required" name="uid"/> -->

                <div id="input-1" class="input-box">
                    <label for="fname">First Name</label>
                    <input path="fname" type="text" required="required" name="fname" value="${userData.getFname()}"/>
                </div>

                <div id="input-2" class="input-box">
                    <label for="fname">Last Name</label>
                    <input path="lname" type="text" required="required" name="lname" value="${userData.getLname()}"/>
                </div>

                <div id="input-3" class="input-box">
                    <label for="uname">Username</label>
                    <input disabled="disabled" type="text" required="required" name="uname" value="${userData.getUname()}"/>
                </div>

                <div id="input-4" class="input-box">
                    <label for="email">Email</label>
                    <input disabled="disabled" type="text" required="required" name="email" value="${userData.getEmail()}"/>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <!-- <input type="hidden" required="required" name="password"/> -->

                <button type="submit" id="submit-button">Save Changes</button>

            </form>
        </div>
    </section>
</body>
</html>