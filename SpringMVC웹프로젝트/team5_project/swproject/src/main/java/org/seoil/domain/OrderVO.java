package org.seoil.domain;

import java.util.Date;

public class OrderVO {

	private Integer orderno; // 주문번호
	private Integer userno; // 사용자 번호
	private Integer usedno; // 중고차 번호
	private String usename; // 수령인이름
	private Date orderdate; // 주문일자
	private Integer totalmoney; // 총주문 금액
	private String orderaddr; // 수 주소
	private String userphone; // 수령인 전화번호
	private String paymethod; // 결제 방법
	
	private String usedname; // 중고차량 이름
	private String username; // 판매자 이름
	
	private String state;
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsedname() {
		return usedname;
	}
	public void setUsedname(String usedname) {
		this.usedname = usedname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getOrderno() {
		return orderno;
	}
	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getUsedno() {
		return usedno;
	}
	public void setUsedno(Integer usedno) {
		this.usedno = usedno;
	}
	public String getUsename() {
		return usename;
	}
	public void setUsename(String usename) {
		this.usename = usename;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Integer getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(Integer totalmoney) {
		this.totalmoney = totalmoney;
	}
	public String getOrderaddr() {
		return orderaddr;
	}
	public void setOrderaddr(String orderaddr) {
		this.orderaddr = orderaddr;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	
	
	
	
	
	
}
