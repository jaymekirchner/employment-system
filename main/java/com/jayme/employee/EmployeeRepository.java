package com.jayme.employee;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jayme.compensation.Compensation;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

	/* Search Methods */
	List<Employee> findByFirstName(String firstName);
	List<Employee> findByLastName(String lastName);
	List<Employee> findByPosition(String position);	
	List<Employee> findByFirstNameAndLastName(String firstName, String lastName);
	List<Employee> findByFirstNameAndPosition(String firstName, String position);
	List<Employee> findByLastNameAndPosition(String lastName, String position);
	List<Employee> findByFirstNameAndLastNameAndPosition(String firstName, String lastName, String position);

	/* Check if employee already exists */
	List<Employee> findByFirstNameAndMiddleNameAndLastNameAndBirthday(String firstName, String middleName, String lastName, String birthday);
	
}
