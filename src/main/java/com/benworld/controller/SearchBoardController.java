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
import com.benworld.domain.SearchCriteria;
import com.benworld.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void registerGET(BoardVO vo, Model model)throws Exception {
		logger.info("Search register Get.........");
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo, RedirectAttributes rttr)throws Exception{
		
		logger.info("Search register Post.........");
		System.out.println(vo.toString());
		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		//pm.setTotalCount(service.listCountCriteria(cri));
		pm.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pm);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void readPage(@RequestParam("bno")int bno,@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		model.addAttribute("vo", service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno")int bno, @ModelAttribute("cri") SearchCriteria cri ,Model model) throws Exception{
		logger.info("Search Modify GET....................");
		//logger.info("cri" + cri.toString());
		model.addAttribute("vo", service.read(bno));
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO vo, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		logger.info("Search Modify Post...............");
		service.modify(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String removePaging(@RequestParam("bno")int bno, SearchCriteria cri, RedirectAttributes rttr )throws Exception{
		logger.info("Search remove  .........................");

		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/sboard/list";
	}
}
