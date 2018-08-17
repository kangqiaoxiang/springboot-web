package com.hand.mapper;

import java.util.List;
import java.util.Map;

public interface ItemsMapper {
	
	//查询代办事项
	List<Map<String, Object>> showTodo(int user_id);

	boolean itemsIncre(Map<String, Object> map);

	boolean deleteItems(Map<String, Object> map);

	Map<String, Object> searchItem(Map<String, Object> map);

	boolean updateItem(Map<String, Object> map);


}
