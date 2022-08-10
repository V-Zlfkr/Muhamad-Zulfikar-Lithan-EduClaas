package com.abccar.carsale.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abccar.carsale.entity.Bid;
import com.abccar.carsale.entity.Car;
import com.abccar.carsale.entity.User;
import com.abccar.carsale.repository.UserRepository;
import com.abccar.carsale.security.WebUserDetail;
import com.abccar.carsale.service.WebService;

@Controller
public class WebController {
	
	@Autowired
	WebService webService;
	
	@GetMapping("/")
	public String index(HttpSession session) {
		session.removeAttribute("sessionUserId");
		session.removeAttribute("sessionUserRole");
		return "index";
	}
	
	@GetMapping("/home")
	public ModelAndView homePage(@AuthenticationPrincipal WebUserDetail webUserDetail,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String username = webUserDetail.getUsername();
		User user = webService.findByUsername(username);
		session.setAttribute("sessionUserId", user.getId());
		session.setAttribute("sessionUserRole", user.getRole());
		List<Car> cars = webService.listCarDataActive();
		mav.addObject("carData", cars);
		mav.setViewName("homePage");
		return mav;
	}
	
	@GetMapping("/home/search")
	public ModelAndView homePageSearch(@RequestParam("searchKey") String searchKey) {
		ModelAndView mav = new ModelAndView();
		List<Car> cars = webService.listSearchCarData(searchKey);
		mav.addObject("carData", cars);
		mav.setViewName("homePage");
		return mav;
	}
	
	@GetMapping("/registration")
	public String registration(@ModelAttribute("saveUserData") User user) {
		return "registrationPage";
	}
	
	@PostMapping("/registration/save")
	public String saveRegist(@RequestParam("email") String email,
			@RequestParam("uname") String uname,
			@ModelAttribute("saveUserData") User user,
			RedirectAttributes redirectAttributes) {
		User dataEmailOrUname = webService.findByEmailOrUname(email, uname);
		if (dataEmailOrUname != null) {
			redirectAttributes.addFlashAttribute("error", "Email or Username has already exist.");
			return "redirect:/registration";
		}
		webService.registerUserData(user);
		return "thankYouRegister";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "loginPage";
	}
	
	@GetMapping("/login-error")
	public String loginError(Model model) {
		model.addAttribute("error", "Username or Password does not exist.");
		return "loginPage";
	}
	
	@GetMapping("/post/car")
	public String postCar(@ModelAttribute("saveModelData") Car car) {
		return "postCar";
	}
	
	@PostMapping("/post/car/save")
	public String saveCar(@ModelAttribute("saveModelData") Car car,
			HttpSession session) {
		int userId = (int) session.getAttribute("sessionUserId");
		User user = webService.findUserById(userId);
		car.setUser(user);
		Car saveCarData = webService.postCarData(car);
		return "redirect:/home";
	}
	
	@GetMapping("/detail/car/{id}")
	public ModelAndView carDetail(@PathVariable("id") int id, @ModelAttribute("saveModelData") Bid bid) {
		ModelAndView mav = new ModelAndView();
		Car car = webService.findCarById(id);
		mav.addObject("carData", car);
		
		List<Bid> listBid = webService.listBidByCarId(id);
		mav.addObject("listBidData", listBid);
		
		mav.setViewName("carDetail");
		return mav;
	}
	
	@PostMapping("/detail/car/{cid}/save")
	public String saveBidCar(HttpSession session,
			@ModelAttribute("saveModelData") Bid bid,
			@PathVariable("cid") int cid) {
		int uid = (int) session.getAttribute("sessionUserId");
		User user = webService.findUserById(uid);
		Car car = webService.findCarById(cid);
		bid.setUser(user);
		bid.setCar(car);
		Bid saveBidData = webService.saveCarBid(bid);
		return "redirect:/detail/car/" + cid;
	}
	
	@GetMapping("/detail/user/{id}")
	public ModelAndView userProfile(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView();
		User user = webService.findUserById(id);
		mav.addObject("userData", user);
		mav.setViewName("userProfile"); 
		return mav;
	}
	
	@PostMapping("/detail/user/{id}/save")
	public String saveUserProfile(@PathVariable("id") int id,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname) {
		User allData = webService.findUserById(id);
		Date saveDate = new Date(System.currentTimeMillis());
		User user = new User(id, fname, lname, allData.getUname(), allData.getEmail(), allData.getPassword(), allData.getRole(), saveDate, allData.getCars());
		webService.saveUserWithoutRole(user);
		return "redirect:/detail/user/"+id;
	}
	
	@GetMapping("/list/user")
	public ModelAndView userList() {
		ModelAndView mav = new ModelAndView();
		List<User> listUser = webService.listUserData();
		mav.addObject("listData", listUser);
		mav.setViewName("userList");
		return mav;
	}
	
	@GetMapping("/list/user/search")
	public ModelAndView searchUserId(@RequestParam("searchId") int id) {
		ModelAndView mav = new ModelAndView();
		List<User> user = webService.listUserId(id);
		mav.addObject("listData", user);
		mav.setViewName("userList");
		return mav;
	}
	
	@GetMapping("/list/user/{id}/delete")
	public String deleteUser(@PathVariable("id") int uid) {
		webService.deleteUserById(uid);
		System.out.println("User has been deleted" + uid);
		return "redirect:/list/user";
	}
	
	@GetMapping("/list/carmanage")
	public ModelAndView carManage() {
		ModelAndView mav = new ModelAndView();
		List<Car> cars = webService.listCarData();
		mav.addObject("listCarData", cars);
		mav.setViewName("carAdminManage");
		return mav;
	}
	
	@GetMapping("/list/carmanage/search")
	public ModelAndView carManageSearch(@RequestParam("searchKey") int id) {
		ModelAndView mav = new ModelAndView();
		List<Car> car = webService.listSearchCarDataById(id);
		mav.addObject("listCarData", car);
		mav.setViewName("carAdminManage");
		return mav;
	}
	
	@GetMapping("/list/carmanage/{carId}/active")
	public String activateCar(@PathVariable("carId") int id) {
		String activate = "ACTIVE";
		Car car = webService.findCarById(id);
		Car activateCar = new Car(id, car.getModel(), car.getBrand(), car.getYear(), car.getPrice(), activate, car.getDescription(), car.getSaveDate(), car.getUser(), car.getBids());
		webService.saveCarDataPlain(activateCar);
		return "redirect:/list/carmanage";
	}
	
	@GetMapping("/list/carmanage/{carId}/deactive")
	public String deactivateCar(@PathVariable("carId") int id) {
		String deactivate = "DEACTIVE";
		Car car = webService.findCarById(id);
		Car deactivateCar = new Car(id, car.getModel(), car.getBrand(), car.getYear(), car.getPrice(), deactivate, car.getDescription(), car.getSaveDate(), car.getUser(), car.getBids());
		webService.saveCarDataPlain(deactivateCar);
		return "redirect:/list/carmanage";
	}
	
}
