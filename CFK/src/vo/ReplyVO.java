package vo;

import java.sql.Date;

public class ReplyVO {

	private int reply_num;
	private String reply_content;
	private String reply_writer;
	private Date reply_date;
	private int reply_board_num;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private int board_num;
	
	
	


	public ReplyVO(int reply_num, String reply_content, String reply_writer, Date reply_date, int reply_re_ref,
			int reply_re_lev, int reply_re_seq) {
		super();
		this.reply_num = reply_num;
		this.reply_content = reply_content;
		this.reply_writer = reply_writer;
		this.reply_date = reply_date;
		this.reply_re_ref = reply_re_ref;
		this.reply_re_lev = reply_re_lev;
		this.reply_re_seq = reply_re_seq;
	}

	public ReplyVO(String reply_content, String reply_writer, Date reply_date, int reply_re_ref, int reply_re_lev,
			int reply_re_seq) {
		super();
		this.reply_content = reply_content;
		this.reply_writer = reply_writer;
		this.reply_date = reply_date;
		this.reply_re_ref = reply_re_ref;
		this.reply_re_lev = reply_re_lev;
		this.reply_re_seq = reply_re_seq;
	}

	public ReplyVO(int board_num) {
		super();
		this.board_num = board_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public ReplyVO() {
		super();
	}

	public ReplyVO(String reply_content) {
		super();
		this.reply_content = reply_content;
	}

	public ReplyVO(int reply_num, String reply_content, String reply_writer, Date reply_date, int reply_board_num,
			int reply_re_ref, int reply_re_lev, int reply_re_seq) {
		super();
		this.reply_num = reply_num;
		this.reply_content = reply_content;
		this.reply_writer = reply_writer;
		this.reply_date = reply_date;
		this.reply_board_num = reply_board_num;
		this.reply_re_ref = reply_re_ref;
		this.reply_re_lev = reply_re_lev;
		this.reply_re_seq = reply_re_seq;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getReply_board_num() {
		return reply_board_num;
	}

	public void setReply_board_num(int reply_board_num) {
		this.reply_board_num = reply_board_num;
	}

	public int getReply_re_ref() {
		return reply_re_ref;
	}

	public void setReply_re_ref(int reply_re_ref) {
		this.reply_re_ref = reply_re_ref;
	}

	public int getReply_re_lev() {
		return reply_re_lev;
	}

	public void setReply_re_lev(int reply_re_lev) {
		this.reply_re_lev = reply_re_lev;
	}

	public int getReply_re_seq() {
		return reply_re_seq;
	}

	public void setReply_re_seq(int reply_re_seq) {
		this.reply_re_seq = reply_re_seq;
	}	
	
	
	
	
	
	
}
