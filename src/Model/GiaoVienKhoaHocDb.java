package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import Bean.GiaoVienKhoaHoc;
import Bean.NguoiDungJoinKhoaHoc;
import Bean.giaoVien;



public class GiaoVienKhoaHocDb {
	public ArrayList<GiaoVienKhoaHoc> getListTeacherCourse() throws SQLException {
		ArrayList<GiaoVienKhoaHoc> listTeacherCourse = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `giaovien`JOIN `khoahoc` WHERE `giaovien`.`maGiaoVien`=`khoahoc`.`maGiaoVien`");

		while (rs.next()) {
			int maGiaoVien_1 = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa_gv = rs.getString(3);
			String hinhAnh_gv = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang_gv = rs.getFloat(8);
			int maKhoaHoc = rs.getInt(9);
			String tenKhoaHoc = rs.getString(10);
			String maDanhMuc = rs.getString(11);
			String hinhAnh_kh = rs.getString(12);
			int soLuong = rs.getInt(13);
			String moTa_kh = rs.getString(14);
			int maGiaoVien_2 = rs.getInt(15);
			float xepHang_kh = rs.getFloat(16);
			int thanhTien = rs.getInt(17);
			int giamGia = rs.getInt(18);
			
			
			
			GiaoVienKhoaHoc gv_kh = new GiaoVienKhoaHoc(maGiaoVien_1, tenGiaoVien, moTa_gv, hinhAnh_gv, soLuongKH, soLuongHV, luotXem, xepHang_gv,maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh_kh, soLuong, moTa_kh, maGiaoVien_2, xepHang_kh,
					thanhTien, giamGia);
			listTeacherCourse.add(gv_kh);
		}
		return listTeacherCourse;
	}
	public ArrayList<GiaoVienKhoaHoc> getListTeacherBySearch(String name) throws SQLException {
		ArrayList<GiaoVienKhoaHoc> listTeacher= new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("SELECT * FROM `giaovien`JOIN `khoahoc` WHERE `giaovien`.`maGiaoVien`=`khoahoc`.`maGiaoVien`and `giaovien`.`tenGiaoVien` LIKE '%"+name+"%'");

		while (rs.next()) {
			int maGiaoVien_1 = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa_gv = rs.getString(3);
			String hinhAnh_gv = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang_gv = rs.getFloat(8);
			int maKhoaHoc = rs.getInt(9);
			String tenKhoaHoc = rs.getString(10);
			String maDanhMuc = rs.getString(11);
			String hinhAnh_kh = rs.getString(12);
			int soLuong = rs.getInt(13);
			String moTa_kh = rs.getString(14);
			int maGiaoVien_2 = rs.getInt(15);
			float xepHang_kh = rs.getFloat(16);
			int thanhTien = rs.getInt(17);
			int giamGia = rs.getInt(18);
			
			
			
			GiaoVienKhoaHoc gv_kh = new GiaoVienKhoaHoc(maGiaoVien_1, tenGiaoVien, moTa_gv, hinhAnh_gv, soLuongKH, soLuongHV, luotXem, xepHang_gv,maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh_kh, soLuong, moTa_kh, maGiaoVien_2, xepHang_kh,
					thanhTien, giamGia);
			listTeacher.add(gv_kh);
			gv_kh = null;
		}
		JDBCConnection.dbClose();
		return listTeacher;
	}

	public ArrayList<GiaoVienKhoaHoc> getListTeacherByLimit(int start, int total) throws SQLException {
		ArrayList<GiaoVienKhoaHoc> listTeacher= new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `giaovien`JOIN `khoahoc` WHERE `giaovien`.`maGiaoVien`=`khoahoc`.`maGiaoVien` LIMIT " + (start) + ", " + total);

		while (rs.next()) {
			int maGiaoVien_1 = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa_gv = rs.getString(3);
			String hinhAnh_gv = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang_gv = rs.getFloat(8);
			int maKhoaHoc = rs.getInt(9);
			String tenKhoaHoc = rs.getString(10);
			String maDanhMuc = rs.getString(11);
			String hinhAnh_kh = rs.getString(12);
			int soLuong = rs.getInt(13);
			String moTa_kh = rs.getString(14);
			int maGiaoVien_2 = rs.getInt(15);
			float xepHang_kh = rs.getFloat(16);
			int thanhTien = rs.getInt(17);
			int giamGia = rs.getInt(18);
			
			
			
			GiaoVienKhoaHoc gv_kh = new GiaoVienKhoaHoc(maGiaoVien_1, tenGiaoVien, moTa_gv, hinhAnh_gv, soLuongKH, soLuongHV, luotXem, xepHang_gv,maKhoaHoc, tenKhoaHoc, maDanhMuc, hinhAnh_kh, soLuong, moTa_kh, maGiaoVien_2, xepHang_kh,
					thanhTien, giamGia);
			listTeacher.add(gv_kh);
			gv_kh = null;
		}
		JDBCConnection.dbClose();
		return listTeacher;
	}
	
	public int getCountTeacher() throws SQLException{
		int count = 0;

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select count(khoahoc.maKhoaHoc) as numberOfCourse from `giaovien`JOIN `khoahoc` WHERE `giaovien`.`maGiaoVien`=`khoahoc`.`maGiaoVien`");
		while (rs.next()) {
			count = rs.getInt(1);
		}
		JDBCConnection.dbClose();
		return count;
	}


}
