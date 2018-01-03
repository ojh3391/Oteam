package board.vo;

import java.sql.Date;

public class BoardVO
{
	private int board_num;
	private String board_subject;
	private String board_content;
	private String board_file;
	private String board_real_file;
	private String board_thumbnail;
	private String board_writer;
	private int board_vote;
	private int board_readcount;
	private Date board_date;
	
	
	


	public BoardVO(int board_num, String board_subject, String board_thumbnail, String board_writer, int board_vote,
			int board_readcount, Date board_date) {
		super();
		this.board_num = board_num;
		this.board_subject = board_subject;
		this.board_thumbnail = board_thumbnail;
		this.board_writer = board_writer;
		this.board_vote = board_vote;
		this.board_readcount = board_readcount;
		this.board_date = board_date;
	}


	public BoardVO()
	{
		super();
		
	}
	
	
	public int getBoard_num()
	{
		return board_num;
	}
	public void setBoard_num(int board_num)
	{
		this.board_num = board_num;
	}
	public String getBoard_subject()
	{
		return board_subject;
	}
	public void setBoard_subject(String board_subject)
	{
		this.board_subject = board_subject;
	}
	public String getBoard_content()
	{
		return board_content;
	}
	public void setBoard_content(String board_content)
	{
		this.board_content = board_content;
	}
	public String getBoard_file()
	{
		return board_file;
	}
	public void setBoard_file(String board_file)
	{
		this.board_file = board_file;
	}
	public String getBoard_real_file()
	{
		return board_real_file;
	}
	public void setBoard_real_file(String board_real_file)
	{
		this.board_real_file = board_real_file;
	}
	public String getBoard_thumbnail()
	{
		return board_thumbnail;
	}
	public void setBoard_thumbnail(String board_thumnail)
	{
		this.board_thumbnail = board_thumnail;
	}
	public String getBoard_writer()
	{
		return board_writer;
	}
	public void setBoard_writer(String board_writer)
	{
		this.board_writer = board_writer;
	}
	public int getBoard_vote()
	{
		return board_vote;
	}
	public void setBoard_vote(int board_vote)
	{
		this.board_vote = board_vote;
	}
	public int getBoard_readcount()
	{
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount)
	{
		this.board_readcount = board_readcount;
	}
	public Date getBoard_date()
	{
		return board_date;
	}
	public void setBoard_date(Date board_date)
	{
		this.board_date = board_date;
	}
	
	
	
}
