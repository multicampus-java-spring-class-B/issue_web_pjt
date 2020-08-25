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
	public UserVO login(String userid, String pw) {
		// TODO Auto-generated method stub
		
		return dao.login(userid, pw);
	}

	@Override
	public int addUser(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		return dao.addUser(user);
	}

	@Override
	public UserVO getUser(String userid) {
		// TODO Auto-generated method stub
		return dao.getUser(userid);
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
	public int removeUser(String userid) {
		// TODO Auto-generated method stub
		return dao.removeUser(userid);
	}

	@Override
	public List<UserVO> searchUser(String condition, String keyword) {
		// TODO Auto-generated method stub
		return dao.searchUser(condition, keyword);
	}
	
	@Override
	public int IdChk(String userid) throws Exception {
		return dao.idChk(userid);
	}
}
