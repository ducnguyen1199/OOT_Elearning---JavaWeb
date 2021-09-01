
$("[data-toggle='popover']").on('shown.bs.popover', function () {
	var arrValue = $("#contentEvent").html().split('|');
	$('.add-to-card_button').attr('onClick', `handleAddToCart(${arrValue[0]},${arrValue[1]},'${arrValue[2]}','${arrValue[3]}');`);
});
function handleAddToCart(maKhoaHoc, statusAdd, username, maDanhMuc) {
	if (username == '' || !username) {
		swal({
			title: "You are not logged in!",
			text: "Would you like to go to the login page?",
			icon: "warning",
			buttons: true,
			ok: true,
		})
			.then((value) => {
				if (value == true) {
					window.location.href = "/Elearning_FE/home-login";
				}
			});
	}
	else if (statusAdd == 0 && username != '') {
		window.location.href = "/Elearning_FE/addToCart?maKhoaHoc=" + maKhoaHoc;
		localStorage.setItem("yOffset", window.pageYOffset);
		localStorage.getItem("flag-course") ? '' : localStorage.setItem("cate-home", maDanhMuc); 
	};
};
$(document).ready(function () {
	// getDate
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = dd + '/' + mm + '/' + yyyy;
	
	// Popover
	var listCoursePopover = $(".course_popover");
	var getDataFromCard = $(".store-Data");
	console.log(getDataFromCard);
	if (window.location.pathname != "/Elearning_FE/HoSo") {
		listCoursePopover.map((index, item) => {
			var data = getDataFromCard[index];
			
			var arrayData = (data.getAttribute("name")).split('|-');
			$(item).attr(
				"data-content", `<div class="popover-inner"><div class="popover_header">
			      <div
			      class="d-flex justify-content-between"
			      style="padding: 5px 0"
			    >
			      <div class="-avatar">
			        <img src="view/assets/img/avatar.png" alt="" />
			        <p>${arrayData[5]}</p>
			      </div>
			      <div class="-lastupdated">Last update ${today}</div>
			    </div>
			    <h3 class="popover-header">
			      <a href="/Elearning_FE/detail-course?id=${arrayData[4]}">
			        ${arrayData[0]}
			      </a>
			    </h3>
			    <div class="popover_badge -with-content">
			    <span class="badge-with-content">
			    <span class="badge-text">bestseller</span>
			  </span>
			      <span class="content-info">
			        <span>
			          in
			          <a href="true"> ${arrayData[1]} </a>
			        </span>
			        | Development
			      </span>
			    </div>
			    <div class="course-info">
			      <div class="e-icon">
			      <i class="fa fa-play-circle-o" aria-hidden="true"></i>
			        5 lectures
			      </div>
			      <div class="e-icon">
			      <i class="fa fa-clock-o" aria-hidden="true"></i>
			        10 houres
			      </div>
			      <div class="e-icon">
			      <i class="fa fa-slideshare" aria-hidden="true"></i>
			        All levels
			      </div>
			    </div>
			  </div>
			  <div class="popover_body">
			    <div class="description">${arrayData[2]}</div>
			    <div class="description-info">
			      With no prior experience, you will have the opportunity to walk
			      through hands-on examples with Hadoop and Spark frameworks, two of the
			      most common ...
			    </div>
			    <div class="popover_cart">
			    <div class="add-to-card_button btn--add mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect
			    	${arrayData[7] == 1 ? "ordered" : arrayData[7] == 2 ? "bought" : ""}
			    ">
			    	${arrayData[7] == 0 ? "Add to cart" : arrayData[7] == 1 ? "Ordered" : "Bought"}
			     </div>
			    </div>
			    <div class="d-flex justify-content-between align-items-center heart">
			      <i class="fa fa-heart" aria-hidden="true"></i>
			      <div class="fee">$${Math.round(arrayData[3] - (arrayData[3] * arrayData[9] / 100))}</div>
			    </div>
			  </div></div>
			  <div id="contentEvent" class="d-none">${arrayData[4]}|${arrayData[7]}|${arrayData[arrayData.length - 2]}|${arrayData[1]}</div>
			  `
			);
		})
	}

	$(".course_popover")
		.popover({
			trigger: "manual",
			html: true,
			animation: false,
		})
		.on("mouseenter", function () {
			var _this = this;
			$(this).popover("show");
			$(".popover").on("mouseleave", function () {
				$(_this).popover("hide");
			});
		})
		.on("mouseleave", function () {
			var _this = this;
			setTimeout(function () {
				if (!$(".popover:hover").length) {
					$(_this).popover("hide");
				}
			}, 0);
		});

	// detail-course
	$(".odometer").appear(function (e) {
		$(this).html($(this).attr("data-count"));
	});
	$("#applyCoupon").on("click", function () {
		$(this).css("display", "none");
		$("#coupon_form").css("display", "block");
	});

	// loader
	$(window).on("load", function () {
		if (localStorage.getItem("yOffset")) {
			window.scroll({
				top : localStorage.getItem("yOffset"),
				left : 0,
			});
			localStorage.removeItem("yOffset");
		}
		if(window.location.pathname == "/Elearning_FE/TrangChu"){
			setTimeout(() => {
				$(".loader-wapper").remove();
			}, 100);
		}else{
			setTimeout(() => {
				$(".loader-wapper").remove();
			}, 1000);
		}
		
	})


	// Back to top
	var btn = $('#back-to-top');
	$(window).scroll(function () {
		if ($(window).scrollTop() > 300) {
			btn.addClass('show');
		} else {
			btn.removeClass('show');
		}
	});

	btn.on('click', function (e) {
		e.preventDefault();
		console.log($.fn.jquery);
		$('html, body').animate({ scrollTop: 0 }, '300');
	});

	// Discount
	let d = new Date();
	let dSale = new Date();
	dSale.setDate(dSale.getDate() + 1);
	let nDate = Math.abs(dSale - d) / 1000;
	window.$("#clock").FlipClock(nDate, {
		clockFace: "DailyCounter",
		countdown: true,
	});
	//

	// KhoaHoc
	handleonClick = (id, page) => {
		var pageNumber = 0;

		if (page == 'next') pageNumber = parseInt($(".numcd.active").attr("num")) + 1;
		else if (page == 'prev') pageNumber = parseInt($(".numcd.active").attr("num")) - 1;
		else pageNumber = page;

		window.location.href = `/Elearning_FE/Courses?id=${id}&page=${pageNumber}`;
	}
	handleonClickBest = (id, page, flag) => {
		var pageNumber = 0;

		if (page == 'next') pageNumber = parseInt($(".numcb.active").attr("num")) + 1;
		else if (page == 'prev') pageNumber = parseInt($(".numcb.active").attr("num")) - 1;
		else pageNumber = page;

		window.location.href = `/Elearning_FE/Courses?id=${id}&page=${pageNumber}&flag=${flag}`;
	}

	handleonClickTrending = (id, page, flag) => {
		var pageNumber = 0;

		if (page == 'next') pageNumber = parseInt($(".numct.active").attr("num")) + 1;
		else if (page == 'prev') pageNumber = parseInt($(".numct.active").attr("num")) - 1;
		else pageNumber = page;

		window.location.href = `/Elearning_FE/Courses?id=${id}&page=${pageNumber}&flag=${flag}`;
	}

});
function handleDetail(id) {
	window.location.href = `/Elearning_FE/detail-course?id=` + id;
}