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
import Model.KhoaHocDb;

@WebServlet("/admin/course/edit")
public class EditCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int maKhoaHoc = Integer.parseInt(request.getParameter("maKhoaHoc"));
		String maDanhMuc = request.getParameter("maDanhMuc");
		String hinhAnh = request.getParameter("file");

		String moTa = request.getParameter("moTa");
		int thanhTien = Integer.parseInt(request.getParameter("donGia"));
		int giamGia = Integer.parseInt(request.getParameter("giamGia"));
		String testHinh = request.getParameter("testHinh");
		System.out.println(hinhAnh+"dellok"+ testHinh);
		if(hinhAnh == "")
		{
			hinhAnh=testHinh;
		}

		KhoaHocDb kh = new KhoaHocDb();
		KhoaHoc k = new KhoaHoc(maKhoaHoc, "", maDanhMuc, hinhAnh, 0, moTa, 0, 0, thanhTien, giamGia);

		try {
			kh.editKhoaHoc(k);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/admin/course");
	}

}
