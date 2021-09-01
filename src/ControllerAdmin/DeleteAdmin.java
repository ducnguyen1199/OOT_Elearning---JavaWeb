package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.NguoiDungDb;


@WebServlet("/admin/view-admin/delete")
public class DeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int role = Integer.parseInt(request.getParameter("role"));
		NguoiDungDb db = new NguoiDungDb();
		
		try {
			db.deleteUser(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(role==3) {
			String sql = " You cannot delete !!";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/view-admin").forward(request, response);
		}
		else
		{
		response.sendRedirect(request.getContextPath() + "/admin/view-admin");
		}

	}

}
