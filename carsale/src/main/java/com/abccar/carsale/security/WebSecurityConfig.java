package com.abccar.carsale.security;

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
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	UserDetailsService userDetailService;
	
	@Autowired
	WebRolesHandler roles;
	
	@Autowired
	public WebSecurityConfig(PasswordEncoder encoder) {
		this.passwordEncoder = encoder;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http
			.authorizeRequests()
				.antMatchers("/", "/registration", "/registration/save").permitAll()
				.antMatchers("/css/**", "/image/**", "/js/**").permitAll()
				.antMatchers("/home/**", "/detail/car/**", "/detail/user/**").hasAnyAuthority("USER", "ADMIN")
				.antMatchers("/post/car/**").hasAuthority("USER")
				.antMatchers("/list/user/**", "/list/carmanage/**").hasAuthority("ADMIN")
				.anyRequest()
				.authenticated()
				.and()
			.formLogin()
				.loginPage("/login").permitAll()
				.failureUrl("/login-error")
				.usernameParameter("uname")
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
	AuthenticationProvider accesProvider() {
		DaoAuthenticationProvider securityDao = new DaoAuthenticationProvider();
		securityDao.setPasswordEncoder(passwordEncoder);
		securityDao.setUserDetailsService(userDetailService);
		return securityDao;
	}
	
}
