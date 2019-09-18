package com.movie.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.member.MemberDTO;
import com.movie.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDAO mDao;
	
	@Override
	public boolean login(MemberDTO mDto, HttpSession httpSession) {
		boolean result= mDao.loginCheck(mDto);//true or false
		if(result) {
			MemberDTO one = viewMember(mDto.getUserid());
			httpSession.setAttribute("userid", one.getUserid());
			httpSession.setAttribute("name", one.getName());
		}
		return result;
	}

	@Override
	public void logOut(HttpSession httpSession) {
		//  TODO 로그아웃, 세션을 초기화
httpSession.invalidate();
		
	}

	@Override
	public MemberDTO viewMember(String userid) {
		 return mDao.viewMember(userid);
	}

	@Override
	public int idCheck(String id) {
		// TODO 아이디 중복체크
		return mDao.idCheck(id);
	}

	

}
