package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import Bean.KhoaHoc;
import Bean.NguoiDung;
import Model.KhoaHocDb;

@WebServlet("/admin/course/add")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<KhoaHoc> listCourse = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenKhoaHoc = request.getParameter("tenKhoaHoc");
		String maDanhMuc = request.getParameter("maDanhMuc");
		int maGiaoVien = Integer.parseInt(request.getParameter("maGiaoVien"));
		String hinhAnh = request.getParameter("file");
		String moTa = request.getParameter("moTa");
		float xepHang = Float.parseFloat(request.getParameter("xepHang"));
		int thanhTien = Integer.parseInt(request.getParameter("donGia"));
		int giamGia = Integer.parseInt(request.getParameter("giamGia"));
		
		KhoaHocDb listkh = new KhoaHocDb();
		KhoaHocDb kh = new KhoaHocDb();
		KhoaHoc k = new KhoaHoc(0,tenKhoaHoc,maDanhMuc, hinhAnh, 0, moTa,maGiaoVien, xepHang, thanhTien, giamGia);
		
		try {
			listCourse=listkh.getListCourse();
			kh.addKhoaHoc(k);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int flg = 0;

		for (int i = 0; i < listCourse.size(); i++) {
			
			if (listCourse.get(i).getTenKhoaHoc().equals(tenKhoaHoc)) {
				flg = 1;
				break;
			}
		}
	
		if (flg == 1) {
			String sql = "Your course name cannot be used !!";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/course").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/course");
		}
		
	}

}

