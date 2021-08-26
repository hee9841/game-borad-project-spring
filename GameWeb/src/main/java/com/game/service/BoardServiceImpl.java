package com.game.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.domain.BoardVO;
import com.game.domain.Criteria;
import com.game.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		
		String content = boardVO.getContent().replace("\r\n", "<br>");
		boardVO.setContent(content);
		
		return boardDAO.insertBoard(boardVO);
	}

	@Override
	public List<BoardVO> selectBoards(Criteria cri) throws Exception {
		
		return boardDAO.selectBoards(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return boardDAO.countPaging(cri);
	}

	@Override
	public BoardVO selectBoard(int board_num) throws Exception {
		
		return boardDAO.selectBoard(board_num);
	}

	@Override
	public int addViews(int board_num) throws Exception {
		
		return boardDAO.addViews(board_num);
	}

	@Override
	public int deleteBoard(int board_num) throws Exception {
		
		return boardDAO.deleteBoard(board_num);
	}


	public int modifyBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.modifyBoard(boardVO);
	}

}
