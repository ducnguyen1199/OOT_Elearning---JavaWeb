<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<jsp:include page="/view/components/Header.jsp" />
	<div class="cart-page">
		<div class="container ">
			<div class="row justify-content-around">
				<div
					class="col-md-7 col-sm-12 col-xs-12 p-3 bg-white rounded shadow-sm mb-3">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="border-0 bg-light">
										<div class="p-2 pr-3 text-uppercase product">Product</div>
									</th>
									<th scope="col" class="border-0 bg-light price">
										<div class="py-2 text-uppercase">Price</div>
									</th>
									<th scope="col" class="border-0 bg-light remove">
										<div class="py-2 text-uppercase">Remove</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${sessionScope.order.items != null}">
									<c:forEach var="item" items="${sessionScope.order.items}">
										<jsp:include page="/view/components/ItemCart.jsp">
											<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
												name="maKhoaHoc" />
											<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
												name="tenKhoaHoc" />
											<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
												name="hinhAnh" />
											<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}"
												name="danhMuc" />
											<jsp:param value="${item.getDonGia()}" name="donGia" />
										</jsp:include>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div
					class="col-md-4 col-sm-12 col-xs-12 p-3 bg-white rounded shadow-sm mb-3">
					<div class="bg-light px-4 py-3 text-uppercase font-weight-bold">
						Order summary</div>
					<div class="p-4">
						<ul class="list-unstyled mb-4">

							<li class="d-flex justify-content-between py-3 border-bottom">
								<strong class="text-muted">Order Subtotal </strong> <c:if
									test="${sessionScope.order.items != null}">
									<strong> $${sessionScope.order.tongTien() }</strong>
								</c:if> <c:if test="${sessionScope.order.items == null}">
									<strong> $0 </strong>
								</c:if>
							</li>

							<li class="d-flex justify-content-between py-3 border-bottom">
								<strong class="text-muted">Tax</strong> <c:if
									test="${sessionScope.order.items != null}">
									<strong> $${sessionScope.order.tongGiamGia() }</strong>
								</c:if> <c:if test="${sessionScope.order.items == null}">
									<strong> $0 </strong>
								</c:if>
							</li>
							<li class="d-flex justify-content-between py-3 border-bottom">
								<strong class="text-muted">Total</strong> <c:if
									test="${sessionScope.order.items != null}">
									<h5 class="font-weight-bold">$${sessionScope.order.tongTien() + sessionScope.order.tongGiamGia() }</h5>
								</c:if> <c:if test="${sessionScope.order.items == null}">
									<h5 class="font-weight-bold">$0</h5>
								</c:if>

							</li>
						</ul>
						<a href="Courses" class="btn btn-dark rounded-pill py-2 btn-block">
							Continue shopping </a> <a href="ThanhToan"
							class="btn btn-dark rounded-pill py-2 btn-block"> Procceed to
							checkout </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="px-5 py-3">
		<div class="owl-carousel owl-theme custom">
			<c:forEach var="item" items="${courseDb}">
				<jsp:include page="/view/components/Card.jsp">
					<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}" name="maKhoaHoc" />
					<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}" name="tenKhoaHoc" />
					<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}" name="maDanhMuc" />
					<jsp:param value="${item.getKhoaHoc().getHinhAnh()}" name="hinhAnh" />
					<jsp:param value="${item.getKhoaHoc().getSoLuong()}" name="soLuong" />
					<jsp:param value="${item.getKhoaHoc().getMoTa()}" name="moTa" />
					<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}" name="maGiaoVien" />
					<jsp:param value="${item.getKhoaHoc().getXepHang()}" name="xepHang" />
					<jsp:param value="${item.getKhoaHoc().getThanhTien()}" name="thanhTien" />
					<jsp:param value="${item.getKhoaHoc().getGiamGia()}" name="giamGia" />	
					<jsp:param value="${item.getStatus()}" name="status" />
				</jsp:include>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />
	<script>
		$('.owl-carousel').owlCarousel({
			loop: false,
			margin: 30,
			nav: true,
			responsive: {
				0: {
					items: 1
				},
				600: {
					items: 3
				},
				1000: {
					items: 5
				}
			}
		});
	</script>
	
</body>
</html>