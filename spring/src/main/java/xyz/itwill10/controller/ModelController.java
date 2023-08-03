package xyz.itwill10.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

public class ModelController {
	@RequestMapping("/display1")
	public String dispaly1(Model model) {
		model.addAttribute("name", "ȫ�浿");
		model.addAttribute("now", new SimpleDateFormat("yyyy�� MM�� dd�� HH�� mm�� ss��").format(new Date()));
		return "model_display";
	}
	
	@RequestMapping("/display2")
	public String dispaly2(Model model) {
		model.addAttribute("name", "�Ӳ���");
		model.addAttribute("now", new SimpleDateFormat("yyyy�� MM�� dd�� HH�� mm�� ss��").format(new Date()));
		return "model_display";
	}
	
	@ModelAttribute(value="now")
	public String getNow() {
		return new SimpleDateFormat("yyyy�� MM�� dd�� HH�� mm�� ss��").format(new Date());
	}
}
