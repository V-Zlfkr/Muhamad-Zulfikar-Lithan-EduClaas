<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <link rel="icon" type="image/image" href="WEB-INF/image/logo/CarSaleLogoRectangle-01.png">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/thankYouRegister/style.css">
</head>
<body>
    <h1 class="thank-you-title">Thank You !</h1>
    <i class="fa-solid fa-check fa-6x"></i>
    <p class="thank-you-text">Thank you for joining, with this account you could start bid your dream car. The page will direct you to login page, <i>automatically...</i></p>
</body>
<script src="${pageContext.servletContext.contextPath}/js/fontawesome/all.js">

</script>
<script type="text/javascript">

    setTimeout(function () {
           window.location.href= '/login';
        },2000);
    
    </script>
</html>