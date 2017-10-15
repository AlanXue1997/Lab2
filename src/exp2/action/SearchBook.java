package exp2.action;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class SearchBook extends ActionSupport{
	
	public SearchBook(){
		
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String st = request.getParameter("bookName");
		LinkedList<Book> books = DB.searchBook(st);
		request.setAttribute("st", st);
		if(!books.isEmpty()){
			//request
			request.setAttribute("found", true);
			request.setAttribute("books", books);
			return SUCCESS;
		}
		else{
			request.setAttribute("found", false);
			return ERROR;
		}
	}
}
