/**
 * 
 * A Service Class to implement UserDetailsService framework.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.abccommunity.event.dto.User;
import com.abccommunity.event.repository.Repository;
import com.abccommunity.event.security.WebUserDetail;

@Service
public class LoginService implements UserDetailsService{
	
	@Autowired
	Repository dao;
	
	User user;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		user = dao.findByEmail(email);
		if (user == null) {
			System.out.println("Email is Not Valid");
			throw new UsernameNotFoundException(email);
		}
		return new WebUserDetail(user);
	}
	
}
