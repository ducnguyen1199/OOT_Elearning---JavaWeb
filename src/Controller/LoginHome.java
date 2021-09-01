package Controller;

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


@WebServlet("/Loginhome")
public class LoginHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NguoiDung User = new NguoiDung();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		String taiKhoan = request.getParameter("Username");
		String matKhau = request.getParameter("Password");
		int role = 1;
		NguoiDungDb nd = new NguoiDungDb ();
		
		try {
			User = nd.getUser(taiKhoan,matKhau,role);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (User.getTaiKhoan()!=null) {
			HttpSession HttpSession=request.getSession();
			HttpSession.setAttribute("email", User.getEmail());
			HttpSession.setAttribute("username", taiKhoan);
			HttpSession.setAttribute("password", matKhau);
			response.sendRedirect("TrangChu");
		} else {
			request.setAttribute("aleartErr","Your account is incorrect");
			request.getRequestDispatcher("/home-login").forward(request, response);
		}
	}
	

}
