<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk Email</title>
    <link rel="stylesheet" href="css/component/header-color.css">
    <link rel="stylesheet" href="css/bulkEmail/style.css">
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



    <section class="bulk-form">
        <form action="/sendBulk" method="post">
            <div class="select-target">
                <label for="receiver">Enter Receiver</label>
                <input type="text" id="receiver" name="receiver" placeholder="example@email.com" required="required"/>
            </div>
            <div class="title-card">
                <input type="text" id="subject" name="subject" placeholder="Enter Subject" required="required"/>
            </div>
            <div class="body-text-card">
                <textarea id="bulk" name="bulk" placeholder="Enter Bulk" required="required"></textarea>

                <div class="submit-card">
                    <input type="reset" id="reset" value="Delete"/>
                </div>
                <div class="submit-card">
                    <input type="submit" id="submit" value="Send"/>
                </div>
            </div>
            <input type ="hidden" name ="${_csrf.parameterName }" value ="${_csrf.token }"/>
        </form>
    </section>
</body>
</html>