package com.movie.controller.movie;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.service.movie.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("movie/*")
public class movieController {
	@Inject
	MovieService mService;
	
	@GetMapping("detail")
	public String detail(String code) {
		log.info("Datauk Oage Prinr : " + code);
		
		mService.detail(code);
		return "";
	}

}
