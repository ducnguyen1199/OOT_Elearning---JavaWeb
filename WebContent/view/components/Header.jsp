<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img" var="url"></c:url>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="uri"
	value="${requestScope['javax.servlet.forward.request_uri']}" />
<header class="header">
	<div class="container">
		<nav class="navbar navbar-expand-md navbar-light p-0">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/TrangChu">
				<img src="${url}/logo-oot.PNG" class="img-fluid logo" alt="" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						class="nav-link link ${uri.endsWith('/') ? 'selectedLink' : ''} ${uri.endsWith('/TrangChu') ? 'selectedLink' : ''}"
						href="${ctx}/TrangChu"> Home </a></li>
					<li class="nav-item"><a
						class="nav-link link ${uri.endsWith('/Courses') ? 'selectedLink' : ''}"
						href="${ctx}/Courses"> Courses </a></li>
					<li class="nav-item"><a
						class="nav-link link ${uri.endsWith('/Blogs') ? 'selectedLink' : ''}"
						href="${ctx}/Blogs"> Blogs </a></li>
					<li class="nav-item"><a
						class="nav-link link ${uri.endsWith('/About') ? 'selectedLink' : ''}"
						href="${ctx}/About"> About </a></li>




					<li class="nav-item cart"><a> <span
							class="nav-link icon"> <i class="fa fa-shopping-cart"
								aria-hidden="true"></i>
						</span> <c:if test="${sessionScope.order.items.size() > 0}">
								<span class="count"> ${sessionScope.order.items.size()}</span>
							</c:if> <c:if test="${sessionScope.order.items.size() == null}">
								<span class="count">0</span>
							</c:if> <c:if test="${ username!= null && username != ''}">
								<div class="giohang p-2">
									<div class="items">
										<c:if test="${sessionScope.order.items != null}">
											<c:forEach var="item" items="${sessionScope.order.items}">
												<jsp:include page="/view/components/ItemMiniCart.jsp">
													<jsp:param value="${item.getKhoaHoc().getMaKhoaHoc()}"
														name="maKhoaHoc" />
													<jsp:param value="${item.getKhoaHoc().getTenKhoaHoc()}"
														name="tenKhoaHoc" />
													<jsp:param value="${item.getKhoaHoc().getHinhAnh()}"
														name="hinhAnh" />
													<jsp:param value="${item.getDonGia()}" name="donGia" />
												</jsp:include>
											</c:forEach>
										</c:if>
									</div>
									<p class="sum">
										<c:if test="${sessionScope.order.items != null}">
											<span class="text-success">Subtotal:
												$${sessionScope.order.tongTien() }</span>
										</c:if>
										<c:if test="${sessionScope.order.items == null}">
											<span class="text-success">Subtotal: $0</span>
										</c:if>
									</p>
									<div class="buttons">
										<a href="#" class="btn-view-cart">
											<div class="btn-123">
												<a href="/Elearning_FE/GioHang" class="btn-6"> Detail <span></span>
												</a>
											</div>
										</a> <a href="#" class="btn-checkout">
											<div class="btn-123">
												<a href="/Elearning_FE/ThanhToan" class="btn-6"> Payment
													<span></span>
												</a>
											</div>
										</a>
									</div>
								</div>
							</c:if>
					</a></li>
					<c:choose>
						<c:when test="${username!= null && username != ''}">
							<li class="nav-item login">
								<div class="user">
									<span class="user-icon">${username.substring(0,1).toUpperCase()}</span>
								</div>
								<div class="user-info">
									<div class="user-email">
										<div class="user mr-3">
											<span class="user-icon">${username.substring(0,1).toUpperCase()}</span>
										</div>
										<div class="text">
											<span style="cursor: 'pointer';">${username} </span> <br />
											<span class="text-muted">${email} </span>
										</div>
									</div>
									<div class="item">
										<i class="fa fa-bell-o icon" aria-hidden="true"></i> <span>Notifications</span>
									</div>
									<div class="item">
										<i class="fa fa-comment-o icon" aria-hidden="true"></i> <span>Messages</span>
									</div>
									<a class="item profile" href="HoSo"> <i
										class="fa fa-user-o icon" aria-hidden="true"></i> <span>Profile</span>
									</a> <a class="item his" href="#"> <i
										class="fa fa-history icon" aria-hidden="true"></i> <span>Purchare
											history</span>
									</a>
									<div class="item">
										<i class="fa fa-credit-card icon" aria-hidden="true"></i> <span>Payment
											methods</span>
									</div>
									<div class="item">
										<a href="LogOutUser"><i class="fa fa-power-off icon"
											aria-hidden="true"></i> <span>Log out</span> </a>
									</div>
								</div>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item sign_in">
								<div class="btn-123">
									<a href="/Elearning_FE/home-login" class="btn-6"> Sign in <span></span>
									</a>
								</div>
							</li>
							<li class="nav-item sign_up">
								<div class="btn-123">
									<a href="/Elearning_FE/home-signup" class="btn-6"> Sign up
										<span></span>
									</a>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
</header>
<div class="end-header"></div>
