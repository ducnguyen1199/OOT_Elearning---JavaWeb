package Bean;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
	private int id;
	private NguoiDung nguoiDung;
	private List<Item> items;
	private int status;
	
	public Order() {
		this.status = 0;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}
	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public long tongTien() {
		long tong =0;
		for(Item item : this.items) {
			tong+= item.getDonGia();
		};
		return tong;
	}
	public long tongGiamGia() {
		return this.tongTien()/100;
	}
	
}
