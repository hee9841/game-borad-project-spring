package com.game.persistence;

import java.util.List;

import com.game.domain.BoardVO;
import com.game.domain.Criteria;

public interface BoardDAO {
	
	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> selectBoards(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public BoardVO selectBoard(int board_num) throws Exception;
	
	public int addViews(int board_num) throws Exception;
	
	public int deleteBoard(int board_num) throws Exception;
	
}
