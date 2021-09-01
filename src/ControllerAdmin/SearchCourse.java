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

@WebServlet("/admin/course/search")
public class SearchCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<KhoaHoc> listCourse = new ArrayList<>();
    ArrayList<DanhMuc> listDanhMuc = new ArrayList<>();
    ArrayList<giaoVien> listGiaoVien = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenKhoaHoc = request.getParameter("name");
		
		if(tenKhoaHoc != "") {
			KhoaHocDb kh = new KhoaHocDb();
			DanhMucDb dm = new DanhMucDb();
			GiaoVienDb gv = new GiaoVienDb();
			try {
				listCourse = kh.getListCourseBySearch(tenKhoaHoc);
				listDanhMuc = dm.getListCate();
				listGiaoVien = gv.getListTeacher();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(listCourse.size() > 0) {
				request.setAttribute("listCourse", listCourse);
				request.setAttribute("listDanhMuc", listDanhMuc);
				request.setAttribute("listGiaoVien", listGiaoVien);
			}else {
				String sql = "Khong tim thay khoa hoc";
				request.setAttribute("alertMsg", sql);
			}

			
			request.getRequestDispatcher("/view/pages_admin/manager-course.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/course");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
