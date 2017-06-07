package org.kosta.healthin.controller;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TrainerPageService;
import org.springframework.stereotype.Controller;

@Controller
public class TrainerPageController {
	@Resource
	private TrainerPageService trainerPageService;
}
