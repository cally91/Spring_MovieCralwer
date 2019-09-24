package com.movie.scheduler;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.movie.service.movie.MovieService;
import com.movie.service.text.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class Scheduler {

	@Inject
	MovieService mService;

	@Inject
	ReviewService rService;

	//영화정보
	@Scheduled(cron = "20 16 10 * * *")
	public void movieCollect() throws IOException {

		mService.ticketRank();
		rService.ticketRank();

	}
	//영화평점 수집
	@Scheduled(cron = "50 26 14 * * *")
	public  void replyCollect() throws IOException{
		mService.replyMovie();
	}

}
