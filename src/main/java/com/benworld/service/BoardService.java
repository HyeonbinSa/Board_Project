package com.benworld.service;

import java.util.List;

import com.benworld.domain.BoardVO;
import com.benworld.domain.Criteria;
import com.benworld.domain.SearchCriteria;

public interface BoardService {
	public void regist(BoardVO vo)throws Exception;
	public BoardVO read(int bno)throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public void remove(int bno)throws Exception;
	public List<BoardVO> listAll()throws Exception;
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
