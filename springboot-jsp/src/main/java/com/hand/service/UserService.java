package com.hand.service;


import java.util.Map;

import javax.annotation.Resource;

import com.hand.mapper.UserMapper;
import com.hand.pojo.User;
import org.springframework.stereotype.Service;



@Service
public class UserService {
	@Resource
	UserMapper userMapper;
	//注册
	public void registerUser(Map<String, Object> map) {
		userMapper.registerUser(map);
		
	}
	//登录
	public User login(Map<String, Object> map) {
		
		return userMapper.login(map);
	}
	//显示基本信息
	public Map<String, Object> showData(Map<String, Object> map) {
		
		return userMapper.showData(map);
	}
	public boolean updatedUser(Map<String, Object> map) {
		
		return userMapper. updatedUser(map);
	}

}
