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
import Model.KhoaHocDb;
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;


@WebServlet("/GioHang")
public class GioHang extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhoaHocDb courseDb = new KhoaHocDb();
		NguoiDung nd = new NguoiDung();
		NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
		List<KhoaHoc> listCourse = new ArrayList<KhoaHoc>();
		List<KhoaHoc> listCourseOfUser = new ArrayList<KhoaHoc>();
		
		List<Item> newListCourse = new ArrayList<Item>();
		HttpSession session = request.getSession();
		
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		Order order = (Order) session.getAttribute("order");
		
		try {
			nd = NguoiDungDb.getUser(username, password,1);
			listCourse = courseDb.getListCourse();
			listCourseOfUser = ndkh.getListCourseOfUser(nd.getMaNguoiDung());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(listCourse.size() > 0) {
			for(KhoaHoc kh : listCourse) {
				Item item = new Item();
				item.setKhoaHoc(kh);
				item.setStatus(0);
				newListCourse.add(item);
			}
		}
		if(listCourseOfUser.size()>0) {
			for(KhoaHoc kh : listCourseOfUser) {
				for(Item item : newListCourse) {
					if(kh.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
						item.setStatus(2);
					}
				}
			}
		}
		if(order != null && order.getItems().size() > 0) {
			for(Item item : order.getItems()) {
				item.setStatus(1);
				for(Item item1 : newListCourse) {
					if(item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
						if(item1.getStatus() < 2) {
							item1.setStatus(item.getStatus());
						}
					}
				}
			}
		}
		
		request.setAttribute("order", order);
		request.setAttribute("courseDb", newListCourse);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages_home/GioHang.jsp");
		dispatcher.forward(request, response);
	}
}
