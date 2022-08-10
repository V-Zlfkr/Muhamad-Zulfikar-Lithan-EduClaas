/**
 * 
 * An Interface to declare methods without implementation.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.service;

import java.util.List;
import java.util.Optional;

import com.abccommunity.event.dto.BulkEmail;
import com.abccommunity.event.dto.JobDto;
import com.abccommunity.event.dto.User;

public interface UserService {
	public void updateUser (User user);
	public List<User> showAllUser();
	public User showUser(String name);
	public User loginUser(String email);
	public void deleteData (int id);
	public User searchUid (int id);
	public void sendBulkEmail(String receiver, String subject, String bulk);
	public void addBulkDatabase (BulkEmail saveBulk);
	public User searchEmail (String user);
	public JobDto addJobOpportunity (JobDto jdto);
	public List<JobDto> showAllJob();
	public JobDto searchJid(int id);
	public void deleteJobData (int job_id);
	public void addUserDetail(User u);
}