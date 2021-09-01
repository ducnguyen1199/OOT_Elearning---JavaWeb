package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.NguoiDungJoinKhoaHocDb;


@WebServlet("/admin/user-course/delete")
public class DeleteUserCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maKhoaHoc = Integer.parseInt(request.getParameter("id1"));
		int maNguoiDung = Integer.parseInt(request.getParameter("id2"));

		NguoiDungJoinKhoaHocDb db = new NguoiDungJoinKhoaHocDb();
		try {
			db.deleteUserCourse(maKhoaHoc, maNguoiDung);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/admin/user-course");
	}


}
