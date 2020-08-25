package controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import boardlist.service.BoardListService;
import boardlist.vo.BoardListVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardListService service;
	
	//MAIN_JSON
	@RequestMapping("/jsonlist.do") //요청들어오면 key = /user/list.do value = list()
	@ResponseBody //ajax서버에서 사용할 서버
	public List<BoardListVO> jsonlist() {
		return service.getBoardNameList();
	}
	
	// 리스트 보여주기 
	@RequestMapping("/boardlist/boardlist.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(" ", service.getPostList());
		mav.setViewName("/boardlist/board_list");
		
		return mav;
	}
	
	//게시글 추가
	@RequestMapping(value = "/boardlist/add.do", method = RequestMethod.POST)
	public String addBoardList(BoardListVO vo , HttpServletRequest req) throws Exception {
	
		service.addPost(vo);
		
		return "redirect:/boardlist/boardlist.do";
	}
	
	//게시물 하나를 디테일하게 보기
	@RequestMapping("/boardlist/view.do")
	public ModelAndView view(String title) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(" ",service.getPost(title));
		mav.setViewName("/boardlist/board_view");
		
		return mav;
	}
	
	//게시물 삭제하기
	@RequestMapping("/boardlist/remove.do")
	public String remove(int post_id) {
		service.removeBoardList(post_id);
		
		return "redirect: /boardlist/board list.do";
	}
	
	//게시물 수정하기
	@RequestMapping("/boarlist/modify.do")
	public ModelAndView modify(String title) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("", service.getPost(title));
		mav.setViewName("boardlist/board_modify");
		
		return mav;
	}
	
	//게시물 업데이트
	@RequestMapping("/boardlist/update.do") 
	public String update(BoardListVO vo) {
		service.updateBoardList(vo);
		
		return "boardlist/board_view";
	}
	
	//error 처리
	@ExceptionHandler(Exception.class)
	public String ex(Exception e, Model model) {
		model.addAttribute("Exception", e);
		return "error";
	}

}
