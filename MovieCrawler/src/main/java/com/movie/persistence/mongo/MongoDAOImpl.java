package com.movie.persistence.mongo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.movie.domain.mongo.MovieReplyDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MongoDAOImpl implements MongoDAO{
	@Inject
	private MongoOperations mongoOper;
	@Override
	public void save(MovieReplyDTO mDto) {
		// TODO Auto-generated method stub
		log.info("mongoDB Save");
		mongoOper.save(mDto);
	}

	@Override
	public void findAll(String code) {
		// TODO Auto-generated method stub
		log.info("mongoDB find 실행");
//		List<MovieReplyDTO> mList=mongoOper.findAll(MovieReplyDTO.class,"movieReply");
		Criteria cri =new Criteria("code");
		cri.is(code);
		Query query =new Query(cri);
		List<MovieReplyDTO> mList =mongoOper.find(query, MovieReplyDTO.class,"MovieReply");
		
		for (MovieReplyDTO movieReplyDTO : mList) {
			log.info("제목 : " +movieReplyDTO.getMovie()
			+ ", 댓글 : " +movieReplyDTO.getContent()
			+ ", 작성자 : " +movieReplyDTO.getWriter()
			+ ", 평점 : " +movieReplyDTO.getScore());
		}
		log.info("size" + mList.size());
	}

}
