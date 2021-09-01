package Bean;

public class DanhMuc {
	private String maDanhMuc;
	private String tenDanhMuc;
	private String moTa;
	
	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public DanhMuc() {
		super();
	}

	public DanhMuc(String maDanhMuc, String tenDanhMuc, String moTa) {
		super();
		this.maDanhMuc = maDanhMuc;
		this.tenDanhMuc = tenDanhMuc;
		this.moTa = moTa;
	}

	public String getMaDanhMuc() {
		return maDanhMuc;
	}

	public void setMaDanhMuc(String maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	@Override
	public String toString() {
		return "DanhMuc [maDanhMuc=" + maDanhMuc + ", tenDanhMuc=" + tenDanhMuc + "]";
	}

}
