package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Bean.KhoaHoc;
import Bean.giaoVien;
import Model.GiaoVienDb;
import Model.KhoaHocDb;

@WebServlet("/admin/teacher/edit")
public class EditTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int maGiaoVien = Integer.parseInt(request.getParameter("maGiaoVien"));
		String tenGiaoVien = request.getParameter("tenGiaoVien");
		String hinhAnh = request.getParameter("file");
		String moTa = request.getParameter("moTa");
		int luotXem = Integer.parseInt(request.getParameter("luotXem"));
		float xepHang = Float.parseFloat(request.getParameter("xepHang"));
		String testHinh = request.getParameter("testHinh");
		if(hinhAnh == "")
		{
			hinhAnh=testHinh;
		}

	
		GiaoVienDb gv = new GiaoVienDb();
		giaoVien g = new giaoVien(maGiaoVien,tenGiaoVien,moTa, hinhAnh, 0, 0,luotXem, xepHang);
		

		try {
			gv.editGiaoVien(g);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/admin/teacher");
	}

}

