package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import Bean.KhoaHoc;
import Bean.NguoiDungJoinKhoaHoc;

public class NguoiDungJoinKhoaHocDb {
	public static ArrayList<NguoiDungJoinKhoaHoc> getListUserCourse() throws SQLException {
		ArrayList<NguoiDungJoinKhoaHoc> listUserCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery(
				"Select kh.maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, ndkh.maNguoiDung, taiKhoan, hoTen, ngayDangKi from nguoidungkhoahoc ndkh, khoahoc kh, nguoidung nd where ndkh.maNguoiDung = nd.maNguoiDung and kh.maKhoaHoc = ndkh.maKhoaHoc");

		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String hinhAnh = rs.getString(3);
			String moTa = rs.getString(4);
			int maNguoiDung = rs.getInt(5);
			String taiKhoan = rs.getString(6);
			String hoTen = rs.getString(7);
			Date ngayDangKi = rs.getDate(8);
			NguoiDungJoinKhoaHoc ndkh = new NguoiDungJoinKhoaHoc(maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, maNguoiDung,
					taiKhoan, hoTen, ngayDangKi);
			listUserCourse.add(ndkh);
		}
		return listUserCourse;
	}

	public void deleteUserCourse(int maKhoaHoc, int maNguoiDung) throws SQLException {

		Connection con = JDBCConnection.getConnection();
		String sql = "Delete from nguoidungkhoahoc where maNguoiDung=? and maKhoaHoc=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, maNguoiDung);
		st.setInt(2, maKhoaHoc);

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public ArrayList<NguoiDungJoinKhoaHoc> getListCourseBySearch(String name) throws SQLException {
		ArrayList<NguoiDungJoinKhoaHoc> listUserCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery(
				"Select kh.maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, ndkh.maNguoiDung, taiKhoan, hoTen, ngayDangKi from nguoidungkhoahoc ndkh, khoahoc kh, nguoidung nd where ndkh.maNguoiDung = nd.maNguoiDung and kh.maKhoaHoc = ndkh.maKhoaHoc and taiKhoan LIKE '%" + name + "%'");
		
		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String hinhAnh = rs.getString(3);
			String moTa = rs.getString(4);
			int maNguoiDung = rs.getInt(5);
			String taiKhoan = rs.getString(6);
			String hoTen = rs.getString(7);
			Date ngayDangKi = rs.getDate(8);
			NguoiDungJoinKhoaHoc ndkh = new NguoiDungJoinKhoaHoc(maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, maNguoiDung,
					taiKhoan, hoTen, ngayDangKi);
			listUserCourse.add(ndkh);
		}
		return listUserCourse;
	}
	
	public ArrayList<NguoiDungJoinKhoaHoc> getListUserCourseByLimit(int start, int total) throws SQLException {
		ArrayList<NguoiDungJoinKhoaHoc> listUserCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select kh.maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, ndkh.maNguoiDung, taiKhoan, hoTen, ngayDangKi from nguoidungkhoahoc ndkh, khoahoc kh, nguoidung nd where ndkh.maNguoiDung = nd.maNguoiDung and kh.maKhoaHoc = ndkh.maKhoaHoc LIMIT " + (start) + ", " + total);

		while (rs.next()) {
			int maKhoaHoc = rs.getInt(1);
			String tenKhoaHoc = rs.getString(2);
			String hinhAnh = rs.getString(3);
			String moTa = rs.getString(4);
			int maNguoiDung = rs.getInt(5);
			String taiKhoan = rs.getString(6);
			String hoTen = rs.getString(7);
			Date ngayDangKi = rs.getDate(8);
			NguoiDungJoinKhoaHoc ndkh = new NguoiDungJoinKhoaHoc(maKhoaHoc, tenKhoaHoc, hinhAnh, moTa, maNguoiDung,
					taiKhoan, hoTen, ngayDangKi);
			listUserCourse.add(ndkh);
		}
		JDBCConnection.dbClose();
		return listUserCourse;
	}

	public int getCountUserCourse() throws SQLException{
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(ndkh.maKhoaHoc) as numberOfCourse from nguoidungkhoahoc ndkh, khoahoc kh, nguoidung nd where ndkh.maNguoiDung = nd.maNguoiDung and kh.maKhoaHoc = ndkh.maKhoaHoc");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}
}
