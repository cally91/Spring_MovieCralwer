package com.movie.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.ReplyDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		
		return   sqlSession.selectList("reply.list",bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		log.info("write="+rDto);
		sqlSession.insert("reply.lnsert",rDto);
		
	}

	@Override
	public void delete(ReplyDTO rDto) {
		sqlSession.delete("reply.delete",rDto);
		
	}


}
