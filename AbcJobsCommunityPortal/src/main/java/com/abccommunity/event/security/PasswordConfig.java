/**
 * 
 * A Class to encode incoming "characters" as a password
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PasswordConfig {
	@Bean
	public PasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder(10);
	}
}