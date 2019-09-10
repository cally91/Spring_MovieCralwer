package com.movie.service.text;

import java.beans.Transient;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.movie.domain.text.ReviewDTO;
import com.movie.persistence.text.ReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO rDao;

	String reviewUrl = "";
	int page = 1;

	String url = "";
	int movieno = 0;
	String compare = "";
	int sum = 0;

	@Override
	@Transient
	public List<ReviewDTO> ticketRank() throws IOException {

		List<ReviewDTO> reviewDTO = new ArrayList<ReviewDTO>();
		String movieUrl = "https://movie.naver.com/movie/bi/mi/basic.nhn?code=187366";
		reviewUrl = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=187366&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=";
		url = reviewUrl + page;
		
		Document movieDoc = Jsoup.connect(movieUrl).get();
		Elements movieName = movieDoc.select(" div.mv_info_area > div.mv_info > h3.h_movie >a");
		String  movie = movieName.get(0).text();
		 while (page<10) {
			Document reviewDoc = Jsoup.connect(url).get();
			Elements reviewList = reviewDoc.select("div.score_result  li");
			
			 
			for (int i = 0; i < reviewList.size(); i++) {
				 movieno= i+1;
						
				Elements geatLine = reviewList.get(i).select("dl dt em");
				String reviewdatere = geatLine.get(1).text();
				String reviewdate = reviewdatere.substring(0, reviewdatere.indexOf(" "));
				String writer2 = geatLine.get(0).text();
				String grade = reviewList.get(i).select("div.star_score > em").text();
				String review = reviewList.get(i).select("p").text();
				String writer=writer2.replace("****", "");
				
				ReviewDTO rDto = new ReviewDTO(movieno,movie,grade,review,writer,reviewdate);
				reviewDTO.add(rDto);
				rDao.write(rDto);
					
			}
			page = page + 1;
			url = reviewUrl + page;
			
		}
		return reviewDTO;
	}

}
