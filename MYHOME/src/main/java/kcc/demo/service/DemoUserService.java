package kcc.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kcc.demo.domain.Message;
import kcc.demo.repository.MessageRepository;

@Service
public class DemoUserService {

	@Autowired 
	MessageRepository messageRepository;
	
	

	/**
	 * @brief 사용자 등록
	 * @author : 이혜진
	 * @date :  2018. 03
	 **/
	public void insertMessage(Message message) throws Exception{
		messageRepository.save(message);
	}
	
	public List<Message> getMessage() throws Exception{
		return messageRepository.findAll();

	}
	
	
}
