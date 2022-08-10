package com.abccar.carsale.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abccar.carsale.entity.Bid;
import com.abccar.carsale.entity.Car;
import com.abccar.carsale.entity.User;
import com.abccar.carsale.repository.BidRepository;
import com.abccar.carsale.repository.CarRepository;
import com.abccar.carsale.repository.UserRepository;

@Service("webservice")
public class WebServiceImp implements WebService{
	
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CarRepository carRepository;
	
	@Autowired
	private BidRepository bidRepository;
	
	@Autowired
	public WebServiceImp(PasswordEncoder encoder) {
		// TODO Auto-generated constructor stub
		this.passwordEncoder = encoder;
	}

	@Override
	public void registerUserData(User user) {
		// TODO Auto-generated method stub
		user.setRole("USER");
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userRepository.save(user);
	}

	@Override
	public User findByEmailOrUname(String email, String uname) {
		// TODO Auto-generated method stub
		User data = userRepository.findByEmailOrUname(email, uname);
		return data;
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		User data = userRepository.findByUname(username);
		return data;
	}

	@Override
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		Optional<User> data = userRepository.findById(id);
		User user = data.get();
		return user;
	}

	@Override
	public User saveUserWithoutRole(User user) {
		// TODO Auto-generated method stub
		User data = userRepository.save(user);
		return data;
	}

	@Override
	public Car postCarData(Car car) {
		// TODO Auto-generated method stub
		car.setStatus("ACTIVE");
		Car data = carRepository.save(car);
		return data;
	}

	@Override
	public List<Car> listCarData() {
		// TODO Auto-generated method stub
		List<Car> cars = carRepository.findAll();
		return cars;
	}

	@Override
	public List<Car> listSearchCarData(String searchKey) {
		// TODO Auto-generated method stub
		List<Car> cars = carRepository.findByBrandOrModelOrPrice(searchKey);
		return cars;
	}

	@Override
	public Car findCarById(int id) {
		// TODO Auto-generated method stub
		Optional<Car> data = carRepository.findById(id);
		Car car = data.get();
		return car;
	}

	@Override
	public Bid saveCarBid(Bid bid) {
		// TODO Auto-generated method stub
		Bid data = bidRepository.save(bid);
		return data;
	}

	@Override
	public List<Bid> listBidByCarId(int carId) {
		// TODO Auto-generated method stub
		List<Bid> data = bidRepository.listBidByCarId(carId);
		return data;
	}

	@Override
	public List<User> listUserData() {
		// TODO Auto-generated method stub
		List<User> data = userRepository.findAll();
		return data;
	}

	@Override
	public List<User> listUserId(int id) {
		// TODO Auto-generated method stub
		List<User> data = userRepository.listUserById(id);
		return data;
	}

	@Override
	public void deleteUserById(int id) {
		// TODO Auto-generated method stub
		userRepository.deleteById(id);
	}

	@Override
	public List<Car> listCarDataActive() {
		// TODO Auto-generated method stub
		List<Car> activeCar = carRepository.listCarDataActive();
		return activeCar;
	}

	@Override
	public void saveCarDataPlain(Car car) {
		// TODO Auto-generated method stub
		carRepository.save(car);
	}

	@Override
	public List<Car> listSearchCarDataById(int id) {
		// TODO Auto-generated method stub
		List<Car> car = carRepository.listSearchCarDataById(id);
		return car;
	}
	
}
