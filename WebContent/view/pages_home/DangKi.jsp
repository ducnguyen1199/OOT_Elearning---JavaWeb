<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<jsp:include page="/view/components/Header.jsp" />
	<div class="bg-form">
		<div class="bg-blur">
			<div class="wrapper-form">
				<div class="container-form">
					<c:if test="${opt != 1}">
						<h1>
							<b>Sign up</b>
						</h1>
					</c:if>
					<c:if test="${opt == 1}">
						<h1>
							<b>Verification Gmail</b>
						</h1>
					</c:if>
					<form class="form" action="/Elearning_FE/SignUpHome" method="post"
						autocomplete="off">
						<c:if test="${opt != 1}">
							<c:if test="${user==null }">
								<input type="text" pattern="[A-Za-z0-9]{1,}"
									title="Tài khoản có các kí tự đặc biệt" placeholder="User name"
									name="username" Required>
								<input type="password" placeholder="Password" name="password"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Mật khẩu ít nhất một số và một chữ hoa và chữ thường và ít nhất 8 ký tự trở lên"
									Required>
								<input type="text" pattern="[A-Za-z ]{1,}"
									title="Tên bạn có các kí tự đặc biệt" placeholder="Full name"
									name="fullname" Required>
								<input type="text" pattern="[0-9]{10,13}"
									placeholder="Phone number" name="number" Required>
								<input type="email" placeholder="Email" name="email" Required>
								<div class="btn-form">
							</c:if>
							<c:if test="${user!=null }">
								<input type="text" pattern="[A-Za-z]{1,}"
									title="Tài khoản có các kí tự đặc biệt"
									value="${user.getTaiKhoan()}" name="username" Required>
								<p style="color: red; font-size: 12px; margin-top: 0">The
									Account already exists. Please enter a different Account</p>
								<input type="password" value="${user.getMatKhau()}" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Mật khẩu ít nhất một số và một chữ hoa và chữ thường và ít nhất 8 ký tự trở lên"
									name="password" Required>
								<input type="text" pattern="[A-Za-z ]{1,}"
									title="Tên bạn có các kí tự đặc biệt"
									value="${user.getHoTen()}" name="fullname" Required>
								<input type="text" pattern="[0-9]{10,13}"
									value="${user.getSoDienThoai()}" name="number" Required>
								<input type="email" value="${user.getEmail()}" name="email"
									Required>
								<div class="btn-form">
							</c:if>
							<button class="test-btn btn-5" type="submit" id="login-button">Sign
								up</button>
				</div>
				</c:if>
				<c:if test="${opt == 1}">
					<input type="hidden" name="username" value="${user.getTaiKhoan()}">
					<input type="hidden" name="password" value="${user.getMatKhau()}">
					<input type="hidden" name="fullname" value="${user.getHoTen()}">
					<input type="hidden" name="number" value="${user.getSoDienThoai()}">
					<input type="hidden" name="email" value="${user.getEmail()}">
					<p>OPT has been sent to the email you registered</p>
					<input type="text" placeholder="OPT" name="xacnhan" Required>
					<c:if test="${textOPT!=null}">
						<p style="color: red">OTP is not correct</p>
					</c:if>
					<div class="btn-form">
						<button class="test-btn btn-5" type="submit" id="login-button">confirm</button>
					</div>
				</c:if>

				<p>
					Already have login and password? <a href="/Elearning_FE/home-login">Sign
						in now</a>
				</p>
				</form>

			</div>

			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	</div>
	<c:if test="${aleartErr != null}">
		<div id="aleartErr" style="display: none">${aleartErr}</div>
	</c:if>
	<c:if test="${aleartSuccess != null}">
		<div id="aleartSuccess" style="display: none">${aleartSuccess}</div>
	</c:if>
	<c:if test="${alertMsg != null}">
		<div id="alertMsg" style="color: red">${alertMsg}</div>
	</c:if>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />

	<script>
		$(window).on("load", function () {
			if ($("#aleartErr").length) {
			      swal({
			         title: $("#aleartErr").html(),
			         icon: "warning",
			         dangerMode: true,
			         timer: 1000
			      })
			   }
				if ($("#aleartSuccess").length) {
				      swal({
				         title: $("#aleartSuccess").html(),
				         icon: "success",
				         successMode: true,
				         timer: 1000
				      }).then((rs) => {
				    	  window.location.href="/Elearning_FE/home-login"
				    })
				 }
		});
		
	</script>
</body>
</html>