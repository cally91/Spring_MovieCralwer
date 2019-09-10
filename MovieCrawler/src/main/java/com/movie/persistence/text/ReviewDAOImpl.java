package com.movie.persistence.text;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.text.ReviewDTO;

@Repository
public  class ReviewDAOImpl implements ReviewDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void write(ReviewDTO rDto) {
		sqlSession.insert("movie.review", rDto);
		
	}


}
