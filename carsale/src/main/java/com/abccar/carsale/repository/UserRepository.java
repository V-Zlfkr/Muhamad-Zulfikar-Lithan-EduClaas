package com.abccar.carsale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccar.carsale.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM user WHERE email = ? OR uname = ?")
	public User findByEmailOrUname(@Param("email") String email, @Param("uname") String uname);
	
	@Query(nativeQuery = true, value = "SELECT * FROM `user` WHERE id = ?")
	public List<User> listUserById(@Param("id") int id);

	public User findByUname(String username);

}
