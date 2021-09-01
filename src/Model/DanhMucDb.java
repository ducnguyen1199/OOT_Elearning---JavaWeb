package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.DanhMuc;

public class DanhMucDb {
	public static ArrayList<DanhMuc> getListCate() throws SQLException{
		ArrayList<DanhMuc> listCate = new ArrayList<>();
		
		Connection con = JDBCConnection.getConnection();
		
		ResultSet rs = con.createStatement().executeQuery("Select * from danhmuc");
		
		while(rs.next()) {
			String maDanhMuc = rs.getString(1);
			String tenDanhMuc = rs.getString(2);
			String moTa = rs.getString(3);
			DanhMuc dm = new DanhMuc(maDanhMuc, tenDanhMuc,moTa);
			listCate.add(dm);
		}
		return listCate;
	}
}
