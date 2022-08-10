package com.abccar.carsale.service;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.abccar.carsale.entity.Bid;
import com.abccar.carsale.entity.Car;
import com.abccar.carsale.entity.User;

@SpringBootTest
class ServiceTest {
	
	@Autowired
	WebService webService;
	
//	@Test
//	public void registrationTest() {
//		User user = new User();
//		user.setFname("Vanessa");
//		user.setLname("Rossaria");
//		user.setUname("vrossaria");
//		user.setEmail("vanessa@gmail.com");
//		user.setPassword("rossaria");
//		webService.registerUserData(user);
//		Assertions.assertThat(user.getId()).isGreaterThan(0);
//	}
	
	@Test
	public void postCarTest() {	
		Car car = new Car();
		car.setModel("Mercedez McLaren SLR");
		car.setBrand("Mercedez Benz");
		car.setYear("2006");
		car.setPrice("2600000");
		car.setDescription("Test Description");
		webService.postCarData(car);
		Assertions.assertThat(car.getId()).isGreaterThan(0);
	}
	
//	@Test
//	public void searchCarDataTest() {
//		String searchByBrand = "Mercedez";
//		List<Car> car = webService.listSearchCarData(searchByBrand);
//		Assertions.assertThat(car).isNotEmpty();
//	}
	
//	@Test
//	public void bidCarTest() {
//		Bid bid = new Bid();
//		bid.setBidPrice(5000000);
//		webService.saveCarBid(bid);
//		Assertions.assertThat(bid.getId()).isGreaterThan(0);
//	}
	
//	@Test
//	public void updateProfileTest() {
//		User user = webService.findUserById(6);
//		user.setFname("JUnit Test Data");
//		User saveData = webService.saveUserWithoutRole(user);
//		Assertions.assertThat(saveData.getFname()).isEqualTo("JUnit Test Data");
//	}
}
