<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/component/headerUser/style.css">
<header>
    <a href="/home">
        <img src="${pageContext.servletContext.contextPath}/image/logo/CarSaleLogoRectangle2-01.png" alt="logo" class="home-logo">
    </a>
    <div class="header-btn-container">
        <button class="header-btn" id="header-btn-1" onclick="window.location.href='/home'">Home</button>
        <button class="header-btn" id="header-btn-2" onclick="window.location.href='/post/car'">Post Car</button>
    </div>
    <div class="header-profile-container">
        <p id="profile-title">Profile</p>
        <img src="${pageContext.servletContext.contextPath}/image/header/profile-icon-01.png" class="profile-logo">
        <div class="dropdown-content">
            <button id="profile-btn-1" onclick="window.location.href='/detail/user/${sessionUserId}'">Go to Profile</button>
            <button id="profile-btn-2" onclick="window.location.href='/logout'">Log Out</button>
        </div>
    </div>
</header>