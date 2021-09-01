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
											style="margin-right: 10px;">Student
									</h4>
								</div>
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
										<form action="/Elearning_FE/admin/user/search"
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

											<c:forEach items="${listUser}" var="item" varStatus="vs">
												<tr>
													<td contenteditable="true">${vs.count}</td>
													<td contenteditable="true">${item.hoTen}</td>
													<td contenteditable="true">${item.taiKhoan}</td>
													<td contenteditable="true">${item.email}</td>
													<td contenteditable="true">${item.soDienThoai}</td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-danger mb-3"
																onClick="handleOnDeleteUser(${item.maNguoiDung})">
																<i class="ri-delete-bin-2-fill pr-0"></i>Delete
															</button>
													</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-end">
											<%-- 											<c:forEach items="${page}" var="number">
												<li class="page-item"><a class="page-link" href="#">${number}</a></li>
											</c:forEach> --%>
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

	<jsp:include page="/view/Html/admin/Script.jsp" />
	<script>
	function handleOnDeleteUser(id) {
		  swal({
		    title: "Are you sure?",
		    text: "You won't be able to revert this!",
		    icon: "warning",
		    buttons: true,
		    dangerMode: true,
		  }).then((willDelete) => {
		    if (willDelete) {
		      window.location.href = `/Elearning_FE/admin/user/delete?id=` + id;
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
		            window.location.href = `/Elearning_FE/admin/user`;
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
		            window.location.href = `/Elearning_FE/admin/user`;
		         }
		      });
		   }
		})
	
	</script>
</body>
</html>