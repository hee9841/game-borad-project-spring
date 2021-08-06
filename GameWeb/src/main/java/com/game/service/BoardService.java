package com.game.service;

import java.util.List;

import com.game.domain.BoardVO;
import com.game.domain.Criteria;

public interface BoardService {

	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> selectBoards(Criteria cri) throws Exception;				// �Խ��� ��� ��������
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public BoardVO selectBoard(int board_num) throws Exception;		// �� ���� �б�
	
	public int addViews(int board_num) throws Exception;
	
	public int deleteBoard(int board_num) throws Exception;
	
}
