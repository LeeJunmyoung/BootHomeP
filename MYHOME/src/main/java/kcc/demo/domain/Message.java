package kcc.demo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Message {
	
	@Id
	private String message_id;

	private String name="";
	
	private String email="";
	
	private String phone="";
	
	private String message="";

	
	


	public String getMessage_id() {
		return message_id;
	}

	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
