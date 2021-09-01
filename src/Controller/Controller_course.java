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

import Bean.DanhMuc;
import Bean.Item;
import Bean.KhoaHoc;
import Bean.NguoiDung;
import Bean.Order;
import Bean.giaoVien;
import Model.DanhMucDb;
import Model.GiaoVienDb;
import Model.KhoaHocDb;
import Model.NguoiDungDb;
import Model.NguoiDungKhoaHocDb;

@WebServlet("/Courses")
public class Controller_course extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<KhoaHoc> listCourse = new ArrayList<>();
	ArrayList<KhoaHoc> listCourseByCate = new ArrayList<>();
	ArrayList<DanhMuc> listCate = new ArrayList<>();
	ArrayList<KhoaHoc> listSortBest = new ArrayList<>();
	ArrayList<KhoaHoc> listSortTrending = new ArrayList<>();
	ArrayList<KhoaHoc> listCourseLimit = new ArrayList<>();
	ArrayList<KhoaHoc> listCourseLimitByCate = new ArrayList<>();
	ArrayList<giaoVien> listTeacher = new ArrayList<>();
	NguoiDung nd = new NguoiDung();
	NguoiDungKhoaHocDb ndkh = new NguoiDungKhoaHocDb();
	List<KhoaHoc> listCourseOfUser = new ArrayList<KhoaHoc>();
	
	int TotalPageByCate;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Item> newListCourse = new ArrayList<Item>();
		List<Item> newListSortBest = new ArrayList<Item>();
		List<Item> newListSortTrending = new ArrayList<Item>();
		KhoaHocDb kh = new KhoaHocDb();
		DanhMucDb dm = new DanhMucDb();
		GiaoVienDb gv = new GiaoVienDb();
		String tenDanhMuc = "All Course";
		String maDanhMuc = request.getParameter("id");
		String moTa = "This course you will learn how make your website and quick advanced style for your skill";
		String soPage = request.getParameter("page");
		int page;
		int start = 0;
		int total;
		String color = "";
		String arrColor[] = { "#e79e9c", "#9b3b5a", "#890ca1", "#0ca129d9", "#7a8230", "#c92592", "#3659a2" };
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		Order order = (Order) session.getAttribute("order");
		
		if (session.getAttribute("keyword") != null && session.getAttribute("listCourseBykw") != null) {
			if (!session.getAttribute("keyword").equals("") && !session.getAttribute("listCourseBykw").equals("")) {
				request.setAttribute("keyword", session.getAttribute("keyword"));
				request.setAttribute("listCourseBykw", session.getAttribute("listCourseBykw"));

				request.getSession().setAttribute("keyword", "");
				request.getSession().setAttribute("listCourseBykw", "");
			}
		}

		try {
			listCate = dm.getListCate();
			listTeacher = gv.getListTeacher();
			nd = NguoiDungDb.getUser(username, password,1);
			listCourseOfUser = ndkh.getListCourseOfUser(nd.getMaNguoiDung());
			for (int i = 0; i < listCate.size(); i++) {
				if (listCate.get(i).getMaDanhMuc().equals(maDanhMuc)) {
					tenDanhMuc = listCate.get(i).getTenDanhMuc();
					moTa = listCate.get(i).getMoTa();
					color = arrColor[i % 7];
				}
			}
			if (soPage == null) {
				soPage = "1";
				page = Integer.parseInt(soPage);
			} else {
				page = Integer.parseInt(soPage);
			}
			total = 8;
			start = page * 8 - 8;
			if (maDanhMuc == null || maDanhMuc.equals("allcourse")) {
				maDanhMuc = "allcourse";
				listCourse = kh.getListCourseByLimit(start, total);
				
				TotalPageByCate = kh.getCountCourse();
			} else {
				listCourse = kh.getListCourseByLimitByCate(maDanhMuc, start, total);
				TotalPageByCate = kh.getCountCourseByCate(maDanhMuc);
			}
			
			if(listCourse.size() > 0) {
				for(KhoaHoc k : listCourse) {
					Item item = new Item();
					item.setKhoaHoc(k);
					item.setStatus(0);
					newListCourse.add(item);
				}
			}
			if(listCourseOfUser.size()>0) {
				for(KhoaHoc k : listCourseOfUser) {
					for(Item item : newListCourse) {
						if(k.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		String Flag = request.getParameter("flag");
		if (Flag != null) {
			String getSelect = Flag;
			try {
				if (soPage == null) {
					soPage = "1";
					page = Integer.parseInt(soPage);
				} else {
					page = Integer.parseInt(soPage);
				}
				total = 8;
				start = page * 8 - 8;
				if (maDanhMuc.length() == 0 || maDanhMuc.equals("allcourse")) {
					listSortBest = kh.getBestCourse(start, total);
					listSortTrending = kh.getTrendingCourse(start, total);
				} else {
					listSortBest = kh.getBestCourse(maDanhMuc, start, total);
					listSortTrending = kh.getTrendingCourse(maDanhMuc, start, total);
				}
				
				if(listSortBest.size() > 0) {
					for(KhoaHoc k : listSortBest) {
						Item item = new Item();
						item.setKhoaHoc(k);
						item.setStatus(0);
						newListSortBest.add(item);
					}
				}
				if(listSortTrending.size() > 0) {
					for(KhoaHoc k : listSortTrending) {
						Item item = new Item();
						item.setKhoaHoc(k);
						item.setStatus(0);
						newListSortTrending.add(item);
					}
				}
				if(listCourseOfUser.size()>0) {
					for(KhoaHoc k : listCourseOfUser) {
						for(Item item : newListSortBest) {
							if(k.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
								item.setStatus(2);
							}
						}
						for(Item item : newListSortTrending) {
							if(k.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
								item.setStatus(2);
							}
						}
					}
				}
				if(order != null && order.getItems().size() > 0) {
					for(Item item : order.getItems()) {
						item.setStatus(1);
						for(Item item1 : newListSortBest) {
							if(item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
								if(item1.getStatus() < 2) {
									item1.setStatus(item.getStatus());
								}
							}
						}
						for(Item item1 : newListSortTrending) {
							if(item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
								if(item1.getStatus() < 2) {
									item1.setStatus(item.getStatus());
								}
							}
						}
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			request.getSession().setAttribute("listSortBest", listSortBest);
			request.getSession().setAttribute("listSortTrending", listSortTrending);
			
			request.setAttribute("newListSortBest", newListSortBest);
			request.setAttribute("newListSortTrending", newListSortTrending);
			request.setAttribute("getSelect", getSelect);
			request.setAttribute("flag", getSelect);
		}

		if (request.getParameter("id") == null)
			request.setAttribute("statusLoading", true);
	
		
		request.getSession().setAttribute("listCate", listCate);
		request.getSession().setAttribute("listCourse", listCourse);
		request.getSession().setAttribute("listTeacher", listTeacher);
		request.getSession().setAttribute("maDanhMuc", maDanhMuc);
		request.getSession().setAttribute("tenDanhMuc", tenDanhMuc);
		request.getSession().setAttribute("moTa", moTa);
		request.getSession().setAttribute("soPage", soPage);
		request.getSession().setAttribute("TotalPageByCate", TotalPageByCate);
		request.getSession().setAttribute("color", color);
		request.getSession().setAttribute("newListCourse", newListCourse);
		request.getRequestDispatcher("/view/pages_home/KhoaHoc.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		KhoaHocDb kh = new KhoaHocDb();
		List<Item> newListSortBest = new ArrayList<Item>();
		List<Item> newListSortTrending = new ArrayList<Item>();
		String getSelect = request.getParameter("getSelect");
		int index = getSelect.indexOf("+");
		String flag = getSelect.substring(index + 1);
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		Order order = (Order) session.getAttribute("order");
		
		String idDanhMuc = getSelect.substring(0, index);
		String soPage = request.getParameter("page");
		int page;
		int start = 0;
		int total;
		int totalPageSortBest = 0;
		int totalPageSortTrending = 0;
		if (soPage == null) {
			soPage = "1";
			page = Integer.parseInt(soPage);
		} else {
			page = Integer.parseInt(soPage);
		}
		total = 8;
		start = page * 8 - 8;
		try {
			if (idDanhMuc.length() == 0 || idDanhMuc.equals("allcourse")) {
				listSortBest = kh.getBestCourse(start, total);
				listSortTrending = kh.getTrendingCourse(start, total);
				
				totalPageSortBest =  (int)((float)Math.ceil(kh.getCountCourseSortBest() / 8));
				totalPageSortTrending =  (int) (Math.ceil((float) kh.getCountCourseSortTrending() / 8));
			} else {
				listSortBest = kh.getBestCourse(idDanhMuc, start, total);
				listSortTrending = kh.getTrendingCourse(idDanhMuc, start, total);
				totalPageSortBest =  (int)(Math.ceil((float)kh.getCountCourseSortBest(idDanhMuc) / 8));
				totalPageSortTrending =  (int) (Math.ceil((float)kh.getCountCourseSortTrending(idDanhMuc) / 8));
			}
			if(listSortBest.size() > 0) {
				for(KhoaHoc k : listSortBest) {
					Item item = new Item();
					item.setKhoaHoc(k);
					item.setStatus(0);
					newListSortBest.add(item);
				}
			}
			if(listSortTrending.size() > 0) {
				for(KhoaHoc k : listSortTrending) {
					Item item = new Item();
					item.setKhoaHoc(k);
					item.setStatus(0);
					newListSortTrending.add(item);
				}
			}
			if(listCourseOfUser.size()>0) {
				for(KhoaHoc k : listCourseOfUser) {
					for(Item item : newListSortBest) {
						if(k.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
							item.setStatus(2);
						}
					}
					for(Item item : newListSortTrending) {
						if(k.getMaKhoaHoc() == item.getKhoaHoc().getMaKhoaHoc()) {
							item.setStatus(2);
						}
					}
				}
			}
			if(order != null && order.getItems().size() > 0) {
				for(Item item : order.getItems()) {
					item.setStatus(1);
					for(Item item1 : newListSortBest) {
						if(item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
							if(item1.getStatus() < 2) {
								item1.setStatus(item.getStatus());
							}
						}
					}
					for(Item item1 : newListSortTrending) {
						if(item.getKhoaHoc().getMaKhoaHoc() == item1.getKhoaHoc().getMaKhoaHoc()) {
							if(item1.getStatus() < 2) {
								item1.setStatus(item.getStatus());
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("listSortBest", listSortBest);
		request.getSession().setAttribute("listSortTrending", listSortTrending);
		request.getSession().setAttribute("totalPageSortBest", totalPageSortBest);
		request.getSession().setAttribute("totalPageSortTrending", totalPageSortTrending);
		request.setAttribute("getSelect", getSelect);
		request.setAttribute("flag", flag);
		request.setAttribute("soPage", soPage);
		request.setAttribute("newListSortBest", newListSortBest);
		request.setAttribute("newListSortTrending", newListSortTrending);

		request.getRequestDispatcher("/view/pages_home/KhoaHoc.jsp").forward(request, response);
	}
}
