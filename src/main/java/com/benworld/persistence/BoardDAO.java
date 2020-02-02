package com.benworld.persistence;

import java.util.List;

import com.benworld.domain.BoardVO;
import com.benworld.domain.Criteria;
import com.benworld.domain.SearchCriteria;

public interface BoardDAO {
	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int bno)throws Exception;
	public void update(BoardVO vo)throws Exception;
	public void delete(int bno)throws Exception;
	public List<BoardVO> listAll()throws Exception;
	public List<BoardVO> listPage(int page)throws Exception;
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	public int countPaging(Criteria cri)throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	public void updateViewCnt(Integer bno)throws Exception;
}
