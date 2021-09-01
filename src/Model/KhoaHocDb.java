package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.KhoaHoc;

public class KhoaHocDb {
	public static ArrayList<KhoaHoc> getListCourse() throws SQLException {
		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc");

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getListCourseByCate(String cate) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc where maDanhMuc='" + cate + "'");

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getListCourseTopView() throws SQLException {
		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM khoahoc ORDER BY soLuong DESC LIMIT 12");

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getListCourseByKeyword(String keyword) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("SELECT * FROM khoahoc WHERE tenKhoaHoc LIKE '%" + keyword + "%'");

		return getData(rs);
	}

	private static ArrayList<KhoaHoc> getData(ResultSet rs) throws SQLException {
		ArrayList<KhoaHoc> listCourse = new ArrayList<>();
		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String maDanhMuc = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuong = rs.getInt(5);
			String moTa = rs.getString(6);
			int maGiaoVien = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			int thanhTien = rs.getInt(9);
			int giamGia = rs.getInt(10);
			KhoaHoc kh = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			listCourse.add(kh);
			kh = null;
		}
		JDBCConnection.dbClose();
		return listCourse;
	}

	public void addKhoaHoc(KhoaHoc k) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "INSERT INTO khoahoc(tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang, thanhTien, giamGia) VALUES (?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, k.getTenKhoaHoc());
		st.setString(2, k.getMaDanhMuc());
		st.setString(3, k.getHinhAnh());
		st.setInt(4, 0);
		st.setString(5, k.getMoTa());
		st.setInt(6, k.getMaGiaoVien());
		st.setFloat(7, k.getXepHang());
		st.setInt(8, k.getThanhTien());
		st.setInt(9, k.getGiamGia());

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public void deleteKhoaHoc(int id) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "Delete from khoahoc where maKhoaHoc=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public void editKhoaHoc(KhoaHoc k) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "update khoahoc set moTa=?,maDanhMuc=?,hinhAnh=?,thanhTien=?,giamGia=? where maKhoaHoc=?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, k.getMoTa());
		st.setString(2, k.getMaDanhMuc());
		st.setString(3, k.getHinhAnh());
		st.setInt(4, k.getThanhTien());
		st.setInt(5, k.getGiamGia());
		st.setInt(6, k.getMaKhoaHoc());

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public ArrayList<KhoaHoc> getListCourseBySearch(String name) throws SQLException {
		ArrayList<KhoaHoc> listCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from khoahoc where tenKhoaHoc LIKE '%" + name + "%'");

		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String maDanhMuc = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuong = rs.getInt(5);
			String moTa = rs.getString(6);
			int maGiaoVien = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			int thanhTien = rs.getInt(9);
			int giamGia = rs.getInt(10);
			KhoaHoc kh = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			listCourse.add(kh);
			kh = null;
		}
		JDBCConnection.dbClose();
		return listCourse;
	}

	public ArrayList<KhoaHoc> getListCourseByLimit(int start, int total) throws SQLException {
		ArrayList<KhoaHoc> listCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc LIMIT " + (start) + ", " + total);

		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String maDanhMuc = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuong = rs.getInt(5);
			String moTa = rs.getString(6);
			int maGiaoVien = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			int thanhTien = rs.getInt(9);
			int giamGia = rs.getInt(10);
			KhoaHoc kh = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			listCourse.add(kh);
			kh = null;
		}
		JDBCConnection.dbClose();
		return listCourse;
	}

	public ArrayList<KhoaHoc> getListCourseByLimitByCate(String cate, int start, int total) throws SQLException {
		ArrayList<KhoaHoc> listCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery(
				"Select * from khoahoc WHERE maDanhMuc='" + cate + "' LIMIT " + (start) + ", " + total);

		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String maDanhMuc = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuong = rs.getInt(5);
			String moTa = rs.getString(6);
			int maGiaoVien = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			int thanhTien = rs.getInt(9);
			int giamGia = rs.getInt(10);
			KhoaHoc kh = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			listCourse.add(kh);
			kh = null;
		}
		JDBCConnection.dbClose();
		return listCourse;
	}

	public int getCountCourse() throws SQLException {
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}

	public int getCountCourseByCate(String cate) throws SQLException {
		int count = 0;
		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc WHERE maDanhMuc='" + cate + "'");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}

	public static ArrayList<KhoaHoc> getBestCourse(String cate, int start, int total) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from khoahoc where maDanhMuc='" + cate + "' AND xepHang >= 4.5 ORDER BY xepHang DESC  LIMIT " + (start) + ", " + total );

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getTrendingCourse(String cate, int start, int total) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from khoahoc where maDanhMuc='" + cate + "' AND soLuong >= 1000 ORDER BY soLuong DESC LIMIT " + (start) + ", " + total);

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getBestCourse(int start, int total) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc where xepHang >= 4.5 ORDER BY xepHang DESC LIMIT " + (start) + ", " + total);

		return getData(rs);
	}

	public static ArrayList<KhoaHoc> getTrendingCourse(int start, int total) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc  where soLuong >= 1000 ORDER BY soLuong DESC LIMIT " + (start) + ", " + total);

		return getData(rs);
		}
	public int getCountCourseSortBest() throws SQLException {
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc where xepHang >= 4.5");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}
	public int getCountCourseSortTrending() throws SQLException {
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc where soLuong >= 1000");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}
	public int getCountCourseSortBest(String cate) throws SQLException {
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc where maDanhMuc='" + cate + "' AND  xepHang >= 4.5 ");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}

	public int getCountCourseSortTrending(String cate) throws SQLException {
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(maKhoaHoc) as numberOfCourse from khoahoc where maDanhMuc='" + cate + "' AND soLuong >= 1000");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}
	public KhoaHoc getCourseById(int id) throws SQLException {
		KhoaHoc kh = new KhoaHoc();

		Connection con = JDBCConnection.getConnection();
		ResultSet rs = con.createStatement().executeQuery("Select * from khoahoc where maKhoaHoc='" + id + "'");
		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String maDanhMuc = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuong = rs.getInt(5);
			String moTa = rs.getString(6);
			int maGiaoVien = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			int thanhTien = rs.getInt(9);
			int giamGia = rs.getInt(10);
			KhoaHoc khoaHoc = new KhoaHoc(maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh, soLuong, moTa, maGiaoVien, xepHang,
					thanhTien, giamGia);
			kh = khoaHoc;
		}

		JDBCConnection.dbClose();
		return kh;
	}
	
	public static ArrayList<KhoaHoc> getListCoursesForUser(String taiKhoan) throws SQLException {

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("SELECT * FROM khoahoc kh1 " + 
						"WHERE kh1.maDanhMuc IN (SELECT DISTINCT kh2.maDanhMuc FROM khoahoc kh2 WHERE kh2.maKhoaHoc IN (SELECT ndkh.maKhoaHoc FROM nguoidungkhoahoc ndkh JOIN nguoidung nd ON ndkh.maNguoiDung=nd.maNguoiDung WHERE nd.taiKhoan='"+ taiKhoan +"'))" + 
						"AND kh1.maKhoaHoc NOT IN (SELECT ndkh.maKhoaHoc FROM nguoidungkhoahoc ndkh JOIN nguoidung nd ON ndkh.maNguoiDung = nd.maNguoiDung WHERE nd.taiKhoan='"+ taiKhoan +"')"
								+ "ORDER BY kh1.soLuong DESC LIMIT 12");
		return getData(rs);
	}
}
