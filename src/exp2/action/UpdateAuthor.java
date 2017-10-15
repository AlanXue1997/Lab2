package exp2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class UpdateAuthor extends ActionSupport{
	
	public UpdateAuthor(){
		
	}
	
	public void run() throws Exception{
		System.out.println("UpdateAuthor.java processing");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		Person person = new Person();
		String name = request.getParameter("authorName");
		String country = request.getParameter("authorCountry");
		int id = Integer.parseInt(request.getParameter("authorId"));
		if("".equals(name) || "".equals(country)){
			response.getWriter().write("no");
		}
		else{
			person.setId(id);
			person.setName(name);
			person.setAge(Integer.parseInt(request.getParameter("authorAge")));
			person.setCountry(country);
			person.setIntroduction(request.getParameter("authorIntroduction"));
			DB.updatePerson(person);
			System.out.println("yes");
			response.getWriter().write("yes");
		}
	}
	
	public String execute(){
		/*
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		Person person = DB.getPerson(id);
		if(null == person){
			return ERROR;
		}
		else{
			request.setAttribute("author", person);
			return SUCCESS;
		}*/
		return ERROR;
	}
}
