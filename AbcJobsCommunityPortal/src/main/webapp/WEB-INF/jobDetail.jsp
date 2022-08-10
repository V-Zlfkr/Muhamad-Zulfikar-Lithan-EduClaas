<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/component/header-color.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/jobDetail/style.css">
    <title>${jobdetail.job_company} | ABC</title>
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


    <section class="card-bg">
        <img src="${pageContext.servletContext.contextPath}/img/jobListPic/JobListPic-01.jpg" alt="company-pic">
        <textarea id="jobtitle" readonly disabled>${jobdetail.job_title}</textarea>
        <input type="text" id="jobcompany" value="${jobdetail.job_company}" readonly disabled/>
        <input type="text" id="joblocation" value="${jobdetail.job_location}" readonly disabled/>
        <div id="line-1"></div>
        <input type="text" id="jobworkplace" value="${jobdetail.job_workplace}" readonly disabled/>
        <input type="text" id="jobemployment" value="${jobdetail.job_employment}" readonly disabled/>


        <% if(session.getAttribute("sessionRole").equals("USER")) {%>
            <button onclick="window.open('${jobdetail.job_link}')" id="apply-btn">Apply</button>
            <%} %>
        

            <% if(session.getAttribute("sessionRole").equals("ADMIN")) {%>
                <form action="deleteTalent" method="get">
                    <input readonly type="hidden" name="jobdelete" value="${jobdetail.job_id}"/>
                    <input type="submit" value="Delete Vacancy" id="delete-btn"/>
                </form>
                <%} %>


        <!-- <div id="line-2"></div> -->
        <p id="jobdesc">${jobdetail.job_desc}</p>
    </section>
</body>
</html>