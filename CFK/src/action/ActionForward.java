package action;

public class ActionForward
{
	// 액션 결과에 따른 이동방법 및 이동경로를 처리
	private String path;
	private boolean redirect;
	
	public ActionForward(String path, boolean redirect)
	{
		super();
		this.path = path;
		this.redirect = redirect;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public boolean isRedirect()
	{
		return redirect;
	}

	public void setRedirect(boolean redirect)
	{
		this.redirect = redirect;
	}
	
	
}
