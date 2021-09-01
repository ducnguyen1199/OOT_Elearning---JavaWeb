package Bean;

public class NguoiDung {
	private int maNguoiDung;
	private String taiKhoan;
	private String matKhau;
	private String hoTen;
	private String email;
	private String soDienThoai;
	private int roleId;

	public NguoiDung() {
		super();
	}

	public NguoiDung(int maNguoiDung, String taiKhoan, String matKhau, String hoTen, String email, String soDienThoai,
			int roleId) {
		super();
		this.maNguoiDung = maNguoiDung;
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
		this.hoTen = hoTen;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.roleId = roleId;
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}

	public void setMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "NguoiDung [maNguoiDung=" + maNguoiDung + ", taiKhoan=" + taiKhoan + ", matKhau=" + matKhau + ", hoTen="
				+ hoTen + ", email=" + email + ", soDienThoai=" + soDienThoai + ", roleId=" + roleId + "]";
	}

}
