package com.abccommunity.event.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abccommunity.event.dto.JobDto;

public interface JobRepository extends JpaRepository<JobDto, Integer>{

}
