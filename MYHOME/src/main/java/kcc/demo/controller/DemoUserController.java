package kcc.demo.controller;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kcc.demo.domain.Message;
import kcc.demo.domain.MessageInput;
import kcc.demo.service.DemoUserService;

@Controller
public class DemoUserController {
	
	@Autowired
	DemoUserService demoService;

	/**
	 * @brief 사용자 페이지 조회
	 * @author : 이혜진
	 * @date :  2018. 03
	 **/
	@RequestMapping(value = "/")
	public String userList(HttpServletRequest request,Model model) {
		//ArrayList<User> userList = new ArrayList<User>();
		
		try {
			//userList=demoService.userView(authInput);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//model.addAttribute("userList", userList);
		
		return "redirect:/pickme";
	}
	
	
	@RequestMapping(value = "/pickme")
	public String indexToGo(HttpServletRequest request,Model model) {
		//ArrayList<User> userList = new ArrayList<User>();
		
		try {
			//userList=demoService.userView(authInput);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//model.addAttribute("userList", userList);
		
		return "index";
	}
	
	
	@RequestMapping(value = "/message.ajax",method=RequestMethod.POST)
	public @ResponseBody String insertUser(HttpServletRequest request,Model model, @ModelAttribute MessageInput input) {
		String result="";
		try {
			System.out.println("test");
			Message message = new Message();
			message.setMessage_id(UUID.randomUUID().toString());
			message.setMessage(input.getMessage());
			message.setName(input.getName());
			message.setPhone(input.getPhone());
			message.setEmail(input.getEmail());
			demoService.insertMessage(message);
			System.out.println("test1");
			result = "SUCCESS";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			result = "FAIL";
		}
		return result;
	}
	
	@RequestMapping(value = "/getmessage",method=RequestMethod.GET)
	public @ResponseBody List<Message> getMessage(HttpServletRequest request,Model model, @ModelAttribute MessageInput input) {
		String result="";
		List<Message> resp= new  ArrayList<Message>() ;
		try {
			resp=demoService.getMessage();
		} catch (Exception e) {
			
		}
		return resp;
	}

}
