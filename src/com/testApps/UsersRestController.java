package com.testApps;

import java.io.Console;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.testApps.dao.User;
import com.testApps.dao.usersDAO;

@RestController
public class UsersRestController {

	@RequestMapping(value = "/users", method = RequestMethod.GET, headers = "Accept=application/json", produces = {"application/json" })
	public List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		ApplicationContext appcontext = new ClassPathXmlApplicationContext("com/testApps/beans/beans.xml");
		usersDAO userDAOInstance = (usersDAO) appcontext.getBean("usersDAO");
		users = userDAOInstance.getUsers();
		((ClassPathXmlApplicationContext)appcontext).close();
		return users;

	}
	
	
	@RequestMapping(value = "/user/create", method = RequestMethod.POST, headers = "Accept=application/json", produces = {"application/json" })
	public boolean createUser(@RequestBody User user) {
		if(user.getFirstName()==null || user.getLastName()==null || user.getDob()==null)
		{
			return false;
		}
		ApplicationContext appcontext = new ClassPathXmlApplicationContext("com/testApps/beans/beans.xml");
		usersDAO userDAOInstance = (usersDAO) appcontext.getBean("usersDAO");
		boolean isSuccess=userDAOInstance.createUser(user);
		((ClassPathXmlApplicationContext)appcontext).close();
		return isSuccess;
	}

}
