<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<c:url value="/view/assets/img/" var="urlLogo"></c:url>
<div class="iq-sidebar">
	<div class="iq-sidebar-logo d-flex justify-content-between">
		<a href="/Elearning_FE/admin/dashboard"> <img
			src="${urlLogo}/logo-oot.PNG" class="img-fluid" alt="">
		</a>
		<div class="iq-menu-bt-sidebar">
			<div class="iq-menu-bt align-self-center">
				<div class="wrapper-menu">
					<div class="main-circle">
						<i class="ri-more-fill"></i>
					</div>
					<div class="hover-circle">
						<i class="ri-more-2-fill"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="sidebar-scrollbar">
		<nav class="iq-sidebar-menu">
			<ul class="iq-menu">
				<li class="iq-menu-title"><i class="ri-subtract-line"></i><span> Dashboard</span></li>
				<li class="active"><a href="/Elearning_FE/admin/dashboard"
					class="iq-waves-effect"><i class="ri-home-8-fill"></i><span>Home</span></a>
				</li>
				<li class="iq-menu-title"><i class="ri-subtract-line"></i><span>Manage
						</span></li>
				<c:choose>
					<c:when test="${UserAdmin.getRoleId() == 3}">
						<li class=""><a href="/Elearning_FE/admin/view-admin"
							class="iq-waves-effect"><i class="fa fa-user-circle"
								aria-hidden="true"></i><span>Admin</span></a>
						<li>
					</c:when>
				</c:choose>
				<li class=""><a href="/Elearning_FE/admin/course"
					class="iq-waves-effect"><i class="fa fa-chrome"
						aria-hidden="true"></i><span>Course</span></a>
				<li><a href="javascript:void(0);" class="iq-waves-effect"><i
						class="fa fa-address-card-o" aria-hidden="true"></i><span>Teacher
							</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
					<ul class="iq-submenu">
						<li><a href="/Elearning_FE/admin/teacher"><i
								class="fa fa-id-badge" aria-hidden="true"></i>Information</a></li>
						<li><a href="/Elearning_FE/admin/chi-tiet-giao-vien"><i
								class="fa fa-book" aria-hidden="true"></i>Teacher course</a></li>
					</ul></li>
				<li><a href="javascript:void(0);" class="iq-waves-effect"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span> Student
							</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
					<ul class="iq-submenu">
						<li><a href="/Elearning_FE/admin/user"><i
								class="fa fa-id-badge" aria-hidden="true"></i>Information</a></li>
						<li><a href="/Elearning_FE/admin/user-course"><i
								class="fa fa-film" aria-hidden="true"></i>Student course</a></li>
					</ul></li>

			</ul>
		</nav>
		<div class="p-3"></div>
	</div>
</div>
