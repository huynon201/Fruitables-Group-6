<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 24/05/2024
  Time: 16:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    function checkLoginStatus() {
        var loginInfo = "${loginInfo}";
        if (!loginInfo) {
            alert('You need to login to continue');
            window.location.href = '${pageContext.request.contextPath}/login';
        }
    }

    window.onload = function() {
        checkLoginStatus();
    };
</script>

<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
    </a>
    <a href="#" class="sidebar-toggler flex-shrink-0">
        <i class="fa fa-bars"></i>
    </a>
    <form class="d-none d-md-flex ms-4">
        <input class="form-control border-0" type="search" placeholder="Tìm kiếm">
    </form>
    <div class="navbar-nav align-items-center ms-auto">

        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="<c:url value="/resource/admin/img/user.jpg"/>" alt="" style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex">${loginInfor.username}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <c:if test="${not empty loginInfo}">
                    <a href="#" class="my-auto" onclick="logout()">
                       Đăng xuất
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</nav>

<script>
    function logout() {
        let ans = confirm("Do you want to logout?");
        if (ans) {
            window.location = "${pageContext.request.contextPath}/logout";
        }
    }
</script>
