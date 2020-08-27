package boardlist.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import boardlist.vo.BoardListVO;

@Component("spring")
public class BoardListDAO_using_Spring implements BoardListDAO {

	@Autowired
	JdbcTemplate templete;

	@Override
	public int addPost(BoardListVO post_num) throws Exception {

		String sql = "INSERT INTO post (post_id, title, content, user_id, board_name, view_count, Wtime) "

				+ "VALUES (?,?,?,?,?,?,?)";

		return templete.update(sql, post_num.getPost_id(), post_num.getTitle(), post_num.getContent(),
				post_num.getUser_id(), post_num.getBoard_name(), post_num.getView_count(), post_num.getWtime());
	}

	@Override
	public BoardListVO getPost(int post_id) {
		String sql = "SELECT * FROM post WHERE post_id = ?";
		String sql2 = "UPDATE post SET view_count = view_count+1 WHERE post_id = ?";
		templete.update(sql2, new Object[] { post_id });

		return templete.queryForObject(sql, new Object[] { post_id }, new BoardListRowMapper());
	}

	@Override
	public List<BoardListVO> getPostList() {
		String sql = "select * from post";

		return templete.query(sql, new BoardListRowMapper());
	}

	/*
	@Override
	public List<BoardListVO> searchBoardlist(String condition, String keyword) {
		String sql = "SELECT * FROM post WHERE upper(" + condition + ") LIKE '%'||?||'%'";

		return templete.query(sql, new Object[] { keyword }, new BoardListRowMapper());

	}*/
	@Override
	public List<BoardListVO> searchBoardlist(String condition, String keyword) {
		String lowerkey = keyword.toLowerCase();
		String sql = "SELECT * FROM post WHERE Board_NAME = ? and lower(title) LIKE ?";
		return templete.query(sql,new Object[] {condition,"%"+lowerkey+"%"}, new BoardListRowMapper());
	}

	@Override
	public int updateBoardList(BoardListVO boardlist) {
		String sql = "UPDATE post SET title = ?, content = ?";

		return templete.update(sql, new Object[] { boardlist.getTitle(), boardlist.getContent() });
	}

	@Override
	public int removeBoardList(String value) {
		String sql = "DELETE FROM post WHERE title = ?";

		return templete.update(sql, new Object[] { value });
	}
	@Override
	public List<BoardListVO> getBoardNameList() {
		String sql = "SELECT * FROM board";
		return templete.query(sql, new CategoryMapper());
	}

	class BoardListRowMapper implements RowMapper<BoardListVO> {

		@Override
		public BoardListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardListVO vo = new BoardListVO();
			vo.setBoard_name(rs.getString("board_name"));
			vo.setContent(rs.getString("content"));
			vo.setPost_id(rs.getInt("post_id"));
			vo.setTitle(rs.getString("title"));
			vo.setUser_id(rs.getString("user_id"));
			vo.setView_count(rs.getInt("view_count"));
			vo.setWtime(rs.getDate("Wtime"));
			return vo;
		}

	}
	class CategoryMapper implements RowMapper<BoardListVO> {
		@Override
		public BoardListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardListVO vo = new BoardListVO();
			vo.setBoard_name(rs.getString("board_name"));
			vo.setBoard_contents(rs.getString("board_contents"));
			return vo;
		}
	}

}
