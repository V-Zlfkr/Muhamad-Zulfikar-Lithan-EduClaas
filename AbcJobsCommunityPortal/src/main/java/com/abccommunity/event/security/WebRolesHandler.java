/**
 * 
 * A Class to handle role and which site are going to direct after login.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.abccommunity.event.dto.User;
import com.abccommunity.event.repository.Repository;

@Component
public class WebRolesHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Collection<? extends GrantedAuthority> access = authentication.getAuthorities();
		String url = null;
		for (GrantedAuthority role : access) {
			System.out.println("Accessed role is " + role);
			if (role.getAuthority().equals("ADMIN")) {
				url = "/feed";
				break;
			} else if (role.getAuthority().equals("USER")) {
				url = "/feed";
				break;
			}
		}
		System.out.println("Redirect to " + url);
		new DefaultRedirectStrategy()
			.sendRedirect(request, response, url);
	}
	
}
