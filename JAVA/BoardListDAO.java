package boardlist.dao;

import java.util.List;

import boardlist.vo.BoardListVO;

public interface BoardListDAO {
	int addPost(BoardListVO post_num) throws Exception;
	
	BoardListVO getPost(String title);
	
	List<BoardListVO> getPostList();
	
	List<BoardListVO> searchBoardlist(String condition, String keyword);
	
	int updateBoardList(BoardListVO boardlist);
	
	int removeBoardList(int value);
	
	List<BoardListVO> getBoardNameList();
} 
