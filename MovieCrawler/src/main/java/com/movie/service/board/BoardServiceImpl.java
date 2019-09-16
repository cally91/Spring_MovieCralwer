package com.movie.service.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.board.BoardDTO;
import com.movie.persistence.board.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO bDao;

	@Override
	public void write(BoardDTO bDto) {
		// TODO Auto-generated method stub
		bDao.write(bDto);
	}

	@Override
	public void update(BoardDTO bDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDTO read(int bno, HttpSession httpSession) {
		long update_time = 0;

		if (httpSession.getAttribute("update_time_" + bno) != null) {
			// 최근에 조회수\를 올린 시간
			update_time = (long) httpSession.getAttribute("update_time_" + bno);
		}

		long current_time = System.currentTimeMillis();
		if (current_time - update_time > 24 * 60 * 60 * 1000) {
			// 해당게시글의 조회수 +1
			bDao.increaseCnt(bno);
			
			// 조회수를 증가한 시간session에 저장
			httpSession.setAttribute("update_time_"+ bno,current_time);
		}

		// 게시건 1건(상세게시글)을 조회
		return bDao.read(bno);
	}

	@Override
	public List<BoardDTO> listAll(HashMap<String, Object> option) {
//게시글에 게시글 목록을 조회
		return bDao.listAll(option);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		// 게시글파의 페이지 네이션 작업을 위해
		// 게시판 전체 Count 수를 계산
		return bDao.countArticle(search_option, keyword);
	}

}
