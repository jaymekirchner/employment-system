package com.jayme.compensation;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.jayme.employee.Employee;

@Entity(name="compensation")
@Table(name = "compensation", schema = "mydb")
public class Compensation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="compensation_type", nullable = false)
	@NotNull(message="Please select a compensation type")
	private String compensationType;
	
	@Column(name="amount", nullable = false)
	@NotBlank(message="Please provide an amount (can be negative)")
	@Pattern(regexp = "^(-*)(\\d{1,3}(\\,\\d{3})*|(\\d+))(\\.\\d{2})?$", message="Pattern must be (positive or negative) 1234 or 1234.00 or 12,345 or 12,345.00")
	private String amount;
	
	@Column(name="description")
	private String description;
	
	@Column(name="date", nullable = false)
	@NotBlank(message="Please provide a date")
	private String date; //get last date of current month
	
	@ManyToOne //(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id")
	private Employee employee;
	
	@Transient
	private String startDate;
	
	@Transient
	private String endDate;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCompensationType() {
		return compensationType;
	}

	public void setCompensationType(String compensationType) {
		this.compensationType = compensationType;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
		this.date = YearMonth.parse(date, formatter).atEndOfMonth().toString();
	}

	public Employee getEmployee() {
		return employee;
	}
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Compensation [id=");
		builder.append(id);
		builder.append(", compensationType=");
		builder.append(compensationType);
		builder.append(", amount=");
		builder.append(amount);
		builder.append(", description=");
		builder.append(description);
		builder.append(", date=");
		builder.append(date);
		builder.append(", employee=");
		builder.append(employee);
		builder.append("]");
		return builder.toString();
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		if (startDate == null || startDate.equals("")) {
			int year = LocalDate.now().getYear();
			this.startDate = LocalDate.parse(""+year+"-01-01").toString();
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
			this.startDate = YearMonth.parse(startDate, formatter).atEndOfMonth().toString();
		}
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		if (endDate == null || endDate.equals("")) {
			this.endDate = LocalDate.now().toString();
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
			this.endDate = YearMonth.parse(endDate, formatter).atEndOfMonth().toString();
		}
	}
	
}
