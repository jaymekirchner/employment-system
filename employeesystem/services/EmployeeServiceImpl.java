package com.jayme.employeesystem.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jayme.employeesystem.dao.EmployeeDao;
import com.jayme.employeesystem.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao dao;

	public EmployeeDao getDao() {
		return dao;
	}

	public void setDao(EmployeeDao dao) {
		this.dao = dao;
	}

	@Override
	@Transactional // good policy to have this in the Services layer
	public int save(Employee e) {
		return dao.create(e);
	}

	
}