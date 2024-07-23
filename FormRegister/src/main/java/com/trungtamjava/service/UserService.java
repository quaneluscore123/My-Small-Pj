package com.trungtamjava.service;

import java.util.List;

import com.trungtamjava.dao.UserDao;
import com.trungtamjava.model.User;

public class UserService {
	
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public List<User> getAllUser(){
		return userDao.getAllUsers();
	}
	
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}
	
}
