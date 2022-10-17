package com.jayme.login;

import org.springframework.stereotype.Service;

@Service
public class LoginService {

	public boolean validateUser(String username, String password) {
		return username.equalsIgnoreCase("jayme") && password.equalsIgnoreCase("test");
	}
	
}
