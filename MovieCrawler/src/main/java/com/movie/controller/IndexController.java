package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.movie.MovieDTO;
import com.movie.service.movie.MovieService;

@Controller
public class IndexController {

	@Inject
	MovieService mSercice;
	
	@RequestMapping("/")
	public String index(Model model) throws IOException {
		
		// 4. 수집한 데이터 View단으로 전송
		String sort = "booking";
		model.addAttribute("rankList",mSercice.movieList(sort));
		model.addAttribute("sort",sort);
		// 5. View단 이동
		return "index";
	}
	
	
	@GetMapping(value = "/sort")
	public String sortList(@RequestParam(defaultValue = "booktng") String sort, Model model) {
		model.addAttribute("rankList",mSercice.movieList(sort));
		model.addAttribute("sort",sort);
		return "index";
	}
	
}
