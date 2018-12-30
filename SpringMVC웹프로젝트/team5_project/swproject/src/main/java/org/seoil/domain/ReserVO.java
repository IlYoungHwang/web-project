package org.seoil.domain;

import java.util.Date;

public class ReserVO {
	
	private Integer no; // 예약번호
	private Integer userno; // 사용자번호
	private Integer rentno; // 렌트차량번호
	private Date reserdate; // 예약일자
	private Date returndate; // 반납일자
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getRentno() {
		return rentno;
	}
	public void setRentno(Integer rentno) {
		this.rentno = rentno;
	}
	public Date getReserdate() {
		return reserdate;
	}
	public void setReserdate(Date reserdate) {
		this.reserdate = reserdate;
	}
	public Date getReturndate() {
		return returndate;
	}
	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}	
}
