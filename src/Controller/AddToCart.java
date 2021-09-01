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
import Bean.Order;
import Model.KhoaHocDb;

@WebServlet(urlPatterns = {"/addToCart"})
public class AddToCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhoaHocDb khoaHocDb = new KhoaHocDb();
		String url = request.getHeader("referer");
		
		int id;
			
		if (request.getParameter("maKhoaHoc") != null) {
			id = Integer.parseInt(request.getParameter("maKhoaHoc"));
			KhoaHoc khoaHoc = new KhoaHoc();
			try {
				khoaHoc = khoaHocDb.getCourseById(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			HttpSession session = request.getSession();
			if (session.getAttribute("order") == null) {
				Order order = new Order();
				List<Item> listItems = new ArrayList<Item>();
				Item item = new Item();
				item.setKhoaHoc(khoaHoc);
				item.setDonGia(Math.round(khoaHoc.getThanhTien()*(1 - (float)khoaHoc.getGiamGia()/100)));
				listItems.add(item);
				order.setItems(listItems);
				session.setAttribute("order", order);
			} else {
				Order order = (Order) session.getAttribute("order");
				List<Item> listItems = order.getItems();
				boolean check = false;
				for (Item item : listItems) {
					if (item.getKhoaHoc().getMaKhoaHoc() == khoaHoc.getMaKhoaHoc()) {
						check = true;
						item.setStatus(1);
					}
				}
				if (check == false) {
					Item item = new Item();
					item.setKhoaHoc(khoaHoc);
					item.setDonGia(Math.round(khoaHoc.getThanhTien()*(1 - (float)khoaHoc.getGiamGia()/100)));
					listItems.add(item);
				}
				session.setAttribute("order", order);
			}
			response.sendRedirect(url);
		}
	}
}
