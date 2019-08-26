package com.movie.domain.movie;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MovieDTO {

	private int rank; // 순위
	private String movie; // 영화 제목
	private String imgSrc; // 포스트이미지
	private String type; // 영화 장르
	private String openDate; //개봉일
	private String bookinRate ; //애매율
	private String runTime; // 상영시간
	private String director; //감독
	private String actor; //출연자
	private String naverCode; // 네이버 영화 코드
	private double naverScore; //네이버 평점
	private String daumCode; // 다음 영화코드
	private double daumScore; //다음 평점
}
