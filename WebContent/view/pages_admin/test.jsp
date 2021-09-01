<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/view/Html/admin/Head.jsp" />
</head>
<body>
   <!-- loader Start -->
      <div id="loading">
         <div id="loading-center">

         </div>
      </div>
      <!-- loader END -->
      <!-- Wrapper Start -->
      <div class="wrapper">
         <!-- Sidebar  -->
         <div class="iq-sidebar">
            <div class="iq-sidebar-logo d-flex justify-content-between">
               <a href="index.html">
               <img src="images/logo-base.png" class="img-fluid" alt="">
               </a>
               <div class="iq-menu-bt-sidebar">
                     <div class="iq-menu-bt align-self-center">
                        <div class="wrapper-menu">
                           <div class="main-circle"><i class="ri-more-fill"></i></div>
                           <div class="hover-circle"><i class="ri-more-2-fill"></i></div>
                        </div>
                     </div>
                  </div>
            </div>
            <div id="sidebar-scrollbar">
               <nav class="iq-sidebar-menu">
                  <ul class="iq-menu">
                     <li class="iq-menu-title"><i class="ri-subtract-line"></i><span>Trang chủ</span></li>                  
                     <li class="active">
                        <a href="dashboard-1.html" class="iq-waves-effect"><i class="ri-home-8-fill"></i><span>Home</span></a>
                     </li>
                     <li class="iq-menu-title"><i class="ri-subtract-line"></i><span>Quản lý</span></li>
                     <li class="">
                        <a href="account.html" class="iq-waves-effect"><i class="fa fa-user-circle" aria-hidden="true"></i><span>User</span></a>
                     <li>
                     <li class="">
                        <a href="website.html" class="iq-waves-effect"><i class="fa fa-chrome" aria-hidden="true"></i><span>Website</span></a>
                     <li>
                        <a href="javascript:void(0);" class="iq-waves-effect"><i class="fa fa-address-card-o" aria-hidden="true"></i><span>Khách hàng</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul class="iq-submenu">
                           <li><a href="customer.html"><i class="fa fa-id-badge" aria-hidden="true"></i>Thông tin</a></li>
                           <li><a href="contribute.html"><i class="fa fa-book" aria-hidden="true"></i>Đóng góp</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:void(0);" class="iq-waves-effect"><i class="fa fa-language" aria-hidden="true"></i><span>Ngôn ngữ</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul class="iq-submenu">
                           <li><a href="english.html"><i class="fa fa-flag-checkered" aria-hidden="true"></i>Tiếng anh</a></li>
                           <li><a href="film.html"><i class="fa fa-film" aria-hidden="true"></i>Tựa đề phim</a></li>
                        </ul>
                     </li>

                  </ul>
               </nav>
               <div class="p-3"></div>
            </div>
         </div>
        
         <!-- Page Content  -->
         <div id="content-page" class="content-page">
             <!-- TOP Nav Bar -->
         <div class="iq-top-navbar">
            <div class="iq-navbar-custom">
               <div class="iq-sidebar-logo">
                  <div class="top-logo">
                     <a href="index.html" class="logo">
                     <img src="images/logo.png" class="img-fluid" alt="">
                     <span>XRay</span>
                     </a>
                  </div>
               </div>
               <nav class="navbar navbar-expand-lg navbar-light p-0">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <i class="ri-menu-3-line"></i>
                  </button>
                  <div class="iq-menu-bt align-self-center">
                     <div class="wrapper-menu">
                        <div class="main-circle"><i class="ri-more-fill"></i></div>
                           <div class="hover-circle"><i class="ri-more-2-fill"></i></div>
                     </div>
                  </div>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav ml-auto navbar-list">
                        <li class="nav-item iq-full-screen">
                           <a href="#" class="iq-waves-effect" id="btnFullscreen"><i class="ri-fullscreen-line"></i></a>
                        </li>
                        <li class="nav-item">
                           <a href="#" class="search-toggle iq-waves-effect">
                                 <i class="ri-notification-3-fill"></i>
                                 <span class="bg-danger dots"></span>
                              </a>
                           <div class="iq-sub-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                       <h5 class="mb-0 text-white">All Notifications<small class="badge  badge-light float-right pt-1">4</small></h5>
                                    </div>

                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Emma Watson Bini</h6>
                                             <small class="float-right font-size-12">Just Now</small>
                                             <p class="mb-0">95 MB</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">New customer is join</h6>
                                             <small class="float-right font-size-12">5 days ago</small>
                                             <p class="mb-0">Jond Bini</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Two customer is left</h6>
                                             <small class="float-right font-size-12">2 days ago</small>
                                             <p class="mb-0">Jond Bini</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">New Mail from Fenny</h6>
                                             <small class="float-right font-size-12">3 days ago</small>
                                             <p class="mb-0">Jond Bini</p>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </li>
                        <li class="nav-item dropdown">
                           <a href="#" class="search-toggle iq-waves-effect">
                              <i class="ri-mail-open-fill"></i>
                              <span class="bg-primary count-mail"></span>
                           </a>
                           <div class="iq-sub-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                       <h5 class="mb-0 text-white">All Messages<small class="badge  badge-light float-right pt-1">5</small></h5>
                                    </div>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Bini Emma Watson</h6>
                                             <small class="float-left font-size-12">13 Jun</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Lorem Ipsum Watson</h6>
                                             <small class="float-left font-size-12">20 Apr</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Why do we use it?</h6>
                                             <small class="float-left font-size-12">30 Jun</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Variations Passages</h6>
                                             <small class="float-left font-size-12">12 Sep</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/05.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Lorem Ipsum generators</h6>
                                             <small class="float-left font-size-12">5 Dec</small>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <ul class="navbar-list">
                     <li>
                        <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                           <img src="images/user/1.jpg" class="img-fluid rounded mr-3" alt="user">
                           <div class="caption">
                              <h6 class="mb-0 line-height">Bini Jets</h6>
                              <span class="font-size-12">Available</span>
                           </div>
                        </a>
                        <div class="iq-sub-dropdown iq-user-dropdown">
                           <div class="iq-card shadow-none m-0">
                              <div class="iq-card-body p-0 ">
                                 <div class="bg-primary p-3">
                                    <h5 class="mb-0 text-white line-height">Hello Bini Jets</h5>
                                    <span class="text-white font-size-12">Available</span>
                                 </div>
                                 <a href="profile.html" class="iq-sub-card iq-bg-primary-hover">
                                    <div class="media align-items-center">
                                       <div class="rounded iq-card-icon iq-bg-primary">
                                          <i class="ri-file-user-line"></i>
                                       </div>
                                       <div class="media-body ml-3">
                                          <h6 class="mb-0 ">My Profile</h6>
                                          <p class="mb-0 font-size-12">View personal profile details.</p>
                                       </div>
                                    </div>
                                 </a>
                                 <a href="profile-edit.html" class="iq-sub-card iq-bg-primary-hover">
                                    <div class="media align-items-center">
                                       <div class="rounded iq-card-icon iq-bg-primary">
                                          <i class="ri-profile-line"></i>
                                       </div>
                                       <div class="media-body ml-3">
                                          <h6 class="mb-0 ">Edit Profile</h6>
                                          <p class="mb-0 font-size-12">Modify your personal details.</p>
                                       </div>
                                    </div>
                                 </a>
                                 <a href="account-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                    <div class="media align-items-center">
                                       <div class="rounded iq-card-icon iq-bg-primary">
                                          <i class="ri-account-box-line"></i>
                                       </div>
                                       <div class="media-body ml-3">
                                          <h6 class="mb-0 ">Account settings</h6>
                                          <p class="mb-0 font-size-12">Manage your account parameters.</p>
                                       </div>
                                    </div>
                                 </a>
                                 <a href="privacy-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                    <div class="media align-items-center">
                                       <div class="rounded iq-card-icon iq-bg-primary">
                                          <i class="ri-lock-line"></i>
                                       </div>
                                       <div class="media-body ml-3">
                                          <h6 class="mb-0 ">Privacy Settings</h6>
                                          <p class="mb-0 font-size-12">Control your privacy parameters.</p>
                                       </div>
                                    </div>
                                 </a>
                                 <div class="d-inline-block w-100 text-center p-3">
                                    <a class="bg-primary iq-sign-btn" href="sign-in.html" role="button">Sign out<i class="ri-login-box-line ml-2"></i></a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </li>
                  </ul>
               </nav>

            </div>
         </div>
         <!-- TOP Nav Bar END -->
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="row">
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card">
                              <div class="iq-card-body iq-bg-primary rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-primary"><i class="fas fa-language"></i></div>
                                    <div class="text-right">                                 
                                       <h2 class="mb-0"><span class="counter">5600</span></h2>
                                       <h5 class="">Doctors</h5>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card">
                              <div class="iq-card-body iq-bg-warning rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-warning"><img src="images/language/uk_big.png" alt=""></div>
                                    <div class="text-right">                                 
                                       <h2 class="mb-0"><span class="counter">3450</span></h2>
                                       <h5 class="">Nurses</h5>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card">
                              <div class="iq-card-body iq-bg-danger rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-danger"><img src="images/language/france_big.png" alt=""></div>
                                    <div class="text-right">                                 
                                       <h2 class="mb-0"><span class="counter">3500</span></h2>
                                       <h5 class="">Patients</h5>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card">
                              <div class="iq-card-body iq-bg-info rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-info"><img src="images/language/japan_big.png" alt=""></div>
                                    <div class="text-right">                                 
                                       <h2 class="mb-0"><span class="counter">4500</span></h2>
                                       <h5 class="">Pharmacists</h5>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                 <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title"> 3D Pie Chart</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <div id="am-3dpie-chart" style="height: 500px;"></div>
                     </div>
                  </div>
                  </div>
               </div>
            </div>
      <!-- Footer -->
         <footer class="bg-white iq-footer">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-6">
                     <ul class="list-inline mb-0">
                        <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
                        <li class="list-inline-item"><a href="terms-of-service.html">Terms of Use</a></li>
                     </ul>
                  </div>
                  <div class="col-lg-6 text-right">
                     Copyright 2020 <a href="#">XRay</a> All Rights Reserved.
                  </div>
               </div>
            </div>
         </footer>
      <!-- Footer END -->
         </div>
      </div>
      <!-- Wrapper END -->
	<jsp:include page="/view/Html/admin/Script.jsp" />
</body>
</html>