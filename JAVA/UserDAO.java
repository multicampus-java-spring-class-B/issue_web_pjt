package biz.user.dao;

import java.util.List;

import biz.user.vo.UserVO;

public interface UserDAO {
	UserVO login(String id, String pw);

	int addUser(UserVO user) throws Exception;

	int idChk(String userid) throws Exception; //아이디 중복체크 
	
	UserVO getUser(String userid);

	List<UserVO> getUserList();

	int updateUser(UserVO user);

	int removeUser(String userid);

	List<UserVO> searchUser(String condition, String keyword);
}
