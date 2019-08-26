package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.domain.movie.MovieDTO;
import com.movie.sevice.movie.MovieSevice;

@Controller
public class IndexController {

	@Inject
	MovieSevice mSevice;

	@RequestMapping("/")
	public String index(Model model) throws IOException {
		
		List<MovieDTO> rankList = mSevice.ticketRank();
		
		model.addAttribute("rankList", rankList);
		return "index";
	}
}
