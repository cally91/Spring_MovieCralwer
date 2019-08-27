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
		// 1. 데이터 수집 2. DB에 저장
		mSevice.ticketRank();
		//3. DB에서 수집한 데이터 조회
		List<MovieDTO> rankList = mSevice.movieList();
		
		//4, 수집한 데이터 vIEW 단으로 전송
		model.addAttribute("rankList", rankList);
		//5.vIEW 단이동
		return "index";
	}
}
