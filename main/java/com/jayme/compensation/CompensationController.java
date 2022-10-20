package com.jayme.compensation;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.validation.Valid;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String total = getTotalAmount(compensationList);
		
		model.addAttribute("totalAmount", total);
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
		model.addAttribute("dateValue", YearMonth.now().toString());
		return "add-compensation-form";
	}

	@PostMapping("/add-compensation/{employeeId}")
	public String submitAddCompensationForm(@Valid @ModelAttribute("compensation") Compensation compensation, 
			BindingResult bindingResult, @PathVariable(name="employeeId") long employeeId, Model model) {
		
		Employee employee = compensation.getEmployee();
		String compensationType = compensation.getCompensationType();
		String description = compensation.getDescription();
		
		String date = compensation.getDate();
		int y = LocalDate.parse(date).getYear();
		int m = LocalDate.parse(date).getMonthValue();
		date = YearMonth.of(y, m).toString();
		
		if (bindingResult.hasErrors()) {
//			System.out.println("binding result has errors");
			model.addAttribute(compensation);
			model.addAttribute(employee);
			model.addAttribute("dateValue", date);
			return "add-compensation-form";
			
		} else {
			if (compensation.getDate().equals("")) {
				model.addAttribute("dateError", "Please enter a date");
				return "add-compensation-form";
			}
			
			Double compensationAmount = new Double(compensation.getAmount());
			
			if (compensationType.equals("Salary")) { 
				if(!checkSalaryDate(compensation)) {  
					model.addAttribute("dateError", "Only 1 Salary entry allowed per month");
					model.addAttribute(compensation);
					model.addAttribute(employee);
					return "add-compensation-form";
				}
			} 			
			else if (compensationType.equals("Bonus") || compensationType.equals("Commission") || compensationType.equals("Allowance")) { 
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
			else if (compensationType.equals("Adjustment")) { 
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
			model.addAttribute("employee", employee);
			model.addAttribute("task", "added");
			model.addAttribute("compensation", compensation);
			compensationService.save(compensation);
			return "success-compensation";
		}
	}

	@RequestMapping("/filter-compensation/{employeeId}")
	public String filterCompensationDetails(@PathVariable(name = "employeeId") long employeeId, Model model) {
		model.addAttribute("employee", employeeService.get(employeeId));
		model.addAttribute("compensation", new Compensation());
		model.addAttribute("dateValue", YearMonth.now().toString());
		return "search-compensation-page";
	}
	
	@PostMapping("/filter-compensation/{employeeId}")
	public String viewFilteredCompensationDetails(@PathVariable(name = "employeeId") long employeeId, 
			@ModelAttribute(name="compensation") Compensation compensation, 
			BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
//			System.out.println("binding result has errors");
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
			else {
				List<Compensation> compensationList = compensationService.findCompensationByEmployeeIdAndDateBetweenOrderByDateDesc(employeeId, start, end);
				Map<String, String> map = buildAmountsMap(compensationList, new TreeMap<>());

				model.addAttribute("employee", employeeService.get(employeeId));
				model.addAttribute(compensation);
				model.addAttribute("map", map);
				return "view-filtered-compensation";
			}
		}
	}
	
	@RequestMapping("/view-details/{employeeId}/{date}")
	public String viewCompensationBreakdownForMonth(@PathVariable("employeeId") long employeeId, @PathVariable("date") String date, Model model) {
		List<Compensation> compensationList = compensationService.findCompensationByEmployeeIdAndDateEquals(employeeId, date);
		String total = getTotalAmount(compensationList);
		Month month = LocalDate.parse(date).getMonth();
		
		model.addAttribute("totalAmount", total);
		model.addAttribute("chosenMonth", "for "+month);
		model.addAttribute("employee", employeeService.get(employeeId));
		model.addAttribute("compensationList", compensationList);
		return "view-compensation-details";
	}
	
	
	@RequestMapping("/delete-compensation/{employeeId}/{id}")
	public String deleteCompensation(@PathVariable("employeeId") long employeeId, @PathVariable(name = "id") long id) {
		compensationService.delete(id);
		return "redirect:/compensation-details/{employeeId}";
	}
	
	
	private String getTotalAmount(List<Compensation> compensationList) {
		DecimalFormat amountFormatter = new DecimalFormat("#,##0.00");
		double totalAmount = 0;
		
		for(Compensation comp : compensationList) {
			double amount = new Double(comp.getAmount());
			totalAmount += amount;
		}
		
		return amountFormatter.format(totalAmount);
		
	}
	
	private Map<String, String> buildAmountsMap(List<Compensation> compensationList, Map<String, String> map) {
		DecimalFormat amountFormatter = new DecimalFormat("#0.00");
		
		for(Compensation comp : compensationList) {
			String dt = comp.getDate();
			
			double amount = new Double(comp.getAmount());
			String currAmt = map.get(dt);
			
			if (currAmt == null || currAmt.equals("")) {
				String amt = amountFormatter.format(amount);
				map.put(dt, amt);
			} else {
				double currAmount = new Double(currAmt);
				double total = amount + currAmount;
				map.put(dt, amountFormatter.format(total));
			}
		}
		
		return map;
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
