package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Bean.giaoVien;

import Model.GiaoVienDb;


@WebServlet("/admin/teacher/search")
public class SearchTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

    ArrayList<giaoVien> listGiaoVien = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenGiaoVien = request.getParameter("name");
		
		if(tenGiaoVien != "") {

			GiaoVienDb gv = new GiaoVienDb();
			try {
				listGiaoVien = gv.getListTeacherBySearch(tenGiaoVien);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(listGiaoVien.size() > 0) {
				request.setAttribute("listGiaoVien", listGiaoVien);
			}else {
				String sql = "No teachers found";
				request.setAttribute("alertMsg", sql);
			}
			request.setAttribute("search", tenGiaoVien);
			
			request.getRequestDispatcher("/view/pages_admin/manager-teacher.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/course");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}