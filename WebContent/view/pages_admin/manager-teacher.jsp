<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<c:url value="/view/assets/img_teacher" var="url_img"></c:url>
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
											style="margin-right: 10px;">Teacher Management
									</h4>
								</div>
								<span class="table-add float-right mb-3 mr-2"
									style="margin-top: 1rem !important;">
									<button type="button" data-toggle="modal"
										data-target="#addTeacher" class="btn btn-sm iq-bg-success">
										<i class="ri-add-fill"><span class="pl-1">Add
												teacher </span></i>
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
										<form action="/Elearning_FE/admin/teacher/search"
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
												<th>Name</th>
												<th>Description</th>
												<th>Picture</th>
												<th>Number of courses</th>
												<th>The number of student</th>

												<th>Function</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${listGiaoVien}" var="item" varStatus="vs">
												<tr>
													<td contenteditable="true">${vs.count}</td>
													<td contenteditable="true">${item.tenGiaoVien}</td>
													<td contenteditable="true">${item.moTa}</td>
													<td contenteditable="true"><img class="img-fuild"
														src="${url_img}/${item.hinhAnh}" width="80" height="70" /></td>
													<td contenteditable="true">${item.soLuongKH}</td>
													<td contenteditable="true">${item.soLuongHV}</td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-warning mb-3"
																data-toggle="modal"
																data-target="#editTeacher${vs.index}">
																<i class="fa fa-wrench" aria-hidden="true"></i>Edit
															</button>
															<button type="button" class="btn btn-danger mb-3"
																onClick="handleOnDelete(${item.maGiaoVien})">
																<i class="ri-delete-bin-2-fill pr-0"></i>Delete
															</button>
													</span></td>
												</tr>
												<div class="modal fade" id="editTeacher${vs.index}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Edit
																	teacher</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form action="/Elearning_FE/admin/teacher/edit"
																	method="POST">
																	<div class="form-group">
																		<input type="hidden" name="maGiaoVien"
																			value="${item.maGiaoVien}" /> <input type="hidden"
																			name="testHinh" value="${item.hinhAnh}" /> <label
																			for="tenKhoaHoc">Name</label> <input type="text"
																			pattern="[a-zA-Z0-9\s]+"
																			title="Tên khóa học có các kí tự đặc biệt"
																			class="form-control" id="tenGiaoVien"
																			name="tenGiaoVien" value="${item.tenGiaoVien}">
																	</div>
																	<div class="form-group">
																		<label for="moTa">Description</label> <input
																			type="text" class="form-control" id="moTa"
																			name="moTa" value="${item.moTa}">
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
																		<label for="luotXem">View</label> <input type="number"
																			min="0" class="form-control" id="luotXem"
																			name="luotXem" value="${item.luotXem}">
																	</div>
																	<div class="form-group">
																		<label for="xepHang">Teacher ratings</label> <input
																			type="number" step="0.1" min="1" max="5"
																			class="form-control" id="xepHang" name="xepHang"
																			value="${item.xepHang}">
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

											</c:forEach>
										</tbody>
									</table>
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-end">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="/view/components/FooterAdmin.jsp" />
		</div>
	</div>
	<div class="modal fade" id="addTeacher" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add teacher</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/Elearning_FE/admin/teacher/add" method="POST">
						<div class="form-group">
							<label for="tenKhoaHoc">Name</label> <input type="text"
								pattern="[a-zA-Z0-9\s]+"
								title="Tên khóa học có các kí tự đặc biệt"
								class="form-control" id="tenGiaoVien" name="tenGiaoVien"
								placeholder="Name" required>
						</div>
						<div class="form-group">
							<label for="moTa">Description</label> <input type="text"
								class="form-control" id="moTa" name="moTa"
								placeholder="Description" required>
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
							<label for="luotXem">View</label> <input type="number" min="0"
								class="form-control" id="luotXem" name="luotXem" required>
						</div>
						<div class="form-group">
							<label for="xepHang">Teacher ratings</label> <input type="number"
								step="0.1" min="1" max="5" class="form-control" id="xepHang"
								name="xepHang" required>
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
	<jsp:include page="/view/Html/admin/Script.jsp" />
	<script>
	function handleOnDelete(id) {
		  swal({
		    title: "Are you sure?",
		    text: "You won't be able to revert this!",
		    icon: "warning",
		    buttons: true,
		    dangerMode: true,
		  }).then((willDelete) => {
		    if (willDelete) {
		      window.location.href = `/Elearning_FE/admin/teacher/delete?id=` + id;
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
		            window.location.href = `/Elearning_FE/admin/teacher`;
		         }
		      });
		   }
		})
	$(window).on("load", function () {
		console.log($("#alertMsg"));
		   if ($("#alertMsg_1").length) {
		      swal({
		         title: $("#alertMsg_1").html(),
		         text: "Would you like to go back?",
		         icon: "warning",
		         buttons: true,
		         dangerMode: true,
		      }).then((willDelete) => {
		         if (willDelete) {
		            window.location.href = `/Elearning_FE/admin/teacher`;
		         }
		      });
		   }
		})
		
	</script>
</body>
</html>
