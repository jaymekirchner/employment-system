package com.jayme.employee;

import java.time.Month;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import com.jayme.compensation.Compensation;

@Entity(name = "employee")
@Table(name = "employee", schema = "mydb")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "first_name", nullable = false)
	@NotBlank(message = "Please provide a first name")
	private String firstName;

	@Column(name = "middle_name")
	private String middleName;

	@Column(name = "last_name", nullable = false)
	@NotBlank(message = "Please provide a last name")
	private String lastName;

	@Column(name = "birthday", nullable = false)
	@NotBlank(message = "Please provide a birthday")
	private String birthday;

	@Column(name = "position", nullable = false)
	@NotBlank(message = "Please provide the employee's position")
	private String position;

	@OneToMany(mappedBy = "employee") //fetch = FetchType.LAZY,
	private List<Compensation> compensationList;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		if (middleName == null) {
			middleName = "";
		}
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public List<Compensation> getCompensationList() {
		return compensationList;
	}

	public void setCompensationList(List<Compensation> compensationList) {
		this.compensationList = compensationList;
	}

	@Override
	public int hashCode() {
		return Objects.hash(birthday, firstName, lastName, middleName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Employee)) {
			return false;
		}
		Employee other = (Employee) obj;
		return Objects.equals(birthday, other.birthday) && Objects.equals(firstName, other.firstName)
				&& Objects.equals(lastName, other.lastName) && Objects.equals(middleName, other.middleName);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Employee [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", middleName=");
		builder.append(middleName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", position=");
		builder.append(position);
		builder.append("]");
		return builder.toString();
	}

}
