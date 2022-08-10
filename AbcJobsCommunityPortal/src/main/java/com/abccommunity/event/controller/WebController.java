/**
 * 
 * This class purpose as the "Controller" for Spring MVC
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abccommunity.event.dto.BulkEmail;
import com.abccommunity.event.dto.JobDto;
import com.abccommunity.event.dto.User;
import com.abccommunity.event.security.WebUserDetail;
import com.abccommunity.event.service.UserService;

@Controller
public class WebController {
	
	@Autowired
	UserService userservice;
	List<User> showWebAllUser = new ArrayList<User>();
	

	// Landing page map
	@GetMapping(value= "/")
	public String landPage(HttpSession session) {
		//Removing attribute after user is logout.
		session.removeAttribute("sessionValid");
		session.removeAttribute("sessionRole");
		return "index";
	}
	
	//Registration page view
	@GetMapping(value="/register")
	public String registerPage(@ModelAttribute("data") User user, HttpSession regSession) {
		regSession.removeAttribute("regData");
		return "registerPage";
	}
	
	//Registration submission function
	@PostMapping(value = "/registerSuccess")
	public String registerSuccessPage(@ModelAttribute("data") User user, HttpSession regSession) {
		regSession.setAttribute("regData", user);
		System.out.println(user);
		return "confirmEmailRegist";
	}
	
	//Thank You page view
	@GetMapping(value = "/thankYou")
	public String thankYou(@ModelAttribute("data") User user, HttpSession regSession) {
		// To add data inside the database.
		User dataPass = (User) regSession.getAttribute("regData");
		userservice.addUserDetail(dataPass);
		System.out.println("User has been registered" + dataPass);
		regSession.removeAttribute("regData");
		return "thankYouPage";
	}
	
	//Homepage View and adding session to the current user
	@GetMapping(value = "/feed")
	public String homePage(@ModelAttribute("search") User lname,
			@AuthenticationPrincipal WebUserDetail webUserDetail,
			HttpSession session) {
		String email = webUserDetail.getUsername();
		User user = userservice.loginUser(email);
		session.setAttribute("sessionValid", user.getUid());
		session.setAttribute("sessionFname", user.getFname());
		session.setAttribute("sessionLname", user.getLname());
		session.setAttribute("sessionRole", user.getRole());
		return "homePage";
	}
	
	//List all user for admin role
	@GetMapping(value = "/viewAllUser")
	public ModelAndView viewAllUser(@ModelAttribute("search") User lname) {
		List<User> showWebAllUser = userservice.showAllUser();
		System.out.println(showWebAllUser);
		return new ModelAndView("viewAllUser", "user", showWebAllUser);
	}
	
	@GetMapping(value = "/login")
	public String login(@ModelAttribute("login") User user) {
		return "loginPage";
	}
	
	//Login error map for security configuration
	@GetMapping(value = "/login-error")
	public String loginError(Model model, String errormsg) {
		errormsg="Login Failed<br>Email or Password doesn't exist.";
		model.addAttribute("error", errormsg);
		return "loginPage";
	}
	
//	@PostMapping(value = "/loginCheck")
//	public String loginUser(@ModelAttribute("login") User user,
//			HttpSession session,
//			RedirectAttributes model,
//			@RequestParam("email") String email,
//			@RequestParam("password") String password) {
//		User login=userservice.loginUser(email, password);
//		if (login == null) {
//			model.addFlashAttribute("error", "Login Failed<br>Email or Password doesn't exist.");
//			return "redirect:/login";
//		}
//		else {
//			int sessionId = login.getUid();
//			String sessionRole = login.getRole();
//			session.setAttribute("sessionValid", sessionId);
//			session.setAttribute("sessionRole", sessionRole);
//			return "redirect:/feed";
//		}
//	}
	
	@GetMapping(value = "/resetPassEmail")
	public String resetPassEmail() {
		return "resetPassEmail";
	}
	
	@PostMapping(value = "/resetPassEmailCode")
	public String resetPassEmailCode(@RequestParam("email")String email,
			HttpSession resetPassSession) {
		resetPassSession.setAttribute("resetPassEmail", email);
		return "resetPassEmailCode";
	}
	
	@GetMapping(value = "/resetPass")
	public ModelAndView resetPass(HttpSession resetPassSession) {
		String user = (String) resetPassSession.getAttribute("resetPassEmail");
		User userData= userservice.searchEmail(user);
		return new ModelAndView("resetPass", "resetPassData", userData);
	}
	
	@PostMapping (value = "/resetPassSuccess")
	public String resetPassSuccess(@RequestParam("uid") int uid,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname,
			@RequestParam("username") String username,
			@RequestParam("email") String email,
			@RequestParam("contact") String contact,
			@RequestParam("address") String address,
			@RequestParam("password") String password,
			@RequestParam("role") String role) {
		User user = new User(uid, fname, lname, username, email, address, contact, password, role);
		userservice.addUserDetail(user);
		return "resetPassSuccess";
	}
	
	//Search function of navigation bar
	@PostMapping (value = "/searchUser")
	public ModelAndView search(@ModelAttribute("search") User searchName) {
		String searchname=searchName.getLname();
		List<User> u=new ArrayList<User>();
		User userShow=userservice.showUser(searchname);
		u.add(userShow);
		return new ModelAndView("viewProfile", "singleUser", u);
	}
	
	//Delete function for admin
	@GetMapping(value = "/deleteUser")
	public String deleteUser(@RequestParam("deleteUserData") Integer uid) {
		userservice.deleteData(uid);
		return "redirect:/viewAllUser";
	}
	
	@GetMapping(value = "/update/{searchuid}")
	public ModelAndView updatePage(@PathVariable("searchuid") Integer uid, @ModelAttribute("search") User lname) {
		User userUpdate = userservice.searchUid(uid);
		return new ModelAndView("updateProfile", "updateprofile", userUpdate);
	}
	
	@GetMapping(value = "/update/dataUpdate")
	public String updateData(@RequestParam("uid") int uid,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname,
			@RequestParam("username") String username,
			@RequestParam("email") String email,
			@RequestParam("contact") String contact,
			@RequestParam("address") String address,
			@RequestParam("password") String password,
			@RequestParam("role") String role) {
		User user = new User(uid, fname, lname, username, email, address, contact, password, role);
		userservice.updateUser(user);
		return "redirect:/viewAllUser";
	}
	
	@GetMapping(value = "/userUpdate/{userId}")
	public ModelAndView userUpdate(@PathVariable("userId") Integer id, @ModelAttribute("search") User lname) {
		User getId = userservice.searchUid(id);
		return new ModelAndView("userUpdate", "updateprofile", getId);
	}
	
	@GetMapping (value = "/userUpdate/applyUpdate")
	public String applyUpdate(@RequestParam("uid") int uid,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname,
			@RequestParam("username") String username,
			@RequestParam("email") String email,
			@RequestParam("contact") String contact,
			@RequestParam("address") String address,
			@RequestParam("password") String password,
			@RequestParam("role") String role) {
		User user = new User(uid, fname, lname, username, email, address, contact, password, role);
		userservice.updateUser(user);
		String reload = "redirect:/userUpdate/" + uid;
		return reload;
	}
	
	@GetMapping (value = "/bulkEmail")
	public String bulkEmail (@ModelAttribute("search") User lname) {
		return "bulkEmail";
	}
	
	@PostMapping (value = "/sendBulk")
	public String sendBulk (@RequestParam("receiver") String receiver,
			@RequestParam("subject") String subject,
			@RequestParam("bulk") String bulk) {
		String[] emailArray = receiver.split(", ");
		for (int i = 0; i < emailArray.length; i++) {
			userservice.sendBulkEmail(emailArray[i], subject, bulk);
			BulkEmail objBulk = new BulkEmail(emailArray[i], subject, bulk);
			userservice.addBulkDatabase(objBulk);
		}
		return "redirect:/bulkEmail";
	}
	
	@GetMapping (value = "/jobHome")
	public String jobHome (@ModelAttribute("search") User lname) {
		return "jobHome";
	}

	@GetMapping (value = "/talentpost")
	public String talentpost (@ModelAttribute("postJob")JobDto jobDto,
			@ModelAttribute("search") User lname) {
		return "jobPost";
	}

	@PostMapping (value = "/talentpost/postjob")
	public String postJob(@ModelAttribute("postJob")JobDto jobDto) {
		JobDto jobObj = userservice.addJobOpportunity(jobDto);
		System.out.println(jobObj);
		return "redirect:/talentpost";
	}

	@GetMapping (value = "/talentlist")
	public ModelAndView talentList(@ModelAttribute("search") User lname) {
		List<JobDto> listJob = userservice.showAllJob();
		System.out.println(listJob);
		return new ModelAndView("jobList", "jobAttribute", listJob);
	}

	@GetMapping (value = "/talent/{jobid}")
	public ModelAndView jobDetail (@PathVariable("jobid") int job_id, @ModelAttribute("search") User lname) {
		JobDto jobDto = userservice.searchJid(job_id);
		return new ModelAndView("jobDetail", "jobdetail", jobDto);
	}

	@GetMapping (value = "/talent/deleteTalent")
	public String deleteTalent (@RequestParam("jobdelete") Integer jobid) {
		userservice.deleteJobData(jobid);
		System.out.println("Delete Job with Id = "+jobid);
		System.out.println("Job Id = " + jobid + "Has been deleted!");
		return "redirect:/talentlist";
	}
}