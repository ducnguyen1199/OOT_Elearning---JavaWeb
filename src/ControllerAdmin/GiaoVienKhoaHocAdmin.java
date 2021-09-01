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




@WebServlet("/admin/chi-tiet-giao-vien")
public class GiaoVienKhoaHocAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   ArrayList<GiaoVienKhoaHoc> listGiaoVienKhoaHoc = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("page");
		String tenGiaoVien = request.getParameter("name");
		int[] numberPage = new int[0];
		int page = 1, start = 0, total = 15;
		int count = 0;
		
		GiaoVienKhoaHocDb gv = new GiaoVienKhoaHocDb();
		
		try {
			count = gv.getCountTeacher();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		if (tenGiaoVien != null && tenGiaoVien != "") {
			try {
				listGiaoVienKhoaHoc = gv.getListTeacherBySearch(tenGiaoVien);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int index = (int) Math.ceil((float) listGiaoVienKhoaHoc.size() / total);
			numberPage = new int[index];
			for (int i = 0; i < numberPage.length; i++) {
				numberPage[i] = i + 1;
			}
			
		} else {
			if(tenGiaoVien == "") {
				response.sendRedirect(request.getContextPath() + "/admin/chi-tiet-giao-vien");
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
			
			start = total*(page - 1);

			try {
				listGiaoVienKhoaHoc = gv.getListTeacherByLimit(start, total);
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
		request.setAttribute("search", tenGiaoVien);
		
		if(listGiaoVienKhoaHoc.size() > 0) {
			request.setAttribute("listGiaoVienKhoaHoc", listGiaoVienKhoaHoc);
		}else {
			String sql = "No teachers found";
			request.setAttribute("alertMsg", sql);
		}
			
		request.getRequestDispatcher("/view/pages_admin/manager-teacher-course.jsp").forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
