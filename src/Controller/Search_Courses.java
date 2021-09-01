package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.KhoaHoc;
import Model.KhoaHocDb;


@WebServlet("/Courses/Search")
public class Search_Courses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Search_Courses() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		try {
			ArrayList<KhoaHoc> listCourseBykw = KhoaHocDb.getListCourseByKeyword(keyword);
			
			request.getSession().setAttribute("keyword", keyword);
			request.getSession().setAttribute("listCourseBykw", listCourseBykw);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("/Elearning_FE/Courses");
	}

}
