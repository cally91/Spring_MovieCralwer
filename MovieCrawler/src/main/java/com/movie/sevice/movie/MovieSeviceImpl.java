package com.movie.sevice.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.domain.movie.MovieDTO;
import com.movie.persistence.movie.MovieDAO;

@Service
public class MovieSeviceImpl implements MovieSevice {

	@Inject
	MovieDAO mDao;

	@Override
	@Transactional
	public List<MovieDTO> ticketRank() throws IOException {
		// 비즈니스로직: 네이버 ,다음 영화 정보 크롤링 DB에저장

		// 1~20위까지 영화 제목과 네이버, 다음 영화 코드 값을 저장하는 리스트
		List<MovieDTO> ranklist = new ArrayList<MovieDTO>();
		String naverRankUrl = "https://movie.naver.com/movie/running/current.nhn?order=reserve";
		String daumRankUrl = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx";
		// 네이버 영화 실시간 애매 순위 1~ 20위까지 수집
		Document naverdoc = Jsoup.connect(naverRankUrl).get();
		Elements naverList = naverdoc.select("dt.tit a");
		Elements naverImg = naverdoc.select("div.thumb a img");
		Elements scoreList = naverdoc.select("dl.lst_dsc");
		// 다음 영화 실시간 애매 순위 1~20위까지 수집
		Document daumdoc = Jsoup.connect(daumRankUrl).get();
		Elements daumList = daumdoc.select(".tit_join a");
		
		// DB에 있는 기존 영화정보데이터를 삭제!
		mDao.deleteAll();

		// 1~20위까지 영화 정보 추출
		for (int i = 0; i < 10; i++) {

			// 순위 영화 제목 포스터 이미지, 네이버 영화 코드
			int rank = i + 1;// 순위
			String movie = naverList.get(i).text(); // 영화제목
			String naverhref = naverList.get(i).attr("href");
			String naverCode = naverhref.substring(naverhref.lastIndexOf("=") + 1);// 영화 href 주소에서 Naver 고유 영화 코드 추출
			String imgSrc = naverImg.get(i).attr("src");// 포스터 이미지
			Double naverScore = Double.parseDouble(scoreList.get(i).select("span.num").first().text());
			String bookingRate = scoreList.get(i).select("span.num").last().text();

			// 다음 영화코드
			String daumHref = daumList.get(i).attr("href");
			Document detailMovie = Jsoup.connect(daumHref).get();
			String daumHrefDeep = detailMovie.select(".wrap_pbtn a").attr("href");
			String daumCode = daumHrefDeep.substring(daumHrefDeep.lastIndexOf("=") + 1);
			String daumPoint = detailMovie.select(".subject_movie em.emph_grade").text();
			Double daumScore = 0.0;
			if (!daumPoint.isEmpty()) {
				daumScore = Double.parseDouble(daumPoint);
			}
			Elements info1 = detailMovie.select("dd.txt_main");
			String type = info1.get(0).text();
			String date = info1.get(1).text();
			String openDate = date.substring(0, date.indexOf("개봉"));
			String info3 = info1.get(1).nextElementSibling().text();
			String time = info3.substring(0, info3.indexOf(","));
			String runTime = time.substring(0, time.lastIndexOf("분"));
			Elements info2 = detailMovie.select("dd.type_ellipsis");
			String director = info2.get(0).select("a").text();
			String actor = info2.get(1).select("a").text();

			MovieDTO mDto = new MovieDTO(rank, movie, imgSrc, type, openDate, bookingRate, runTime, director, actor,
					naverCode, naverScore, daumCode, daumScore);
			ranklist.add(mDto);
			
			mDao.ticketRankWrite(mDto);
		}
//			for (MovieDTO movie : ranklist) {
//				System.out.println(movie.toString());
//				
//			}
		return ranklist;
	}

	@Override
	public List<MovieDTO> movieList() {

		// DB에 저장되어 있는 실시간 영화 애매 순위 정보를
		// 가져와서 View 단으로 전송
		List<MovieDTO> rankList = mDao.movieList();

		return rankList;
	}

}
