package com.abccommunity.event.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "bulkEmail")
public class BulkEmail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bulkId;
	private String receiver;
	private String subject;
	private String bulk;
	
	public BulkEmail() {
		
	}

	public BulkEmail(int bulkId, String receiver, String subject, String bulk) {
		super();
		this.bulkId = bulkId;
		this.receiver = receiver;
		this.subject = subject;
		this.bulk = bulk;
	}

	public BulkEmail(String receiver, String subject, String bulk) {
		super();
		this.receiver = receiver;
		this.subject = subject;
		this.bulk = bulk;
	}

	/**
	 * @return the bulkId
	 */
	public int getBulkId() {
		return bulkId;
	}

	/**
	 * @param bulkId the bulkId to set
	 */
	public void setBulkId(int bulkId) {
		this.bulkId = bulkId;
	}

	/**
	 * @return the receiver
	 */
	public String getReceiver() {
		return receiver;
	}

	/**
	 * @param receiver the receiver to set
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the bulk
	 */
	public String getBulk() {
		return bulk;
	}

	/**
	 * @param bulk the bulk to set
	 */
	public void setBulk(String bulk) {
		this.bulk = bulk;
	}

	@Override
	public String toString() {
		return "BulkEmail [bulkId=" + bulkId + ", receiver=" + receiver + ", subject=" + subject + ", bulk=" + bulk
				+ "]";
	}
	
	
}
