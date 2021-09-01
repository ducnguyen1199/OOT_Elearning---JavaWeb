package Bean;

import java.io.Serializable;

public class Item implements Serializable {
	private int id;
	private KhoaHoc khoaHoc;
	private long donGia;
	private int status;
	
	public Item() {
		super();
		this.status = 0; 
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public KhoaHoc getKhoaHoc() {
		return khoaHoc;	
	}
	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}
	public long getDonGia() {
		return donGia;
	}
	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
