package exp2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.util.LinkedList;

import java.sql.ResultSet;

/**
 * 所有有关数据库的操作在此进行
 * @author Alan
 *
 */
public class DB {
	
	static private final boolean server = false;//true local, false sina
	
	/**
	 * 从数据库中获取isbn码对应的图书，并写入一个Book类，返回此Book类
	 * @param isbn 想要获取的图书对应的isbn码
	 * @return isbn码所对应的书，如果不存在，则返回null
	 */
	static public Book getBook(String isbn){
		if("".equals(isbn)) return null;
       String sql =  "select * from book where isbn=" + isbn;
       Statement stmt = null;
       Connection conn = null;
       ResultSet rs = null;
       try{
           Class.forName("com.mysql.jdbc.Driver").newInstance();
    	   if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
    	   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);

		   if(rs.next()){
		       Book book = new Book();
		       book.setIsbn(isbn);
		       if(null != rs.getString(2))
		           book.setName(new String(rs.getString(2).trim()));
		       if(null != rs.getString(3))
		           book.setAuthor(Integer.parseInt(rs.getString(3).trim()));
		       if(null != rs.getString(4))
		    	   book.setPress(new String(rs.getString(4).trim()));
		       if(null != rs.getString(5))
		    	   book.setPublicationDate(Integer.parseInt(rs.getString(5).trim()));
			   if(null != rs.getString(6))
				   book.setPrice(Integer.parseInt(rs.getString(6)));
			   if(null != rs.getString(7))
				   book.setIntroduction(rs.getString(7).trim());
		       return book;
		   }
		   else
		       return null;
       }
       catch(Exception ex){
		   System.out.println(ex);
		   System.exit(0);
       }
       finally{
    	   try{
    		   if(null != rs) rs.close();
    		   if(null != stmt) stmt.close();
    		   if(null != conn) conn.close();
    	   }catch(Exception ex){
    		   System.out.println(ex);
    		   System.exit(0);
    	   }
       }
       return null;
       
    }
	
	/**
	 * 搜索图书
	 * @param st 想要搜索的内容，可以是isbn、书名、作者、国家或出版社，若搜索条件不唯一，用空格隔开
	 * @return LinkedList<Book> 所有符合条件的书
	 */
	static public LinkedList<Book> searchBook(String st){
       String sql = "select b.isbn,b.name,b.author,b.press,b.publicdate,b.price,b.intro from book b, person p where p.id=b.author and ";
       String[] array = st.split(" ");
       for(String s: array)
    	   sql += "(b.isbn = '" + s + "' or b.name like '%" + s + "%' or b.press like '%" + s + "%' or p.name like '%" + s + "%' or p.country like '%" + s + "%') and ";
       sql += "true";
       LinkedList<Book> list = new LinkedList<Book>();
       Statement stmt = null;
       Connection conn = null;
       ResultSet rs = null;
       try{
    	   Class.forName("com.mysql.jdbc.Driver").newInstance();
    	   if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
    	   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while(rs.next()){
		       Book book = new Book();
		       book.setIsbn(rs.getString(1));
		       if(null != rs.getString(2))
		           book.setName(new String(rs.getString(2).trim()));
		       if(null != rs.getString(3))
		    	   book.setAuthor(Integer.parseInt(rs.getString(3).trim()));
		       if(null != rs.getString(4))
		    	   book.setPress(new String(rs.getString(4).trim()));
		       if(null != rs.getString(5))
		    	   book.setPublicationDate(Integer.parseInt(rs.getString(5).trim()));
		       if(null != rs.getString(6))
				   book.setPrice(Integer.parseInt(rs.getString(6)));
		       if(null != rs.getString(7))
				   book.setIntroduction(rs.getString(7).trim());
		       list.add(book);
		   }
		   return list;
       }
       catch(Exception ex){
	   System.out.println(ex);
	   System.exit(0);
       }finally{
    	   try{
    		   if(null != rs) rs.close();
    		   if(null != stmt) stmt.close();
    		   if(null != conn) conn.close();
    	   }catch(Exception ex){
    		   System.out.println(ex);
    		   System.exit(0);
    	   }
       }
       return null;
   }
	
	/**
	 * 从数据库中获取st对应的作家，并写入一个LinkedList<Person>，返回此LinkedList
	 * @param st 想要获取的作家的名字
	 * @return st所对应的作家
	 */
	static public LinkedList<Person> searchPerson(String st){
			//Connection conn;
			String sql = "select * from person where name='" + st + "'";
			LinkedList<Person> list = new LinkedList<Person>();
			Statement stmt = null;
		       Connection conn = null;
		       ResultSet rs = null;
			try{
			    Class.forName("com.mysql.jdbc.Driver").newInstance();
				if(server){
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
				}
				else{
					conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
				}
				stmt = conn.createStatement();
			
			   rs = stmt.executeQuery(sql);
			   //rs.last();
			   while(rs.next()){
				   Person person = new Person();
					person.setId(Integer.parseInt(rs.getString(1).trim()));
					person.setName(new String(rs.getString(2).trim()));
					if(null != rs.getString(3).trim()){
						person.setAge(Integer.parseInt(rs.getString(3).trim()));
					}
					if(null != rs.getString(4).trim()){
						person.setCountry(new String(rs.getString(4).trim()));
					}
					if(null != rs.getString(5).trim()){
						person.setIntroduction(new String(rs.getString(5).trim()));
					}
			       list.add(person);
			   }
			   System.out.println(list.size());
			   return list;
	       }
	       catch(Exception ex){
		   System.out.println(ex);
		   System.exit(0);
	       }finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
	       return null;
	   }

	/**
	 * 将一个书的信息存入数据库（只用于新建图书之时即可）
	 * @param book	想要存入的图书
	 * @return	返回是否成功存入图书，不成功的原因可能是isbn没有填写、isbn在数据库中已经存在
	 */
	static public boolean saveBook(Book book){
		if(book.getIsbn() == "") return false;//incorrect isbn
		String sql = "select * from book where isbn='" + book.getIsbn() + "'";
		Statement stmt = null;
	       Connection conn = null;
	       ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);//find if the book exits in the database
			if(rs.next()) return false;//the book exists in the database
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		sql = "insert into book (isbn, name, author, press, publicdate, price, intro) "
				+ "values ('" + book.getIsbn() + "','" + book.getName() + "'," + book.getAuthor() + ",'"
				+ book.getPress() + "'," + book.getPublicationDate() + "," + book.getPrice() + ",'" + book.getIntroduction() + "')";
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);//insert the book into database
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		return true;
	}

	/**
	 * 从数据库中获取id对应的用户，并写入一个Person类，返回此Person类
	 * @param id 想要获取的用户对应的id
	 * @return id所对应的用户，如果不存在，则返回null
	 */
	static public Person getPerson(int id){
		if(id <= 0) return null;
		String sql = "select * from person where id=" + id;
		Statement stmt = null;
	       Connection conn = null;
	       ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql);
		    if(rs.next()){
				Person person = new Person();
				person.setId(id);
				person.setName(new String(rs.getString(2).trim()));
				if(null != rs.getString(3).trim()){
					person.setAge(Integer.parseInt(rs.getString(3).trim()));
				}
				if(null != rs.getString(4).trim()){
					person.setCountry(new String(rs.getString(4).trim()));
				}
				if(null != rs.getString(5).trim()){
					person.setIntroduction(new String(rs.getString(5).trim()));
				}
				return person;
		    }
		    else
		    	return null;
		}
		catch(Exception ex){
		    System.out.println(ex);
		    System.exit(0);
		}finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		return null;
	}
	
	/**
	 * 将一个作者的信息存入数据库
	 * @param person 想要存入的人
	 * @return 返回是否成功存入此人
	 */
	static public int savePerson(Person person){
		if("".equals(person.getName())) return -1;//incorrect name
		String sql = "insert into person (name, age, country, intro) values ('"
				+ person.getName() + "'," + person.getAge() + ",'" + person.getCountry() + "','" + person.getIntroduction() + "')";
		Statement stmt = null;
	       Connection conn = null;
	       ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		sql = "select last_insert_id()";
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);//find if the person exits in the database
			if(rs.next()) {
				person.setId(Integer.parseInt(rs.getString(1).trim()));
			}
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != rs) rs.close();
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		return person.getId();
	}
	
	/**
	 * 更新一个作者的数据
	 * @param person 想要更新的作者
	 */
	static public void updatePerson(Person person){
		String sql = "update person set name='" + person.getName() + "',age=" + person.getAge() 
				+ ",country='" + person.getCountry() + "',intro='" + person.getIntroduction() + "' where id=" + person.getId();
		Statement stmt = null;
	       Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}		finally{
	    	   try{
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
	}
	
	/**
	 * 更新一个图书的数据
	 * @param book 想要更新的图书
	 */
	static public void updateBook(Book book){
		String sql = "update book set name='" + book.getName() + "',author="
				+ book.getAuthor() + ",press='" + book.getPress() + "',publicdate=" + book.getPublicationDate()
				+ ",price=" + book.getPrice() + ",intro='" + book.getIntroduction() + "' where isbn=" + book.getIsbn();
		Statement stmt = null;
	       Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
	}
	
	/**
	 * 删除一个图书
	 * @param isbn 想要删除的图书的isbn
	 * @return 删除是否成功
	 */
	static public boolean deleteBook(String isbn){
		String sql = "delete from book where isbn=" + isbn;
		System.out.println(sql);
		Statement stmt = null;
	       Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(server){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library2?useSSL=false&characterEncoding=UTF-8", "root", "");
			}
			else{
				conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_xuezhlab2?useSSL=false&characterEncoding=UTF-8", "lw425k0zzw", "hx1imiw13yjh024z1ii1zijh2wlh0xym4yx4m1hh");
			}
			stmt = conn.createStatement();
			return stmt.executeUpdate(sql) == 1;
		}
		catch(Exception ex){
			System.out.println(ex);
			System.exit(0);
		}finally{
	    	   try{
	    		   if(null != stmt) stmt.close();
	    		   if(null != conn) conn.close();
	    	   }catch(Exception ex){
	    		   System.out.println(ex);
	    		   System.exit(0);
	    	   }
	       }
		return false;
	}
}
