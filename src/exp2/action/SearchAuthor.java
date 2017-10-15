package exp2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class SearchAuthor extends ActionSupport{
	public void run() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("authorName");
		if(name.lastIndexOf("'") >= 0) {
			response.getWriter().write("no");
			return;
		}
		System.out.print(name + " ");
		response.setCharacterEncoding("UTF-8");
		if(DB.searchPerson(name).size() > 0){
			System.out.println("yes");
			response.getWriter().write("yes");
		}
		else{
			System.out.println("no");
			response.getWriter().write("no");
		}
	}
}
