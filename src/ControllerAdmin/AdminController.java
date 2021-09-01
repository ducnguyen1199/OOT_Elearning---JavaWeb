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

@WebServlet("/admin/view-admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<NguoiDung> listAdmin = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hoTen = request.getParameter("name");
		NguoiDungDb db = new NguoiDungDb();
	
		if (hoTen == null) {
			try {
				listAdmin = db.getListUserAdmin();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				listAdmin = db.getlistAdminBySearch(hoTen);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (listAdmin.size() > 0) {
			request.setAttribute("listUser", listAdmin);
		} else {
			String sql = "Admin not found";
			request.setAttribute("alertMsg", sql);
		}

		request.setAttribute("listAdmin", listAdmin);
		request.setAttribute("search", hoTen);
		
		//Check role
		NguoiDung userAdmin = new NguoiDung();
		HttpSession HttpSession = request.getSession();
		userAdmin = (NguoiDung) HttpSession.getAttribute("UserAdmin");
		
		if(userAdmin != null && userAdmin.getRoleId() == 3) {
			request.getRequestDispatcher("/view/pages_admin/manager-admin.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/view/page_not_found/PageNotFound.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
