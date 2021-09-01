<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="popover-inner">
	<div class="popover_header">
		<div class="d-flex justify-content-between" style="padding: 5px 0">
			<div class="-avatar">
				<img src="./img/avatar.png" alt="" />
				<p>Điền Họ tên</p>
			</div>
			<div class="-lastupdated">Last updated 04/05/2020</div>
		</div>
		<h3 class="popover-header">
			<a href="#"> Điền Tên khóa hoc </a>
		</h3>
		<div class="popover_badge -with-content">
			<span class="badge-with-content"> <span class="badge-text">bestseller</span>
			</span> <span class="content-info"> <span> in <a href="true">
						Điền danh mục khóa học </a>
			</span> | Development
			</span>
		</div>
		<div class="course-info">
			<div class="e-icon">
				<i class="fa fa-play-circle-o" aria-hidden="true"></i> 5 lectures
			</div>
			<div class="e-icon">
				<i class="fa fa-clock-o" aria-hidden="true"></i> 10 houres
			</div>
			<div class="e-icon">
				<i class="fa fa-slideshare" aria-hidden="true"></i> All levels
			</div>
		</div>
	</div>
	<div class="popover_body">
		<div class="description">Điền Mô tả vào đây</div>
		<div class="description-info">With no prior experience, you will
			have the opportunity to walk through hands-on examples with Hadoop
			and Spark frameworks, two of the most common ...</div>
		<div class="popover_cart">
			<c:url value="/addToCart?maKhoaHoc=${param.maKhoaHoc}"
				var="addToCart"></c:url>
			<a href="${addToCart}" class="cart-btn-add">Add to cart</a>
		</div>

		<div class="d-flex justify-content-between align-items-center heart">
			<i class="fa fa-heart" aria-hidden="true"></i>
			<div class="fee">$100.00</div>
		</div>
	</div>
</div>