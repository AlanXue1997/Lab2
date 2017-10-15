package exp2.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class DeleteBook extends ActionSupport{
	
	public DeleteBook(){
		
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String isbn = request.getParameter("isbn");
		if(DB.deleteBook(isbn)){
			System.out.println(isbn + "Succeed");
			return SUCCESS;
		}
		else{
			System.out.println(isbn + "Failed");
			return ERROR;
		}
	}
}
