package org.kosta.healthin.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Resource
	private HomeService homeService;
	
	@RequestMapping("{viewName}.do")
	public String showView( @PathVariable String viewName ) {
		System.out.println("@PathVariable: "+viewName);
		//System.out.println("tiles View Response");
		//tilesbase 는 tiles-config.xml의 definition name이다
		// tiles config의 difinition name을 반환하면 tiles viewResolver 방식으로 응답한다.
		return viewName+".tiles"; 
	}
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView( @PathVariable String dirName,@PathVariable String viewName ) {
		System.out.println("@PathVariable: "+dirName+"/"+viewName);
		return dirName+"/"+viewName+".tiles"; 
	}
	
	/**
	 * Home(main) 페이지에 모든 컨텐츠들을 출력
	 * @return
	 */
	@RequestMapping("home.do")
	public ModelAndView showAllContents() {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> allContentList = homeService.getAllContentsList();
		mv.addObject("allContentList", allContentList);
		mv.setViewName("home.tiles");
		return mv;
	}
}
