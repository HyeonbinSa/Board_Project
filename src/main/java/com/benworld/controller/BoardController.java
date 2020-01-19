package com.benworld.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.benworld.domain.BoardVO;
import com.benworld.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void registerGET(BoardVO vo, Model model)throws Exception {
		logger.info("register Get.........");
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo, RedirectAttributes rttr)throws Exception{
		
		logger.info("register Post.........");
		System.out.println(vo.toString());
		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll";
	}
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("listAll get ..................");
		model.addAttribute("list", service.listAll());
	}
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno")int bno, Model model)throws Exception {
		model.addAttribute("vo", service.read(bno));
	}
}
