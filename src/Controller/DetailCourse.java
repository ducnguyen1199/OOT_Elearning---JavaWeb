package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Item;
import Bean.KhoaHoc;
import Bean.NguoiDung;
import Bean.Order;
import Bean.giaoVien;
import Model.GiaoVienDb;
import Model.KhoaHocDb;
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;

@WebServlet("/detail-course")
public class DetailCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	KhoaHoc kh = new KhoaHoc();
	giaoVien gv = new giaoVien();
	NguoiDung nd = new NguoiDung();
	NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		List<KhoaHoc> listCourseOfUser = new ArrayList<KhoaHoc>();
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		Order order = (Order) session.getAttribute("order");
		int maKhoaHoc;
		int status = 0;

		if (id != null) {
			try {
				maKhoaHoc = Integer.parseInt(id);
			} catch (NumberFormatException e) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid iD!");
				return;
			}

			KhoaHocDb dbkh = new KhoaHocDb();
			try {
				kh = dbkh.getCourseById(maKhoaHoc);
				nd = NguoiDungDb.getUser(username, password,1);
				listCourseOfUser = ndkh.getListCourseOfUser(nd.getMaNguoiDung());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if (kh != null) {
				GiaoVienDb dbgv = new GiaoVienDb();
				try {
					gv = dbgv.getTeacherById(kh.getMaGiaoVien());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(listCourseOfUser.size()>0) {
				for(KhoaHoc kh : listCourseOfUser) {
					if(maKhoaHoc == kh.getMaKhoaHoc()) {
						status = 2;
						break;
					}
				}
			}
			if(order != null && order.getItems().size()>0) {
				for(Item item : order.getItems()) {
					if(maKhoaHoc == item.getKhoaHoc().getMaKhoaHoc()) {
						if(status <2) {
							status = 1;
							break;
						}
					}
				}
			}

			request.setAttribute("tenGiaoVien", gv.getTenGiaoVien());
			request.setAttribute("course", kh);
			request.setAttribute("status", status);
			request.setAttribute("username", username);

			request.getRequestDispatcher("/view/pages_home/ChiTietKhoaHoc.jsp").forward(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid iD!");
			return;
		}

	}
}
