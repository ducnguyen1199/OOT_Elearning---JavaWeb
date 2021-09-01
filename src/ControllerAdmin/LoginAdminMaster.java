package ControllerAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin-login")
public class LoginAdminMaster extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		if (session != null && session.getAttribute("UserAdmin") != null) {
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		}else {
			request.getRequestDispatcher("/view/pages_admin/Admin.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/pages_admin/Admin.jsp").forward(request, response);
	}

}
