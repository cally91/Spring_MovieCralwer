package com.movie.service.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.member.MemberDTO;
import com.movie.persistence.member.MemberDAO;

@Service
public   class MemberServiceImpl implements MemberService{
	
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

	@Override
	public void write(MemberDTO mDto, HttpSession httpSession) {
			mDao.write(mDto);
	}

	@Override
	public int pwCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mDao.pwCheck(map);
	}

	@Override
	public void delete(String id,HttpSession httpSession) {
		// TODO 회원탈퇴
		//2.session값을 초기화
		int result = mDao.delete(id);
		if(result>=1) {
			httpSession.invalidate();
		}
		
	}

	@Override
	public void update(MemberDTO mDto,HttpSession httpSession) {
		// TODO 회원수정
		String userid =(String) httpSession.getAttribute("userid");
		mDto.setUserid(userid);
		int result= mDao.update(mDto);
		if(result >0) {
			httpSession.setAttribute("name", mDto.getName());
		}
		
	}

	

}
