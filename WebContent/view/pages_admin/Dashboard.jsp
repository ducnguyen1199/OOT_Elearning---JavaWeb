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
					<div class="col-lg-12">
						<div class="row">
							<div class="col-md-6 col-lg-3">
								<div class="iq-card">
									<div class="iq-card-body iq-bg-primary rounded">
										<div class="d-flex align-items-center justify-content-between">
											<div class="rounded-circle iq-card-icon bg-primary">
												<i class="fa fa-television" aria-hidden="true"></i>
											</div>
											<div class="text-right">
												<h2 class="mb-0">
													<span class="counter">1787</span>
												</h2>
												<h5 class="">Online Courses</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="iq-card">
									<div class="iq-card-body iq-bg-warning rounded">
										<div class="d-flex align-items-center justify-content-between">
											<div class="rounded-circle iq-card-icon bg-warning">
											<i class="fa fa-user-o" aria-hidden="true"></i>
											</div>
											<div class="text-right">
												<h2 class="mb-0">
													<span class="counter">690</span>
												</h2>
												<h5 class="">Trusted Tutors</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="iq-card">
									<div class="iq-card-body iq-bg-danger rounded">
										<div class="d-flex align-items-center justify-content-between">
											<div class="rounded-circle iq-card-icon bg-danger">
												<i class="fa fa-graduation-cap" aria-hidden="true"></i>
											</div>
											<div class="text-right">
												<h2 class="mb-0">
													<span class="counter">855046</span>
												</h2>
												<h5 class="">Online Student</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="iq-card">
									<div class="iq-card-body iq-bg-info rounded">
										<div class="d-flex align-items-center justify-content-between">
											<div class="rounded-circle iq-card-icon bg-info">
												<i class="fa fa-sun-o" aria-hidden="true"></i>
											</div>
											<div class="text-right">
												<h2 class="mb-0">
													<span class="counter">5403</span>
												</h2>
												<h5 class="">Success </h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">Top Courses</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<div id="doc-chart-01" style="height: 470px;"></div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">Top Teacher</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<div id="am-3dpie-chart" style="height: 470px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/view/components/FooterAdmin.jsp" />
		</div>
	</div>
	<div class="dataTeacher" style="display: none">
		<c:forEach items="${listTopTeacher}" var="item" varStatus="vs">
		<p id="nameTeacher${vs.index}">${item.tenGiaoVien}</p>
		<p id="dataTeacher${vs.index}">${item.soLuongKH}</p>
		</c:forEach>
	</div>
	<div class="dataCourse" style="display: none">
		<c:forEach items="${listTopCourse}" var="item" varStatus="vs">
		<p id="nameCourse${vs.index}">${item.tenKhoaHoc}</p>
		<p id="dataCourse${vs.index}">${item.soLuong}</p>
		</c:forEach>
	</div>

	<jsp:include page="/view/Html/admin/Script.jsp" />
</body>
</html>