package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.NguoiDung;
import Model.NguoiDungDb;

@WebServlet("/admin/user/search")
public class SearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<NguoiDung> listUser = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hoTen = request.getParameter("name");

		if (hoTen != "") {
			NguoiDungDb db = new NguoiDungDb();
			try {
				listUser = db.getlistUserBySearch(hoTen);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (listUser.size() > 0) {
				request.setAttribute("listUser", listUser);
			} else {
				String sql = "User not found";
				request.setAttribute("alertMsg", sql);
			}
			request.setAttribute("search", hoTen);
			request.getRequestDispatcher("/view/pages_admin/manager-user.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/user");
		}
	}
}
