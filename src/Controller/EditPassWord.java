package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.NguoiDungDb;


@WebServlet("/EditPassWord")
public class EditPassWord extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)request.getSession().getAttribute("username");
		String password = (String)request.getSession().getAttribute("password");
		String matKhauHienTai = request.getParameter("matKhauHienTai");
		String matKhauMoi = request.getParameter("matKhauMoi");
		String matKhauXacNhan = request.getParameter("matKhauXacNhan");
		
		if (!matKhauHienTai.equals(password)) {
			request.setAttribute("aleartPw", "Your current password is incorrect!");
		} else if (!matKhauMoi.equals(matKhauXacNhan)) {
			request.setAttribute("aleartPw", "Your confirm password is incorrect");
		} else {
			request.getSession().setAttribute("password", matKhauMoi);
			request.setAttribute("aleartSuccess", "Success! Your Password has been changed!");
			try {
				NguoiDungDb.updatePassword(username, matKhauMoi);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("tabActive", 1);
		request.getRequestDispatcher("/HoSo").forward(request, response);
	}

}
