<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:url value="/view/assets/admin/images" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/admin/Head.jsp" />
<body>
	  <div id="loading">
         <div id="loading-center">
         </div>
      </div>
	<section class="sign-in-page">
		<div class="container sign-in-page-bg mt-5 p-0">
			<div class="row no-gutters">
				<div class="col-md-6 text-center">
					<div class="sign-in-detail text-white">
						<a class="sign-in-logo mb-5" href="#"><img
							src="${url}/logo-oot.PNG" class="img-fluid" alt="logo"></a>
						<div class="owl-carousel" data-autoplay="true" data-loop="true"
							data-nav="false" data-dots="true" data-items="1"
							data-items-laptop="1" data-items-tab="1" data-items-mobile="1"
							data-items-mobile-sm="1" data-margin="0">
							<div class="item">
								<img src="${url}/login/1.png" class="img-fluid mb-4" alt="logo">
								<h4 class="mb-1 text-white">Manage your orders</h4>
								<p>It is a long established fact that a reader will be
									distracted by the readable content.</p>
							</div>
							<div class="item">
								<img src="${url}/login/2.png" class="img-fluid mb-4" alt="logo">
								<h4 class="mb-1 text-white">Manage your orders</h4>
								<p>It is a long established fact that a reader will be
									distracted by the readable content.</p>
							</div>
							<div class="item">
								<img src="${url}/login/3.png" class="img-fluid mb-4" alt="logo">
								<h4 class="mb-1 text-white">Manage your orders</h4>
								<p>It is a long established fact that a reader will be
									distracted by the readable content.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 position-relative">
					<div class="sign-in-from">
						<h1 class="mb-0">Sign in</h1>
						<p>Enter your email address and password to access admin
							panel.</p>
						<form class="mt-4" action="/Elearning_FE/LoginAdmin" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="text" name="username" class="form-control mb-0" id="exampleInputEmail1"
									placeholder="Enter username " required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>  <input type="password"
									class="form-control mb-0" name="password" id="exampleInputPassword1"
									placeholder="Password" required>
							</div>
							<c:if test="${alertMsg != null}">
								<div id="alertMsg" class="alert alert-danger" > <strong>${alertMsg}</strong></div>
							</c:if>
							<div class="d-inline-block w-100">
								<div
									class="custom-control custom-checkbox d-inline-block mt-2 pt-1">
									<input type="checkbox" class="custom-control-input"
										id="customCheck1"> <label class="custom-control-label"
										for="customCheck1">Remember Me</label>
								</div>
								<button type="submit" class="btn btn-primary float-right">Sign
									in</button>
							</div>
							<div class="sign-info">
								<span class="dark-color d-inline-block line-height-2">Don't
									have an account? <a href="#">Sign up</a>
								</span>
								<ul class="iq-social-media">
									<li><a href="#"><i class="ri-facebook-box-line"></i></a></li>
									<li><a href="#"><i class="ri-twitter-line"></i></a></li>
									<li><a href="#"><i class="ri-instagram-line"></i></a></li>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/view/Html/admin/Script.jsp" />

</body>
</html>