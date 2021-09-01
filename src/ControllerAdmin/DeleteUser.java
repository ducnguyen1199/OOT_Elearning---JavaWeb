package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.NguoiDungKhoaHoc;
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;


@WebServlet("/admin/user/delete")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ArrayList<NguoiDungKhoaHoc> listUser = new ArrayList<>();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		NguoiDungKhoaHocDb ng = new NguoiDungKhoaHocDb();
		NguoiDungDb db = new NguoiDungDb();
		try {
			listUser=ng.getListCourseOfUser();
			db.deleteUser(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int flg = 0;

		for (int i = 0; i < listUser.size(); i++) {
			if (listUser.get(i).getMaNguoiDung()==id) {
				flg = 1;
				break;
			}
		}
	
		if (flg == 1) {
			String sql = "The current user cannot be deleted";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/user").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/user");
		}

	}

}
