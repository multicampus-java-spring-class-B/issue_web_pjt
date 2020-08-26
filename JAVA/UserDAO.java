package biz.user.dao;

import java.util.List;

import biz.user.vo.UserVO;

public interface UserDAO {
	UserVO login(String user_id, String pw);

	int addUser(UserVO user) throws Exception;

	int idChk(String user_id) throws Exception; //아이디 중복체크 
	
	UserVO getUser(String user_id);

	List<UserVO> getUserList();

	int updateUser(UserVO user);

	int removeUser(String user_id);

	List<UserVO> searchUser(String condition, String keyword);
}
