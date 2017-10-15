package exp2.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class GetBook extends ActionSupport{

	public GetBook(){
		
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String isbn = request.getParameter("isbn");
		Book book = DB.getBook(isbn);
		if(null == book){
			return ERROR;
		}
		else{
			request.setAttribute("book", book);
			request.setAttribute("author", DB.getPerson(book.getAuthor()));
			return SUCCESS;
		}
	}
	
}
