package com.jayme.compensation;

import java.time.LocalDate;
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

import com.jayme.employee.Employee;
import com.jayme.employee.EmployeeService;

@Controller
public class CompensationController {

	@Autowired
	CompensationService compensationService;

	@Autowired
	EmployeeService employeeService;

	@RequestMapping("/compensation-details/{employeeId}")
	public String showCompensationDetails(@PathVariable(name = "employeeId") long employeeId, Model model) {
		List<Compensation> compensationList = compensationService.findCompensationByEmployeeId(employeeId);
		model.addAttribute("employee", employeeService.get(employeeId));
		model.addAttribute("compensationList", compensationList);
		return "view-compensation-details";
	}

	@RequestMapping("/add-compensation/{employeeId}")
	public String showAddCompensationForm(@PathVariable(name = "employeeId") long employeeId, Model model) {
		Compensation compensation = new Compensation();
		model.addAttribute("compensation", compensation);
		model.addAttribute("employee", employeeService.get(employeeId));
		model.addAttribute("employeeId", employeeId);
		return "add-compensation-form";
	}

	@PostMapping("/add-compensation/{employeeId}")
	public String submitAddCompensationForm(@Valid @ModelAttribute("compensation") Compensation compensation, 
			BindingResult bindingResult, @PathVariable(name="employeeId") long employeeId, Model model) {
		
		Employee employee = compensation.getEmployee();
		String compensationType = compensation.getCompensationType();
		String description = compensation.getDescription();
		
		if (bindingResult.hasErrors()) {
			model.addAttribute(compensation);
			model.addAttribute(employee);
			return "add-compensation-form";
			
		} else {
			Double compensationAmount = new Double(compensation.getAmount());
			
			if (compensationType.equals("Salary")) { //if compensationType == salary, date restriction -- only 1 per month
				if(!checkSalaryDate(compensation)) {  //returns true if date already exists in compensationList
					model.addAttribute("dateError", "Only 1 Salary entry allowed per month");
					model.addAttribute(compensation);
					model.addAttribute(employee);
					return "add-compensation-form";
				}
			} 			
			else if (compensationType.equals("Bonus") || compensationType.equals("Commission") || compensationType.equals("Allowance")) { //if compensationType == commission, warning message that amount should be actual amount received, not %age, amount > 0, description required
				if ((compensationAmount <= 0) || (checkDescription(description))) {
					if (compensationAmount <= 0) {
						model.addAttribute("amountError", "Amount must be greater than 0");
					}
					
					if (checkDescription(description)) {
						model.addAttribute("descriptionError", "Description must be provided");
					}
				
					model.addAttribute(compensation);
					model.addAttribute(employee);
					return "add-compensation-form";
				}
			}
			else if (compensationType.equals("Adjustment")) { //if compensationType == adjustment, amount != 0, description required
				if ((compensationAmount == 0) || (checkDescription(description))) {
					if (compensationAmount == 0) {
						model.addAttribute("amountError", "Amount cannot be 0");
					}
					if (checkDescription(description)) {
						model.addAttribute("descriptionError", "Description must be provided");
					}
				
					model.addAttribute(compensation);
					model.addAttribute(employee);
					return "add-compensation-form";
				}
			}
			
			model.addAttribute("compensation", compensation);
			compensationService.save(compensation);
			return "redirect:/compensation-details/{employeeId}";
		}
	}

	@RequestMapping("/filter-compensation/{employeeId}")
	public String filterCompensationDetails(@PathVariable(name = "employeeId") long employeeId, Model model) {
		model.addAttribute("employee", employeeService.get(employeeId));
		model.addAttribute("compensation", new Compensation());
		return "search-compensation-page";
	}
	
	@PostMapping("/filter-compensation/{employeeId}")
	public String viewFilteredCompensationDetails(@PathVariable(name = "employeeId") long employeeId, 
			@ModelAttribute(name="compensation") Compensation compensation, 
			BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			System.out.println("binding result has errors");
			model.addAttribute("employee", employeeService.get(employeeId));
			model.addAttribute(compensation);
			return "search-compensation-page";
			
		} else {
			String start = compensation.getStartDate();
			String end = compensation.getEndDate();
			if (!checkStartEndDates(start, end)) {
				model.addAttribute("validDatesError", "Start date must be on or before end date");
				return "search-compensation-page";
			}
			model.addAttribute(compensation);
			return "redirect:/compensation-history/{employeeId}";
			
		}
	}
	
	
	
	
	/* DELETE COMPENSATION*/
	@RequestMapping("/delete-compensation/{employeeId}/{id}")
	public String deleteCompensation(@PathVariable("employeeId") long employeeId, @PathVariable(name = "id") long id) {
		compensationService.delete(id);
		return "redirect:/compensation-details/{employeeId}";
	}
	
	private boolean checkStartEndDates(String startDate, String endDate) {
		return LocalDate.parse(startDate).compareTo(LocalDate.parse(endDate)) <= 0;
	}
	
	private boolean checkDescription(String description) {
		return (description == null || description.equals(""));
	}

	private boolean checkSalaryDate(Compensation compensation) {
		long empId = compensation.getEmployee().getId();
		String compType = compensation.getCompensationType();
		String compDate = compensation.getDate();
		List<Compensation> compList = compensationService.findByEmployeeIdAndCompensationTypeAndDate(empId, compType, compDate);
		return compList.isEmpty();
	}

}
