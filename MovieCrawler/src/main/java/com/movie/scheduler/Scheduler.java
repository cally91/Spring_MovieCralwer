package com.movie.scheduler;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.movie.service.movie.MovieService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class Scheduler {

	@Inject
	MovieService mService;
	
	@Scheduled(cron = "0 00 12 * * *")
	public void movieCollect() throws IOException {
		
			mService.ticketRank();
		
		
	}
	
}
