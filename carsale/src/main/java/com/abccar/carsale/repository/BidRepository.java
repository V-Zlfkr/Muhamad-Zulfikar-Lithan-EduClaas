package com.abccar.carsale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccar.carsale.entity.Bid;

@Repository
public interface BidRepository extends JpaRepository<Bid, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM `bid` WHERE car_id = :carId ORDER BY bid_price DESC")
	public List<Bid> listBidByCarId(@Param("carId") int carId);
	
}
