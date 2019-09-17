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
		// TODO 게시글 등록
		sqlSession.insert("board.write",bDto);

	}

	@Override
	public void update(BoardDTO bDto) {
		// TODO 게시글 수정
		sqlSession.update("board.update",bDto);
	}

	@Override
	public void delete(int bno) {
		// TODO 게시글 삭제
		sqlSession.delete("board.delete",bno);
	}

	@Override
	public BoardDTO read(int bno) {
		//TODO 게시글 한개 보기
		
		// selectOne : 1줄
		// selectList : 여러줄
		return sqlSession.selectOne("read", bno);
	}

	@Override
	public List<BoardDTO> listAll(HashMap<String, Object> option) {
		// TODO  게시글 전체보기(검색)
		option.put("keyword", "%" + option.get("keyword") + "%");

		return sqlSession.selectList("board.listAll", option);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO  게시글 전체보기(카운터)
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%" + keyword + "%");
		return sqlSession.selectOne("board.countArticle", map);
	}

	

	@Override
	public void updateCnt(int bno, int yesmap) {
		// TODO 댓글 카운터
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno",bno);
		map.put("yesmap",yesmap);
		sqlSession.update("board.updateCnt",map);
		
	}

	@Override
	public void deleteCnt(int bno) {
		
	}

	@Override
	public void increaseReplyCnt(int bno, int yesmap) {
		
	}

	@Override
	public void increaseCnt(int bno) {
		// TODO Auto-generated method stub
		sqlSession.update("board.increaseCnt",bno);
		
	}
	
}
