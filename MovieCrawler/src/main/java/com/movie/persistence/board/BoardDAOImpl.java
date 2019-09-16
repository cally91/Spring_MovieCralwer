package com.movie.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void write(BoardDTO bDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("board.insert",bDto);

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
	public BoardDTO read(int bno) {
		// selectOne : 1줄
		// selectList : 여러줄
		return sqlSession.selectOne("read", bno);
	}

	@Override
	public List<BoardDTO> listAll(HashMap<String, Object> option) {
		option.put("keyword", "%" + option.get("keyword") + "%");

		return sqlSession.selectList("board.listAll", option);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%" + keyword + "%");
		return sqlSession.selectOne("board.countArticle", map);
	}

	

	@Override
	public void updateCnt(int bno, int yesmap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno",bno);
		map.put("yesmap",yesmap);
		sqlSession.update("board.updateCnt",map);
		
	}

	@Override
	public void deleteCnt(int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseReplyCnt(int bno, int yesmap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseCnt(int bno) {
		// TODO Auto-generated method stub
		sqlSession.update("board.increaseCnt",bno);
		
	}
	
}
