package ControllerAdmin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutAdmin")
public class LogoutAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath() + "/admin-login");
	}
}
