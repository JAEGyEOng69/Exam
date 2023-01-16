package kr.or.ddit.service.Impl;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ProdMapper;
import kr.or.ddit.service.BookService;
import kr.or.ddit.service.ProdService;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProdServiceImpl implements ProdService{

	@Autowired
	ProdMapper prodMapper;
	
	// 도서 목록
	@Override
	public JSONObject amtSale(){
		List<Map<String,Object>> list = this.prodMapper.amtSale();
		
//		log.info("list : "+list.get(0).toString());
		
		for(int i=0; i<list.size(); i++){
			Map<String, Object> map =list.get(i);
			log.info(map.toString());
		}
		
		// JSONObject를 만들어보자 
		JSONObject data = new JSONObject();
		
		// 1. cols 배열에 넣기
		// JSON 컬럼 객체
//		"cols":[
//				{"id":"","lable":"과일","pattern":"", "type":"string"},
//				{"id":"","lable":"수량","pattern":"", "type":"number"}
//			],

		JSONObject col1 = new JSONObject(); // 상품명(속성명)
		JSONObject col2 = new JSONObject(); // 금액(속성명)
		
		JSONArray title = new JSONArray();
		col1.put("lable", "상품명");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		/*
		 "rows":[
		{"c":[{"v" :"귤"},{"v":365615}]},
		{"c":[{"v" :"오렌지"},{"v":198118}]},
		{"c":[{"v" :"키위"},{"v":1851811}]},
		{"c":[{"v" :"포도"},{"v":111151}]},
		{"c":[{"v" :"수박"},{"v":581552}]}
		]
		 */
		// 2. rows 에 넣기
		JSONArray body = new JSONArray();
		for(Map<String, Object> map :list) {
			JSONObject prodName = new JSONObject();
			prodName.put("v", map.get("PRODNAME"));
			
			JSONObject money = new JSONObject();
			money.put("v", map.get("MONEY"));
			
			JSONArray row = new JSONArray();
			row.add(prodName);
			row.add(money);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
			
			
		}
		data.put("rows", body);
		
		return data;
		
	}

	
}
