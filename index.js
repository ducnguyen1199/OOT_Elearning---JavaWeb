dataCategory = [
  {
    maDanhMuc: "All",
    tenDanhMuc: "Tất cả khóa học",
  },
  {
    maDanhMuc: "BackEnd",
    tenDanhMuc: "Lập trình Backend",
  },
  {
    maDanhMuc: "Design",
    tenDanhMuc: "Thiết kế Web",
  },
  {
    maDanhMuc: "DiDong",
    tenDanhMuc: "Lập trình di động",
  },
  {
    maDanhMuc: "FrontEnd",
    tenDanhMuc: "Lập trình Front end",
  },
  {
    maDanhMuc: "FullStack",
    tenDanhMuc: "Lập trình Full Stack",
  },
  {
    maDanhMuc: "TuDuy",
    tenDanhMuc: "Tư duy lập trình",
  },
];
let category_content = ``;

dataCategory.map((item, index) => {
  dataShow =
    item.maDanhMuc != "All"
      ? dataCourse.filter(
          (i) => i.danhMucKhoaHoc.maDanhMucKhoahoc == item.maDanhMuc
        )
      : dataCourse;
  category_content += ` <li class="nav-item">
	    <a class="nav-link ${index == 0 ? "active" : ""}" id="${
    item.maDanhMuc
  }-tab" data-toggle="tab" href="#${
    item.maDanhMuc
  }" role="tab" aria-controls="${item.maDanhMuc}" aria-selected="true">${
    item.tenDanhMuc
  }</a>
	  </li>`;
});

$("#popular__nav").html(category_content);

let dataIns = [
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/01.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/02.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/03.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/04.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/05.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Alex Labby",
    skill: "Software Development Trainer",
    img: "./img/06.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
];
let contentIns = ``;
dataIns.map((item) => {
  contentIns += `<div class="card ">
		  <img src="${item.img}" alt="" />
		  <div class="detail-card ">
		    <h3>${item.name}</h3>
		    <p>${item.skill}</p>
		  </div>
		  <div class="icon-card">
		    <i class="fa fa-star" aria-hidden="true" />
		    <i class="fa fa-star" aria-hidden="true" />
		    <i class="fa fa-star" aria-hidden="true" />
		    <i class="fa fa-star" aria-hidden="true" />
		    <i class="fa fa-star" aria-hidden="true" />
		  </div>

		  <div class="info-card">
		    <span class="view">
		        <i class="fa fa-eye" aria-hidden="true" ></i> ${item.view}
		    </span>
		    <div class="info-icon">
		      <div class="face">
		        <a href="#">
		          <i class="fa fa-facebook" aria-hidden="true" ></i> 
		        </a>
		      </div>
		      <div class="mail">
		        <a href="#">
		          <i class="fa fa-envelope" aria-hidden="true" ></i> 
		        </a>
		      </div>
		      <div class="twitter">
		        <a href="#">
		          <i class="fa fa-twitter" aria-hidden="true" ></i> 
		        </a>
		      </div>
		      <div class="youtube">
		        <a href="#">
		          <i class="fa fa-youtube-play" aria-hidden="true" ></i> 
		        </a>
		      </div>
		    </div>
		    <div class="card-footer">
		      <p>
		        <i class="fa fa-play-circle" aria-hidden="true" ></i>
		        ${item.course} courses
		      </p>
		      <p>
		        <i class="fa fa-users" aria-hidden="true" ></i>
		        ${item.student} student
		      </p>
		    </div>
		  </div>
		</div>`;
});
$("#ins-content").html(contentIns);
