package com.movie.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.board.ReplyDTO;
import com.movie.service.board.BoardService;
import com.movie.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("reply/*")
public class ReplyController {

	@Inject
	private ReplyService rService;
	@Inject
	private BoardService bService;
	
	@GetMapping(value = "list")
	public String listAll(int bno,Model model) {
		List<ReplyDTO> list = rService.list(bno);
		
		model.addAttribute("replyList",rService.list(bno));
		return "board/commentlist";
	}
	
	@ResponseBody
	@GetMapping(value = "delete")
	public void delete(ReplyDTO rDto) {
		rService.delete(rDto);
	}
	@ResponseBody
	@PostMapping(value = "write")
	public void writw(ReplyDTO rDto, HttpSession httpSession) {
		String name= (String) httpSession.getAttribute("name");
		rDto.setWriter(name);
		rService.write(rDto);
	}
	
}
