package Bean;

import java.util.Date;

public class NguoiDungKhoaHoc {
	private int maKhoaHoc;
	private int maNguoiDung;
	private Date ngayDangKi;

	public NguoiDungKhoaHoc() {
		super();
	}

	public NguoiDungKhoaHoc(int maKhoaHoc, int maNguoiDung, Date ngayDangKi) {
		super();
		this.maKhoaHoc = maKhoaHoc;
		this.maNguoiDung = maNguoiDung;
		this.ngayDangKi = ngayDangKi;
	}

	public int getMaKhoaHoc() {
		return maKhoaHoc;
	}

	public void setMaKhoaHoc(int maKhoaHoc) {
		this.maKhoaHoc = maKhoaHoc;
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}

	public void setMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}

	public Date getNgayDangKi() {
		return ngayDangKi;
	}

	public void setNgayDangKi(Date ngayDangKi) {
		this.ngayDangKi = ngayDangKi;
	}

	@Override
	public String toString() {
		return "NguoiDungKhoaHoc [maKhoaHoc=" + maKhoaHoc + ", maNguoiDung=" + maNguoiDung + ", ngayDangKi="
				+ ngayDangKi + "]";
	}
}
