<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img_course" var="url"></c:url>
<div class="item my-1">
	<div class="media" onclick="handleDetail(${param.maKhoaHoc})">
		<img class="img" src=" ${url}/${param.hinhAnh}" width="100" />
		<div class="media-body">
			<span class="name-course">${param.tenKhoaHoc }</span> <br /> <span
				class="text-success">$${Math.round(Float.parseFloat(param.donGia))}</span>
		</div>
	</div>
</div>