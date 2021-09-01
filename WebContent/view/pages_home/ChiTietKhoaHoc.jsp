<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/img_course" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<%
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
	%>
	<jsp:include page="/view/components/LoadingHome.jsp" />
	<jsp:include page="/view/components/Header.jsp" />
	<section class="course">
		<div class="course-details">
			<div class="row container mx-auto">
				<div class="col-sm-12 d-flex justify-content-end gift-wishlist">
					<a class="gift-wistlist__gift" href="#"> <span class="cardGift">
							<i class="fa fa-gift"></i>
					</span> <span>Gift This Course</span>
					</a>
					<button class="gift-wistlist__wishlist btn">
						<div class="heart">
							<span class="ac-icon ac-icon-love"></span>
						</div>
						<span>Wishlist</span>
					</button>
				</div>
				<div class="col-sm-8 col-12 detail-info">
					<div class="detail-info__title">
						<div>${course.tenKhoaHoc}</div>
						<div>${course.moTa}</div>
					</div>

					<div class="wrapper-details d-flex align-items-center">
						<div class="wrapper__badge d-flex">
							<span class="badge-with-content"> <span class="badge-text">bestseller</span>
							</span>
						</div>
						<div class="star d-flex align-items-center">
							<span class="material-icons"> grade </span> <span
								class="material-icons"> grade </span> <span
								class="material-icons"> grade </span> <span
								class="material-icons"> grade </span> <span
								class="material-icons"> star_half </span> <span>${course.xepHang }</span>
							<span>${course.soLuong} students enrolled</span>
						</div>
					</div>
					<div style="margin-top: 10px; font-size: 15px">
						<span style="text-transform: capitalize; margin-right: 15px;">
							Created by ${tenGiaoVien} </span> <span>Last updated <%=df.format(new java.util.Date())%></span>
					</div>
					<div style="margin-top: 10px; font-size: 15px; display: flex">
						<span> <i class="fa fa-comment"></i>
						</span> <span>&nbsp;English</span> <span class="material-icons ml-3"
							style="font-size: 20px; line-height: 1.1; margin-right: -2px;">
							closed_caption </span> <span> &nbsp;English [Auto-generated],
							French [Auto-generated] </span>
					</div>
				</div>
				<div class="col-sm-4 col-12">
					<div class="right-col__content">
						<div class="right-col__module">
							<div class="detail-course__img">
								<div class="-style"></div>
								<img src="${url}/${course.hinhAnh}" alt="error" class="img-fluid" />
							</div>
							<div class="right-col__inner">
								<div class="detail-course__info">
									<div class="buy-box">
										<div class="buy-box__element">
											<div class="-price-discount">
												<span style="font-weight: 700">$<fmt:formatNumber
														type="number" groupingUsed="false"
														value="${Math.round(course.thanhTien -(course.thanhTien * course.giamGia / 100))}" />
												</span>
											</div>
											<div class="-price-origin">
												<span> <s>$${course.thanhTien}</s>
												</span>
											</div>
											<div class="-price-discount-percent">
												<span>${course.giamGia}% off</span>
											</div>
										</div>
										<div class="buy-box__element--discount-expiration">
											<div class="-icon">
												<span class="material-icons"> alarm_on </span>
											</div>
											<div class="-text">
												<b>1 day</b> left at this price!
											</div>
										</div>
										<div class="buy-box__element--add-to-cart-button">
											<button
												class="cart-btn btn-lg btn--add mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent
													${status == 1 ? 'ordered' : status == 2 ? 'bought' : ''} 
												"
												onClick="handleAddToCart(${course.maKhoaHoc},${status},`${username}`)" <c:if test="${status >= 1}">disabled</c:if>>
													${status == 0 ? "Add to cart" : status == 1 ? "Ordered" : "Bought"}
												</button>
										</div>
										<c:if test="${status <= 1 }">
											<div class="buy-box__element--buy-now-button">
											<a href="/Elearning_FE/GioHang" class="btn btn--buy btn-lg text-center">Buy
												now</a>
											</div>
										</c:if>
									</div>
								</div>
								<div class="buy-box__element buy-box__element--money-back">
									<span class="money-back"> 30-Day Money-Back Guarantee </span>
								</div>
								<div class="incentives">
									<div class="incentives__title">This course includes</div>
									<ul class="incentives__list">
										<li class="incentives__item"><span class="material-icons">
												ondemand_video </span> <span>47.5 hours on-demand video</span></li>
										<li class="incentives__item"><span class="material-icons">
												insert_drive_file </span> <span>21 articles</span></li>
										<li class="incentives__item"><span class="material-icons">
												description </span> <span>1 downloadable resource</span></li>
										<li class="incentives__item"><span class="material-icons">
												code </span> <span>6 coding exercises</span></li>
										<li class="incentives__item"><span class="material-icons">
												all_inclusive </span> <span>Full lifetime access</span></li>
										<li class="incentives__item"><span class="material-icons">
												phone_iphone </span> <span>Access on mobile and TV</span></li>
										<li class="incentives__item"><span> <i
												class="fa fa-certificate"></i>
										</span> <span>Certificate of Completion</span></li>
									</ul>
								</div>
								<div class="coupon">
									<form class="coupon_form animated fadeIn" id="coupon_form">
										<div class="input-group">
											<input type="text" class="form-control"
												aria-describedby="button-addon" placeholder="Enter Coupon" />
											<div class="input-group-append">
												<button class="btn" type="button" id="button-addon">
													Apply</button>
											</div>
										</div>
									</form>

									<button class="coupon__btn btn btn-link" id="applyCoupon">
										Apply Coupon</button>
								</div>
								<div class="share">
									<div class="share__underline"></div>
									<div class="share__body">
										<button class="btn btn-link d-flex justify-content-center">
											<span class="material-icons"> share </span> <span
												style="line-height: 1.6; margin-left: 5px;">Share</span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="right-col__train">
							<div class="right-col__inner">
								<div class="buy-for-team__title">Training 5 or more
									people?</div>
								<p class="buy-for-team__text">Get your team access to 3,500+
									top Udemy courses anytime, anywhere.</p>
								<a href="false" class="buy-for-team__link"> Try Udemy for
									Business </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row py-5">
				<div class="col-sm-8">
					<div class="what-you-get">
						<div class="what-you-get__content">
							<div class="what-you-get__title">What you'll learn</div>
							<ul class="what-you-get__items px-0">
								<li class="what-you-get__item"><span
									class="what-you-get__icon"> <span class="material-icons">
											done </span>
								</span> <span class="what-you-get__text"> To develop a modern
										and responsive application with Angular 6 </span></li>
								<li class="what-you-get__item"><span
									class="what-you-get__icon"> <span class="material-icons">
											done </span>
								</span> <span class="what-you-get__text"> To implement good
										practices by creating services, interfaces, models ... </span></li>
								<li class="what-you-get__item"><span
									class="what-you-get__icon"> <span class="material-icons">
											done </span>
								</span> <span class="what-you-get__text"> To articulate all the
										concepts discussed in a practical case: by creating a real
										application </span></li>
								<li class="what-you-get__item"><span
									class="what-you-get__icon"> <span class="material-icons">
											done </span>
								</span> <span class="what-you-get__text"> To be in a position of
										strength in relation to companies and recruiters seeking
										developers at the cutting edge of technology </span></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row pb-5">
				<div class="col-sm-8">
					<div class="requirement">
						<div class="requirement__title">Requirements</div>
						<ul class="requirement__list">
							<li class="requirement__item">This not a beginner course —
								You should be confident in coding HTML and CSS before taking the
								course</li>
							<li class="requirement__item">Any computer and OS will work
								— Windows, macOS or Linux</li>
							<li class="requirement__item">There is no need for any paid
								software — The text editor you already have works just fine</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row pb-5">
				<div class="col-sm-8">
					<div class="rating row">
						<div class="col-sm-12 rating__title mb-5">Student feedback</div>
						<div class="col-sm-4 rating-inner justify-content-center">
							<div class="rating-col text-center">
								<div class="rating-col__number">
									<span class="odometer" data-count="4.7">0</span>
								</div>
								<div class="rating-col__text">Course Rating</div>
								<div class="rating-col__star">
									<span class="material-icons"> grade </span> <span
										class="material-icons"> grade </span> <span
										class="material-icons"> grade </span> <span
										class="material-icons"> grade </span> <span
										class="material-icons"> star_half </span>
								</div>
							</div>
						</div>
						<div class="col-sm-4 rating-inner px-0">
							<div class="rating-col__element">
								<ul class="ul-list">
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Communication</span></li>
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Maecenas cursus mauris justo</span></li>
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Suspendisse sit amet</span></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4 rating-inner px-0">
							<div class="rating-col__element">
								<ul class="ul-list">
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Suspendisse sit amet</span></li>
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Communication</span></li>
									<li class="ul-list__item"><span class="material-icons">
											grade </span> <span>5.0 Maecenas cursus mauris justo</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />

	<jsp:include page="/view/Html/Script.jsp" />
</body>
</html>