package com.jayme.compensation;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jayme.employee.Employee;

public interface CompensationRepository extends JpaRepository<Compensation, Long> {
	
	List<Compensation> findByEmployeeId(long employeeId);
	List<Compensation> findByEmployeeAndDate(Employee employee, String date);
	  
	List<Compensation> findByEmployeeIdAndCompensationTypeAndDate(long employeeId, String compensationType, String date);
	
	List<Compensation> findByEmployeeIdAndDateBetweenOrderByDateDesc(long employeeId, String startDate, String endDate);
	
//	List<Compensation> findByCompensationTypeAndDate(String compensationType, String date);
//	List<Compensation> findByCompensationType(String compensationType);
	
}
