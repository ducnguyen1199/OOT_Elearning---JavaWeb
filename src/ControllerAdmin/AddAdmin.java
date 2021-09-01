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

@WebServlet("/admin/view-admin/add")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean checkUser = false;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String number = request.getParameter("number");
		String email = request.getParameter("email");
		NguoiDungDb db = new NguoiDungDb();
		NguoiDung n = new NguoiDung(0, username, password, fullname, email, number, 2);

		try {
			checkUser = db.checkUserByUsername(username);
			db.addNguoiDung(n);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int flg = 0;
		System.out.println(checkUser);
		
		if(checkUser) {
			flg = 1;
		}

		if (flg == 1) {
			String sql = "Account cannot use !!";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/view-admin").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/view-admin");
		}

	}

}
