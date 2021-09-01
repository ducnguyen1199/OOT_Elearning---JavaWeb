package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.KhoaHoc;
import Bean.giaoVien;


public class GiaoVienDb {
	public static ArrayList<giaoVien> getListTeacher() throws SQLException{
		Connection con = JDBCConnection.getConnection();
		
		ResultSet rs = con.createStatement().executeQuery("Select * from giaovien");
		
		return  getData(rs);
		
	}
	public static ArrayList<giaoVien> getTopTeacher() throws SQLException{
		Connection con = JDBCConnection.getConnection();
		
		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM giaovien ORDER BY soLuongKH DESC LIMIT 6");
		
		return  getData(rs);
	}
	private static ArrayList<giaoVien> getData(ResultSet rs) throws SQLException {
		ArrayList<giaoVien> listTeacher = new ArrayList<>();
		while(rs.next()) {
			int maGiaoVien = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			giaoVien gv = new giaoVien(maGiaoVien, tenGiaoVien, moTa, hinhAnh, soLuongKH, soLuongHV, luotXem, xepHang);
			listTeacher.add(gv);
		}
		return listTeacher;
	}
	public void addTeacher(giaoVien gv) throws SQLException{
		Connection con = JDBCConnection.getConnection();
		String sql = "INSERT INTO `giaovien`( `tenGiaoVien`, `moTa`, `hinhAnh`, `soLuongKH`, `soLuongHV`, `luotXem`, `xepHang`) VALUES (?,?,?,?,?,?,?)";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, gv.getTenGiaoVien());
		st.setString(2, gv.getMoTa());
		st.setString(3, gv.getHinhAnh());
		st.setInt(4, 0);
		st.setInt(5,0);
		st.setInt(6, gv.getLuotXem());
		st.setFloat(7, gv.getXepHang());
		
		st.executeUpdate();
	}
	public void deleteGiaoVien(int id) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "Delete from giaovien where maGiaoVien=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);

		st.executeUpdate();
		JDBCConnection.dbClose();
	}
	public void editGiaoVien(giaoVien gv) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "update giaovien set tenGiaoVien=?,moTa=?,hinhAnh=?,luotXem=?,xepHang=? where maGiaoVien=?";
		
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, gv.getTenGiaoVien());
		st.setString(2, gv.getMoTa());
		st.setString(3, gv.getHinhAnh());
		st.setInt(4, gv.getLuotXem());
		st.setFloat(5, gv.getXepHang());
		st.setInt(6,gv.getMaGiaoVien());
		System.out.println("oc hco"+st);
		st.executeUpdate();
		JDBCConnection.dbClose();
	}
	public ArrayList<giaoVien> getListTeacherBySearch(String name) throws SQLException {
		ArrayList<giaoVien> listTeacher= new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from giaovien where tenGiaoVien LIKE '%" + name + "%'");

		while (rs.next()) {
			int maGiaoVien = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			giaoVien gv = new giaoVien(maGiaoVien, tenGiaoVien, moTa, hinhAnh, soLuongKH, soLuongHV, luotXem, xepHang);
			listTeacher.add(gv);
			gv = null;
		}
		JDBCConnection.dbClose();
		return listTeacher;
	}
	
	public giaoVien getTeacherById(int id) throws SQLException{
		giaoVien gv = new giaoVien();
		
		Connection con = JDBCConnection.getConnection();
		
		ResultSet rs = con.createStatement().executeQuery("Select * from giaovien where maGiaoVien = " + id);
		
		while (rs.next()) {
			int maGiaoVien = rs.getInt(1);
			String tenGiaoVien = rs.getString(2);
			String moTa = rs.getString(3);
			String hinhAnh = rs.getString(4);
			int soLuongKH = rs.getInt(5);
			int soLuongHV = rs.getInt(6);
			int luotXem = rs.getInt(7);
			float xepHang = rs.getFloat(8);
			gv = new giaoVien(maGiaoVien, tenGiaoVien, moTa, hinhAnh, soLuongKH, soLuongHV, luotXem, xepHang);
		}
		
		return gv;
	}
}
