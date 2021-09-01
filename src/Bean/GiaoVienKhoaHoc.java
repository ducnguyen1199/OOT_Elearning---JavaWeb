package Bean;

public class GiaoVienKhoaHoc {

	private int maGiaoVien_1;
	private String tenGiaoVien;
	private String moTa;
	private String hinhAnh_gv;
	private int soLuongKH;
	private int soLuongHV;
	private int luotXem;
	private float xepHang_gv;
	private int maKhoaHoc;
	private String tenKhoaHoc;
	private String maDanhMuc;
	private String hinhAnh_kh;
	private int soLuong;
	private String moTa_kh;
	private int maGiaoVien_2;
	private float xepHang_kh;
	private int thanhTien;
	private int giamGia;
	
//	contructor
	public GiaoVienKhoaHoc() {
		super();
	}
	public GiaoVienKhoaHoc(int maGiaoVien_1, String tenGiaoVien, String moTa, String hinhAnh_gv, int soLuongKH, int soLuongHV,
			int luotXem, float xepHang_gv, int maKhoaHoc, String tenKhoaHoc, String maDanhMuc, String hinhAnh_kh, int soLuong, String moTa_kh,
			int maGiaoVien_2, float xepHang_kh, int thanhTien, int giamGia) {
		super();
		this.maGiaoVien_1 = maGiaoVien_1;
		this.tenGiaoVien = tenGiaoVien;
		this.moTa = moTa;
		this.hinhAnh_gv = hinhAnh_gv;
		this.soLuongKH = soLuongKH;
		this.soLuongHV = soLuongHV;
		this.luotXem = luotXem;
		this.xepHang_gv = xepHang_gv;
		
		this.maKhoaHoc = maKhoaHoc;
		this.tenKhoaHoc = tenKhoaHoc;
		this.maDanhMuc = maDanhMuc;
		this.hinhAnh_kh = hinhAnh_kh;
		this.soLuong = soLuong;
		this.moTa_kh = moTa_kh;
		this.maGiaoVien_2 = maGiaoVien_2;
		this.xepHang_kh = xepHang_kh;
		this.thanhTien = thanhTien;
		this.giamGia = giamGia;
	}
//	get and set
	public int getMaGiaoVien_1() {
		return maGiaoVien_1;
	}
	public void setMaGiaoVien_1(int maGiaoVien_1) {
		this.maGiaoVien_1 = maGiaoVien_1;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhAnh_gv() {
		return hinhAnh_gv;
	}
	public void setHinhAnh_gv(String hinhAnh_gv) {
		this.hinhAnh_gv = hinhAnh_gv;
	}
	public int getSoLuongKH() {
		return soLuongKH;
	}
	public void setSoLuongKH(int soLuongKH) {
		this.soLuongKH = soLuongKH;
	}
	public int getSoLuongHV() {
		return soLuongHV;
	}
	public void setSoLuongHV(int soLuongHV) {
		this.soLuongHV = soLuongHV;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	public float getXepHang_gv() {
		return xepHang_gv;
	}
	public void setXepHang_gv(float xepHang_gv) {
		this.xepHang_gv = xepHang_gv;
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
	public String getHinhAnh_kh() {
		return hinhAnh_kh;
	}
	public void setHinhAnh_kh(String hinhAnh_kh) {
		this.hinhAnh_kh = hinhAnh_kh;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getMoTa_kh() {
		return moTa_kh;
	}
	public void setMoTa_kh(String moTa_kh) {
		this.moTa_kh = moTa_kh;
	}
	public int getMaGiaoVien_2() {
		return maGiaoVien_2;
	}
	public void setMaGiaoVien_2(int maGiaoVien_2) {
		this.maGiaoVien_2 = maGiaoVien_2;
	}
	public float getXepHang_kh() {
		return xepHang_kh;
	}
	public void setXepHang_kh(float xepHang_kh) {
		this.xepHang_kh = xepHang_kh;
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
	
//	to string
	@Override
	public String toString() {
		return "giaoVien [maGiaoVien=" + maGiaoVien_1 + ", tenGiaoVien=" + tenGiaoVien + ", moTa=" + moTa + ", hinhAnh="
				+ hinhAnh_gv + ", soLuongKH=" + soLuongKH + ", soLuongHV=" + soLuongHV + ", luotXem=" + luotXem
				+ ", xepHang=" + xepHang_gv + maKhoaHoc + ", tenKhoaHoc=" + tenKhoaHoc + ", maDanhMuc=" + maDanhMuc
				+ ", hinhAnh=" + hinhAnh_kh + ", soLuong=" + soLuong + ", moTa=" + moTa + ", maGiaoVien=" + maGiaoVien_1
				+ ", xepHang=" + xepHang_kh + ", thanhTien=" + thanhTien + ", giamGia=" + giamGia + "]";
	}
	
	

}
