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
					<h1>
						<b>Sign in</b>
					</h1>

					<form class="form" method="post" action="/Elearning_FE/Loginhome" autocomplete="off">
						<input type="text" placeholder="Username" name="Username" required>
						<input type="password" placeholder="Password" name="Password" required>
						<div class="btn-form">
							<c:if test="${alertMsg != null}">
								<div class="errform" id="alertMsg" style="color: red">${alertMsg}</div>
							</c:if>
							<button class="test-btn btn-5" type="submit" id="login-button">Sign
								in</button>
						</div>
						<p>
							Don't have an account yet? <a href="/Elearning_FE/home-signup">Register
								now</a>
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
			      }).then((rs) => {
			    	  window.location.href="/Elearning_FE/home-login"
			    	})
			   }
		});
		
	</script>
</body>
</html>