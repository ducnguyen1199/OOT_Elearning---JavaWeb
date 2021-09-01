package Bean;

public class KhoaHoc {
	private int maKhoaHoc;
	private String tenKhoaHoc;
	private String maDanhMuc;
	private String hinhAnh;
	private int soLuong;
	private String moTa;
	private int maGiaoVien;
	private float xepHang;
	private int thanhTien;
	private int giamGia;

	public KhoaHoc() {
		super();
	}

	public KhoaHoc(int maKhoaHoc, String tenKhoaHoc, String maDanhMuc, String hinhAnh, int soLuong, String moTa,
			int maGiaoVien, float xepHang, int thanhTien, int giamGia) {
		super();
		this.maKhoaHoc = maKhoaHoc;
		this.tenKhoaHoc = tenKhoaHoc;
		this.maDanhMuc = maDanhMuc;
		this.hinhAnh = hinhAnh;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.maGiaoVien = maGiaoVien;
		this.xepHang = xepHang;
		this.thanhTien = thanhTien;
		this.giamGia = giamGia;
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

	public String getMaDanhMuc() {
		return maDanhMuc;
	}

	public void setMaDanhMuc(String maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getMaGiaoVien() {
		return maGiaoVien;
	}

	public void setMaGiaoVien(int maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
	}

	public float getXepHang() {
		return xepHang;
	}

	public void setXepHang(float xepHang) {
		this.xepHang = xepHang;
	}

	public int getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(int thanhTien) {
		this.thanhTien = thanhTien;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	@Override
	public String toString() {
		return "KhoaHoc [maKhoaHoc=" + maKhoaHoc + ", tenKhoaHoc=" + tenKhoaHoc + ", maDanhMuc=" + maDanhMuc
				+ ", hinhAnh=" + hinhAnh + ", soLuong=" + soLuong + ", moTa=" + moTa + ", maGiaoVien=" + maGiaoVien
				+ ", xepHang=" + xepHang + ", thanhTien=" + thanhTien + ", giamGia=" + giamGia + "]";
	}

}
