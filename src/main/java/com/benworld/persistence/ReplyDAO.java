package com.benworld.persistence;

import java.util.List;

import com.benworld.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO vo)throws Exception;
	//public void read(int rno)throws Exception;
	public void update(ReplyVO vo)throws Exception;
	public void delete(int rno)throws Exception;
}
