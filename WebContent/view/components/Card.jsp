<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/img_course" var="url"></c:url>
<div class="card course_card course_popover" data-toggle="popover">
  <input class="store-Data" style="display:none"
    name="${param.tenKhoaHoc}|-${param.maDanhMuc}|-${param.moTa}|-${param.thanhTien }|-${param.maKhoaHoc}|-${param.tenGiaoVien}|-${param.soLuong}|-${param.status}|-${username}|-${param.giamGia}">
  <div style="cursor: pointer" onclick="handleDetail(${param.maKhoaHoc})">
    <c:choose>
      <c:when test="${param.xepHang >= 4.5 }">
        <div class="wrapper-badge ">
          <div class="badge badge--hot">
            Best
            <i></i> <i></i>
          </div>
        </div>
      </c:when>
      <c:when test="${param.soLuong < 1000 }">
        <div class="wrapper-badge ">
          <div class="badge badge--new">
            New
            <i></i> <i></i>
          </div>
        </div>
      </c:when>
      <c:when test="${param.soLuong > 1000}">
        <div class="wrapper-badge ">
          <div class="badge badge">
            Hot
            <i></i> <i></i>
          </div>
        </div>
      </c:when>
    </c:choose>
    <div class="card-top">
      <img src="
            ${url}/${param.hinhAnh}" class="card-img-top img-fluid" alt="#error" title=biDanh />
      <div class="card__overlay">
      </div>
    </div>
    <hr class="m-0" />
    <div class="card-body">
      <h1 class="card-title">
        <span>${param.tenKhoaHoc} </span>

      </h1>
      <p class="card-text">${param.moTa}</p>
      <div class="star">
        <i class="fa fa-star" aria-hidden="true"></i>
        <i class="fa fa-star" aria-hidden="true"></i>
        <i class="fa fa-star" aria-hidden="true"></i>
        <i class="fa fa-star" aria-hidden="true"></i>
        <i class="fa fa-star-half" aria-hidden="true"></i>
        <span></span>
        <span>

        </span>
      </div>
      <div class="price">
        <s>
          <span>$${ param.thanhTien}</span>
        </s>
        <span>$${Math.round(param.thanhTien -(param.thanhTien * param.giamGia / 100))}</span>
      </div>
    </div>
  </div>

</div>