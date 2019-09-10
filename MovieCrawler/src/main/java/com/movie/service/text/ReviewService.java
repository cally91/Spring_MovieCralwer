package com.movie.service.text;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.movie.domain.text.ReviewDTO;

@Service
public interface ReviewService {
	public List<ReviewDTO> ticketRank() throws IOException;
	
}
