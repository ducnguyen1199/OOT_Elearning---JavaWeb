<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/img" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<c:if test="${statusLoading == true}">
		<jsp:include page="/view/components/LoadingHome.jsp" />
	</c:if>
	<jsp:include page="/view/components/Header.jsp" />
		<div id="payCourses" style="display: none"></div>
	<div class="checkout-page">
		<div class="checkout-content">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-xs-12 mb-3">
						<div class="your-items">
							<c:if test="${sessionScope.order.items.size() > 0}">
								<h3>Your Items (${sessionScope.order.items.size()})</h3>
							</c:if>
							<c:if test="${sessionScope.order.items.size() == null}">
								<h3>Your Items (0)</h3>
							</c:if>

							<div class="list-course">
								<c:if test="${sessionScope.order.items != null}">
									<c:forEach var="item" items="${sessionScope.order.items}">
										<jsp:include page="/view/components/ItemMiniCart.jsp">
											<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
												name="maKhoaHoc" />
											<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
												name="tenKhoaHoc" />
											<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
												name="hinhAnh" />
											<jsp:param value="${item.getDonGia()}" name="donGia" />
										</jsp:include>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-xs-12 mb-3">
						<div class="total-pay">
							<c:if test="${sessionScope.order.items != null}">
								<h3>Total: $${sessionScope.order.tongTien() }</h3>
							</c:if>
							<c:if test="${sessionScope.order.items == null}">
								<h3>Total: $0</h3>
							</c:if>
							<div class="total">
								<div class="payment">
									<div class="pay-methods">
										<span class="title">Payment Methods: </span> <span
											class="pay-cart"> <img
											src="${url}/mastercard.png" />
										</span> <span class="pay-cart"> <img
											src="${url}/visa.png" />
										</span> <span class="pay-cart"> <img
											src="${url}/paypal.png" />
										</span> <span class="pay-cart"> <img
											src="${url}/bitcoin.png" />
										</span>
									</div>
									<form>
										<div class="form-group">
											<input type="text" class="form-control"
												placeholder="Name on Card" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control"
												placeholder="Card Number" />
										</div>
										<div class="row">
											<div class="col">
												<select>
													<option>MM</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
											<div class="col">
												<select>
													<option>YY</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
											<div class="col">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Security Code" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<select>
													<option>Viet Nam</option>
													<option>Trung Quoc</option>
													<option>Thai Lan</option>
													<option>English</option>
													<option>Ameria</option>
													<option>India</option>
												</select>
											</div>
											<div class="col">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Zip/Postal Code" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<div class="form-group">
													<c:url value="/Payment" var="onPayment"></c:url>
													<a href="${onPayment}" class="btn btn-success" id="payment">Complete
														Payment</a>
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<i class="fa fa-lock" aria-hidden="true"></i> <span>Security
														Payment</span>
												</div>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />
	<script>
	$("#payment").on("click", function (e) {
		event.preventDefault();
		swal({
		         title: $("#payCourses").html(),
		         text: "Đăng ký thành công",
		         icon: "success",
		         button: false,
		         timer: 1000
		      }).then((rs) => {
		            window.location.href = `/Elearning_FE/Payment`;
		      });
		})
		
	</script>
</body>
</html>