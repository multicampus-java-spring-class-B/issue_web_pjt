package biz.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import biz.user.vo.UserVO;

@Component("spring")
public class UserDAO_Spring implements UserDAO{

	@Autowired
	 JdbcTemplate templete; //하드코딩하지 않음

	@Override
	public UserVO login(String id, String pw) {
		System.out.println("지금 Spring으로 연동중");
		 String sql = "select * from userinfo where userid=? and userpwd=?";
		 UserVO vo = null;
		 
		 try {
			 vo = templete.queryForObject(sql,new Object[] {id,pw},new UserRowMapper());
		 } catch (Exception e) {
			 
		 }
		 
		 return vo;
	}

	@Override
	public int addUser(UserVO user) throws Exception {
		String sql = 
		"insert into userinfo (id, pw, name, phone, sex) values (?, ?, ?, ?, ?)";

		return templete.update(sql,user.getUserid(), user.getPw(), user.getName(), user.getPhone(), user.getSex());
	}

	@Override
	public UserVO getUser(String userid) {
		 String sql = "select * from userinfo where userid = ?";
		 
		return templete.queryForObject(sql,new Object[] {userid},new UserRowMapper()); //하나만 리턴하려고할때 For
	}

	@Override
	public List<UserVO> getUserList() {
		System.out.println("지금 Spring으로 연동중");
		 String sql = "select * from userinfo ";	 
		 
		 
		return templete.query(sql, new UserRowMapper());
	}

	@Override
	public int updateUser(UserVO user) {
		 String sql = "update userinfo set phone=?, sex=? "
		 		+ " where  userid  = ? ";
		 
		 

		return templete.update(sql, new Object[] {user.getPhone(), user.getSex(), user.getUserid()});
	}

	@Override
	public int removeUser(String userid) {
		 String sql = "delete from userinfo where  userid  = ? ";

		 
		 
		return templete.update(sql,new Object[] {userid});
	}

	@Override
	public List<UserVO> searchUser(String condition, String keyword) {
		System.out.println("지금 spring으로 동작중");
		String sql = "select * from userinfo where upper("+condition+") like  '%'||?||'%'";
				 
		return templete.query(sql,new Object[] {keyword} ,new UserRowMapper());
	}
	
	@Override
	public int idChk(String userid) throws Exception {
		String sql = "select count(*) from userinfo where userid = ? ";	//count가 열이름으로 부적합하다는 에러 
		int result = template.queryForObject(sql, Integer.class, userid);
		return result; 
	}

}


class UserRowMapper implements RowMapper<UserVO>{
	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO vo = new UserVO();
		vo.setUserid(rs.getString("userid"));
		vo.setPw(rs.getString("pw"));
		vo.setName(rs.getString("name"));
		vo.setPhone(rs.getString("phone"));
		vo.setSex(rs.getString("sex"));
		return vo;
	}
}










