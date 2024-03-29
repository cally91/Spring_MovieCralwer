package com.movie.persistence.member;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.member.MemberDTO;

@Repository
public  class MemberDAOImpl implements MemberDAO{

	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MemberDTO mDto) {
		 int count = sqlSession.selectOne("member.login",mDto);
		return (count ==1) ? true : false;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember",userid);
	}

	@Override
	public int idCheck(String id) {
		// TODO id 중복체크
		return sqlSession.selectOne("member.idCheck",id);
	}

	@Override
	public void write(MemberDTO mDto) {
		// TODO 회원가입
		sqlSession.insert("member.write",mDto);
	}

	@Override
	public int pwCheck(Map<String, String> map) {
		// TODO 현제 pw 체크
		return sqlSession.selectOne("member.pwCheck",map);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.delete",id);
	}

	@Override
	public int update(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.update",mDto);
	}
}
