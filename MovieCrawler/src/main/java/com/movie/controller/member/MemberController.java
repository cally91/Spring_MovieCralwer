package com.movie.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.member.MemberDTO;
import com.movie.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("member/*")
public class MemberController {

	@Inject
	MemberService mServiece;

	@PostMapping(value = "login")
	@ResponseBody
	public String login_check(MemberDTO mDto, HttpSession httpSession) {
		boolean result = mServiece.login(mDto, httpSession);
		String flag = "-1";
		if (result) {
			flag = "1";
		}
		return flag;
	}
	@PostMapping(value = "logout")
	@ResponseBody
	public void logOut(HttpSession httpSession) {
		mServiece.logOut(httpSession);
	}
	@GetMapping(value = "write")
	public String write() {
		return "member/write";
	}
	@PostMapping(value = "write")
	public String write(MemberDTO mDto,HttpSession httpSession) {
		mServiece.write(mDto, httpSession);
		return "redirect:/";
	}
	
	
	@ResponseBody
	@PostMapping("idcheck")
	public int idcheck(String id) {
		log.info("AJEX ID 중복체크 : "+id);
		return mServiece.idCheck(id);
	}
	@GetMapping(value = "delete")
	public String delete() {
		return "member/delete";
	}
	@PostMapping(value = "delete")
	public String delete(String id, HttpSession httpSession) {
		mServiece.delete(id,httpSession);
		return "redirect:/";
		
	}
	@ResponseBody
	@PostMapping("pwcheck")
	public int pwCheck(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return mServiece.pwCheck(map);
	}
}
