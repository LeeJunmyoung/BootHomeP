package kcc.demo.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kcc.demo.domain.Message;
import kcc.demo.domain.MessageInput;
import kcc.demo.service.DemoUserService;


@RestController
public class Ajax {


	@Autowired
	DemoUserService demoService;

	
	@RequestMapping(value = "/message",method=RequestMethod.POST)
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
	
}
