<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img_teacher" var="url"></c:url>
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
	<section class="intro">
		<div class="container">
			<div class="intro_content">
				<h3>LEARN ONLINE COURSES</h3>
				<h1>Advance Your Career.</h1>
				<p class="sub-title">
					<span class="number">6,178</span> courses in Business, Technology
					and Creative Skills taught by industry experts.
				</p>
				<form action="TrangChu" method="post" autocomplete="off">
					<div class="col-6 mx-auto search">
						<div class="input-group p-3 bg-white">
							<input type="text" class="form-control input" id="tc-s"
								placeholder="What do you want to learn?" name="keyword"
								value="${keyword}" required />
							<div class="input-group-append">
								<button class="btn btn-info" type="submit">
									Search <i class="ti-angle-right small"></i>
								</button>
							</div>
							<c:if test="${!keyword && keyword != null && keyword != ''}">
								<div class="list-filter " id="tc-content-search">
									<c:choose>
										<c:when test="${listCourseBykw.size() > 0 }">
											<c:forEach var="item" items="${listCourseBykw}">
												<jsp:include page="/view/components/ItemMiniCart.jsp">
													<jsp:param value="${item.getHinhAnh()}" name="hinhAnh" />
													<jsp:param value="${item.getMaKhoaHoc()}" name="maKhoaHoc" />
													<jsp:param value="${item.getTenKhoaHoc()}"
														name="tenKhoaHoc" />
													<jsp:param
														value="${item.getThanhTien()*(1 - item.getGiamGia()/100)}"
														name="donGia" />
												</jsp:include>
											</c:forEach>
										</c:when>
										<c:when test="${listCourseBykw.size() == 0 }">
											<div class="item find">
												<p class="text-center">No course found</p>
											</div>
										</c:when>
									</c:choose>
								</div>
							</c:if>
						</div>
					</div>
				</form>
				<div class="buttons">
					<button class="btn btn-success start">Start Free Trial</button>
					<button class="btn become">Become An Instructor</button>
				</div>
			</div>
		</div>

	</section>

	<section class="use-course fix_Use-Course">
		<h1 class="font-weight-bold">WHY USE OUR COURSES?</h1>
		<p class="my-3">We have collected all of the necessary tools for
			effective study. Here you can find high quality free and paid
			programs. Every student has the opportunity to become a teacher.</p>

		<div class="row">
			<div class="col-4">
				<div class="item"
					style="background-image: url('view/assets/img/banner1.png');">
					<div class="content text-right">
						<h3>CERTTIFICAE LEAD</h3>
						<h5>TO GET JOB</h5>
						<button class="btn btn-info get-job">GET JOB</button>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="item item1"
					style="background-image: url('view/assets/img/banner2.png');">
					<div class="content text-right">
						<h3>SAVE MONEY BY</h3>
						<h5>SIGNING UP</h5>
						<button class="btn btn-info sign-up">SIGN UP</button>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="item item2"
					style="background-image: url('view/assets/img/banner3.png');">
					<div class="content text-right">
						<h3>TRAINING FOR</h3>
						<h5>SCHOOLS, GOVEMENT...</h5>
						<button class="btn btn-info view-all">VIEW ALL</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="popular-courses courses container-fluid"
		style="background-color: #f5f5f5;">
		<div class="courses__title">Popular courses</div>
		<div class="popular__header">
			<ul class="nav-card list-unstyled">
				<li class="nav-item item-All" onClick="changeCate('All')">All
					Course</li>
				<c:forEach var="item" items="${listCate}">
					<li class="nav-item item-${item.getMaDanhMuc()}"
						onClick="changeCate('${item.getMaDanhMuc()}')">${item.getTenDanhMuc()}</li>
				</c:forEach>
			</ul>
			<div class="owl-carousel owl-theme custom" data-aos="fade-up">
				<c:forEach var="item" items="${newListCourse}">

					<c:forEach var="item2" items="${listTeacher}">
						<c:if
							test="${item2.maGiaoVien == item.getKhoaHoc().getMaGiaoVien() }">
							<c:set var="tenGiaoVien" value="${item2.tenGiaoVien}" />
						</c:if>
					</c:forEach>
					<div
						class="card-course card-${item.getKhoaHoc().getMaDanhMuc()} show">
						<jsp:include page="/view/components/Card.jsp">
							<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
								name="maKhoaHoc" />
							<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
								name="tenKhoaHoc" />
							<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}"
								name="maDanhMuc" />
							<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
								name="hinhAnh" />
							<jsp:param value="${item.getKhoaHoc().getSoLuong()}"
								name="soLuong" />
							<jsp:param value="${item.getKhoaHoc().getMoTa()}" name="moTa" />
							<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
								name="maGiaoVien" />
							<jsp:param value="${tenGiaoVien}" name="tenGiaoVien" />
							<jsp:param value="${item.getKhoaHoc().getXepHang()}"
								name="xepHang" />
							<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
								name="thanhTien" />
							<jsp:param value="${item.getKhoaHoc().getGiamGia()}"
								name="giamGia" />
							<jsp:param value="${item.getStatus()}" name="status" />
						</jsp:include>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="discount">
		<div class="container">
			<div class="row discount__content">
				<div class="col-sm-7 discount__detail discount__content-detail">
					<div class="discount__header">
						<div class="-title">SCRIBBLE STARTUP COURSE:</div>
						<div class="-save">SAVE UP TO 30% + FREE REACTJS</div>
					</div>
					<div class="discount__body">
						<div class="t-body">This course is the first of a two-course
							sequence: Introduction to Computer Science and Programming Using
							Python, and Introduction to Computational Thinking and Data
							Science.</div>
						<div class="time-remaining" id="time-remaining">
							<div class="time-remaining__header">
								<span class="time-remaining__header-line"></span>
								<h4>HURRY UP! IT'S ONLY LEFT</h4>
								<span class="time-remaining__header-line"></span>
							</div>
							<div class="clock" id="clock"></div>
						</div>
					</div>
					<div class="sign-up">
						<Button class="btn-sign-up">Sign up now</Button>
					</div>
				</div>
				<div
					class="col-sm-5 discount__img discount__content-img d-flex align-items-center justify-content-center">
					<img class="img-fluid"
						src="https://miro.medium.com/max/1121/1*baMG8GKXPjYjfY-fVTHAzg.png"
						alt="" />
				</div>
			</div>
		</div>
	</section>
	
	<c:if test="${username!= null && username != '' && listCourseForUser.size() > 0}">
		<section class="courses container-fluid">
			<div class="courses__title">Courses For You</div>
			<div class="owl-carousel owl-theme custom">
				<c:forEach var="item" items="${newListCourseForYou}">
					<c:forEach var="item2" items="${listTeacher}">
						<c:if test="${item2.maGiaoVien == item.getKhoaHoc().getMaGiaoVien() }">
							<c:set var="tenGiaoVien" value="${item2.tenGiaoVien}" />
						</c:if>
					</c:forEach>
					<jsp:include page="/view/components/Card.jsp">
						<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
								name="maKhoaHoc" />
							<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
								name="tenKhoaHoc" />
							<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}"
								name="maDanhMuc" />
							<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
								name="hinhAnh" />
							<jsp:param value="${item.getKhoaHoc().getSoLuong()}"
								name="soLuong" />
							<jsp:param value="${item.getKhoaHoc().getMoTa()}" name="moTa" />
							<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
								name="maGiaoVien" />
							<jsp:param value="${tenGiaoVien}" name="tenGiaoVien" />
							<jsp:param value="${item.getKhoaHoc().getXepHang()}"
								name="xepHang" />
							<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
								name="thanhTien" />
							<jsp:param value="${item.getKhoaHoc().getGiamGia()}"
								name="giamGia" />
							<jsp:param value="${item.getStatus()}" name="status" />
					</jsp:include>
				</c:forEach>
			</div>
		</section>
	</c:if>

	<section class="courses container-fluid">
		<div class="courses__title">Students are viewing</div>
		<div class="owl-carousel owl-theme custom">
			<c:forEach var="item" items="${newListCourseTopView}">
				<c:forEach var="item2" items="${listTeacher}">
					<c:if
						test="${item2.maGiaoVien == item.getKhoaHoc().getMaGiaoVien() }">
						<c:set var="tenGiaoVien" value="${item2.tenGiaoVien}" />
					</c:if>
				</c:forEach>
				<jsp:include page="/view/components/Card.jsp">
					<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
						name="maKhoaHoc" />
					<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
						name="tenKhoaHoc" />
					<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}"
						name="maDanhMuc" />
					<jsp:param value="${item.getKhoaHoc().getHinhAnh()}" name="hinhAnh" />
					<jsp:param value="${item.getKhoaHoc().getSoLuong()}" name="soLuong" />
					<jsp:param value="${item.getKhoaHoc().getMoTa()}" name="moTa" />
					<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
						name="maGiaoVien" />
					<jsp:param value="${tenGiaoVien}" name="tenGiaoVien" />
					<jsp:param value="${item.getKhoaHoc().getXepHang()}" name="xepHang" />
					<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
						name="thanhTien" />
					<jsp:param value="${item.getKhoaHoc().getGiamGia()}" name="giamGia" />
					<jsp:param value="${item.getStatus()}" name="status" />
				</jsp:include>
			</c:forEach>
		</div>
	</section>

	<section class="instructors">
		<h1>Top Rating Instructors</h1>
		<div class="row parent-card">
			<div class="row test" id="ins-content">
				<c:forEach var="item" items="${listTopTeacher}">
					<div class="card">
						<img src="${url}/${item.getHinhAnh()}" alt="" />
						<div class="detail-card">
							<h3>${item.getTenGiaoVien()}</h3>
							<p>${item.getMoTa()}</p>
						</div>
						<div class="icon-card">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
						</div>

						<div class="info-card">
							<span class="view"> <i class="fa fa-eye"
								aria-hidden="true"></i> ${item.getLuotXem()}
							</span>
							<div class="info-icon">
								<div class="face">
									<a href="#"> <i class="fa fa-facebook" aria-hidden="true"></i>
									</a>
								</div>
								<div class="mail">
									<a href="#"> <i class="fa fa-envelope" aria-hidden="true"></i>
									</a>
								</div>
								<div class="twitter">
									<a href="#"> <i class="fa fa-twitter" aria-hidden="true"></i>
									</a>
								</div>
								<div class="youtube">
									<a href="#"> <i class="fa fa-youtube-play"
										aria-hidden="true"></i>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<p>
									<i class="fa fa-play-circle" aria-hidden="true"></i>
									${item.getSoLuongKH()} courses
								</p>
								<p>
									<i class="fa fa-users" aria-hidden="true"></i>
									${item.getSoLuongHV()} student
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="count_courses">
		<div class="count_icon">
			<div class="icon">
				<i class="fa fa-television" aria-hidden="true"></i>
				<p>1787</p>
				<p>Online Courses</p>
			</div>
			<div class="icon">
				<i class="fa fa-user-o" aria-hidden="true"></i>
				<p>690</p>
				<p>Trusted Tutors</p>
			</div>
			<div class="icon">
				<i class="fa fa-graduation-cap" aria-hidden="true"></i>
				<p>855046</p>
				<p>Online Student</p>
			</div>
			<div class="icon">
				<i class="fa fa-sun-o" aria-hidden="true"></i>
				<p>5403</p>
				<p>Success Stories</p>
			</div>
		</div>
	</section>

	<section class="contact-area ptb-100">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-md-12">
					<div class="contact-box">
						<div class="icon">
							<i class="fa fa-phone"></i>
						</div>

						<div class="content">
							<h4>Phone / Fax</h4>
							<p>
								<a href="#">(+021) 245522455</a>
							</p>
							<p>
								<a href="#">(+000) 245522455</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-12">
					<div class="contact-box">
						<div class="icon">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</div>

						<div class="content">
							<h4>E-mail</h4>
							<p>
								<a href="#">ootteam@gmail.com</a>
							</p>
							<p>
								<a href="#">ootteam-sp@gmail.com</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-12">
					<div class="contact-box">
						<div class="icon">
							<i class="fa fa-map-marker"></i>
						</div>

						<div class="content">
							<h4>Location</h4>
							<p>Quarter 6, Linh Trung Ward, District Thu Duc, Ho Chi Minh
								city.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />
	<script>
		$(document).on(
				"click",
				function(e) {
					e.target.id != "tc-s" ? $("#tc-content-search").addClass(
							"hide") : $("#tc-content-search").removeClass(
							"hide");
				});

		function changeCate(cate) {
			localStorage.setItem("cate-home", cate);
			localStorage.setItem("yOffset", window.pageYOffset);
			window.location.href = "TrangChu";
		}
		$(window).on("load", function() {
			if (localStorage.getItem("cate-home")) {
				var cate = localStorage.getItem("cate-home");

				if (cate == 'All') {
					localStorage.setItem("flag-course", true);
				} else {
					$(".card-course:not(.card-" + cate + ")").remove();
					localStorage.removeItem("flag-course", false);
				}

				$(".item-" + cate).addClass("active");
				localStorage.removeItem("cate-home");

			} else {
				$(".item-All").addClass("active");
				localStorage.setItem("flag-course", true);
			}

			$('.owl-carousel').owlCarousel({
				loop : false,
				margin : 30,
				nav : true,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 3
					},
					1000 : {
						items : 5
					}
				}
			});
		})
	</script>
</body>
</html>
