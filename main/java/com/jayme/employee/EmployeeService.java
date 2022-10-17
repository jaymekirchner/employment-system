package com.jayme.employee;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jayme.compensation.Compensation;

@Service
@Transactional
public class EmployeeService {
	
	@Autowired
	private EmployeeRepository repo;
	
	public List<Employee> listAll() {
		return repo.findAll();
	}
	
	public void save(Employee employee) {
		repo.save(employee);
	}

	public Employee getReferenceById(long id) {
		return repo.getReferenceById(id);
	}
	
	public Employee get(long id) {
		return repo.findById(id).get();
	}
	
	public void delete(long id) {
		repo.deleteById(id);
	}

	public Optional<Employee> findById(long id) {
		return repo.findById(id);
	}
	
	public List<Employee> findByFirstNameAndMiddleNameAndLastNameAndBirthday(String firstName, String middleName, String lastName, String birthday) {
		return repo.findByFirstNameAndMiddleNameAndLastNameAndBirthday(firstName, middleName, lastName, birthday);
	}
	
	public List<Employee> findByFirstName(String firstName) {
		return repo.findByFirstName(firstName);
	}
	
	public List<Employee> findByLastName(String lastName) {
		return repo.findByLastName(lastName);
	}
	
	public List<Employee> findByPosition(String position) {
		return repo.findByPosition(position);
	}
	
	public List<Employee> findByFirstNameAndLastName(String firstName, String lastName) {
		return repo.findByFirstNameAndLastName(firstName, lastName);
	}
	
	public List<Employee> findByFirstNameAndPosition(String firstName, String position) {
		return repo.findByFirstNameAndPosition(firstName, position);
	}
	
	public List<Employee> findByLastNameAndPosition(String lastName, String position) {
		return repo.findByLastNameAndPosition(lastName, position);
	}
	
	public List<Employee> findByFirstNameAndLastNameAndPosition(String firstName, String lastName, String position) {
		return repo.findByFirstNameAndLastNameAndPosition(firstName, lastName, position);
	}
		
}
