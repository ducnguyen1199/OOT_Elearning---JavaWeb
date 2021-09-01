package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.NguoiDungJoinKhoaHoc;
import Model.NguoiDungJoinKhoaHocDb;

@WebServlet("/admin/user-course/search")
public class SearchUserCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<NguoiDungJoinKhoaHoc> listUserCourse = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hoTen = request.getParameter("name");
		
		if(hoTen != "") {
			NguoiDungJoinKhoaHocDb db = new NguoiDungJoinKhoaHocDb();
			try {
				listUserCourse = db.getListCourseBySearch(hoTen);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(listUserCourse.size() > 0) {
				request.setAttribute("listUserCourse", listUserCourse);
			}else {
				String sql = "Student course not found";
				request.setAttribute("alertMsg", sql);
			}

			
			request.getRequestDispatcher("/view/pages_admin/manager-user-course.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/user-course");
		}
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
