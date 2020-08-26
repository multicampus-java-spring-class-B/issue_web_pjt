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
	 JdbcTemplate template; //하드코딩하지 않음

	@Override
	public UserVO login(String user_id, String pw) {
		System.out.println("지금 Spring으로 연동중");
		 String sql = "select * from member where user_id=? and pw=?";
		 UserVO vo = null;
		 
		 try {
			 vo = template.queryForObject(sql,new Object[] {user_id,pw},new UserRowMapper());
		 } catch (Exception e) {
			 
		 }
		 
		 return vo;
	}

	@Override
	public int addUser(UserVO user) throws Exception {
		String sql = 
		"insert into member (user_id, pw, name, hp, sex) values (?, ?, ?, ?, ?)";

		return template.update(sql,user.getUser_id(), user.getPw(), user.getName(), user.getHp(), user.getSex());
	}

	@Override
	public UserVO getUser(String user_id) {
		 String sql = "select * from member where user_id = ?";
		 
		return template.queryForObject(sql,new Object[] {user_id},new UserRowMapper()); //하나만 리턴하려고할때 For
	}

	@Override
	public List<UserVO> getUserList() {
		System.out.println("지금 Spring으로 연동중");
		 String sql = "select * from member ";	 
		 
		 
		return template.query(sql, new UserRowMapper());
	}

	@Override
	public int updateUser(UserVO user) {
		 String sql = "update member set hp=?, sex=? "
		 		+ " where  user_id  = ? ";
		 
		 

		return template.update(sql, new Object[] {user.getHp(), user.getSex(), user.getUser_id()});
	}

	@Override
	public int removeUser(String user_id) {
		 String sql = "delete from member where  user_id  = ? ";

		 
		 
		return template.update(sql,new Object[] {user_id});
	}

	@Override
	public List<UserVO> searchUser(String condition, String keyword) {
		System.out.println("지금 spring으로 동작중");
		String sql = "select * from member where upper("+condition+") like  '%'||?||'%'";
				 
		return template.query(sql,new Object[] {keyword} ,new UserRowMapper());
	}
	
	@Override
	public int idChk(String user_id) throws Exception {
		String sql = "select count(*) from member where user_id = ? ";	//count가 열이름으로 부적합하다는 에러 
		int result = template.queryForObject(sql, Integer.class, user_id);
		return result; 
	}

}


class UserRowMapper implements RowMapper<UserVO>{
	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO vo = new UserVO();
		vo.setUser_id(rs.getString("user_id"));
		vo.setPw(rs.getString("pw"));
		vo.setName(rs.getString("name"));
		vo.setHp(rs.getString("hp"));
		vo.setSex(rs.getString("sex"));
		return vo;
	}
}










