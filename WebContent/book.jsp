<%@ page language="java" import="exp2.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%	Book book = (Book)request.getAttribute("book"); %>
<title><%=book.getName() %></title>
<link type="text/css" href="<%=request.getContextPath()%>/assets/css/amazeui.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/amazeui.min.js"></script>
</head>
<body>
<div class="am-con" id="container">
	<div class="am-g am-margin-top" style="text-align: center;">
		<a href="index.jsp" class="am-btn am-btn-primary">主页</a>
		<a href="#" onclick="history.back()" class="am-btn am-btn-primary">上一页</a>
	</div>
	
	<div class="am-container am-margin-top">
		
		<div class="am-g">
		<%	if(book != null){ %>
			<div class=" am-u-md-8 am-u-md-push-2 am-u-sm-10 am-u-md-push-1 am-u-xs-12">
		     	<div class="am-panel am-panel-secondary">
		     		<div class="am-panel-hd">
		     			书籍信息
		     			
		     			<button class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only" 
							onclick="window.location='BookModify.jsp?isbnn=<%=book.getIsbn()%>'" style="float: right;">
							<span class="am-icon-pencil"></span> 修改
						</button>
						<script type="text/javascript" >
							function DeleteBook(isbn){
								alert("删除成功！");
								window.location='Delete_Book.action?isbn='+isbn;
							}
						</script>
		     			<button id="deleteBook" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" 
							onclick="DeleteBook(<%=book.getIsbn()%>);" style="float: right;">
							<span class="am-icon-trash-o"></span> 删除
						</button>
		     		</div>
		     		<div class="am-panel-bd">
				    	  <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">书名</div>
				            <div class="am-u-sm-8 am-u-md-10"><%=book.getName()%></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">ISBN</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= book.getIsbn()%></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">出版社</div>
				            <div class="am-u-sm-8 am-u-md-10"><%="".equals(book.getPress())?"未知":book.getPress()%></div>
				          </div>
				          
				          <%int date = book.getPublicationDate(); %>
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">出版时间</div>
				            <div class="am-u-sm-8 am-u-md-10"><%=date==-1?"未知":(date/100 + "年" + date%100/10 + date%10 + "月")%></div>
				          </div>
				          
				          <%int price = book.getPrice(); %>
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">价格</div>
				            <div class="am-u-sm-8 am-u-md-10"><%=price==-1?"未知":(price/100 + "." + price%100/10 + price%10)%></div>
				          </div>
				          
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">简介</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= book.getIntroduction() %></div>
				          </div>
				  	</div>
		     	</div>
			</div>
		<%	}%>
		</div>
		
		<div class="am-g">
		<% Person person = (Person)request.getAttribute("author"); %>
		
			<div class=" am-u-md-8 am-u-md-push-2 am-u-sm-10 am-u-md-push-1 am-u-xs-12">
		     	<div class="am-panel am-panel-secondary">
		     		<div class="am-panel-hd">
		     			作家信息
					</button>
		     		</div>
		     		<div class="am-panel-bd">
				    	  <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">姓名</div>
				            <div class="am-u-sm-8 am-u-md-10"><a href="Get_Author.action?id=<%=person.getId()%>"><%=person.getName()%></a></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">年龄</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= person.getAge()%></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">国籍</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= person.getCountry() %></div>
				          </div>
				          
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">简介</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= person.getIntroduction() %></div>
				          </div>
				          
				  	</div>
		     	</div>
		
			</div>
			
			</div>
			
	</div>
	
</div>


<!-- 
<a href="index.jsp">主页</a><br/>
<a href="#" onclick="history.back()">上一页</a><br/>
<%-- <%	Book book = (Book)request.getAttribute("book"); %>
<%	if(book != null){ %> --%>
	<%-- 书名：<%= book.getName()%><br/>
	ISBN：<%= book.getIsbn()%><br/>
	出版社：<%= book.getPress() %><br/>
	出版日期：<%= book.getPublicationDate() %><br/>
	价格：<%= book.getPrice() %><br/>
	简介：<%= book.getIntroduction() %><br/> --%>
	<button onclick="window.location='Delete_Book.action?isbn=<%=book.getIsbn()%>'">删除</button>
<%-- <%	}%>
<br/>
<% --%>
	Person person = (Person)request.getAttribute("author");
%>
	<%-- 作者：<a href="Get_Author.action?id=<%=person.getId()%>"><%=person.getName()%></a> <br/>
	年龄：<%= person.getAge()%><br/>
	国籍：<%= person.getCountry() %><br/>
	简介：<%= person.getIntroduction() %><br/> --%>

-->
</body>
</html>