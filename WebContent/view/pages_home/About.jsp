<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img_teacher" var="url"></c:url>
<c:url value="/view/assets/img" var="url2"></c:url>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<c:if test="${statusLoading == true}">
		<jsp:include page="/view/components/LoadingHome.jsp" />
	</c:if>
	<jsp:include page="/view/components/Header.jsp" />
	<div class="about">
		<div class="get-knowledge"
			style=" background: url(${url2}/aboutbg.jpg)">
			<div class="content">
				<h1>GET KNOWLEDGE</h1>
				<p class="mb-4">Here you can review some statistics about our
					Education Center</p>
				<div class="can-learn">
					<div class="container">
						<div class="row">
							<div class="col-3">
								<div class="item item1">
									<img src="${url2}/guitar.png" />
									<p>Social Media Management</p>
								</div>
							</div>
							<div class="col-3">
								<div class="item item2">
									<i class="fa fa-laptop"></i>
									<p>Progamming Course</p>
								</div>
							</div>
							<div class="col-3">
								<div class="item item3">
									<i class="fa fa-camera"></i>
									<p>Filmmaking</p>
								</div>
							</div>
							<div class="col-3">
								<div class="item item4">
									<i class="fa fa-bullhorn"></i>
									<p>Cinema Production</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="who-are-we">
			<div class="container">
				<div class="row justify-content-around">
					<div class="col-5">
						<h4>WHO ARE WE?</h4>
						<p class="my-3">
							"We are OOT-Elearning" <br>
							A website of education. We help the teachers and the student connect to each others and provide to the student the best courses.
						</p>
						<button class="btn btn-info contact">CONTACT US NOW</button>
					</div>
					<div class="col-5">
						<img src="${url2}/aboutus.jpg" />
					</div>
				</div>
			</div>
		</div>

		<div class="About_us">
			<h1>About Us</h1>
			<div class="About-content row">
				<div class="col-4 content-left">
					<img class="img-fluid" src="${url2}/09.png" alt=""></img>
					<ul class="list-about">
						<li><a href="/Elearning_FE/TrangChu">Home </a></li>
						<li><a href="/Elearning_FE/About">About </a></li>
						<li><a
							href="https://www.youtube.com/watch?v=Nr6FdfxrC_w&t=32s">Video</a>
						</li>
					</ul>
					<p>If drinking a coffee in the morning don't make you feel
						awake, delete a column in database for better feeling</p>
				</div>
				<div class="col-4 content-mid">
					<div>
						<h3>
							<i class="fa fa-check"></i> Education School Technology
						</h3>
						<ul class="list">
							<li>UIT - University of Information Technology</li>
							<li>K12 - Faculty of Information Technology</li>
						</ul>
					</div>
					<div>
						<h3>
							<i class="fa fa-check"></i> Some Project
						</h3>
						<ul class="list">
							<li>E-Learning - ReactJS</li>
							<li>Online Ticket Booking Service - Angular</li>
						</ul>
					</div>
					<div>
						<h3>
							<i class="fa fa-check"></i> Something do not ask us
						</h3>
						<ul class="list">
							<li>Help you to install Window :)</li>
							<li>Help you to hack Facebook</li>
						</ul>
					</div>
				</div>
				<div class="col-4 content-right">
					<iframe style="width: 100%; height: 200px;"
						src="https://www.youtube.com/embed/Nr6FdfxrC_w" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<iframe style="width: 100%; height: 200px; margin-top:15px;"
						src="https://www.youtube.com/embed/Ni9aZKbjDoA" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<jsp:include page="/view/components/Footer.jsp" />
		<jsp:include page="/view/components/BackToTop.jsp" />
		<jsp:include page="/view/Html/Script.jsp" />
</body>

</html>