package com.jayme.employee;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping({ "/", "/home" })
	public String home(Model model) {
		List<Employee> employees = employeeService.listAll();
		model.addAttribute("employees", employees);
		return "index";
	}

	/* ADD NEW EMPLOYEE */
	@RequestMapping("/add-employee")
	public String showAddEmployeeForm(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "add-employee-form";
	}

	@PostMapping("/add-employee")
	public String submitForm(@Valid @ModelAttribute("employee") Employee employee, BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			model.addAttribute(employee);
			return "add-employee-form";
		} else {
			boolean isValidDate = validateBirthDate(employee.getBirthday());
			boolean employeeExists = isNewEmployee(employee);

			if (!isValidDate) {
				model.addAttribute("errorMessage", "Birth Date cannot be later than today");
				return "add-employee-form";
			} else if (!employeeExists) {
				model.addAttribute("employeeExists",
						"Employee already exists with that full name and birth date. Please modify existing entry to make changes.");
				return "add-employee-form";
			} else {
				model.addAttribute("employee", employee);
				model.addAttribute("task", "added");
				employeeService.save(employee);
				return "success";
			}
		}
	}


	/* SEARCH EMPLOYEES */
	@RequestMapping("/search-employee")
	public String showSearchPage(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "search-employee-form";
	}

	@PostMapping("/search-employee")
	public String showSearchResults(@RequestParam(name = "firstName") String firstName,
			@RequestParam(name = "lastName") String lastName, @RequestParam(name = "position") String position,
			@ModelAttribute(name = "employee") Employee employee, Model model) {

		List<Employee> searchResults = new ArrayList<>();

		boolean first = firstName.equals("");
		boolean last = lastName.equals("");
		boolean pos = position.equals("");

		if (first && last && pos) {
			model.addAttribute("noResults", "Please enter a value to search in at least 1 field");
			return "search-employee-form";
		}

		if (!first && !last && !pos) {
			searchResults = employeeService.findByFirstNameAndLastNameAndPosition(firstName, lastName, position);
		} else if (!first && !last) {
			searchResults = employeeService.findByFirstNameAndLastName(firstName, lastName);
		} else if (!first && !pos) {
			searchResults = employeeService.findByFirstNameAndPosition(firstName, position);
		} else if (!last && !pos) {
			searchResults = employeeService.findByLastNameAndPosition(lastName, position);
		} else if (!first) {
			searchResults = employeeService.findByFirstName(firstName);
		} else if (!last) {
			searchResults = employeeService.findByLastName(lastName);
		} else if (!pos) {
			searchResults = employeeService.findByPosition(position);
		}

		if (searchResults.isEmpty()) {
			model.addAttribute("noResults", "0 results found");
			return "search-employee-form";
		} else {
			model.addAttribute("employees", searchResults);
			return "search-results";
		}
	}
	
	@RequestMapping("/view/{id}")
	public ModelAndView showViewEmployeePage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("view-employee-form");
		Employee employee = employeeService.findById(id).get();
		mav.addObject("employee", employee);
		return mav;
	}

	
	/* EDIT EMPLOYEE */
	@RequestMapping("/edit/{id}")
	public ModelAndView showEditEmployeePage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit-employee-form");
		Employee employee = employeeService.findById(id).get();
		mav.addObject("employee", employee);
		return mav;
	}

	@PostMapping("/update-employee/{id}")
	public String updateEmployee(@Valid @ModelAttribute("employee") Employee employee, BindingResult bindingResult,
			Model model, @PathVariable(name = "id") long id) {
		boolean isValidDate = validateBirthDate(employee.getBirthday());
		boolean employeeExists = isNewEmployee(employee);

		if (!isValidDate) {
			model.addAttribute("errorMessage", "Birth Date cannot be later than today");
			return "edit-employee-form";
		} else if (!employeeExists) {
			model.addAttribute("employeeExists", "Employee already exists with that full name and birth date.");
			return "edit-employee-form";
		}
		
		if (bindingResult.hasErrors()) {
			model.addAttribute(employee);
			return "edit-employee-form";
		} else {
			employeeService.save(employee);
			model.addAttribute("task", "updated");
			return "success";
		}
	}

	
	/* DELETE EMPLOYEE */
	@RequestMapping("/delete/{id}")
	public String deleteEmployee(@PathVariable(name = "id") long id) {
		employeeService.delete(id);
		return "redirect:/home";
	}

	

	private boolean validateBirthDate(String birthDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(birthDate, formatter);
		return localDate.compareTo(LocalDate.now()) < 0;
	}

	private boolean isNewEmployee(Employee employee) {
		List<Employee> employees = employeeService.findByFirstNameAndMiddleNameAndLastNameAndBirthday(
				employee.getFirstName(), employee.getMiddleName(), employee.getLastName(), employee.getBirthday());
		return employees.isEmpty();
	}
	
}
