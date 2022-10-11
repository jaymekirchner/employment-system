package com.jayme.employeesystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.jayme.employeesystem.entity.Employee;

@Repository //does all database work and needs some transactional support
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private HibernateTemplate hibernateTemplate; //UserDaoImpl depends on HibernateTemplate

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public int create(Employee e) {
		Integer result = (Integer) hibernateTemplate.save(e);
		return result;
	}
}
