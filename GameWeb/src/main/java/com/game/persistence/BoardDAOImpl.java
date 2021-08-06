package com.game.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.domain.BoardVO;
import com.game.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.game.mapper.boardMapper";


	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		
		return session.insert(namespace+".insertBoard", boardVO);
	}


	@Override
	public List<BoardVO> selectBoards(Criteria cri) throws Exception {
				
		return session.selectList(namespace+".selectBoards", cri);
	}


	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".countPaging", cri);
	}


	@Override
	public BoardVO selectBoard(int board_num) throws Exception {

		return session.selectOne(namespace+".selectBoard", board_num);
	}


	@Override
	public int addViews(int board_num) throws Exception {
		
		return session.update(namespace+".addViews", board_num);
	}

	@Override
	public int deleteBoard(int board_num) throws Exception {
		
		return session.delete(namespace+".deleteBoard", board_num);
	}
	
}
