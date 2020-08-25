package boardlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boardlist.dao.BoardListDAO;
import boardlist.vo.BoardListVO;

@Component("boardlist")
public class BoardListServiceImpl implements BoardListService {
	@Autowired
	BoardListDAO dao;

	@Override
	public int addPost(BoardListVO post_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.addPost(post_num);
	}

	@Override
	public BoardListVO getPost(String title) {
		// TODO Auto-generated method stub
		return dao.getPost(title);
	}

	@Override
	public List<BoardListVO> getPostList() {
		// TODO Auto-generated method stub
		return dao.getPostList();
	}

	@Override
	public List<BoardListVO> searchBoardlist(String condition, String keyword) {
		// TODO Auto-generated method stub
		return dao.searchBoardlist(condition, keyword);
	}

	@Override
	public int updateBoardList(BoardListVO boardlist) {
		// TODO Auto-generated method stub
		return dao.updateBoardList(boardlist);
	}

	@Override
	public int removeBoardList(int value) {
		// TODO Auto-generated method stub
		return dao.removeBoardList(value);
	}

	@Override
	public List<BoardListVO> getBoardNameList() {
		// TODO Auto-generated method stub
		return dao.getBoardNameList();
	}
}
