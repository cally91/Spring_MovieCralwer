package com.movie.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.board.ReplyDTO;
import com.movie.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO rDeo;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return  rDeo.list(bno);
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
