package com.movie.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return   sqlSession.selectList("reply.list",bno);
	}

	@Override
	public void write(ReplyDTO bDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ReplyDTO bDto) {
		// TODO Auto-generated method stub
		
	}

}