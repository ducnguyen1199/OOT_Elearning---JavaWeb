package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

import Bean.KhoaHoc;
import Bean.NguoiDung;
import Model.KhoaHocDb;
import Model.NguoiDungDb;

@WebServlet("/SignUpHome")
public class SignUpHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<NguoiDung> listUser = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String number = request.getParameter("number");
		String email = request.getParameter("email");
		String xacnhan = request.getParameter("xacnhan");

		NguoiDungDb Nd = new NguoiDungDb();
		NguoiDungDb db = new NguoiDungDb();
		NguoiDung n = new NguoiDung(0, username, password, fullname, email, number, 1);

		int opt = 0;
		if (xacnhan == null) {
			int flg = 0;
			opt = 1;
//			
//			check user
			try {
				listUser = db.getListFullUser();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			for (int i = 0; i < listUser.size(); i++) {
				if (listUser.get(i).getTaiKhoan().equals(username)) {
					flg = 1;
					break;
				}
			}
			if (flg == 1) {
				request.setAttribute("aleartErr", "The Account already exists. Please enter a different Account");
				request.setAttribute("user", n);
		
			} else {
				final String usernamemail = "ootelearning@gmail.com";
				final String passwordmail = "Anh670197";
				Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp.gmail.com");
				prop.put("mail.smtp.port", "587");
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.socketFactory.port", "465");
				prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				int max = 9999;
				int min = 1000;
				Random rd = new Random();
				int numberid = rd.nextInt(max + 1 - min) + min;

				HttpSession HttpSession = request.getSession();
				HttpSession.setAttribute(username + "153", numberid);

				Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(usernamemail, passwordmail);
					}
				});

				try {

					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress("ootelearning@gmail.com"));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					message.setSubject("Verification Gmail");
					message.setText("Dear " + username + "\n\n The verification code sent to you by oot-Elearning is "
							+ numberid);

					Transport.send(message);

					System.out.println("Done");
					request.setAttribute("opt", opt);
					request.setAttribute("user", n);
				

				} catch (MessagingException e) {
					e.printStackTrace();

				}
			}

		} else {
			HttpSession HttpSession = request.getSession();
			opt = 0;

			String maXacNhan = "";
			Object obj = HttpSession.getAttribute(username + "153");
			if (obj != null) {
				maXacNhan = String.valueOf(obj);
				maXacNhan = maXacNhan.replace("-", "");
				System.out.println(maXacNhan);
		
			}
			if (xacnhan.equals(maXacNhan)) {
				try {
					Nd.addNguoiDung(n);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				request.setAttribute("aleartSuccess", "Signup success");
				request.setAttribute("opt", opt);

			} else {
				opt = 1;
				request.setAttribute("opt", opt);
				request.setAttribute("textOPT", "OTP is not correct");
				request.setAttribute("user", n);
	
			}
		}
		request.getRequestDispatcher("/home-signup").forward(request, response);
	}

}
