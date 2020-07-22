package member;

import java.sql.Timestamp;

public class MemberDTO {
//	+----------+-------------+------+-----+---------+----------------+
//	| Field    | Type        | Null | Key | Default | Extra          |
//	+----------+-------------+------+-----+---------+----------------+
//	| num      | int         | NO   | PRI | NULL    | auto_increment |
//	| id       | varchar(20) | NO   |     | NULL    |                |
//	| password | varchar(30) | NO   |     | NULL    |                |
//	| name     | varchar(10) | NO   |     | NULL    |                |
//	| birth    | varchar(10) | NO   |     | NULL    |                |
//	| gender   | varchar(2)  | NO   |     | NULL    |                |
//	| address1 | varchar(30) | NO   |     | NULL    |                |
//	| address2 | varchar(30) | NO   |     | NULL    |                |
//	| zipNo    | varchar(10) | NO   |     | NULL    |                |
//	| phone    | varchar(20) | NO   |     | NULL    |                |
//	| email    | varchar(50) | NO   |     | NULL    |                |
//	| agree    | varchar(30) | NO   |     | NULL    |                |
//	| date     | timestamp   | NO   |     | NULL    |                |
//	+----------+-------------+------+-----+---------+----------------+
	
	private int num;
	private String id;
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String address1;
	private String address2;
	private String zipNo;
	private String phone;
	private String email;
	private String agree;
	private Timestamp date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	

	
}
