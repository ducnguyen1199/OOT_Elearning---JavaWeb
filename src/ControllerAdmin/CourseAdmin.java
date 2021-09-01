package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DanhMuc;
import Bean.KhoaHoc;
import Bean.giaoVien;
import Model.DanhMucDb;
import Model.GiaoVienDb;
import Model.KhoaHocDb;

@WebServlet("/admin/course")
public class CourseAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<KhoaHoc> listCourse = new ArrayList<>();
	ArrayList<DanhMuc> listDanhMuc = new ArrayList<>();
	ArrayList<giaoVien> listGiaoVien = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("page");
		String tenKhoaHoc = request.getParameter("name");
		int[] numberPage = new int[0];
		int page = 1, start = 0, total = 15;
		int count = 0;

		KhoaHocDb kh = new KhoaHocDb();
		DanhMucDb dm = new DanhMucDb();
		GiaoVienDb gv = new GiaoVienDb();

		try {
			count = kh.getCountCourse();
			listDanhMuc = dm.getListCate();
			listGiaoVien = gv.getListTeacher();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (tenKhoaHoc != null && tenKhoaHoc != "") {
			try {
				listCourse = kh.getListCourseBySearch(tenKhoaHoc);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			int index = (int) Math.ceil((float) listCourse.size() / total);
			numberPage = new int[index];
			for (int i = 0; i < numberPage.length; i++) {
				numberPage[i] = i + 1;
			}

		} else {
			if (tenKhoaHoc == "") {
				response.sendRedirect(request.getContextPath() + "/admin/course");
				return;
			}

			if (id != null) {
				try {
					page = Integer.parseInt(id);
				} catch (NumberFormatException e) {
					response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid iD!");
					return;
				}
			}

			start = total * (page - 1);

			try {
				listCourse = kh.getListCourseByLimit(start, total);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			int index = (int) Math.ceil((float) count / total);
			numberPage = new int[index];
			for (int i = 0; i < numberPage.length; i++) {
				numberPage[i] = i + 1;
			}
		}

		request.setAttribute("page", page);
		request.setAttribute("numberPage", numberPage);
		request.setAttribute("count", numberPage.length);
		request.setAttribute("search", tenKhoaHoc);

		if (listCourse.size() > 0) {
			request.setAttribute("listCourse", listCourse);
			request.setAttribute("listDanhMuc", listDanhMuc);
			request.setAttribute("listGiaoVien", listGiaoVien);
		} else {
			String sql = "Course not found";
			request.setAttribute("alertMsg", sql);
		}

		request.getRequestDispatcher("/view/pages_admin/manager-course.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
