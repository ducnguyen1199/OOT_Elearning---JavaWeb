package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import Bean.giaoVien;
import Model.GiaoVienDb;



@WebServlet("/admin/teacher/add")
public class AddNewTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenGiaoVien = request.getParameter("tenGiaoVien");
		String moTa = request.getParameter("moTa");
		String hinhAnh = request.getParameter("file");
		int luotXem = Integer.parseInt(request.getParameter("luotXem"));
		float xepHang = Float.parseFloat(request.getParameter("xepHang"));
		
		GiaoVienDb gv = new GiaoVienDb();
		giaoVien g = new giaoVien(0,tenGiaoVien,moTa, hinhAnh, 0, 0,luotXem, xepHang);
		
		try {
			gv.addTeacher(g);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		response.sendRedirect(request.getContextPath() + "/admin/teacher");
		
	}

}
