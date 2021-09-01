package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.KhoaHoc;
import Bean.NguoiDung;

public class NguoiDungDb {
	public static ArrayList<NguoiDung> getListUser() throws SQLException {
		ArrayList<NguoiDung> listUser = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from nguoidung where roleId = 1");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			listUser.add(nd);
			nd = null;
		}
		JDBCConnection.dbClose();
		return listUser;
	}
	public static ArrayList<NguoiDung> getListFullUser() throws SQLException {
		ArrayList<NguoiDung> listUser = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement().executeQuery("Select * from nguoidung ");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			listUser.add(nd);
			nd = null;
		}
		JDBCConnection.dbClose();
		return listUser;
	}
	public void deleteUser(int id) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "Delete from nguoidung where maNguoiDung=? and (roleId=1 or roleId=2)";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public ArrayList<NguoiDung> getlistUserBySearch(String name) throws SQLException {
		ArrayList<NguoiDung> listUser = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from nguoidung where roleId = 1 and hoTen LIKE '%" + name + "%'");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			listUser.add(nd);
			nd = null;
		}
		JDBCConnection.dbClose();
		return listUser;
	}

	public static NguoiDung getUser(String name, String pass, int role) throws SQLException {
		NguoiDung User = new NguoiDung();

		Connection con = JDBCConnection.getConnection();
		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `nguoidung` WHERE `taiKhoan` = '" + name
				+ "' and `matKhau` ='" + pass + "' and `roleId`='" + role + "'");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			User = nd;

		}
		JDBCConnection.dbClose();
		return User;
	}

	public NguoiDung getUserAdmin(String name, String pass) throws SQLException {
		NguoiDung User = new NguoiDung();

		Connection con = JDBCConnection.getConnection();
		ResultSet rs = con.createStatement().executeQuery(
				"SELECT * FROM `nguoidung` WHERE `taiKhoan` ='" + name + "' and `matKhau` ='" + pass + "' ");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			User = nd;
		}
		JDBCConnection.dbClose();
		return User;
	}

	public static void updatePassword(String taiKhoan, String matKhau) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		con.createStatement()
				.executeUpdate("UPDATE nguoidung SET matKhau='" + matKhau + "' WHERE taiKhoan ='" + taiKhoan + "'");
		JDBCConnection.dbClose();
	}

	public static void updateInfo(NguoiDung nd) throws SQLException {
		Connection con = JDBCConnection.getConnection();

		PreparedStatement st = con
				.prepareStatement("update nguoidung set hoTen=?, soDienThoai=? where taiKhoan=?");

		st.setString(1, nd.getHoTen());
		st.setString(2, nd.getSoDienThoai());
		st.setString(3, nd.getTaiKhoan());

		st.executeUpdate();
		JDBCConnection.dbClose();

	}

	public static ArrayList<NguoiDung> getListUserAdmin() throws SQLException {
		ArrayList<NguoiDung> listUser = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from nguoidung where roleId not in(1) ORDER BY `nguoidung`.`roleId` DESC");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			listUser.add(nd);
			nd = null;
		}
		JDBCConnection.dbClose();
		return listUser;
	}

	public void addNguoiDung(NguoiDung n) throws SQLException {
		Connection con = JDBCConnection.getConnection();
		String sql = "INSERT INTO `nguoidung`( `taiKhoan`, `matKhau`, `hoTen`, `email`, `soDienThoai`, `roleId`) VALUES (?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, n.getTaiKhoan());
		st.setString(2, n.getMatKhau());
		st.setString(3, n.getHoTen());
		st.setString(4, n.getEmail());
		st.setString(5, n.getSoDienThoai());
		st.setInt(6, n.getRoleId());

		st.executeUpdate();
		JDBCConnection.dbClose();
	}

	public ArrayList<NguoiDung> getlistAdminBySearch(String name) throws SQLException {
		ArrayList<NguoiDung> listUserAdmin = new ArrayList<>();

		Connection con = JDBCConnection.getConnection();

		ResultSet rs = con.createStatement()
				.executeQuery("Select * from nguoidung where roleId not in(1) and hoTen LIKE '%" + name + "%'");

		while (rs.next()) {
			int maNguoiDung = rs.getInt(1);
			String taiKhoan = rs.getString(2);
			String matKhau = rs.getString(3);
			String hoTen = rs.getString(4);
			String email = rs.getString(5);
			String soDienThoai = rs.getString(6);
			int roleId = rs.getInt(7);
			NguoiDung nd = new NguoiDung(maNguoiDung, taiKhoan, matKhau, hoTen, email, soDienThoai, roleId);
			listUserAdmin.add(nd);
			nd = null;
		}
		JDBCConnection.dbClose();
		return listUserAdmin;
	}

	public boolean checkUserByUsername(String username) throws SQLException {
		Connection con = JDBCConnection.getConnection();

		String sql = "Select * from nguoidung where taiKhoan='" + username + "'";
		PreparedStatement st = con.prepareStatement(sql);

		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getInt(1));
			return true;
		}
		
		JDBCConnection.dbClose();
		return false;
	}
}
