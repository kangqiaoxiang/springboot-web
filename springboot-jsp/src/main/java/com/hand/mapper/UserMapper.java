package com.hand.mapper;


import com.hand.pojo.User;

import java.util.Map;



public interface UserMapper {

	void registerUser(Map<String, Object> map);

	User login(Map<String, Object> map);

	Map<String, Object> showData(Map<String, Object> map);

	boolean updatedUser(Map<String, Object> map);

}
