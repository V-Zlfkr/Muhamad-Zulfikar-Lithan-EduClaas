<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC || Post Car</title>
    <link rel="icon" type="image/image" href="WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/postCar/style.css">
</head>
<body>
	<jsp:include page="headerUser.jsp"></jsp:include>
    <section class="form-container">
        <form:form action="/post/car/save" method="post" modelAttribute="saveModelData">
            <form:input path="model" type="text" required="required" placeholder="Car Model" id="input-1" class="input"/>

            <form:input path="brand" type="text" required="required" placeholder="Car Brand" id="input-2" class="input"/>

            <form:input path="year" type="text" required="required" placeholder="Car Registration Year" id="input-3" class="input"/>

            <form:input path="price" type="text" required="required" placeholder="Car Price" id="input-4" class="input"/>

            <form:textarea path="description" type="text" required="required" placeholder="Car Description" id="input-5" class="input"></form:textarea>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button type="submit">Post Car</button>
        </form:form>
    </section>
</body>
</html>