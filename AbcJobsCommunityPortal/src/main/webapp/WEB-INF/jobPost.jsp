<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Talent Solution</title>
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/jobPost/style.css">
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


    <section class="card-section">
        <sf:form action="/talentpost/postjob" method="post" modelAttribute="postJob">
            <label for="jobtitle" id="jobtitle-label">Job Title *</label>
            <sf:input type="text" path="job_title" name="jobtitle" id="jobtitle" required="required"/>

            <label for="jobcompany" id="jobcompany-label">Company *</label>
            <sf:input type="text" path="job_company" name="jobcompany" id="jobcompany" required="required"/>

            <label for="workplace" id="workplace-label">Workplace Type *</label>
            <sf:input type="text" path="job_workplace" name="workplace" id="workplace" required="required"/>

            <label for="salary" id="link-label">Application Link *</label>
            <sf:input type="text" path="job_link" name="link" id="link" required="required"/>

            <label for="employment" id="employment-label">Employment Type *</label>
            <sf:input type="text" path="job_employment" name="employment" id="employment" required="required"/>

            <label for="joblocation" id="joblocation-label">Job Location *</label>
            <sf:input type="text" path="job_location" name="joblocation" id="joblocation" required="required"/>

            <label for="jobdesc" id="jobdesc-label">Job Description *</label>
            <sf:textarea name="jobdesc" path="job_desc" id="jobdesc" required="required"/>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="submit" value="Post a Job" id="submit"/>
        </sf:form>
    </section>
</body>
</html>