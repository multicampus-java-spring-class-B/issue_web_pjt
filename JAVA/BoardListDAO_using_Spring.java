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
	public int addPost(BoardListVO boardlist) throws Exception {

		String sql = "INSERT INTO post (post_id, title, content, board_name, user_id) "

				+ "VALUES ((select nvl(max(post_id),0)+1 from post),?,?,?," + boardlist.getUser_id() + " )";

		int a = templete.update(sql, boardlist.getTitle(), boardlist.getContent(), boardlist.getBoard_name());
		System.out.println(boardlist);
		return a;
	}

	@Override
	public BoardListVO getPost(int post_id) {
		String sql = "SELECT * FROM post WHERE post_id = ?";
		
		String sql2 = "UPDATE post SET view_count = view_count+1 WHERE post_id = ?";
	      templete.update(sql2, new Object[] {post_id});

		return templete.queryForObject(sql, new Object[] {post_id}, new BoardListRowMapper());
	}

	@Override
	public List<BoardListVO> getPostList() {
		String sql = "select * from post order by post_id desc";

		return templete.query(sql, new BoardListRowMapper());
	}

	@Override
	public List<BoardListVO> searchBoardlist(String condition, String keyword) {
		String sql = "SELECT * FROM post WHERE upper(" + condition + ") LIKE '%'||?||'%'";

		return templete.query(sql, new Object[] { keyword }, new BoardListRowMapper());

	}

	@Override
	public int updateBoardList(BoardListVO boardlist) {
		String sql = "UPDATE post SET title = ?, content = ? where post_id = ?";

		return templete.update(sql, new Object[] {boardlist.getTitle(), boardlist.getContent(), boardlist.getPost_id() });
	}

	@Override
	public int removeBoardList(int post_id) {
		String sql = "DELETE FROM post WHERE post_id = ?";

		return templete.update(sql, new Object[] { post_id });
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

}
