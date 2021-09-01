<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/img_course" var="url"></c:url>
<tr>
	<td scope="row" class="border-0">
		<div class="p-2 d-flex">
			<img src="${url}/${param.hinhAnh}" alt="" width="70"
				class="img-fluid rounded shadow-sm">
			<div class="ml-3 d-inline-block align-middle info">
				<h5 class="mt-0">
					<div class="text-dark d-inline-block align-middle">${param.tenKhoaHoc }</div>
				</h5>
				<span class="text-muted font-weight-normal d-block">Category:
					${param.danhMuc }</span>
			</div>
		</div>
	</td>
	<td class="border-0 align-middle"><strong>$${param.donGia}</strong></td>
	<td class="border-0 align-middle">
	<c:url value="/deleteItem?maKhoaHoc=${param.maKhoaHoc}"
				var="deleteItem"></c:url>
		<a href="${deleteItem}" class="text-dark"> 
			<i class="fa fa-trash"></i>
		</a>
	</td>
</tr>