package com.movie.sevice.movie;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.movie.domain.movie.MovieDTO;

@Service
public interface MovieSevice {

	// 실시간 영화 순위 , 영화 제목, 영화 포스터 이미지,
	// 네이버 영화 코드, 다음 영화 코드 수집
	public List<MovieDTO> ticketRank()	throws IOException;
		
	
}
