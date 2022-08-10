package com.abccommunity.event.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abccommunity.event.dto.BulkEmail;

public interface BulkRepository extends JpaRepository<BulkEmail, Integer>{
	
}