package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import biz.user.service.UserService;
import biz.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	/*
		login
		logout
		
		userAdd
		userUpdate
		userRemove
		userView
		ex
	 */
	
	// methodName()  일반 유저 사용
	// adminMethodName()  관리자 사용
	
	
	// 로그인화면 입장
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET) //url에 입력한 값을 가져온다. 
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/user_login");
		return mav;
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam("userid") String id, 
				  @RequestParam("pw") String pw, 
				  HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		UserVO vo = service.login(id, pw);
		if(vo != null) {  // 로그인 성공
			req.getSession().setAttribute("user", vo);
			req.getSession().setAttribute("login", vo);
			mav.setViewName("redirect:../index.jsp");
		}else {  // 로그인 실패
			req.setAttribute("msg", "로그인 실패, 로그인 정보를 확인하세요.");
			mav.setViewName("login");
		}
		return mav;
	}
	
	
	// 로그아웃
	@RequestMapping("/logout.do") 
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		req.getSession().invalidate();
		mav.setViewName("redirect::index.jsp");
		return mav;
	}
	
	// 회원가입 페이지 입장
	@RequestMapping(value = "/user/add.do", method = RequestMethod.GET)
	public ModelAndView addUser() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/user_signup");
		return mav;
	}
	
	// 회원가입. 입력 데이터 받고 post방식으로 전달
	@RequestMapping(value = "/user/add.do", method = RequestMethod.POST)
	public ModelAndView addUser(UserVO vo, HttpServletRequest req) throws Exception {
		// 동적 바인딩 하기 위해서 setter 내의 변수 이름과 <form>태그 input 이름 맞춰줄 것 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/user/list.do");
		service.addUser(vo);
		return mav;
	}
	
	// id 중복 체크 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/user/idChk")
	public int idCheck(@RequestParam("userid") String user_id) throws Exception {
		return service.IdChk(user_id);
	}
	
	// admin에서 넘어가면 모든 유저 리스트 확인 후 특정 유저의 정보 확인
	// user에서 넘어가면 자기 자신의 정보 확인
	@RequestMapping("/user/adminview.do")
	public ModelAndView adminUserView(@RequestParam("userid") String userid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", service.getUser(userid));
		mav.setViewName("user/user_view");
		return mav;
	}
	
	// user용 userView만들어야함
	@RequestMapping("/user/view.do")
	public ModelAndView userView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserVO vo = (UserVO)session.getAttribute("user");
		mav.addObject("user", service.getUser(vo.getUserid()));
		mav.setViewName("user/user_view");
		return mav;
	}

	
	// index.jsp에서 session에 저장된 유저가 admin이 아닌 일반 유저일 경우엔 바로 view.do로 가도록 <c:if>분기
	@RequestMapping("/user/list.do")
	public ModelAndView adminUserList() {
		ModelAndView mav = new ModelAndView();
		// 키값은 user_list에서 EL표기법과 맞춰줄 것
		mav.addObject("users", service.getUserList());
		mav.setViewName("user/user_list");
		return mav;
	}
	
	
	// 유저가 수행하는 회원탈퇴. 
	// admin의 유저 삭제 기능은 보류.
	@RequestMapping("/user.remove.do")
    public ModelAndView userRemove(HttpSession session) {
       ModelAndView mav = new ModelAndView();
       UserVO vo = (UserVO)session.getAttribute("user");
       service.removeUser(vo.getUserid()); 
       session.invalidate();
       
       // index설정 다시 제대로 해야함
       mav.setViewName("redirect::../../index.jsp");
       return mav;
    }
	
	// 정보 수정 화면 입장
	// admin용 userModify는 불필요. 
	// 수정 페이지로 이동만 하는 역할
	@RequestMapping("/user.modify.do")
	public ModelAndView userModify(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserVO vo = (UserVO)session.getAttribute("user");
		mav.addObject("user", service.getUser(vo.getUserid()));
		mav.setViewName("user/user_modify");
		return mav;
	}
	
	// 정보 수정 실행
	@RequestMapping("/user.update.do")
	// 자동적으로 Model에 바인딩되는 커맨드객체의 이름을 명시적으로 지정해준것
	public String userUpdate(@ModelAttribute("user") UserVO vo) {  
		service.updateUser(vo);
		return "user/user_view";
	}
	
	// 예외처리는 그대로 사용
	@ExceptionHandler(Exception.class)
	public String ex(Exception e, Model model) {
		model.addAttribute("exception", e);
		return "error";
	}
}
