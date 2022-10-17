package com.jayme.login;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping("/login")
	public String showLoginPage(Model model) {
		Login login = new Login();
		model.addAttribute("login", login);
		return "login-form";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("login") Login login, BindingResult bindingResult, Model model) {

		boolean isValidUser = loginService.validateUser(login.getUsername(), login.getPassword());

		if (bindingResult.hasErrors()) {
			model.addAttribute(login);
			return "login-form";

		} else if (!isValidUser) {
			model.addAttribute("errorMessage", "Invalid Credentials");
			return "login-form";

		} else {
			return "redirect:/home";
		}
	}
}
