package com.jayme;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employmentsystem") // url starts with /employmentsystem (after Application path)
public class EmployeeController {

	@Autowired
	private EmployeeRepository employeeRepository;

	@GetMapping("/signup")
	public String showSignUpForm(Employee employee) {
		return "add-employee";
	}

	@PostMapping("/addemployee")
	public String addEmployee(@Valid Employee employee, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "add-employee"; //goes back to sign-up form
		}
		
		employeeRepository.save(employee);
		return "redirect:/index";
	}

	@GetMapping("/index")
	public String showEmployeeList(Model model) {
		model.addAttribute("employees", employeeRepository.findAll());
		return "index";
	}

	@GetMapping("/edit/{id}")
	public String showUpdateForm(@PathVariable("id") long id, Model model) {
		Employee employee = employeeRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid employee Id: " + id));
		model.addAttribute("employee", employee);
		return "update-employee";
	}

	@PostMapping("/update/{id}")
	public String updateEmployee(@PathVariable("id") long id, @Valid Employee employee, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			employee.setId(id);
			return "update-employee";
		}

		employeeRepository.save(employee);
		return "redirect:/index";
	}

	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") long id, Model model) {
		Employee employee = employeeRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid employee Id: " + id));
		employeeRepository.delete(employee);
		return "redirect:/index";
	}
}
