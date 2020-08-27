package controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardlist.service.BoardListService;
import boardlist.vo.BoardListVO;

@Controller
public class BoardController {

	@Autowired
	BoardListService service;
	
	//MAIN_JSON
	@RequestMapping("/jsonlist.do")
	@ResponseBody //ajax서버에서 사용할 서버
	public List<BoardListVO> jsonlist() {
		return service.getBoardNameList();
	}

	// 리스트 보여주기
	@RequestMapping("/boardlist/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlists", service.getPostList());
		mav.setViewName("/boardlist/board_list");

		return mav;
	}

	@RequestMapping(value = "/boardlist/add.do", method = RequestMethod.GET)
	public String addPost() {
		return "boardlist/board_write";
	}

	// 게시글 추가
	@RequestMapping(value = "/boardlist/add.do", method = RequestMethod.POST)
	public String addBoardList(BoardListVO vo, HttpServletRequest req) throws Exception {

		service.addPost(vo);

		return "redirect:/boardlist/list.do";
	}

	// 게시물 하나를 디테일하게 보기
	@RequestMapping("/boardlist/view.do")
	public ModelAndView view(@RequestParam("post_id") int post_id) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlists", service.getPost(post_id));
		mav.setViewName("/boardlist/board_view");

		return mav;
	}

	// 게시물 삭제하기
	@RequestMapping("/boardlist/remove.do")
	public String remove(String title) {
		service.removeBoardList(title);

		return "redirect:/boardlist/list.do";
	}

	// 게시물 수정하기
	@RequestMapping("/boardlist/modify.do")
	public ModelAndView modify(@RequestParam("post_id") int post_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlists", service.getPost(post_id));
		mav.setViewName("boardlist/board_modify");

		return mav;
	}

	// 게시물 업데이트
	@RequestMapping("/boardlist/update.do")
	public ModelAndView update(@ModelAttribute("boardlist") BoardListVO vo) {
		ModelAndView mav = new ModelAndView();
		service.updateBoardList(vo);
		System.out.println(vo);
		mav.addObject("boardlists", vo);
		mav.setViewName("boardlist/board_view");

		return mav;
	}

	// error 처리
//   @ExceptionHandler(Exception.class)
//   public String ex(Exception e, Model model) {
//      model.addAttribute("Exception", e);
//      return "error";
//   }
	
		//검색해서 board_list로 넘겨줌
	@RequestMapping("/search.do")
	public ModelAndView hello(HttpServletRequest req) {
		String board_name = req.getParameter("slideindex");
		String search = req.getParameter("SearchText");
		System.out.println(board_name + search);
		List<BoardListVO> list = service.searchBoardlist(board_name, search);
		String listSize = Integer.toString(list.size());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search); //혹시몰라 이것도 넘겨줌
		mav.addObject("board_name", board_name); //혹시몰라 이것도 넘겨줌
		mav.addObject("listcnt", listSize);
		mav.addObject("boardlist", list);
		System.out.println(list);
		mav.setViewName("board");
		return mav;
	}

}
