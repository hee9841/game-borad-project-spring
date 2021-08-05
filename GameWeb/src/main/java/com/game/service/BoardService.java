package com.game.service;

import java.util.List;

import com.game.domain.BoardVO;

public interface BoardService {

	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> selectBoards() throws Exception;				// �Խ��� ��� ��������
	
	public BoardVO selectBoard(int board_num) throws Exception;		// �� ���� �б�
	
	public int addViews(int board_num) throws Exception;
	
}
