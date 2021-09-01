package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.KhoaHoc;
import Bean.NguoiDungKhoaHoc;
import Model.GiaoVienDb;
import Model.KhoaHocDb;
import Model.NguoiDungKhoaHocDb;



@WebServlet("/admin/teacher/delete")
public class DeleteTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<KhoaHoc> listKhoaHoc = new ArrayList<>();
  



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		
		KhoaHocDb ng = new KhoaHocDb ();
		GiaoVienDb gv = new GiaoVienDb();
		try {
			listKhoaHoc=ng.getListCourse();
			gv.deleteGiaoVien(id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		int flg = 0;

		for (int i = 0; i < listKhoaHoc.size(); i++) {
			if (listKhoaHoc.get(i).getMaGiaoVien()==id) {
				flg = 1;
				System.out.println(flg+"alo 1234");
				break;
			}
		}
	
		if (flg == 1) {
			String sql = " You cannot delete !!";
			request.setAttribute("alertMsg_1", sql);
			request.getRequestDispatcher("/admin/teacher").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/teacher");
		}
		

	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
