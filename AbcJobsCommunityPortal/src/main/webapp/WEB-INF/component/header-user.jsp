<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<nav class="navbar-container">
    <div class="header-logo">
        <a href="/feed">
            <img src="${pageContext.servletContext.contextPath}/img/Logo White-02.png" alt="Logo-02">
        </a>
    </div>
    <sf:form action="/searchUser" method="post" modelAttribute="search">
        <div class="search-bar">
               <sf:input type="text" path="lname" name="search" id="search" placeholder="Search" onkeydown="enter()" style="padding-left: 20px; padding-right: 20px;"/>
        </div>
    </sf:form>
    <div class="hyperlink-1">
        <a href="#">Discussion</a>
    </div>
    <div class="hyperlink-2">
        <a href="/talentlist">Find Job</a>
    </div>
    <div class="profile-icon">
        <img src="${pageContext.servletContext.contextPath}/img/profile-user.png" alt="icon">
    </div>
    <div class="text-1">
        <p onclick="profileFunction()">Profile</p>
    </div>
    <div class="profile-dropdown" id="profile-dropdown" style="display: none;">
        <button id="profile-button-1" onclick="window.location.href='/userUpdate/${sessionValid}'">Profile</button>
        <button id="profile-button-2" onclick="window.location.href='/logout'">Log Out</button>
    </div>
</nav>
<script type="text/javascript">

    function profileFunction() {
      var x = document.getElementById('profile-dropdown');
      if (x.style.display == 'none') {
        x.style.display = 'block';
      } else {
        x.style.display = 'none';
      }
    }
    
    function enter() {
        if(event.key === 'Enter') {
            window.location.href='/search';
        }
    }
    </script>