package com.movie.service.member;

import javax.servlet.http.HttpSession;

import com.movie.domain.member.MemberDTO;

public interface MemberService {
	//로그인
		public boolean login(MemberDTO mDto, HttpSession httpSession);
		//로그아웃
		public void logOut(HttpSession httpSession);
		// 회원가입
		
		// 회원 수정
		// 회원삭제
		// 회원 정보 1건 검색
		public MemberDTO viewMember(String userid);
		// 비밀번호 수정
		// 현재 비밀번호 채크
		
		//AJAX :ID 중복체크
		public int idCheck(String id);
}
