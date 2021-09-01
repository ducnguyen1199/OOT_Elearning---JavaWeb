package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.NguoiDung;
import Model.NguoiDungDb;


@WebServlet("/EditInfoUser")
public class EditInfoUser extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)request.getSession().getAttribute("username");
		NguoiDung nd = new NguoiDung();
		nd.setHoTen(request.getParameter("hoTen"));
		nd.setSoDienThoai(request.getParameter("soDienThoai"));
		
		try {
			nd.setTaiKhoan(username);
			NguoiDungDb.updateInfo(nd);
			request.setAttribute("aleartSuccess", "Success! Your Account info has been changed!");
			request.setAttribute("tabActive", 2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/HoSo").forward(request, response);
	}

}
