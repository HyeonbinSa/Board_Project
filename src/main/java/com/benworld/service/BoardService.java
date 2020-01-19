package com.benworld.service;

import java.util.List;

import com.benworld.domain.BoardVO;

public interface BoardService {
	public void regist(BoardVO vo)throws Exception;
	public BoardVO read(int bno)throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public void remove(int bno)throws Exception;
	public List<BoardVO> listAll()throws Exception;
}
