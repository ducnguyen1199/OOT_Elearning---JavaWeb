<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/img_teacher" var="url"></c:url>
<c:url value="/view/assets/img" var="url2"></c:url>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/Head.jsp" />
<body>
	<c:if test="${statusLoading == true}">
		<jsp:include page="/view/components/LoadingHome.jsp" />
	</c:if>
	<jsp:include page="/view/components/Header.jsp" />
	<div class="Page_Blog">
        <div class="banner" style="background: url(${url2}/green.png;) ">
        <div style="margin-left: 200px">
         <h1>BLOG</h1>
          <ul>
            <li><a href="/Elearning_FE/TrangChu">HOME</a></li>
            <li><a href="/Elearning_FE/Blogs">BLOG</a></li>
          </ul>
        </div>
        </div>
        <div class="contentBlog row ">
          <div class="col-8 content-left">
            <div class="item">
              <h4>Learn the language of love, morbi venenatis lacinia</h4>
              <img class="img-fluid" src="${url2}/10.jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
            <div class="item">
              <h4>First Ankara Big Data Meetup</h4>
              <img class="img-fluid" src="${url2}/104 .jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
            <div class="item">
              <h4>Where do you want to be?</h4>
              <img class="img-fluid" src="${url2}/blog03 .jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
            <div class="item">
              <h4>Trip to Knaresborough, Speaking club, Going to the pub</h4>
              <img class="img-fluid" src="${url2}/11.jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
            <div class="item">
              <h4>What course will your life take? Morbi venenatis lacinia</h4>
              <img class="img-fluid" src="${url2}/09.jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
            <div class="item">
              <h4>The gig economy is real if you know where to look</h4>
              <img class="img-fluid" src="${url2}/05.jpg"></img>
              <div class="detail">
                <p>
                  <i class="fa fa-clock-o" aria-hidden="true"></i>{" "}
                  <span>17 Nov.2017 </span> <i class="fa fa-user"></i> Posted by{" "}
                  <span>aislin </span> <i class="fa fa-flag"></i>{" "}
                  <span>Event</span>
                </p>
                <p>
                  Education is the process of facilitating learning. Knowledge,
                  skills, values, beliefs, and habits of a group of people are
                  transferred to other people, through storytelling, discussion,
                  teaching, training, or research. …
                </p>
                <button class="btn btn-success "> READ MORE</button>
              </div>
            </div>
          </div>
          <div class="col-3 content-right">
            <h2>Working Hours</h2>
            <ul class="List-work">
              <li>
                <span>Monday</span> <span>9am-6pm</span>
              </li>
              <li>
                <span>Tuesday</span> <span>9am-6pm</span>
              </li>
              <li>
                <span>Wednesday</span> <span>9am-6pm</span>
              </li>
              <li>
                <span>Thursday</span> <span>9am-6pm</span>
              </li>
              <li>
                <span>Friday</span> <span>9am-6pm</span>
              </li>
              <li>
                <span>Saturday</span>{" "}
                <button class="btn btn-info">Closed</button>
              </li>
              <li>
                <span>Sunday</span>{" "}
                <button class="btn btn-info">Closed</button>
              </li>
            </ul>
            <div class="Latest_Posts">
              <h2>Latest Posts</h2>
              <div class="item_latest">
                <img
                  src="${url2}/10-150x150.jpg"
                ></img>
                <div class="Detail">
                  <p>Learn the language of love, morbi venenatis lacinia</p>
                  <p>
                    <i class="fa fa-clock-o" aria-hidden="true"></i>21 Nov.2017{" "}
                    <i class="fa fa-comment"></i> 4
                  </p>
                </div>
              </div>
              <div class="item_latest">
                <img
                  src="${url2}/03-150x150.jpg"
                ></img>
                <div class="Detail">
                  <p>Learn English connect with the world</p>
                  <p>
                    <i class="fa fa-clock-o" aria-hidden="true"></i>17 Nov.2017{" "}
                    <i class="fa fa-comment"></i> 14
                  </p>
                </div>
              </div>
            </div>
            <div class="Teachers">
              <h2>Teachers</h2>
              <div class="item-teacher">
                <img src="${url2}/02-1.png"></img>
                <h3>Charlie Brown</h3>
                <span>Web Designer</span>
                <p>My name is Ruth. I grew up and studied in…</p>
              </div>
              <div class="item-teacher">
                <img src="${url2}/05.png"></img>
                <h3>Jackson James</h3>
                <span>Web Designer</span>
                <p>
                  Praesent varius orci at erat lobortis lacinia. Morbi lectus
                  metus,…
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
	<jsp:include page="/view/components/Footer.jsp" />
	<jsp:include page="/view/components/BackToTop.jsp" />
	<jsp:include page="/view/Html/Script.jsp" />
</body>
</html>
