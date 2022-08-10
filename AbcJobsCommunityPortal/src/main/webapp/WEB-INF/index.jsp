<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" href="css/landingPage/style.css">
        <title>ABC Community Portal</title>
    </head>
    <body>

    <!-- NAVBAR -->
    <jsp:include page="component/header-index.jsp" />
    <!-- /NAVBAR -->

        <section class="hero-banner section-1">
            <img src="img/Hero Banner No Crop.png" alt="hero-image">
            <div class="hero-banner-container">
                <div class="text-banner-1">
                    <p>Develop</p>
                </div>
                <div class="text-banner-2">
                    <p>The Future Society</p>
                </div>
                <div class="text-banner-3">
                    <p>Creates your content, Own it, Share it, Publish it, and Contributes.</p>
                </div>
                <div class="button-banner-1">
                    <button onclick="window.location.href='/register'">Contribute</button>
                </div>
            </div>
        </section>
        <section class="section-2">
            <div id="anchor-1"></div>
            <img src="img/Section2 Elements-01.png" alt="section-2-bg">
            <div class="text-banner-4">
                <h1><span>Explore</span> Possibility</h1>
            </div>
            <div class="text-banner-5">
                <p>There are lots of topics that you can discover,<br>find the one that is suitable or necessary for you to join,<br>and connect with every members</p>
            </div>
        </section>
        <section class="section-3">
            <div id="anchor-2"></div>
            <img src="img/Section3 Elements.png" alt="section-3-bg" >
            <div class="text-banner-6">
                <h1><span>Show</span> Your Contribution</h1>
            </div>
            <div class="text-banner-7">
                <p>Create discussions and help those who in needs.<br>Build your reliable and quality job opportunities,<br>We will let the community show their contributions<br>and help accross the community</p>
            </div>
        </section>
        
        <!-- FOOTER -->

        <jsp:include page="component/footer.jsp" />

        <!-- /FOOTER -->

    </body>
    </html>