package org.seoil.domain;

import java.util.Date;

public class UsedVO {

	private Integer no; // 중고차량레코드 번호
	private Integer userno; // 회원번호
	private String manuf; // 제조사
	private String name; // 차종이름
	private String year; // 연식
	private String color; // 색상
	private String carnum; // 차량번호
	private String trans; // 변속기
	private String fuel; // 연료
	private String seize; // 압류저당
	private String acci; // 사고유무
	private String opt; // 옵션
	private String appro; // 판매승인
	private String driv;  // 주행거리
	private Date regdate; // 등록일자
	private Integer pay; // 가격
	
	private String fullName;
	private String[] files;
	
	
	
	
	
	public Integer getPay() {
		return pay;
	}
	public void setPay(Integer pay) {
		this.pay = pay;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getDriv() {
		return driv;
	}
	public void setDriv(String driv) {
		this.driv = driv;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getAppro() {
		return appro;
	}
	public void setAppro(String appro) {
		this.appro = appro;
	}
	public String getManuf() {
		return manuf;
	}
	public void setManuf(String manuf) {
		this.manuf = manuf;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getTrans() {
		return trans;
	}
	public void setTrans(String trans) {
		this.trans = trans;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getSeize() {
		return seize;
	}
	public void setSeize(String seize) {
		this.seize = seize;
	}
	public String getAcci() {
		return acci;
	}
	public void setAcci(String acci) {
		this.acci = acci;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	
	
	
}
