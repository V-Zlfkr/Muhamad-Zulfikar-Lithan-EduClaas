package com.abccar.carsale.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class WebRolesHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Collection<? extends GrantedAuthority> access = authentication.getAuthorities();
		String url = null;
		for (GrantedAuthority role : access) {
			if (role.getAuthority().equals("ADMIN")) {
				url="/home";
				break;
			}
			else if (role.getAuthority().equals("USER")) {
				url="/home";
				break;
			}
		}
		System.out.println("Role Entering " + url);
		new DefaultRedirectStrategy().sendRedirect(request, response, url);
	}
	
}
