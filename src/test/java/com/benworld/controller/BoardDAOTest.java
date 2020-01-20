package com.benworld.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.benworld.domain.BoardVO;
import com.benworld.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void testCreate()throws Exception{
		BoardVO vo = new BoardVO();
		vo.setContent("새로운 글을 넣습니다.");
		vo.setTitle("새로운 제목을 넣습니다");
		vo.setWriter("작성자누구");
		System.out.println(vo.toString());
		dao.create(vo);
	}
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(1).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setContent("수정된 글을 넣습니다.");
		vo.setTitle("수정된 제목을 넣습니다");
		vo.setWriter("new 작성자");
		System.out.println(vo.toString());
		dao.update(vo);
	}
	@Test
	public void testDelete() throws Exception{
		dao.delete(2);
	}
	@Test
	public void testListPage() throws Exception{
		int page=3;
		List<BoardVO> list = dao.listPage(page);
		for(BoardVO vo : list) {
			logger.info(vo.getBno() + " : " + vo.getTitle());;
		}
	}
	
}
