package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Bean.KhoaHoc;
import Bean.NguoiDung;
import Bean.NguoiDungKhoaHoc;



public class NguoiDungKhoaHocDb {
	public static ArrayList<NguoiDungKhoaHoc> getListCourseOfUser() throws SQLException{
		ArrayList<NguoiDungKhoaHoc> listCourseOfUser = new ArrayList<>();
		
		Connection con = JDBCConnection.getConnection();
		
		ResultSet rs = con.createStatement().executeQuery("Select * from nguoidungkhoahoc");
		
		while(rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			int maNguoiDung = rs.getInt(2);
			Date ngayDangKi = rs.getDate(3);
			NguoiDungKhoaHoc ndkh = new NguoiDungKhoaHoc(maKhoaHoc, maNguoiDung, ngayDangKi);
			listCourseOfUser.add(ndkh);
		}
		return listCourseOfUser;
	}
	
	public static ArrayList<KhoaHoc> getListCourseOfUser(int maNguoiDung) throws SQLException {
		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery(
				"SELECT * FROM nguoidungkhoahoc ndkh join khoahoc kh ON ndkh.maKhoaHoc = kh.maKhoaHoc WHERE ndkh.maNguoiDung='"
						+ maNguoiDung + "'");

		ArrayList<KhoaHoc> listCourseOfUser = new ArrayList<>();

		while (rs.next()) {
			int maKhoaHoc = rs.getInt("maKhoaHoc");
			String tenKhoaHoc = rs.getString("tenKhoaHoc");
			String maDanhMuc = rs.getString("maDanhMuc");
			String hinhAnh = rs.getString("hinhAnh");
			int soLuong = rs.getInt("soLuong");
			String moTa = rs.getString("moTa");
			int maGiaoVien = rs.getInt("maGiaoVien");
			float xepHang = rs.getFloat("xepHang");
			int thanhTien = rs.getInt("thanhTien");
			int giamGia = rs.getInt("giamGia");
			KhoaHoc kh = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			listCourseOfUser.add(kh);
			kh = null;
		}
		return listCourseOfUser;
	}
	public void addNguoiDungKhoaHoc(KhoaHoc k,NguoiDung nd) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "INSERT INTO nguoidungkhoahoc(maKhoaHoc,maNguoiDung,ngayDangKi) VALUES (?,?,?)";
		PreparedStatement st = con.prepareStatement(sql); 
		
		st.setInt(1, k.getMaKhoaHoc());
		st.setInt(2, nd.getMaNguoiDung());
		st.setString(3, "2020-05-16");

		st.executeUpdate();
		JDBCConnection.dbClose();
	}
}
