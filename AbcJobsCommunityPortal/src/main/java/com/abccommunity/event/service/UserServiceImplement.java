/**
 * 
 * A Class to implements the UserService interface and giving the methods a statement.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abccommunity.event.dto.BulkEmail;
import com.abccommunity.event.dto.JobDto;
import com.abccommunity.event.dto.User;
import com.abccommunity.event.repository.BulkRepository;
import com.abccommunity.event.repository.JobRepository;
import com.abccommunity.event.repository.Repository;

@Service("userservice")
public class UserServiceImplement implements UserService{
	
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	Repository dao;
//	List<User> webAllUser = new ArrayList<User>();
	
	@Autowired
	BulkRepository bulkDao;

	@Autowired
	JobRepository jobDao;
	
	@Autowired
	public UserServiceImplement(PasswordEncoder encoder) {
		this.passwordEncoder = encoder;
	}
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public List<User> showAllUser() {
		// TODO Auto-generated method stub
		List<User> showAllDBRecords = dao.findAll();
		return showAllDBRecords;
	}
	
	@Override
	public User showUser(String name) {
		// TODO Auto-generated method stub
		List<User> showAllDBRecords = dao.findAll();
		for (User sUser : showAllDBRecords){
			if (sUser.getLname().equals(name) ||
					sUser.getFname().equals(name) ||
					sUser.getUsername().equals(name)) {
				return sUser;
			}
		}
		return null;
	}

	@Override
	public void deleteData(int id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}

//	@Override
//	public User loginUser(String email, String password) {
//		User userLoginService = dao.findByEmailAndPassword(email, password);
//		return userLoginService;
//	}
	
	@Override
	public User loginUser(String email) {
		User userLoginService = dao.findByEmail(email);
		return userLoginService;
	}

	@Override
	public User searchUid(int id) {
		// TODO Auto-generated method stub
		Optional<User> data = dao.findById(id);
		User user = data.get();
		return user;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		dao.save(user);
	}

	@Override
	public void sendBulkEmail(String receiver, String subject, String bulk) {
		// TODO Auto-generated method stub
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo(receiver);
		mail.setText(bulk);
		mail.setSubject(subject);
		mailSender.send(mail);
		System.out.println("Email has been sent to " + receiver);
	}

	@Override
	public void addBulkDatabase(BulkEmail saveBulk) {
		// TODO Auto-generated method stub
		bulkDao.save(saveBulk);
		System.out.println("Bulk Mail has been saved in Database");
	}

	@Override
	public User searchEmail(String email) {
		// TODO Auto-generated method stub
		User data = dao.findByEmail(email);
		return data;
	}

	@Override
	public JobDto addJobOpportunity(JobDto jdto) {
		// TODO Auto-generated method stub
		jobDao.save(jdto);
		return jdto;
	}

	@Override
	public List<JobDto> showAllJob() {
		// TODO Auto-generated method stub
		List<JobDto> showJobDBRecords = jobDao.findAll();
		return showJobDBRecords;
	}

	@Override
	public JobDto searchJid(int id) {
		// TODO Auto-generated method stub
		Optional<JobDto> jobdata = jobDao.findById(id);
		JobDto jobDto = jobdata.get();
		return jobDto;
	}

	@Override
	public void deleteJobData(int id) {
		jobDao.deleteById(id);
	}
	
	@Override
	public void addUserDetail(User u) {
		// TODO Auto-generated method stub
		u.setPassword(passwordEncoder.encode(u.getPassword()));
		dao.save(u);
	}
}