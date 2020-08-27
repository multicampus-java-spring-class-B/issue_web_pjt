package boardlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import boardlist.dao.BoardListDAO;
import boardlist.vo.BoardListVO;

@Component("boardlist")
//@Service
public class BoardListServiceImpl implements BoardListService {
	@Autowired
	@Qualifier("spring")
	BoardListDAO dao;
	
	
	public BoardListServiceImpl() {
}

	
	public BoardListServiceImpl(BoardListDAO dao) {

		this.dao = dao;
	}


	@Override
	public int addPost(BoardListVO post_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.addPost(post_num);
	}

	@Override
	public BoardListVO getPost(int post_id) {
		// TODO Auto-generated method stub
		return dao.getPost(post_id);
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
	public int removeBoardList(int post_id) {
		// TODO Auto-generated method stub
		return dao.removeBoardList(post_id);
	}

	
}
