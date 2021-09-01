package Bean;

public class giaoVien {
	private int maGiaoVien;
	private String tenGiaoVien;
	private String moTa;
	private String hinhAnh;
	private int soLuongKH;
	private int soLuongHV;
	private int luotXem;
	private float xepHang;

	public giaoVien() {
		super();
	}

	public giaoVien(int maGiaoVien, String tenGiaoVien, String moTa, String hinhAnh, int soLuongKH, int soLuongHV,
			int luotXem, float xepHang) {
		super();
		this.maGiaoVien = maGiaoVien;
		this.tenGiaoVien = tenGiaoVien;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.soLuongKH = soLuongKH;
		this.soLuongHV = soLuongHV;
		this.luotXem = luotXem;
		this.xepHang = xepHang;
	}

	public int getMaGiaoVien() {
		return maGiaoVien;
	}

	public void setMaGiaoVien(int maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
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

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
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

	public float getXepHang() {
		return xepHang;
	}

	public void setXepHang(float xepHang) {
		this.xepHang = xepHang;
	}

	@Override
	public String toString() {
		return "giaoVien [maGiaoVien=" + maGiaoVien + ", tenGiaoVien=" + tenGiaoVien + ", moTa=" + moTa + ", hinhAnh="
				+ hinhAnh + ", soLuongKH=" + soLuongKH + ", soLuongHV=" + soLuongHV + ", luotXem=" + luotXem
				+ ", xepHang=" + xepHang + "]";
	}

}
