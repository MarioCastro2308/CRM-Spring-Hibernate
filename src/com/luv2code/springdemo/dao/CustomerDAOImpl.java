package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	// Need to inject the session factory
	// this is a bean created on the spring-mvc-crud-demo-servlet.xml file
	@Autowired
	private SessionFactory sessionFactory;
	
	// the @Transactional annotation overrides the opening and 
	// closing of a transaction within our session
	@Override
	public List<Customer> getCustomers() {
		
		// Step 01. Get the current Hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// Step 02. Create a query
		Query<Customer> theQuery = 
				session.createQuery("from Customer order by lastName", Customer.class);
		// Step 03. Execute query and get result list
		List<Customer> customers = theQuery.getResultList();
		
		// Step 04. Return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		// Step 01. Get current Hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// Step 02. Save/update the customer
		session.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomer(int theId) {
		// Step 01. Get current Hibernate session
		Session session = sessionFactory.getCurrentSession();
		// Step 02. Retrieve the customer from database
		Customer theCustomer = session.get(Customer.class, theId);
		
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		// Step 01. Get current Hibernate session
		Session session = sessionFactory.getCurrentSession();
		// Step 03. Delete the customer
		Query theQuery = session.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", theId);
		theQuery.executeUpdate();
	}

}
