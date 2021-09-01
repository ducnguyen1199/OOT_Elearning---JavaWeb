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

import Bean.NguoiDung;

import Model.NguoiDungDb;

@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NguoiDung User = new NguoiDung();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String taiKhoan = request.getParameter("username");
		String matKhau = request.getParameter("password");
		NguoiDungDb nd = new NguoiDungDb();

		try {
			User = nd.getUserAdmin(taiKhoan, matKhau);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (User.getTaiKhoan() != null && User.getRoleId() != 1) {
			HttpSession HttpSession = request.getSession();
			HttpSession.setAttribute("UserAdmin", User);

			response.sendRedirect(request.getContextPath() + "/admin/dashboard");



		} else {
			String sql = "Incorrect username or password.";
			request.setAttribute("alertMsg", sql);
			request.getRequestDispatcher("/admin-login").forward(request, response);
		}

	}

}
