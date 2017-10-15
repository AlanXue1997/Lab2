<%@ page language="java" import="java.util.LinkedList, exp2.*, exp2.DB" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>"<%=request.getAttribute("st")%>"的搜索结果</title>
<link type="text/css" href="<%=request.getContextPath()%>/assets/css/amazeui.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/amazeui.min.js"></script>
<style type="text/css">
/* 	.a-am-margin-top{
		margin-top: 5px;
	} */
	.am-g {
	  margin: 20 auto;
	  width: 100%;
	}
	
	.am-g-fixed {
	  max-width: 600px;
	}
</style>
</head>
<body>
		
		<div class="am-g am-g-fixed">
			<s:form action="Search_Book" method="post" class="am-form">
		    	<div class="am-form-group">
		    		<div  class="am-u-sm-8">
		    			<input type=text name="bookName" />
		    		</div>
		    		<input class="am-btn am-btn-primary" type=submit value="搜索"/>
		    		<a class="am-btn am-btn-primary" href="index.jsp">主页</a>
		    	</div>
		    </s:form>
		</div>
		
		<div class="am-g am-g-fixed am-margin-top">
			<%
				if(request.getAttribute("found") != null){
					boolean st = (boolean)request.getAttribute("found");
					if(st){
		     %>
		     
		     <%LinkedList<Book> books = (LinkedList<Book>)request.getAttribute("books");
		     	int i = 1;
				for(Book book:books){ 
			%>
				<div class=" am-u-sm-12">
			     	<div class="am-panel am-panel-secondary">
			     		<div class="am-panel-hd">
			     			<a href="Get_Book.action?isbn=<%=book.getIsbn()%>">《<%=book.getName()%>》</a>
			     		</div>
			     		<div class="am-panel-bd">
					    	  <div class="am-g a-am-margin-top">
					            <div class="am-u-sm-4 am-u-md-3 am-text-right">ISBN</div>
					            <div class="am-u-sm-8 am-u-md-9"><%=book.getIsbn()%></div>
					          </div>
					          
					           <div class="am-g a-am-margin-top">
					            <div class="am-u-sm-4 am-u-md-3 am-text-right">作者</div>
					            <div class="am-u-sm-8 am-u-md-9"><a href="Get_Author.action?id=<%=book.getAuthor()%>"><%=DB.getPerson(book.getAuthor()).getName()%></a></div>
					          </div>
					          
					          
					           <div class="am-g a-am-margin-top">
					            <div class="am-u-sm-4 am-u-md-3 am-text-right">出版社</div>
					            <div class="am-u-sm-8 am-u-md-9"><%="".equals(book.getPress())?"未知":book.getPress()%></div>
					          </div>
					          
					          <%int date = book.getPublicationDate(); %>
					           <div class="am-g a-am-margin-top">
					            <div class="am-u-sm-4 am-u-md-3 am-text-right">出版时间</div>
					            <div class="am-u-sm-8 am-u-md-9"><%=date==-1?"未知":(date/100 + "年" + date%100/10 + date%10 + "月")%></div>
					          </div>
					          
					          <%int price = book.getPrice(); %>
					           <div class="am-g a-am-margin-top">
					            <div class="am-u-sm-4 am-u-md-3 am-text-right">价格</div>
					            <div class="am-u-sm-8 am-u-md-9"><%=price==-1?"未知":(price/100 + "." + price%100/10 + price%10)%></div>
					          </div>
					  	</div>
			     	</div>
			     </div>
		     	<%
		     		i ++;
				}
				%>
		     <%
				}else{
			 %>
     
     			<div class=" am-u-sm-12">
			     	<div class="am-panel am-panel-secondary">
			     		<div class="am-panel-hd">
			     			未找到
			     		</div>
			     		<div class="am-panel-bd">
					    	  没有与“<%=request.getAttribute("st")%>”对应的搜索结果
					  	</div>
			     	</div>
			     </div>
		     
		     <%
				}}
		     %>
		</div>
</body>
</html>