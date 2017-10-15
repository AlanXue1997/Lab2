package exp2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class IsbnValidate extends ActionSupport{
	public void run() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String isbn = request.getParameter("bookIsbn");
		response.setCharacterEncoding("UTF-8");
		
		if(StringUtils.isNumeric(isbn) && (isbn.length() == 10 || isbn.length() == 13)){
			response.getWriter().write("yes");
		}
		else{
			response.getWriter().write("no");
		}
	}
}
