package com.movie.persistence.member;

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
}
