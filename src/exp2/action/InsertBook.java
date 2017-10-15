package exp2.action;

import java.util.LinkedList;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import exp2.*;

public class InsertBook extends ActionSupport{
	
	private static boolean isInteger(String str) {  
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
        return pattern.matcher(str).matches();  
	}
	
	private static boolean isDouble(String str) {  
		Pattern pattern = Pattern.compile("\\d+\\.\\d+$|-\\d+\\.\\d+$"); 
        return pattern.matcher(str).matches();  
	}

	public InsertBook(){
		
	}
	
	public void run() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("bookName");
		String isbn = request.getParameter("bookIsbn");
		String author = request.getParameter("bookAuthor").trim();
		String press = request.getParameter("bookPress");
		String price = request.getParameter("bookPrice");
		String date = request.getParameter("bookDate");
		date = date.replace("-", "");
		String intro = request.getParameter("bookIntroduction");
		LinkedList<Person> persons = DB.searchPerson(author);
		Book book = DB.getBook(isbn);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		if("".equals(name)
				|| "".equals(isbn)
				|| book != null
				|| !isInteger(isbn)
				|| (isbn.length() != 10 && isbn.length() != 13)
				|| "".equals(name)
				|| persons.size() == 0
				|| !("".equals(price) || isInteger(price) || isDouble(price))
		){
			response.getWriter().write("no");
			System.out.println("Refused!!!");
		}
		else{
			book = new Book();
			book.setAuthor(persons.getFirst().getId());
			book.setName(name);
			book.setIsbn(isbn);
			book.setPress(press);
			book.setIntroduction(intro);
			if(!"".equals(date)){
				book.setPublicationDate(Integer.parseInt(date));
			}
			if(!"".equals(price)){
				book.setPrice((int)(Double.parseDouble(price)*100));
			}
			DB.saveBook(book);	
			response.getWriter().write("yes");
		}
	}
	
}
