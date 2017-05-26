package org.kosta.healthin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("{viewName}.do")
	public String showView( @PathVariable String viewName ) {
		System.out.println("@PathVariable: "+viewName);
		//System.out.println("tiles View Response");
		//tilesbase 는 tiles-config.xml의 definition name이다
		// tiles config의 difinition name을 반환하면 tiles viewResolver 방식으로
		// 응답한다.
		return viewName+".tiles"; 
	}
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView( @PathVariable String dirName,@PathVariable String viewName ) {
		System.out.println("@PathVariable: "+dirName+"/"+viewName);
		//System.out.println("tiles View Response");
		//tilesbase 는 tiles-config.xml의 definition name이다
		// tiles config의 difinition name을 반환하면 tiles viewResolver 방식으로
		// 응답한다.
		return dirName+"/"+viewName+".tiles"; 
	}
	
}
