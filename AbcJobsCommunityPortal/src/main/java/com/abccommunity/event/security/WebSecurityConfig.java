/**
 * 
 * A Config Class for web security and sites access.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	private PasswordEncoder passEncoder;
	
	@Autowired
	UserDetailsService userDetail;
	
	@Autowired
	WebRolesHandler roles;
	
	@Autowired
	WebSecurityConfig (PasswordEncoder encoder) {
		this.passEncoder = encoder;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http
			.authorizeRequests()
				.antMatchers("/","/register","/registerSuccess","/thankYou","/resetPassEmail","/resetPassEmailCode","/resetPass","/resetPassSuccess").permitAll()
				.antMatchers("/css/**","/img/**","/component/**").permitAll()
				.antMatchers("/viewAllUser","/deleteUser","/update/**", "/bulkEmail", "/jobHome", "/talentpost", "/talentpost/postjob", "/talent/deleteTalent").hasAuthority("ADMIN")
				.anyRequest()
				.authenticated()
				.and()
			.formLogin()
				.loginPage("/login").permitAll()
				.failureUrl("/login-error")
				.usernameParameter("email")
				.passwordParameter("password")
				.successHandler(roles)
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/").permitAll()
				.clearAuthentication(true)
				.invalidateHttpSession(true);
	}
	
	@Autowired
	AuthenticationProvider accessProvider() {
		DaoAuthenticationProvider securityDao = new DaoAuthenticationProvider();
		securityDao.setPasswordEncoder(passEncoder);
		securityDao.setUserDetailsService(userDetail);
		return securityDao;
	}
}
