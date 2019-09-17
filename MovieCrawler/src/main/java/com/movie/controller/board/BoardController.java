package com.movie.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.domain.board.BoardDTO;
import com.movie.service.board.BoardService;
import com.movie.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/*")
public class BoardController {

	@Inject
	BoardService bService;
	
	@GetMapping(value = "write")
	public String write(@RequestParam(defaultValue = "0") int bno,Model model,HttpSession httpSession) {
		if(bno != 0) { //게시글 수정
			model.addAttribute("one", bService.read(bno));
			
		}
		return "board/write";
	}
	@PostMapping(value = "write")
	public String write(BoardDTO bDto,HttpSession session){
		log.info("bno:"+bDto.getBno());
		String name= (String) session.getAttribute("name");
		bDto.setWriter(name);
		bService.write(bDto);
		return"redirect:view?bno="+bDto.getBno();
		
		
	}
	@GetMapping(value = "delete")
	public String delete(int bno) {
		bService.delete(bno);
		return"redirect:list";
	}
	
	@GetMapping(value = "list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword
			) {
		
		// 레코드 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start= pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록
		HashMap<String, Object> option = new HashMap<>();
		option.put("start", start);
		option.put("end", end);
		option.put("sort_option", sort_option);
		option.put("search_option", search_option);
		option.put("keyword", keyword);
		List<BoardDTO> list = bService.listAll(option);
		
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list",list); // Model 데이터 전송
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		
		mav.setViewName("board/list"); // View단 jsp
		return mav;
	}
	
	@GetMapping("view")
	public String view(int bno,Model model,HttpSession httpSession) {
		// 가방
		// 값을 한개만 담고 싶다 => 변수
		// 값을 여러개해서 1줄을 담고 싶다 => DTO
		// 값을 여러줄 담고 싶다. => List
		bService.increaseCnt(bno, httpSession); //조회수 증가 처리
		BoardDTO dDto = bService.read(bno); // 상세 게시글 출력
		model.addAttribute("one",dDto);
		return "board/view";
	}
	
}
