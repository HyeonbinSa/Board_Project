package com.benworld.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.benworld.domain.Criteria;
import com.benworld.domain.ReplyVO;
import com.benworld.persistence.BoardDAO;
import com.benworld.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO replydao;
	// 댓글 개수를 위해 추가 
	@Inject
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		replydao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(),1);
	}
	
	@Override
	public List<ReplyVO> listReply(int bno) throws Exception {
		return replydao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		replydao.update(vo);
	}
	@Transactional
	@Override
	public void removeReply(int rno) throws Exception {
		int bno = replydao.getBno(rno);
		replydao.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return replydao.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return replydao.count(bno);
	}
	
}
