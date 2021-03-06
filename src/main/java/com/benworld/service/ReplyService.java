package com.benworld.service;

import java.util.List;

import com.benworld.domain.Criteria;
import com.benworld.domain.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo)throws Exception;
	public List<ReplyVO> listReply(int bno)throws Exception;
	public void modifyReply(ReplyVO vo)throws Exception;
	public void removeReply(int rno)throws Exception;
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri)throws Exception;
	public int count(Integer bno)throws Exception;
}
