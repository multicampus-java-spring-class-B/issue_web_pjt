package biz.user.service;

import java.util.List;

import biz.user.vo.UserVO;

public interface UserService {
	   UserVO login(String user_id,String pw);
	   
	   int addUser(UserVO user) throws Exception;
	
	   int IdChk(String user_id) throws Exception;   
	
	   UserVO getUser(String user_id);
	   
	   List<UserVO> getUserList();
	   
	   int updateUser(UserVO user);
	   
	   int removeUser(String user_id);
	   
	   List<UserVO> searchUser(String condition,String keyword);
}
