<%@ page language="java" import="exp2.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% Person person = (Person)request.getAttribute("author"); %>
<title><%=person.getName()%></title>
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
		
			<div class=" am-u-md-8 am-u-md-push-2 am-u-sm-10 am-u-md-push-1 am-u-xs-12">
		     	<div class="am-panel am-panel-secondary">
		     		<div class="am-panel-hd">
		     			作家信息
		     			
		     			<button class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only" 
							onclick="window.location='AuthorModify.jsp?id=<%=person.getId()%>'" style="float: right;">
							<span class="am-icon-pencil"></span> 修改
						</button>
		     			<%-- <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" 
							onclick="window.location='Delete_Author.action?id=<%=person.getId()%>'" style="float: right;">
							<span class="am-icon-trash-o"></span> 删除
						</button> --%>
		     		</div>
		     		<div class="am-panel-bd">
				    	  <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">姓名</div>
				            <div class="am-u-sm-8 am-u-md-10"><%=person.getName()%></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">年龄</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= person.getAge()==-1?"未知":(person.getAge())%></div>
				          </div>
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">国籍</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= person.getCountry() %></div>
				          </div>
				          
				          
				           <div class="am-g am-margin-top">
				            <div class="am-u-sm-4 am-u-md-2 am-text-right">简介</div>
				            <div class="am-u-sm-8 am-u-md-10"><%= "".equals(person.getIntroduction())?"无":person.getIntroduction() %></div>
				          </div>
				          
				  	</div>
		     	</div>
		
			</div>
	</div>

</div>


<%-- <a href="index.jsp">主页</a><br/>
<a href="#" onclick="history.back()">上一页</a><br/>
<%
	Person person = (Person)request.getAttribute("author");
%>
	姓名：<%= person.getName()%><br/>
	年龄：<%= person.getAge()%><br/>
	国籍：<%= person.getCountry() %><br/>
	简介：<%= person.getIntroduction() %><br/> --%>
	
	
</body>
</html>