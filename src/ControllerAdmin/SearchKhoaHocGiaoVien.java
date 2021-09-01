package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.GiaoVienKhoaHoc;
import Model.GiaoVienKhoaHocDb;



@WebServlet("/admin/teacherkhoahoc/search")
public class SearchKhoaHocGiaoVien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    ArrayList<GiaoVienKhoaHoc> listGiaoVienKhoaHoc = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenGiaoVien = request.getParameter("name");
		
		if(tenGiaoVien != "") {

			GiaoVienKhoaHocDb gv = new GiaoVienKhoaHocDb();
			try {
				listGiaoVienKhoaHoc = gv.getListTeacherBySearch(tenGiaoVien);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(listGiaoVienKhoaHoc.size() > 0) {
				request.setAttribute("listGiaoVienKhoaHoc", listGiaoVienKhoaHoc);
			}else {
				String sql = "No courses found";
				request.setAttribute("alertMsg", sql);
			}
			request.setAttribute("search", tenGiaoVien);
			
			request.getRequestDispatcher("/view/pages_admin/manager-teacher-course.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/chi-tiet-giao-vien");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}