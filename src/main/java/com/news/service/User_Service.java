package com.news.service;


import com.news.dao.User_InfoDao;
import com.news.entity.User_Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class User_Service {


	@Autowired
	private User_InfoDao userMapper;

	public User_Info getById(Integer id) throws Exception{
		User_Info user = userMapper.SelectByid(id);
		return user;
	}



	public  User_Info getUserByName(String name)throws Exception{
		User_Info user=userMapper.SelectByName(name);
		return user;
	}



}