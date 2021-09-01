package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Item;
import Bean.Order;

@WebServlet("/deleteItem")
public class DeleteItem extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maKhoaHoc =Integer.parseInt( request.getParameter("maKhoaHoc"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		List<Item> items = order.getItems();
		
		if(order.getItems().size() > 0) {
			for(Item item : items) {
				if(maKhoaHoc == item.getKhoaHoc().getMaKhoaHoc()) {
					items.remove(items.indexOf(item));
					break;
				}
			}
		}
		
		request.setAttribute("order", order);
				
		response.sendRedirect(request.getContextPath() + "/GioHang");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
