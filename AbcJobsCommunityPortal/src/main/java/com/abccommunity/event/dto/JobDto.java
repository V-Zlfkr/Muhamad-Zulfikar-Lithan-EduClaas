package com.abccommunity.event.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table (name = "tb_job")
public class JobDto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int job_id;

	private String job_title;

	private String job_company;

	private String job_workplace;

	@Column (length=1000)
	private String job_link;

	private String job_employment;

	private String job_location;

	@Column (length=100000)
	private String job_desc;
	
	public JobDto() {
		
	}

	public JobDto(int job_id, String job_title, String job_company, String job_workplace, String job_link,
			String job_employment, String job_location, String job_desc) {
		this.job_id = job_id;
		this.job_title = job_title;
		this.job_company = job_company;
		this.job_workplace = job_workplace;
		this.job_link = job_link;
		this.job_employment = job_employment;
		this.job_location = job_location;
		this.job_desc = job_desc;
	}

	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getJob_company() {
		return job_company;
	}

	public void setJob_company(String job_company) {
		this.job_company = job_company;
	}

	public String getJob_workplace() {
		return job_workplace;
	}

	public void setJob_workplace(String job_workplace) {
		this.job_workplace = job_workplace;
	}

	public String getJob_link() {
		return job_link;
	}

	public void setJob_link(String job_link) {
		this.job_link = job_link;
	}

	public String getJob_employment() {
		return job_employment;
	}

	public void setJob_employment(String job_employment) {
		this.job_employment = job_employment;
	}

	public String getJob_location() {
		return job_location;
	}

	public void setJob_location(String job_location) {
		this.job_location = job_location;
	}

	public String getJob_desc() {
		return job_desc;
	}

	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}

	@Override
	public String toString() {
		return "JobDto [job_company=" + job_company + ", job_desc=" + job_desc + ", job_employment=" + job_employment
				+ ", job_id=" + job_id + ", job_link=" + job_link + ", job_location=" + job_location + ", job_title="
				+ job_title + ", job_workplace=" + job_workplace + "]";
	}
	
}