<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/img" var="url"></c:url>
<c:url value="/view/assets/img_course" var="urlCourse"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />

<body>
	<c:if test="${statusLoading == true}">
		<jsp:include page="/view/components/LoadingHome.jsp" />
	</c:if>
	<jsp:include page="/view/components/Header.jsp" />
	<div class="Page_KhoaHoc">
		<div class="Banner row" style="background-color: ${color}">
			<div class="col-6 left">
				<h1 class="animated bounce titles">
					<c:out value="${tenDanhMuc}" />
				</h1>
				<p>${moTa}</p>
				<div class=" img ">
					<div>
						<img src="${url}/Video.png"></img> <span>${TotalPageByCate} Course</span>
					</div>
					<div>
						<img src="${url}/students.png"></img> <span>500+ Students</span>
					</div>
					<div>
						<img src="${url}/Discussion.png"></img> <span>100+ Discussion</span>
					</div>
				</div>
			</div>
			<div class="col-6 right">
				<img src="${url}/course-catagory-hero-1.jpg"></img>
			</div>
		</div>

		<div class="tab_khoahoc">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<c:set var="idDanhMuc" value="allcourse" />
					<a
						class="nav-item nav-link <c:if test="${maDanhMuc == null || maDanhMuc == idDanhMuc }"> active</c:if> "
						href="/Elearning_FE/Courses?id=allcourse&page=1"> All Courses
					</a>
					<c:forEach var="item" items="${listCate}">
						<a
							class="nav-item nav-link <c:if test="${item.maDanhMuc == maDanhMuc }"> active</c:if>"
							href="/Elearning_FE/Courses?id=${item.maDanhMuc }&page=1"> <c:out
								value="${item.tenDanhMuc }" />
						</a>
					</c:forEach>
				</div>
			</nav>
			<div class="tab-content">
				<div class="tab-pane show active ">
					<div class="Courses_Card">
						<div>
							<div class="show_course row">
							
								<c:if test="${getSelect == null || flag == 'Default' }">
									<c:forEach items="${newListCourse}" var="item">
										<div data-aos="fade-up" class="col-3 aos-init aos-animate">
											<c:forEach var="item2" items="${listTeacher}">
												<c:if
													test="${item2.maGiaoVien == item.getKhoaHoc().getMaGiaoVien() }">
													<c:set var="tenGiaoVien" value="${item2.tenGiaoVien}" />
												</c:if>
											</c:forEach>	
											<div class="item-card ">
												<jsp:include page="/view/components/Card.jsp">
													<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
														name="maKhoaHoc" />
														<jsp:param value="${tenGiaoVien}"
														name="tenGiaoVien" />
													<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
														name="tenKhoaHoc" />
													<jsp:param value="${item.getKhoaHoc().getMaDanhMuc()}"
														name="maDanhMuc" />
													<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
														name="hinhAnh" />
													<jsp:param value="${item.getKhoaHoc().getSoLuong()}"
														name="soLuong" />
													<jsp:param value="${item.getKhoaHoc().getMoTa()}"
														name="moTa" />
													<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
														name="maGiaoVien" />
													<jsp:param value="${item.getKhoaHoc().getXepHang()}"
														name="xepHang" />
													<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
														name="thanhTien" />
													<jsp:param value="${item.getKhoaHoc().getGiamGia()}"
														name="giamGia" />
													<jsp:param value="${item.getStatus()}" name="status" />
												</jsp:include>
											</div>
										</div>
									</c:forEach>
								</c:if>

								<c:set var="cate1" value="Best" />
								<c:set var="cate2" value="Trending" />
								<c:if test="${getSelect != null && flag == cate1}">
									<c:forEach items="${newListSortBest}" var="item">
										<div data-aos="fade-up" class="col-3 aos-init aos-animate">
											<div class="item-card ">
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
													<jsp:param value="${item.getKhoaHoc().getMoTa()}"
														name="moTa" />
													<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
														name="maGiaoVien" />
													<jsp:param value="${item.getKhoaHoc().getXepHang()}"
														name="xepHang" />
													<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
														name="thanhTien" />
													<jsp:param value="${item.getKhoaHoc().getGiamGia()}"
														name="giamGia" />
													<jsp:param value="${item.getStatus()}" name="status" />
												</jsp:include>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${getSelect != null && flag == cate2}">
									<c:forEach items="${newListSortTrending}" var="item">
										<div data-aos="fade-up" class="col-3 aos-init aos-animate">
											<div class="item-card ">
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
													<jsp:param value="${item.getKhoaHoc().getMoTa()}"
														name="moTa" />
													<jsp:param value="${item.getKhoaHoc().getMaGiaoVien()}"
														name="maGiaoVien" />
													<jsp:param value="${item.getKhoaHoc().getXepHang()}"
														name="xepHang" />
													<jsp:param value="${item.getKhoaHoc().getThanhTien()}"
														name="thanhTien" />
													<jsp:param value="${item.getKhoaHoc().getGiamGia()}"
														name="giamGia" />
													<jsp:param value="${item.getStatus()}" name="status" />
												</jsp:include>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
							<c:if
								test="${(getSelect == null || flag == 'Default') && Math.ceil(TotalPageByCate /8) > 1}">
								<div class="List_page">
								
								<c:if test="${soPage != 1}">
									<span class="prev onlist"
										onClick="handleonClick(`${maDanhMuc}`,'prev')"> <i
										class="fa fa-angle-double-left"></i>
									</span>
									</c:if>
									<ul class="pagination">
										<c:forEach var="i" begin="1" end="${Math.ceil(TotalPageByCate /8)}">
											<li
												class="num onlist numcd ${i == soPage ? 'active' : '' }"
												onClick="handleonClick(`${maDanhMuc}`,`${i}`)"
												num="${i}">${i}</li>
										</c:forEach>
									</ul>
									<c:if test="${soPage != Math.ceil(TotalPageByCate/8)}">
									<span class="next onlist"
										onClick="handleonClick(`${maDanhMuc}`,'next')"> <i
										class="fa fa-angle-double-right"></i>
									</span>
									</c:if>
								</div>
							</c:if>
							<c:if
								test="${getSelect != null && flag == cate1 && totalPageSortBest > 1}">
								<div class="List_page">
								<c:if test="${soPage != 1}">
									<span class="prev onlist"
										onClick="handleonClickBest(`${maDanhMuc}`,'prev',`${flag }`)">
										<i class="fa fa-angle-double-left"></i>
									</span>
									</c:if>
									<ul class="pagination">
										<c:forEach var="i" begin="1" end="${totalPageSortBest}">
											<li
												class="num onlist numcb ${i == soPage ? 'active' : '' }"
												onClick="handleonClickBest(`${maDanhMuc}`,`${i}`,`${flag }`)"
												num="${i}">${i}</li>
										</c:forEach>
									</ul>
									<c:if test="${soPage != totalPageSortBest}">
									<span class="next onlist"
										onClick="handleonClickBest(`${maDanhMuc}`,'next',`${flag }`)">
										<i class="fa fa-angle-double-right"></i>
									</span>
									</c:if>
								</div>

							</c:if>
							<c:if
								test="${getSelect != null && flag == cate2 && totalPageSortTrending > 1}">
								<div class="List_page">
								<c:if test="${soPage != 1}">
									<span class="prev onlist"
										onClick="handleonClickTrending(`${maDanhMuc}`,'prev,`${flag }`)">
										<i class="fa fa-angle-double-left"></i>
									</span>
									</c:if>
									<ul class="pagination">
										<c:forEach var="i" begin="1" end="${totalPageSortTrending}">
											<li
												class="num onlist numct ${i == soPage ? 'active' : '' }"
												onClick="handleonClickTrending(`${maDanhMuc}`,${i},`${flag}`)"
												num="${i}">${i}</li>
										</c:forEach>
									</ul>
									<c:if test="${soPage != totalPageSortTrending}">
									<span class="next onlist"
										onClick="handleonClickTrending(`${maDanhMuc}`,'next',`${flag }`)">
										<i class="fa fa-angle-double-right"></i>
									</span>
									</c:if>
								</div>
							</c:if>
						</div>
					</div>
				</div>

			</div>


			<div class="fiter_courses">
				<div class="row ">
					<div class="Fiter_icon col-5">
						<span class="pr-3 pl-2">Sort By </span>
						<form class="d-inline"
							action="/Elearning_FE/Courses?id=${maDanhMuc}&page=1"
							method="POST">
							<select id="getSelect" name="getSelect"
								onChange="handleOnChange(event)">
								<option value="${maDanhMuc}+Default"
									<c:if test="${flag=='Default'}">selected</c:if>>Default
									Courses</option>
								<option value="${maDanhMuc}+Best"
									<c:if test="${flag=='Best'}">selected</c:if>>Best
									Courses</option>
								<option value="${maDanhMuc}+Trending"
									<c:if test="${flag=='Trending'}">selected</c:if>>Trending
									Courses</option>
							</select>

							<div class="btn-123 d-none">
								<button class="submit-sort-btn btn-6" id="selectbtn"
									type="submit">
									Submit <span></span>
								</button>
							</div>

						</form>
					</div>
					<form action="/Elearning_FE/Courses/Search"
						class="form-filter form-inline col-6 p-0 ml-auto" method="POST" autocomplete="off">
						<input id="tc-s" class="form-control m-0" type="search" required
							placeholder="Search" aria-label="Search" name="keyword"
							value="${keyword }" />
						<div class="btn-123">
							<button type="submit" class="btn-6">
								Search <span></span>
							</button>
						</div>
						<c:if test="${listCourseBykw != null && listCourseBykw != '' }">
					<c:choose>
						<c:when test="${ listCourseBykw.size() == 0}">
							<div class="Search_filter" id="tc-content-search">
								<div class="item find">
									<p class="text-center">No course found</p>
								</div>
							</div>
						</c:when>
						<c:when test="${listCourseBykw.size() > 0 }">
							<div class="Search_filter" id="tc-content-search">
								<c:forEach var="item" items="${listCourseBykw}">
								<div class="item_search "style="cursor:pointer;">
									<jsp:include page="/view/components/ItemMiniCart.jsp">
										<jsp:param value="${item.getMaKhoaHoc()}" name="maKhoaHoc" />
										<jsp:param value="${item.getTenKhoaHoc()}" name="tenKhoaHoc" />
										<jsp:param value="${item.getHinhAnh()}" name="hinhAnh" />
										<jsp:param
											value="${item.getThanhTien()*item.getGiamGia()/100}"
											name="donGia" />
									</jsp:include>
									</div>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</c:if>
					</form>
					
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />

	<jsp:include page="/view/Html/Script.jsp" />

	<script>
	$(document).on("click", function(e) {
	      e.target.id != "tc-s"
	        ? $("#tc-content-search").addClass("hide")
	        : $("#tc-content-search").removeClass("hide");
	});
	handleOnChange = (event) => {
		$("#selectbtn").click()
	}
	</script>
</body>

</html>