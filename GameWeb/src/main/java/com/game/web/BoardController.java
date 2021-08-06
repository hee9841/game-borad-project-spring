package com.game.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.game.domain.BoardVO;
import com.game.domain.Criteria;
import com.game.domain.PageMaker;
import com.game.service.BoardService;

@RequestMapping("/board/*")

@Controller
public class BoardController {

	@Inject
	private BoardService boardService;

	@RequestMapping(value = "/showList.do", method = RequestMethod.GET)
	public String readBoard(Criteria cri ,Model model, HttpSession requset) throws Exception {

		model.addAttribute("list", boardService.selectBoards(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/board/showList";
	}
	
	@RequestMapping(value="/createBoard.do", method = RequestMethod.GET)
	public String createBoardGET(Model model, HttpSession request) {
		
		return "/board/createBoard";
	}
	
	@RequestMapping(value="/createBoard.do", method = RequestMethod.POST)
	public String createBoardPOST(HttpSession request, BoardVO boardVO, Model model) throws Exception {
		
		int result = boardService.insertBoard(boardVO);
		
		return "redirect:/board/showList.do";
	}
	
	@RequestMapping(value="/readBoard.do", method = RequestMethod.GET)
	public String readBoard(HttpSession request, Criteria cri, int board_num, Model model) throws Exception {
		
		boardService.addViews(board_num);									// 조회수 1회 올리기
		
		model.addAttribute("board", boardService.selectBoard(board_num));	
		model.addAttribute("page", cri.getPage());
 		return "/board/readBoard";
	}
	
	@RequestMapping(value="/deleteBoard.do", method = RequestMethod.GET)
	public String delteBoard(int board_num, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		rttr.addFlashAttribute("success", boardService.deleteBoard(board_num));
		rttr.addAttribute("page", cri.getPage());
		
		return "redirect:/board/showList.do";
	}
}
