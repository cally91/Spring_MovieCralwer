package com.movie.persistence.text;

import com.movie.domain.text.ReviewDTO;

public interface ReviewDAO {
	public void write(ReviewDTO rDto);
}
