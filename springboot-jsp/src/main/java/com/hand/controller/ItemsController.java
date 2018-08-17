package com.hand.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hand.pojo.User;
import com.hand.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hand.service.ItemsService;


@Controller
public class ItemsController {
	@Resource
	ItemsService itemsService;
	//显示代办事项请求
	@RequestMapping("/showTodo")
	@ResponseBody
	public List<Map<String,Object>> showTodo(@RequestParam Map<String, Object> map){
		int user_id = Integer.parseInt(map.get("user_id").toString());
		List<Map<String,Object>> itemsList = itemsService.showTodo(user_id);
		return itemsList;
	}
	//添加代办事项请求
	@RequestMapping("/items_incre")
	@ResponseBody
	public String itemsIncre(@RequestParam Map<String, Object> map,HttpServletRequest request){
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int user_id = user.getUser_id();
		System.out.println(user_id);
		map.put("user_id", user_id);
		Date date = new Date();
		date = DateUtils.getNowDate(date);
		map.put("creation_date", date);
		map.put("last_update_date", date);
		boolean flag = itemsService.itemsIncre(map);
		return "{\"result\" : " + flag + "}";
	}
	//删除代办事项请求
	@RequestMapping("/deleteItems")
	@ResponseBody
	public String deleteItems(@RequestParam Map<String, Object> map){
		int to_item_id = Integer.parseInt(map.get("to_item_id").toString());
		map.put("to_item_id",to_item_id);
		boolean flag = itemsService.deleteItems(map);
		return "{\"result\" : " + flag + "}";
	}
	//查询代办事项请求
	@RequestMapping("/searchItem")
	@ResponseBody
	public Map<String,Object> searchItem(@RequestParam Map<String, Object> map){
		int to_item_id = Integer.parseInt(map.get("to_item_id").toString());
		map.put("to_item_id",to_item_id);
		Map<String,Object> map2 = itemsService.searchItem(map);
		return map2;
	}
	//修改代办事项请求
	@RequestMapping("/updateItem")
	@ResponseBody
	public String updateItem(@RequestParam Map<String, Object> map){
		int to_item_id = Integer.parseInt(map.get("to_item_id").toString());
		map.put("to_item_id",to_item_id);
		Date date = new Date();
		date = DateUtils.getNowDate(date);
		map.put("last_update_date", date);
		boolean flag = itemsService.updateItem(map);
		return "{\"result\" : " + flag + "}";
	}
}
