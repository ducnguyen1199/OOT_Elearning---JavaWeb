<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<c:url value="/view/assets/img_course" var="url_course"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/admin/Head.jsp" />
<body>
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<div class="wrapper">
		<jsp:include page="/view/components/SideBarAdmin.jsp" />
		<div id="content-page" class="content-page">
			<jsp:include page="/view/components/HeaderAdmin.jsp" />

			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">
										<img src="${url}/language/uk_big.png" alt=""
											style="margin-right: 10px;">Student course
									</h4>
								</div>
							</div>
							<c:if test="${alertMsg != null}">
								<div id="alertMsg" style="display: none">${alertMsg}</div>
							</c:if>
							<div class="iq-card-body">
								<div id="table" class="table-editable">
									<div class="iq-search-bar float-right mb-3 mr-2">
										<form action="/Elearning_FE/admin/user-course?search"
											class="searchbox" method="GET">
											<input type="text" class="text search-input" name="name" value="${search}"
												placeholder="Type here to search...">
											<button type="submit" style="display: contents">
												<a class="search-link"><i class="ri-search-line"></i></a>
											</button>
										</form>
									</div>
									<table
										class="table table-bordered table-responsive-md table-striped text-center">
										<thead>
											<tr>
												<th>Index</th>
												<th>Account</th>
												<th>Course name</th>
												<th>Description</th>
												<th>Picture</th>
												<th>Registration Date</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${listUserCourse}" var="item"
												varStatus="vs">
												<tr>
													<td contenteditable="true">${15*(page-1) + vs.count}</td>
													<td contenteditable="true">${item.taiKhoan}</td>
													<td contenteditable="true">${item.tenKhoaHoc}</td>
													<td contenteditable="true">${item.moTa}</td>
													<td contenteditable="true"><img class="img-fuild"
														src=" ${url_course}/${item.hinhAnh}" width="120"
														height="70" /></td>
													<td contenteditable="true">${item.ngayDangKi}</td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-danger mb-3"
																id="btn-delete"
																onclick="handleOnDeleteUserCourse(${item.maKhoaHoc},${item.maNguoiDung})">
																<i class="ri-delete-bin-2-fill pr-0"></i>Delete
															</button>
													</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:if test="${search == null}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-end">
												<c:choose>
													<c:when test="${page == 1}">
														<li class="page-item"><a class="page-link" href="#"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="/Elearning_FE/admin/user-course?page=${page - 1}"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach items="${numberPage}" var="number">
													<li
														class="page-item <c:if test="${page == number}">active</c:if>"><a
														class="page-link"
														href="/Elearning_FE/admin/user-course?page=${number}">${number}</a></li>
												</c:forEach>
												<c:choose>
													<c:when test="${page == count}">
														<li class="page-item"><a class="page-link" href="#"
															aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="/Elearning_FE/admin/user-course?page=${page + 1}"
															aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</nav>
									</c:if>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="/view/components/FooterAdmin.jsp" />
		</div>
	</div>

	<jsp:include page="/view/Html/admin/Script.jsp" />
	<script>
	function handleOnDeleteUserCourse(maKhoaHoc, maNguoiDung) {
		  swal({
		    title: "Are you sure?",
		    text: "You won't be able to revert this!",
		    icon: "warning",
		    buttons: true,
		    dangerMode: true,
		  }).then((willDelete) => {
		    if (willDelete) {
		      window.location.href = `/Elearning_FE/admin/user-course/delete?id1=` +maKhoaHoc+ `&` + `id2=` + maNguoiDung;
		    }
		  });
		}

	$(window).on("load", function () {
		console.log($("#alertMsg"));
		   if ($("#alertMsg").length) {
		      swal({
		         title: $("#alertMsg").html(),
		         text: "Would you like to go back?",
		         icon: "warning",
		         buttons: true,
		         dangerMode: true,
		      }).then((willDelete) => {
		         if (willDelete) {
		            window.location.href = `/Elearning_FE/admin/user-course`;
		         }
		      });
		   }
		})
	
	</script>
</body>
</html>