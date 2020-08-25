package boardlist.vo;

public class BoardListVO {
	int post_id;
	String title;
	String content;
	String user_id;
	String board_name;
	int view_count;
	String Wtime;
	String board_contents; //카테고리
	
	
	public String getBoard_contents() { //카테고리
		return board_contents;
	}

	public void setBoard_contents(String board_contents) { //카테고리
		this.board_contents = board_contents;
	}

	public BoardListVO() {

	}

	public BoardListVO(int post_id, String title, String content, String user_id, String board_name, int view_count,
			String wtime) {
		super();
		this.post_id = post_id;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.board_name = board_name;
		this.view_count = view_count;
		Wtime = wtime;
	}

	public String getTitle() {
		return title;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getWtime() {
		return Wtime;
	}

	public void setWtime(String wtime) {
		Wtime = wtime;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	@Override
	public String toString() {
		return "BoardListVO [post_id=" + post_id + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", board_name=" + board_name + ", view_count=" + view_count + ", Wtime=" + Wtime + "]";
	}

	
}
