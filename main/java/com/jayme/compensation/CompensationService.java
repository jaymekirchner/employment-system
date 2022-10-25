package com.jayme.compensation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jayme.employee.Employee;

@Service
@Transactional
public class CompensationService {
	
	@Autowired
	private CompensationRepository repo;
	
	public List<Compensation> findCompensationByEmployeeId(long employeeId) {
		return repo.findByEmployeeId(employeeId);
	}
	
	public void save(Compensation compensation) {
		repo.save(compensation);
	}
	
	public Compensation get(long id) {
		return repo.findById(id).get();
	}
	
	public List<Compensation> findByEmployeeAndDate(Employee employee, String date) {
		return repo.findByEmployeeAndDate(employee, date);
	}

	public List<Compensation> findCompensationByEmployeeIdAndDateBetweenOrderByDateDesc(long employeeId, String startDate, String endDate) {
		return repo.findCompensationByEmployeeIdAndDateBetweenOrderByDateDesc(employeeId, startDate, endDate);
	}
	
	public List<Compensation> findByEmployeeIdAndCompensationTypeAndDate(long employeeId, String compensationType, String date) {
		return repo.findByEmployeeIdAndCompensationTypeAndDate(employeeId, compensationType, date);
	}

	public void delete(long id) {
		repo.deleteById(id);
	}
	
	public List<Compensation> findCompensationByEmployeeIdAndDateEquals(long employeeId, String date) {
		return repo.findCompensationByEmployeeIdAndDateEquals(employeeId, date);
	}
	
	
}
