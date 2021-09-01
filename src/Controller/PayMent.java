package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;

@WebServlet("/Payment")
public class PayMent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NguoiDung nd = new NguoiDung();
		NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
		List<Item> items = new ArrayList<Item>();
		HttpSession session = request.getSession();

		String username = session.getAttribute("username") != null ? session.getAttribute("username").toString() : null;
		String password = session.getAttribute("password") != null ? session.getAttribute("password").toString() : null;
		Order order = (Order) session.getAttribute("order");
		try {
			nd = NguoiDungDb.getUser(username, password, 1);
			if(order != null && order.getItems().size() > 0) {
				for (Item kh : order.getItems()) {
					boolean check = false;
					for (KhoaHoc khoaHoc : ndkh.getListCourseOfUser(nd.getMaNguoiDung())) {
						if (kh.getKhoaHoc().getMaKhoaHoc() == khoaHoc.getMaKhoaHoc()) {
							check = true;
							break;
						} else {
							check = false;
						}
					}
					if (check == false) {
						ndkh.addNguoiDungKhoaHoc(kh.getKhoaHoc(), nd);	
					}
				}
				order.setItems(items);
			}
			response.sendRedirect(request.getContextPath() + "/TrangChu");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
