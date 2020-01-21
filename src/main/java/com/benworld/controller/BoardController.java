package com.benworld.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.benworld.domain.BoardVO;
import com.benworld.domain.Criteria;
import com.benworld.domain.PageMaker;
import com.benworld.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	private BoardService service;
	
	// 등록 ----------------------------------------------------------------
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
	
	// 리스트 이동 ------------------------------------------------------
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("listAll get ..................");
		model.addAttribute("list", service.listAll());
	}
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pm);
	}
	@RequestMapping(value="/listCri", method = RequestMethod.GET)
	public void listCri(Criteria cri, Model model)throws Exception{
		logger.info("show list Page With Criteria.............");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	// 조회페이지 이동 ------------------------------------------------------------------
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno")int bno, Model model)throws Exception {
		model.addAttribute("vo", service.read(bno));
	}
	// 페이징 추가 
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void readPage(@RequestParam("bno")int bno,@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		model.addAttribute("vo", service.read(bno));
	}
	
	// 수정 ------------------------------------------------------------------------------
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		logger.info("modify GET....................");
		model.addAttribute("vo", service.read(bno));
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO vo, RedirectAttributes rttr)throws Exception{
		logger.info("modify Post...............");
		service.modify(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/board/listAll";
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno")int bno, @ModelAttribute("cri") Criteria cri ,Model model) throws Exception{
		logger.info("modifyPaging GET....................");
		//logger.info("cri" + cri.toString());
		model.addAttribute("vo", service.read(bno));
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO vo, RedirectAttributes rttr)throws Exception{
		logger.info("modify Post...............");
		service.modify(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/board/listPage";
	}
	// 삭제 ------------------------------------------------------------------------------------
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr)throws Exception{
		service.remove(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String removePaging(@RequestParam("bno")int bno, Criteria cri, RedirectAttributes rttr )throws Exception{
		logger.info("remove Paing .........................");

		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listPage";
	}
}
