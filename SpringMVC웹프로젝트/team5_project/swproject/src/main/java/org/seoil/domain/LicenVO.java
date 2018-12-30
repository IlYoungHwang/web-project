package org.seoil.domain;


// 면허 VO
public class LicenVO {

	private Integer no; // 번호
	private String name; //이름
	private Integer userno; // 회원 번호
	private String birth; // 법적생일
	private String licentype; // 면허종류
	private String licennum; //차량 번호
	private String issu; // 면허취득일
	private	String expir; // 면허 종료일
	private String address; // 주소
	
	
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getLicennum() {
		return licennum;
	}
	public void setLicennum(String licennum) {
		this.licennum = licennum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getLicentype() {
		return licentype;
	}
	public void setLicentype(String licentype) {
		this.licentype = licentype;
	}
	public String getIssu() {
		return issu;
	}
	public void setIssu(String issu) {
		this.issu = issu;
	}
	public String getExpir() {
		return expir;
	}
	public void setExpir(String expir) {
		this.expir = expir;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
