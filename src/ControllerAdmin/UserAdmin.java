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

@WebServlet("/admin/user")
public class UserAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NguoiDung> listUser = new ArrayList<>();
		
		NguoiDungDb db = new NguoiDungDb();
		try {
			listUser = db.getListUser();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("listUser", listUser);
		
		request.getRequestDispatcher("/view/pages_admin/manager-user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
