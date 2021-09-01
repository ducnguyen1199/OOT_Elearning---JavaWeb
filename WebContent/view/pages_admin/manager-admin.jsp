<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:url value="/view/assets/admin/images" var="url"></c:url>
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
											style="margin-right: 10px;">Admin
									</h4>
								</div>
								<span class="table-add float-right mb-3 mr-2"
									style="margin-top: 1rem !important;">
									<button type="button" data-toggle="modal"
										data-target="#addAdmin" class="btn btn-sm iq-bg-success">
										<i class="ri-add-fill"><span class="pl-1">Add admin</span></i>
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
										<form action="/Elearning_FE/admin/view-admin?search"
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
												<th>Account</th>
												<th>Email</th>
												<th>Phone</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${listAdmin}" var="item" varStatus="vs">
												<tr>
													<td contenteditable="true">${vs.count}</td>
													<td contenteditable="true">${item.hoTen}</td>
													<td contenteditable="true">${item.taiKhoan}</td>
													<td contenteditable="true">${item.email}</td>
													<td contenteditable="true">${item.soDienThoai}</td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-danger mb-3"
																<c:if test="${item.roleId == 3}">disabled</c:if>
																onClick="handleOnDeleteUserAdmin(${item.maNguoiDung},${item.roleId})">
																<i class="ri-delete-bin-2-fill pr-0"></i>Delete
															</button>
													</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="/view/components/FooterAdmin.jsp" />
		</div>
	</div>

	<div class="modal fade" id="addAdmin" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add admin</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/Elearning_FE/admin/view-admin/add" method="POST">
						<div class="form-group">
							<label for="username">Username</label> <input type="text" pattern="[a-zA-Z0-9]+" title="Tài khoản có các kí tự đặc biệt"
								class="form-control" id="username" name="username"
								placeholder="Username" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Password" required>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <input type="text" pattern="[a-zA-Z0-9\s]+" title="Họ tên có các kí tự đặc biệt"
								class="form-control" id="fullname" name="fullname"
								placeholder="John" required>
						</div>
						<div class="form-group">
							<label for="number">Phone</label> <input type="text"
								class="form-control" id="number" name="number"
								placeholder="0123456789" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								placeholder="abc@gmail.com" required>
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
	function handleOnDeleteUserAdmin(id,role) {
		  swal({
		    title: "Are you sure?",
		    text: "You won't be able to revert this!",
		    icon: "warning",
		    buttons: true,
		    dangerMode: true,
		  }).then((willDelete) => {
		    if (willDelete) {
		      window.location.href = `/Elearning_FE/admin/view-admin/delete?id=` + id+ `&role=`+role;
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
		            window.location.href = `/Elearning_FE/admin/view-admin`;
		         }
		      });
		   }
		})
			$(window).on("load", function () {
		console.log($("#alertMsg_1"));
		   if ($("#alertMsg_1").length) {
		      swal({
		         title: $("#alertMsg_1").html(),
		         text: "Would you like to go back?",
		         icon: "warning",
		         buttons: true,
		         dangerMode: true,
		      }).then((willDelete) => {
		         if (willDelete) {
		            window.location.href = `/Elearning_FE/admin/view-admin`;
		         }
		      });
		   }
		})
	
	</script>
</body>
</html>