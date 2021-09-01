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
import Bean.NguoiDungKhoaHoc;
import Model.GiaoVienDb;
import Model.KhoaHocDb;
import Model.NguoiDungKhoaHocDb;

@WebServlet("/admin/course/delete")
public class DeleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  ArrayList<NguoiDungKhoaHoc> listUser = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		
		NguoiDungKhoaHocDb ng = new NguoiDungKhoaHocDb();
		KhoaHocDb kh = new KhoaHocDb();
		try {
			listUser=ng.getListCourseOfUser();
			kh.deleteKhoaHoc(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int flg = 0;

		for (int i = 0; i < listUser.size(); i++) {
			if (listUser.get(i).getMaKhoaHoc()==id) {
				flg = 1;
				break;
			}
		}
	
		if (flg == 1) {
			String sql = "The course someone is currently learning cannot be deleted";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/course").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/course");
		}

	}

}
