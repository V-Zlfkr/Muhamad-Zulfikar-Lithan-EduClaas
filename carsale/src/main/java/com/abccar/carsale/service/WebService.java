package com.abccar.carsale.service;

import java.util.List;
import java.util.Optional;

import com.abccar.carsale.entity.Bid;
import com.abccar.carsale.entity.Car;
import com.abccar.carsale.entity.User;

public interface WebService {
	public void registerUserData(User user);
	public User findByEmailOrUname(String email, String uname);
	public User findByUsername(String username);
	public User findUserById(int id);
	public User saveUserWithoutRole(User user);
	public Car postCarData(Car car);
	public List<Car> listCarData();
	public List<Car> listSearchCarData(String searchKey);
	public Car findCarById(int id);
	public Bid saveCarBid(Bid bid);
	public List<Bid> listBidByCarId(int carId);
	public List<User> listUserData();
	public List<User> listUserId(int id);
	public void deleteUserById(int id);
	public List<Car> listCarDataActive();
	public void saveCarDataPlain(Car car);
	public List<Car> listSearchCarDataById(int id);
}
