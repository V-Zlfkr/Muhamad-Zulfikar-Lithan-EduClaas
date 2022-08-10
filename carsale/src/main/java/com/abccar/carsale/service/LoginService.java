package com.abccar.carsale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.abccar.carsale.entity.User;
import com.abccar.carsale.repository.UserRepository;
import com.abccar.carsale.security.WebUserDetail;

@Service
public class LoginService implements UserDetailsService{
	@Autowired
	UserRepository userRepository;
	
	private User user;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		user = userRepository.findByUname(username);
		if (user == null) {
			System.out.println("Username is not valid");
			throw new UsernameNotFoundException(username);
		}
		return new WebUserDetail(user);
	}
}
