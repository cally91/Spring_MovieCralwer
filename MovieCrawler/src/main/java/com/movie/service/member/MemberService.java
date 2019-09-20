package com.movie.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.movie.domain.member.MemberDTO;

public interface MemberService {
	//로그인
		public boolean login(MemberDTO mDto, HttpSession httpSession);
		//로그아웃
		public void logOut(HttpSession httpSession);
		// 회원가입
		public void write(MemberDTO mDto, HttpSession httpSession) ;
		// 회원 수정
		public void update(MemberDTO mDto, HttpSession httpSession);
		// 회원삭제
		public void delete(String id, HttpSession httpSession);
		// 회원 정보 1건 검색
		public MemberDTO viewMember(String userid);
		// 비밀번호 수정
		// 현재 비밀번호 채크
		
		//AJAX :ID 중복체크
		public int idCheck(String id);
		//AJAX: 현재 PW 체크
		public int pwCheck(Map<String, String> map);
		
		
		
}
