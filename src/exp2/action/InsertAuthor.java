package exp2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class InsertAuthor extends ActionSupport{
	
	public InsertAuthor(){
		
	}
	
	public void run() throws Exception{
		System.out.println("hehe");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		Person person = new Person();
		String name = request.getParameter("authorName");
		String country = request.getParameter("authorCountry");
		if("".equals(name) || "".equals(country)){
			response.getWriter().write("no");
		}
		else{
			person.setName(name);
			person.setAge(Integer.parseInt(request.getParameter("authorAge")));
			person.setCountry(country);
			person.setIntroduction(request.getParameter("authorIntroduction"));
			if(DB.searchPerson(name).size() > 0){
				System.out.println("no");
				response.getWriter().write("no");
			}
			else{
				DB.savePerson(person);
				System.out.println("yes");
				response.getWriter().write("yes");
			}
		}
	}
	public String execute(){
		return "";
	}
}
