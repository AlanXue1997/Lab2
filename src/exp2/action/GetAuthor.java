package exp2.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class GetAuthor extends ActionSupport{
	
	public GetAuthor(){
		
	}

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		Person person = DB.getPerson(id);
		if(null == person){
			return ERROR;
		}
		else{
			request.setAttribute("author", person);
			return SUCCESS;
		}
	}
}
