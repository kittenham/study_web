package xyz.itwill10.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.itwill10.service.RestBoardService;

@Controller
@RequestMapping("/rest")
@RequiredArgsConstructor
public class RestBoardController {
	private final RestBoardService restBoardService;
	
	//������ ��ȣ�� ���޹޾� RESTBAORD ���̺� ����� �Խñ� �� ������ ��ȣ�� ��µ� �Խñ�
	//����� �˻��Ͽ� JSON ������ ���ڿ��� �����ϴ� ��û ó�� �޼ҵ�
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restBoardList(@RequestParam(defaultValue = "1") int pageNum) {
		return restBoardService.getRestBoardList(pageNum);
		
		
	}
}