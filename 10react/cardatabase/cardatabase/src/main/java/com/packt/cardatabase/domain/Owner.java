package com.packt.cardatabase.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Owner {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long ownerid;
	private String firstname, lasename;
	
	// cascade 속성은 삭제 또는 업데이트 시 연속 효과가 적용되는 방법을 지정 
	// ALL : 모든 작업에 연속 효과를 적용
	// ex> 소유자 삭제 시 연관된 자동차 레코드도 같이 삭제 
	@JsonIgnore		// 직렬화(문자화)를 해제시키는 어노테이션 -> 무한루프 빠지지 않도록 방지 
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "owner")
	private List<Car> cars;
	
	public Owner() {}
	
	public Owner(String firstname, String lastname) {
		super();
		
		this.firstname = firstname;
		this.lasename = lastname;
	}

	
	public List<Car> getCars() {
		return cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}

	
	public long getOwnerid() {
		return ownerid;
	}

	public void setOwnerid(long ownerid) {
		this.ownerid = ownerid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLasename() {
		return lasename;
	}

	public void setLasename(String lasename) {
		this.lasename = lasename;
	} 
	
	
	
	
}
