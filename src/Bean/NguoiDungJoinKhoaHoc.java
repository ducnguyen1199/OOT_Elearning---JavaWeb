package Bean;

import java.util.Date;

public class NguoiDungJoinKhoaHoc {
	private int maKhoaHoc;
	private String tenKhoaHoc;
	private String hinhAnh;
	private String moTa;
	
	private int maNguoiDung;
	private String taiKhoan;
	private String hoTen;
	private Date ngayDangKi;

	public NguoiDungJoinKhoaHoc() {
		super();
	}

	public NguoiDungJoinKhoaHoc(int maKhoaHoc, String tenKhoaHoc, String hinhAnh, String moTa, int maNguoiDung,
			String taiKhoan, String hoTen, Date ngayDangKi) {
		super();
		this.maKhoaHoc = maKhoaHoc;
		this.tenKhoaHoc = tenKhoaHoc;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.maNguoiDung = maNguoiDung;
		this.taiKhoan = taiKhoan;
		this.hoTen = hoTen;
		this.ngayDangKi = ngayDangKi;
	}

	public int getMaKhoaHoc() {
		return maKhoaHoc;
	}

	public void setMaKhoaHoc(int maKhoaHoc) {
		this.maKhoaHoc = maKhoaHoc;
	}
	
	public String getTenKhoaHoc() {
		return tenKhoaHoc;
	}

	public void setTenKhoaHoc(String tenKhoaHoc) {
		this.tenKhoaHoc = tenKhoaHoc;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}

	public void getMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}
	
	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	
	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNgayDangKi() {
		return ngayDangKi;
	}

	public void setNgayDangKi(Date ngayDangKi) {
		this.ngayDangKi = ngayDangKi;
	}
}
