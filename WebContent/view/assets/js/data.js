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
    name: "Duc Dep Zai",
    skill: "Software Development Trainer",
    img: "../img/01.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Duc Dep Zai",
    skill: "Software Development Trainer",
    img: "./img/02.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Duc Dep Zai",
    skill: "Software Development Trainer",
    img: "./img/03.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Duc Dep Zai",
    skill: "Software Development Trainer",
    img: "./img/04.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Duc Dep Zai",
    skill: "Software Development Trainer",
    img: "./img/05.jpg",
    view: 7812,
    course: 10,
    student: 300,
  },
  {
    name: "Duc Dep Zai",
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
		  <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/s960x960/87103121_1559977804161354_4264339630809153536_o.jpg?_nc_cat=101&_nc_sid=85a577&_nc_ohc=gGEHdfvVJ4UAX-05A3N&_nc_ht=scontent.fdad2-1.fna&_nc_tp=7&oh=6769459ac1e2bc9ed4b0d90b194eef17&oe=5ED777C5" alt="" />
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
