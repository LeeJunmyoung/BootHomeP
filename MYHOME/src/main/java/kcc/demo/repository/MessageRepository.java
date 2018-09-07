package kcc.demo.repository;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import kcc.demo.domain.Message;

public interface MessageRepository extends JpaRepository<Message, String>{
	
	
	/*
	List<PxeTarget2> findByIscsipk2MacOrderByIscsipk2Seq(String mac)throws Exception;
	
	@Transactional
	@Modifying
	@Query("DELETE FROM PxeTarget2 p  where p.iscsipk2.mac =:mac")
	void deleteByIscsipkMac(@Param("mac") String mac) throws Exception;
	
	@Transactional
	@Modifying
	@Query("DELETE FROM PxeTarget2 p  where p.time < timestampadd(minute, -5, now())")
	void deleteBeforeData() throws Exception;
	*/
}
