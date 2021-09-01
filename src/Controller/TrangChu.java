package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.DanhMuc;
import Bean.Item;
import Bean.KhoaHoc;
import Bean.NguoiDung;
import Bean.Order;
import Bean.giaoVien;
import Model.DanhMucDb;
import Model.GiaoVienDb;
import Model.KhoaHocDb;
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;

public class TrangChu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getRequestURI().equals("/Elearning_FE/")) {
			response.sendRedirect("TrangChu");
		} else {
			HttpSession session = request.getSession();

			String username = (String) session.getAttribute("username");
			String password = (String) session.getAttribute("password");
			Order order = (Order) session.getAttribute("order");

			try {
				ArrayList<DanhMuc> listCate = DanhMucDb.getListCate();
				KhoaHocDb courseDb = new KhoaHocDb();
				GiaoVienDb teacherDb = new GiaoVienDb();
				
				NguoiDung nd = new NguoiDung();
				NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
				List<KhoaHoc> listCourse = new ArrayList<KhoaHoc>();
				List<KhoaHoc> listCourseTopView = new ArrayList<KhoaHoc>();
				List<KhoaHoc> listCourseOfUser = new ArrayList<KhoaHoc>();
				List<KhoaHoc> listCourseForUser = new ArrayList<KhoaHoc>();
				List<giaoVien> listTeacher = new ArrayList<giaoVien>();
				List<giaoVien> listTopTeacher = new ArrayList<giaoVien>();
				List<Item> newListCourse = new ArrayList<Item>();
				List<Item> newListCourseTopView = new ArrayList<Item>();
				List<Item> newListCourseForYou = new ArrayList<Item>();

				nd = NguoiDungDb.getUser(username, password, 1);
				listCourse = courseDb.getListCourse();
				listCourseTopView = courseDb.getListCourseTopView();
				listCourseOfUser = ndkh.getListCourseOfUser(nd.getMaNguoiDung());
				listTeacher = teacherDb.getListTeacher();
				listTopTeacher = teacherDb.getTopTeacher();
				if (listCourse.size() > 0) {
					for (KhoaHoc kh : listCourse) {
						Item item = new Item();
						item.setKhoaHoc(kh);
						item.setStatus(0);
						newListCourse.add(item);
					}
				}
				if (listCourseTopView.size() > 0) {
					for (KhoaHoc kh : listCourseTopView) {
						Item item = new Item();
						item.setKhoaHoc(kh);
						item.setStatus(0);
						newListCourseTopView.add(item);
					}
				}
				if(username!= null && username != "") {
					listCourseForUser = courseDb.getListCoursesForUser(username);
					if (listCourseForUser.size() > 0) {
						for (KhoaHoc kh : listCourseForUser) {
							Item item = new Item();
							item.setKhoaHoc(kh);
							item.setStatus(0);
							newListCourseForYou.add(item);
						}
					}
				}
				
				if (listCourseOfUser.size() > 0) {
					for (KhoaHoc kh : listCourseOfUser) {
						for (Item item : newListCourse) {
							if (kh.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
								item.setStatus(2);
							}
						}
						for (Item item : newListCourseTopView) {
							if (kh.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
								item.setStatus(2);
							}
						}
						for (Item item : newListCourseForYou) {
							if (kh.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
								item.setStatus(2);
							}
						}
					}
				}
				if (order != null && order.getItems().size() > 0) {
					for (Item item : order.getItems()) {
						item.setStatus(1);
						for (Item item1 : newListCourse) {
							if (item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
								if (item1.getStatus() < 2) {
									item1.setStatus(item.getStatus());
								}
							}
						}
						for (Item item1 : newListCourseTopView) {
							if (item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
								if (item1.getStatus() < 2) {
									item1.setStatus(item.getStatus());
								}
							}
						}
						for (Item item1 : newListCourseForYou) {
							if (item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
								if (item1.getStatus() < 2) {
									item1.setStatus(item.getStatus());
								}
							}
						}
					}
				}
				
				
				
				
				session.setAttribute("listCate", listCate);
				session.setAttribute("listTeacher", listTeacher);
				session.setAttribute("listTopTeacher", listTopTeacher);
				session.setAttribute("newListCourse", newListCourse);
				session.setAttribute("newListCourseTopView", newListCourseTopView);
				request.setAttribute("keyword", "");
				request.setAttribute("order", order);
				session.setAttribute("listCourseForUser", listCourseForUser);
				session.setAttribute("newListCourseForYou", newListCourseForYou);

			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("statusLoading", true);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages_home/TrangChu.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
			

		try {
			ArrayList<KhoaHoc> listCourseBykw = KhoaHocDb.getListCourseByKeyword(keyword);

			request.setAttribute("keyword", keyword);
			request.setAttribute("listCourseBykw", listCourseBykw);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("statusLoading", false);
		request.getRequestDispatcher("/view/pages_home/TrangChu.jsp").forward(request, response);
	}
	
}
