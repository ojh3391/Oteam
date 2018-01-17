package vo;

import java.sql.Date;

public class NotifyVO
{
	private int notify_num;
	private String notify_content;
	private Date notify_date;
	
	public int getNotify_num()
	{
		return notify_num;
	}
	public void setNotify_num(int notify_num)
	{
		this.notify_num = notify_num;
	}
	public String getNotify_content()
	{
		return notify_content;
	}
	public void setNotify_content(String notify_content)
	{
		this.notify_content = notify_content;
	}
	public Date getNotify_date()
	{
		return notify_date;
	}
	public void setNotify_date(Date notify_date)
	{
		this.notify_date = notify_date;
	}
	
}
