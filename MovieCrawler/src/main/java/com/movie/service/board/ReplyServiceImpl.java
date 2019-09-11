package com.movie.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.board.ReplyDTO;
import com.movie.persistence.board.BoardDAO;
import com.movie.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO rDao;
	@Inject
	private BoardDAO bDao;

	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		rDao.write(rDto);
		// 2, 게시글 댓글 +1
		int yesmap = 1;
		bDao.updateCnt(rDto.getBno(),yesmap);

	}

	@Override
	public void delete(ReplyDTO rDto) {

		rDao.delete(rDto);
		int yesmap = -1;
		bDao.updateCnt(rDto.getBno(),yesmap);
	}

}
