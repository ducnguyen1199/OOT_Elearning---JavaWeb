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


@WebServlet("/admin/teacher")
public class TeacherAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    ArrayList<giaoVien> listGiaoVien = new ArrayList<>();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GiaoVienDb gv = new GiaoVienDb();
		try {
			listGiaoVien = gv.getListTeacher();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("listGiaoVien", listGiaoVien);
		request.getRequestDispatcher("/view/pages_admin/manager-teacher.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
