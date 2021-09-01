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
import Model.NguoiDungKhoaHocDb;

@WebServlet("/HoSo")
public class HoSo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		handle(request, response);
		request.setAttribute("statusLoading", true);
		request.getRequestDispatcher("/view/pages_home/HoSo.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		handle(request, response);
		request.setAttribute("statusLoading", false);
		request.getRequestDispatcher("/view/pages_home/HoSo.jsp").forward(request, response);
	}
	private void handle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NguoiDung nd = new NguoiDung();
		NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
		String username = (String)request.getSession().getAttribute("username");
		String password = (String)request.getSession().getAttribute("password");
		try {
			nd = NguoiDungDb.getUser(username, password,1);
			request.setAttribute("info", nd);
			request.setAttribute("listCourseOfUser", ndkh.getListCourseOfUser(nd.getMaNguoiDung()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
