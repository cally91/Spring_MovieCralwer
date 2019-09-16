package com.movie.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor  extends HandlerInterceptorAdapter{

	//메인 액션 실행전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO session채크 값이 있으면 통과
		// TODO 없으면 돌려보냄(원페이지로 복귀후 모달창, 경고메세지 출력
		HttpSession httpSession=request.getSession();
		if(httpSession.getAttribute("userid") ==null) {
			log.info(">> 로그인 해주세요");
			String referer= request.getHeader("referer");
			String uri =request.getRequestURI();
			int index = referer.lastIndexOf("/");
			int length = referer.length();
			String url =referer.substring(index+1,length );
//			log.info("referer: "+referer);
//			log.info("index: "+index);
//			log.info("length: "+length);
//			log.info("url: " + url);
			
			//referer값이 게시글 등록 or 수정 페이지이면
			//게시글 목록 페이지 출력!!
			if(url.equals("write")) {
				response.sendRedirect(request.getContextPath()+"/board/list");
				return false;
			}
			
			
			//Login 페이지로 이동
			//FlashMap은 1회성 데이터
			FlashMap flashMap =RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message","nologin");
			// 게시글 등록 -> 로그인 체크 ->null
			//->원페이지 이동 -> 모달창 로그인 
			//->로그인 성공 ->게시글 등록페이지 이동
			flashMap.put("uri",uri); //로그인후 페이지 주소
			FlashMapManager manager =RequestContextUtils.getFlashMapManager(request);
			
			log.info("map>>" +flashMap);
			manager.saveOutputFlashMap(flashMap, request, response);
			response.sendRedirect(referer);
			
			return false; // 못들어감, 원페이지 복귀
		}else {
			log.info(">> 통과");
			return true; //통과
		}
	}
	
	//메인 액션 실행후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}


}
