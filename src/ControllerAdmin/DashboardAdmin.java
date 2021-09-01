package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.KhoaHoc;
import Bean.giaoVien;
import Model.GiaoVienDb;
import Model.KhoaHocDb;


@WebServlet("/admin/dashboard")

public class DashboardAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ArrayList<giaoVien> listTopTeacher = new ArrayList<>();
    ArrayList<KhoaHoc> listTopCourse = new ArrayList<>();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GiaoVienDb gv = new GiaoVienDb();
		KhoaHocDb kh = new KhoaHocDb();
		try {
			listTopCourse =kh.getListCourseTopView();
			listTopTeacher = gv.getTopTeacher();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("listTopTeacher", listTopTeacher);
		request.setAttribute("listTopCourse", listTopCourse);
		request.getRequestDispatcher("/view/pages_admin/Dashboard.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
