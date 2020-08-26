package biz.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import biz.user.dao.UserDAO;
import biz.user.vo.UserVO;

@Component("userservice")
public class UserServiceImpl implements UserService{

	@Autowired
	@Qualifier("spring")
	UserDAO dao;
	
	public UserServiceImpl() {}
	public UserServiceImpl(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserVO login(String user_id, String pw) {
		// TODO Auto-generated method stub
		
		return dao.login(user_id, pw);
	}

	@Override
	public int addUser(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		return dao.addUser(user);
	}

	@Override
	public UserVO getUser(String user_id) {
		// TODO Auto-generated method stub
		return dao.getUser(user_id);
	}

	@Override
	public List<UserVO> getUserList() {
		// TODO Auto-generated method stub
		return dao.getUserList();
	}

	@Override
	public int updateUser(UserVO user) {
		// TODO Auto-generated method stub
		return dao.updateUser(user);
	}

	@Override
	public int removeUser(String user_id) {
		// TODO Auto-generated method stub
		return dao.removeUser(user_id);
	}

	@Override
	public List<UserVO> searchUser(String condition, String keyword) {
		// TODO Auto-generated method stub
		return dao.searchUser(condition, keyword);
	}
	
	@Override
	public int IdChk(String user_id) throws Exception {
		return dao.idChk(user_id);
	}
}
