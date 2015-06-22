package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_SKILL", query = "SELECT s.ID, s.SKILL_DETAIL"
		+ " FROM SKILL s LEFT JOIN APPLICANT a on s.APPLICANT_ID = a.APPLICANT_ID WHERE s.APPLICANT_ID = :ID", resultClass = SkillDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_SKILL_ID", query = "SELECT s.ID, s.SKILL_DETAIL"
			+ " FROM SKILL s WHERE s.APPLICANT_ID = :ID", resultClass = SkillDTO.class)
	})
public class SkillDTO {
	
	@Id
	@Column(name = "ID")
	private Integer id;

	@Column(name = "SKILL_DETAIL")
	private String skillDetail;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSkillDetail() {
		return skillDetail;
	}

	public void setSkillDetail(String skillDetail) {
		this.skillDetail = skillDetail;
	}

}
