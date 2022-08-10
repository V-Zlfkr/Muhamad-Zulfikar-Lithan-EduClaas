package com.abccommunity.event.controller;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.abccommunity.event.dto.User;
import com.abccommunity.event.repository.Repository;
import com.abccommunity.event.service.UserService;


@SpringBootTest
class QuoteRequestControllerApplicationTests {
	
	@Autowired
	UserService userservice;
	
	@Test
	void registerUser() {
		User user = new User();
		user.setFname("Diluc");
		user.setLname("Ragnvindr");
		user.setPassword("ragnvindr123");
		user.setAddress("Mondstadt");
		user.setContact("7913609");
		user.setUsername("darkknight");
		user.setEmail("ragnvindr@gmail.com");
		userservice.addUserDetail(user);
		assertThat(user).isNotEqualTo(null);
	}
	
//	@Test
//	void searchUser() {
//		User user = userservice.showUser("Zulfikar");
//		System.out.println(user);
//		assertThat(user).isNotEqualTo(null);
//	}
}
