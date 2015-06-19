package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_ADDRESS", query = "SELECT ad.ID, ad.ADDRESS_TYPE, ad.DISTRICT, ad.HOUSE_NO, ad.PROVINCE,"
		+ "ad.ROAD, ad.SUB_DISTRICT, ad.ZIPCODE, ad.APPLICANT_ID"
		+ " FROM ADDRESS ad LEFT JOIN APPLICANT a on ad.APPLICANT_ID = a.APPLICANT_ID WHERE ad.APPLICANT_ID = :ID", resultClass = AddressDTO.class)
	})
public class AddressDTO {
	
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "ADDRESS_TYPE")
	private String addressType;
	
	@Column(name = "DISTRICT")
	private String district;
	
	@Column(name = "HOUSE_NO")
	private String houseNo;
	
	@Column(name = "PROVINCE")
	private String province;
	
	@Column(name = "ROAD")
	private String road;
	
	@Column(name = "SUB_DISTRICT")
	private String subDistrict;
	
	@Column(name = "ZIPCODE")
	private Integer zipcode;
	
	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getRoad() {
		return road;
	}

	public void setRoad(String road) {
		this.road = road;
	}

	public String getSubDistrict() {
		return subDistrict;
	}

	public void setSubDistrict(String subDistrict) {
		this.subDistrict = subDistrict;
	}

	public Integer getZipcode() {
		return zipcode;
	}

	public void setZipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}

}
