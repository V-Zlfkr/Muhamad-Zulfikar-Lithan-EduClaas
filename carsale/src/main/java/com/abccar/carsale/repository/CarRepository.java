package com.abccar.carsale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccar.carsale.entity.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM car c WHERE c.brand LIKE CONCAT('%', :searchKey, '%') AND c.status = 'ACTIVE' OR c.model LIKE CONCAT('%', :searchKey, '%') AND c.status = 'ACTIVE' OR c.price LIKE CONCAT('%', :searchKey, '%') AND c.status = 'ACTIVE'")
	public List<Car> findByBrandOrModelOrPrice(@Param("searchKey") String searchKey);
	
	@Query(nativeQuery = true, value = "SELECT * FROM `car` WHERE `status` = 'ACTIVE'")
	public List<Car> listCarDataActive();
	
	@Query(nativeQuery = true, value = "SELECT * FROM `car` WHERE `id` = ?")
	public List<Car> listSearchCarDataById(@Param("searchKey") int id);
	
}
