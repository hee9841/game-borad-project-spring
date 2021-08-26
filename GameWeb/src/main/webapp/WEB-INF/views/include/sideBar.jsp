<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> GAME WEB </title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		var userInfo = ${sessionScope.userInfo};
	});
</script>
</head>
	<body>
		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/main.do">
                <div class="sidebar-brand-icon rotate-n-15">
                	<i class="fas fa-gamepad"></i>
                </div>
                <div class="sidebar-brand-text mx-3"> GAME WEB </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/main.do">
                    <i class="fas fa-home"></i>
                    <span> HOME </span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <c:if test="${empty userInfo}">
            	<!-- Nav Item - 로그인 -->
	            <li class="nav-item">
	                <a class="nav-link" href="/login/login.do">
	                    <i class="fas fa-fw fa-user"></i>
	                    <span> LOGIN </span></a>
	            </li>
            </c:if>
            <c:if test="${not empty userInfo}">
            	<!-- Nav Item - 게임하기 -->
	            <li class="nav-item">
	                <a class="nav-link" href="#">
	                    <i class="fas fa-fw fa-heart"></i>
	                    <span> GAME </span></a>
	            </li>
            </c:if>
            
            <!-- Nav Item - 게임 설명 -->
            <li class="nav-item">
                <a class="nav-link" href="/main.do#howToPlay">
                    <i class="fas fa-fw fa-gamepad"></i>
                    <span> 게임 설명 </span></a>
            </li>

            <!-- Nav Item - 잡담방-->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span> 잡담방 </span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"> Chat: </h6>
                        <a class="collapse-item" href="/board/showList.do?page=1"> 게시판 </a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
</body>
</html>