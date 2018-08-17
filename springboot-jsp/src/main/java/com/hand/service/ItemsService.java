package com.hand.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hand.mapper.ItemsMapper;
import org.springframework.stereotype.Service;




@Service
public class ItemsService {
	@Resource
	ItemsMapper itemsMapper;
	//查询代办的事项
	public List<Map<String, Object>> showTodo(int user_id) {
		// TODO Auto-generated method stub
		return itemsMapper.showTodo(user_id);
	}
	//新增待办事项
	public boolean itemsIncre(Map<String, Object> map) {
		
		return itemsMapper.itemsIncre(map);
	}
	//删除代办请求
	public boolean deleteItems(Map<String, Object> map) {
		
		return itemsMapper.deleteItems(map);
	}
	public Map<String, Object> searchItem(Map<String, Object> map) {
		
		return itemsMapper.searchItem(map);
	}
	public boolean updateItem(Map<String, Object> map) {
		
		return itemsMapper.updateItem(map);
	}

}
