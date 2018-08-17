package com.hand.controller;


import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hand.pojo.User;
import com.hand.utils.DateUtils;
import com.hand.utils.Md5Utils;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hand.service.UserService;


@Controller
public class UserController {
	@Resource
	UserService userService;

	//展示个人信息
	@RequestMapping("/showData")
	@ResponseBody
	public Map<String, Object> showData(@RequestParam Map<String, Object> map){
		Map<String, Object> map2 = userService.showData(map);
		return map2;
	}
	//修改用户信息
	@RequestMapping("/updatedUser")
	@ResponseBody
	public String updatedUser(@RequestParam Map<String, Object> map,HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int user_id = user.getUser_id();
		map.put("user_id", user_id);
		Date date  = new Date();
		date = DateUtils.getNowDate(date);
		map.put("last_update_date", date);
		String pwd = (String) map.get("password");
		String password = Md5Utils.stringMD5(pwd).substring(0, 20);
		map.put("password",password);
		boolean flag = userService.updatedUser(map);
		return "{\"result\" : " + flag + "}";
	}
}
