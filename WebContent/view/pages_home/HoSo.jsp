<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<c:if test="${statusLoading == true}">
		<jsp:include page="/view/components/LoadingHome.jsp" />
	</c:if>
	<jsp:include page="/view/components/Header.jsp" />
	<c:if test="${aleartPw != null}">
		<div id="aleartPw" style="display: none">${aleartPw}</div>
	</c:if>
	<c:if test="${aleartSuccess != null}">
		<div id="aleartSuccess" style="display: none">${aleartSuccess}</div>
	</c:if>
	<section class="profile-page">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="profile-block">
						<div class="user-profile">
							<div class="wrapper-user">
								<div class="user-img">
									<img src="${url}/avatar.png" width="120" />
								</div>
								<p>${info.getHoTen()}</p>
								<h5>Front End Developer</h5>
							</div>
						</div>
						<div class="nav flex-column nav-pills text-center"
							id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<a class="nav-link  ${tabActive == null ? 'active':''}"
								id="v-pills-profile-tab" data-toggle="pill"
								href="#v-pills-profile" role="tab"
								aria-controls="v-pills-profile" aria-selected="true"> My
								Courses </a> <a class="nav-link ${tabActive == 1 ? 'active':''}"
								id="v-pills-account-tab" data-toggle="pill"
								href="#v-pills-account" role="tab"
								aria-controls="v-pills-account" aria-selected="false">
								Change Password </a> <a
								class="nav-link  ${tabActive == 2 ? 'active':''}"
								id="v-pills-edit-tab" data-toggle="pill" href="#v-pills-edit"
								role="tab" aria-controls="v-pills-edit" aria-selected="false">
								Edit Information </a>
						</div>
					</div>
				</div>
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="d-flex justify-content-between">
							<h3 class="mb-4">My Profile</h3>
							<div class="icons">
								<i class="fa fa-facebook-official fb" aria-hidden="true"></i> <i
									class="fa fa-twitter-square tw" aria-hidden="true"></i> <i
									class="fa fa-youtube-play yt" aria-hidden="true"></i>
							</div>
						</div>
						<div class="tab-pane fade ${tabActive == null ? 'show active':''}"
							id="v-pills-profile" role="tabpanel"
							aria-labelledby="v-pills-profile-tab">
							<h3 class="text-center font-weight-bold">My Courses</h3>
							<div class="history-page">
								<div class="courses_Card Courses_Card">
									<div class="show_course row">
										<c:forEach var="item" items="${listCourseOfUser}"
											varStatus="vs">
											<div
												class="col-4 card-none card-p ${Math.round(Math.floor(vs.index/3))==0?'show':''} 
											card-p${Math.round(Math.floor(vs.index/3))}">
												<div class="item-history">
													<jsp:include page="/view/components/Card.jsp">
														<jsp:param value="${item.getMaKhoaHoc()}" name="maKhoaHoc" />
														<jsp:param value="${item.getTenKhoaHoc()}"
															name="tenKhoaHoc" />
														<jsp:param value="${item.getMaDanhMuc()}" name="maDanhMuc" />
														<jsp:param value="${item.getHinhAnh()}" name="hinhAnh" />
														<jsp:param value="${item.getSoLuong()}" name="soLuong" />
														<jsp:param value="${item.getMoTa()}" name="moTa" />
														<jsp:param value="${item.getMaGiaoVien()}"
															name="maGiaoVien" />
														<jsp:param value="${item.getXepHang()}" name="xepHang" />
														<jsp:param value="${item.getThanhTien()}" name="thanhTien" />
														<jsp:param value="${item.getGiamGia()}" name="giamGia" />
													</jsp:include>
												</div>
											</div>
										</c:forEach>
									</div>
									<c:if
										test="${listCourseOfUser!=null && Math.round(listCourseOfUser.size()/3 + 0.4) - 1 > 0}">
										<div class="List_page">
											<span class="prev onlist d-none"
												onClick="changePage('prev',${Math.round(listCourseOfUser.size()/3 + 0.5)})">
												<i class="fa fa-angle-double-left"></i>
											</span>

											<ul class="pagination">
												<c:forEach var="i" begin="0"
													end="${Math.round(listCourseOfUser.size()/3 + 0.4) - 1}">
													<li class="num numcp num-${i} onlist ${i==0?'active':''}"
														onClick="changePage(${i},${Math.round(listCourseOfUser.size()/3 + 0.4)})"
														num="${i}"><c:out value="${i+1}" /></li>
												</c:forEach>
											</ul>
											<span class="next onlist"
												onClick="changePage('next',${Math.round(listCourseOfUser.size()/3 + 0.4)})">
												<i class="fa fa-angle-double-right"></i>
											</span>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="tab-pane fade ${tabActive == 1 ? 'show active':''}"
							id="v-pills-account" role="tabpanel"
							aria-labelledby="v-pills-account-tab">
							<h3 class="text-center font-weight-bold">Change Password</h3>
							<div>
								<form action="EditPassWord" method="post" autocomplete="off">
									<div class="form-group">
										<label for="taiKhoan">Username</label> <input type="text"
											class="form-control" name="taiKhoan" value="${info.taiKhoan}"
											disabled required />
									</div>
									<div class="form-group">
										<label for="matKhau">Enter Current password</label> <input
											type="password" placeholder="Current password"
											name="matKhauHienTai" class="form-control"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Mật khẩu ít nhất một số và một chữ hoa và chữ thường và ít nhất 8 ký tự trở lên"
											Required />
									</div>
									<div class="form-group">
										<label for="matKhau">Enter new password</label> <input
											type="password" placeholder="New password" name="matKhauMoi"
											class="form-control"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Mật khẩu ít nhất một số và một chữ hoa và chữ thường và ít nhất 8 ký tự trở lên"
											Required />
									</div>
									<div class="form-group">
										<label for="matKhau">Confirm password</label> <input
											type="password" placeholder="Confirm password"
											name="matKhauXacNhan" class="form-control"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Mật khẩu ít nhất một số và một chữ hoa và chữ thường và ít nhất 8 ký tự trở lên"
											Required />
									</div>
									<button type="submit" class="btn btn-primary">Update
										password</button>
								</form>
							</div>
						</div>
						<div class="tab-pane fade${tabActive == 2 ? 'show active':''}"
							id="v-pills-edit" role="tabpanel"
							aria-labelledby="v-pills-edit-tab">
							<h3 class="text-center font-weight-bold">Edit Information</h3>
							<form action="EditInfoUser" method="post" autocomplete="off">
								<div class="form-group">
									<label for="username">Username</label> <input type="text"
										class="form-control" id="username" disabled name="taiKhoan"
										value="${info.taiKhoan}" />
								</div>
								<div class="form-group">
									<label for="email">Email</label> 
									<input type="text"
										class="form-control" id="email" disabled name="email"
										value="${info.email}" />
								</div>
								<div class="form-group">
									<label for="fullname">Full name</label> 
									<input type="text"
										class="form-control" pattern="[A-Za-z ]{1,}"
										title="Tên bạn có các kí tự đặc biệt" placeholder="Full name"
										name="hoTen" Required value="${info.hoTen}" />
								</div>
								<div class="form-group">
									<label for="phone">Phone number</label> <input type="text"
										pattern="[0-9]{10,13}" class="form-control"
										placeholder="Phone number" name="soDienThoai" Required
										value="${info.soDienThoai }" />
								</div>
								<button class="btn btn-success" type="submit">UPDATE
									ACCOUNT</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

	</section>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />
	<script>
		function changePage(page, maxNumber){
			var pageNumber = 0;
			var currentNumber = parseInt($(".numcp.active").attr("num"));
					
			if(page =='next') pageNumber = currentNumber + 1;
			else if(page == 'prev')pageNumber = currentNumber - 1;
			else pageNumber = page; 
			
			pageNumber == 0 ? $(".prev").addClass("d-none"):$(".prev").removeClass("d-none");
			pageNumber == maxNumber-1 ? $(".next").addClass("d-none"):$(".next").removeClass("d-none");
			
			console.log(pageNumber);
			$(".card-p").removeClass("show");
			$(".num").removeClass("active");
			
			$(".card-p"+pageNumber).addClass("show");
			$(".num-"+pageNumber).addClass("active");
		}
		$(window).on("load", function () {
			if ($("#aleartPw").length) {
			      swal({
			         title: $("#aleartPw").html(),
			         icon: "warning",
			         dangerMode: true,
			      });
			   }
				if ($("#aleartSuccess").length) {
				      swal({
				         title: $("#aleartSuccess").html(),
				         icon: "success",
				         successMode: true,
				      })
				   }
		});
		
	</script>
</body>
</html>