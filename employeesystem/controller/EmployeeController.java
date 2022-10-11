package com.jayme.employeesystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jayme.employeesystem.entity.Employee;
import com.jayme.employeesystem.services.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;

	public EmployeeService getService() {
		return service;
	}

	public void setService(EmployeeService service) {
		this.service = service;
	}

	@RequestMapping("login")
	public String showRegistrationPage() {
		System.out.println("showRegistrationPage() activated");
		return "welcome"; //returns welcome page
	}

	@RequestMapping(value = "addNewEmployee", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("employee") Employee e, ModelMap model) {
		int result = service.save(e);
		model.addAttribute("result", "Employee Created!");
		return "addEmployee"; //message will be displayed below form
	}	
	
//	@RequestMapping("getUsers")
//	public String getUsers(ModelMap model) {
//		return "displayUsers"; //returns to this page
//	}

}
