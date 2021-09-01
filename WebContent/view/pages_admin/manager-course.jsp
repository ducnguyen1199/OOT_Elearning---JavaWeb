<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<c:url value="/view/assets/img_course" var="url_img"></c:url>
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
											style="margin-right: 10px;">Course Management
									</h4>
								</div>
								<span class="table-add float-right mb-3 mr-2"
									style="margin-top: 1rem !important;">
									<button type="button" data-toggle="modal"
										data-target="#addCourse" class="btn btn-sm iq-bg-success">
										<i class="ri-add-fill"><span class="pl-1">Add
												course </span></i>
									</button>
								</span>
							</div>
							<c:if test="${alertMsg != null}">
								<div id="alertMsg" style="display: none">${alertMsg}</div>
							</c:if>
							<c:if test="${alertMsg_1 != null}">
								<div id="alertMsg_1" style="display: none">${alertMsg_1}</div>
							</c:if>
							<div class="iq-card-body">
								<div id="table" class="table-editable">
									<div class="iq-search-bar float-right mb-3 mr-2">
										<form action="/Elearning_FE/admin/course?search"
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
												<th>Course name</th>
												<th>Description</th>
												<th>Category</th>
												<th>Picture</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listCourse}" var="item" varStatus="vs">
												<tr>
													<td contenteditable="true">${15*(page-1) + vs.count}</td>
													<td contenteditable="true">${item.tenKhoaHoc}</td>
													<td contenteditable="true">${item.moTa}</td>
													<td contenteditable="true">${item.maDanhMuc}</td>
													<td contenteditable="true"><img class="img-fuild"
														src="${url_img}/${item.hinhAnh}" width="120" height="70" /></td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-warning mb-3"
																data-toggle="modal"
																data-target="#editCourseModal${vs.index}">
																<i class="fa fa-wrench" aria-hidden="true"></i>Edit
															</button>
															<button type="button" class="btn btn-danger mb-3"
																onClick="handleOnDeleteCourse(${item.maKhoaHoc})">
																<i class="ri-delete-bin-2-fill pr-0"></i>Delete
															</button>
													</span></td>

													<div class="modal fade" id="editCourseModal${vs.index}"
														role="dialog">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">Edit
																		course</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form action="/Elearning_FE/admin/course/edit"
																		method="POST">
																		<input type="hidden" name="maKhoaHoc"
																			value="${item.maKhoaHoc}" /> <input type="hidden"
																			name="testHinh" value="${item.hinhAnh}" />
																		<div class="form-group">


																			<label for="tenKhoaHoc">Course name</label> <input
																				type="text" class="form-control" id="tenKhoaHoc"
																				name="tenKhoaHoc" value="${item.tenKhoaHoc}"
																				disabled>
																		</div>
																		<div class="form-group">
																			<label for="moTa">Description</label> <input
																				type="text" class="form-control" id="moTa"
																				name="moTa" value="${item.moTa}">
																		</div>
																		<div class="form-group">
																			<label for="maDanhMuc">Category</label> <select
																				class="form-control" id="maDanhMuc" name="maDanhMuc">
																				<c:forEach items="${listDanhMuc}" var="dm">
																					<c:choose>
																						<c:when test="${dm.maDanhMuc == item.maDanhMuc}">
																							<option value="${item.maDanhMuc}" selected>
																								${dm.tenDanhMuc}</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${dm.maDanhMuc}">
																								${dm.tenDanhMuc}</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="form-group">
																			<label for="giaoVien">Creator</label> </br>
																			<c:forEach items="${listGiaoVien}" var="gv">
																				<c:if test="${gv.maGiaoVien == item.maGiaoVien}">
																					<input type="text" class="form-control"
																						id="tenKhoaHoc" name="maGiaoVien"
																						value="${gv.tenGiaoVien}" disabled>
																				</c:if>
																			</c:forEach>
																		</div>
																		<div class="form-group">
																			<label for="customFile">Picture</label>
																			<div class="custom-file">
																				<input type="file" class="custom-file-input"
																					id="customFile" name="file"> <label
																					class="custom-file-label" for="customFile">Choose
																					file</label>
																			</div>
																		</div>


																		<div class="form-group">
																			<label for="xepHang">Ranking</label><input
																				type="text" class="form-control" id="xepHang"
																				name="xepHang" value="${item.xepHang}" disabled>
																		</div>

																		<div class="form-group">
																			<label for="donGia">Price</label> <input
																				type="number" min="0" class="form-control"
																				id="donGia" value="${item.thanhTien}" name="donGia">
																		</div>
																		<div class="form-group">
																			<label for="giamGia">Discount</label> <input
																				type="number" min="0" max="100" class="form-control"
																				id="giamGia" value="${item.giamGia}" name="giamGia">
																		</div>
																		<div class="form-group text-right mb-0">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="submit" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
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
															href="/Elearning_FE/admin/course?page=${page - 1}"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach items="${numberPage}" var="number">
													<li
														class="page-item <c:if test="${page==number}">active</c:if>">
														<a class="page-link"
														href="/Elearning_FE/admin/course?page=${number}">${number}</a>
													</li>
												</c:forEach>
												<c:choose>
													<c:when test="${page == count}">
														<li class="page-item"><a class="page-link" href="#"
															aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="/Elearning_FE/admin/course?page=${page + 1}"
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

	<div class="modal fade" id="addCourse" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<h5 class="modal-title" id="exampleModalLabel">Add course</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/Elearning_FE/admin/course/add" method="POST">
						<div class="form-group">
							<label for="tenKhoaHoc">Course name</label> <input type="text"
								class="form-control" id="tenKhoaHoc" name="tenKhoaHoc"
								placeholder="Course name" required>
						</div>
						<div class="form-group">
							<label for="moTa">Description</label> <input type="text"
								class="form-control" id="moTa" name="moTa"
								placeholder="Description" required>
						</div>
						<div class="form-group">
							<label for="maDanhMuc">Category</label> <select
								class="form-control" id="maDanhMuc" name="maDanhMuc">
								<c:forEach items="${listDanhMuc}" var="item">
									<option value="${item.maDanhMuc}">${item.tenDanhMuc}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="giaoVien">Creator</label> <select
								class="form-control" id="giaoVien" name="maGiaoVien">
								<c:forEach items="${listGiaoVien}" var="item">
									<option value="${item.maGiaoVien}">${item.tenGiaoVien}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="customFile">Picture</label>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile"
									name="file" accept="image/*" required> <label
									class="custom-file-label" for="customFile">Choose file</label>
							</div>
						</div>
						<div class="form-group">
							<label for="xepHang">Ranking</label> <input class="form-control"
								type="number" id="xepHang" name="xepHang" step="0.1" min="1"
								max="5" required />
						</div>
						<div class="form-group">
							<label for="donGia">Price</label> <input type="number" min="0"
								class="form-control" id="donGia" name="donGia" required>
						</div>
						<div class="form-group">
							<label for="giamGia">Discount</label> <input type="number"
								min="0" max="100" class="form-control" id="giamGia"
								name="giamGia" required>
						</div>

						<div class="form-group text-right mb-0">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="/view/Html/admin/Script.jsp" />
	<script>
		function handleOnDeleteCourse(id) {
			swal({
				title: "Are you sure?",
				text: "You won't be able to revert this!",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			}).then((willDelete) => {
				if (willDelete) {
					window.location.href = `/Elearning_FE/admin/course/delete?id=` + id;
				}
			});
		}

		$(window).on("load", function () {
			if ($("#alertMsg").length) {
				swal({
					title: $("#alertMsg").html(),
					text: "Would you like to go back?",
					icon: "warning",
					buttons: true,
					dangerMode: true,
				}).then((willDelete) => {
					if (willDelete) {
						window.location.href = `/Elearning_FE/admin/course`;
					}
				});
			}
		});
		$(window).on("load", function () {
			if ($("#alertMsg_1").length) {
				swal({
					title: $("#alertMsg_1").html(),
					text: "Would you like to go back?",
					icon: "warning",
					buttons: true,
					dangerMode: true,
				}).then((willDelete) => {
					if (willDelete) {
						window.location.href = `/Elearning_FE/admin/course`;
					}
				});
			}
		});


	</script>
</body>

</html>