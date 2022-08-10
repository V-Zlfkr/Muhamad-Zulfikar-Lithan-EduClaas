/**
 * 
 * An Interface for executing JPA Repository and returning data from Database.
 * 
 * @author Muhamad Zulfikar
 * 
 * copyright 2022
 * 
 */
package com.abccommunity.event.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.abccommunity.event.dto.User;

public interface Repository extends JpaRepository<User, Integer>{
//	@Query(nativeQuery = true, value = "SELECT * FROM users WHERE email = ? AND password = ?")
//	User findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
	
	User findByEmail(String email);
	
	User findByUsername(String username);
}