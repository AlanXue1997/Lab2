<%@ page language="java" import="exp2.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍信息修改</title>
<link type="text/css" href="<%=request.getContextPath()%>/assets/css/amazeui.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/amazeui.min.js"></script>
<style type="text/css">
	.am-g {
	  margin: 20 auto;
	  width: 100%;
	}
	
	.am-g-fixed {
	  max-width: 600px;
	}
</style>
<script type="text/javascript">
function BookUpdateBtn(){
	var name = $("#BookUpdateName").val();
	var isbn = $("#BookUpdateIsbn").val();
	var author = $("#BookUpdateAuthor").val();
	var press = $("#BookUpdatePress").val();
	var date = $("#BookUpdateDate").val();
	var price = $("#BookUpdatePrice").val();
	var introduction = $("#BookInsretIntroduction").val();
	  $.ajax({
		    async: false,
		    type:"POST",
			url:"Update_Book.action",
			data:{"bookName":name, "bookIsbn":isbn, "bookAuthor":author, "bookPress":press, "bookDate":date, "bookPrice":price, "bookIntroduction":introduction},
			dataType:"text",
			success:function (data){
				if(data=="yes"){
					$("#UpdateBookSucceed").show();
					$("#UpdateBookSucceed").delay(1000).hide(0);
					$("#BookUpdate")[0].reset();
				}
			},
			error:function(data){
			}
		});
	  setTimeout(function(){window.location.reload();}, 1000);
	  $("#BookUpdate").submit();
}
	$(function() {
	  $('#BookUpdate').validator({
		  validate: function(validity) {
			  var comparer = function(v, name){
				  if(v == "yes"){
					  validity.valid = true;
					  $(validity.field).closest('.am-form-group').find('.am-alert').hide();
				  }
				  else{
					  validity.valid = false;
					  var $field = $(validity.field);
				      var $group = $field.closest('.am-form-group');
				      var $alert = $group.find('.am-alert');
				      var msg = "作者不存在，请先添加作者";
				      if(name == null || name == undefined || name == '') msg = "作者不能为空";
				      if (!$alert.length) {
				        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
				          appendTo($group);
				      }
				      $alert.html(msg).show();
				  }
			  }
			  if ($(validity.field).is('.js-ajax-validate')) {
			  
				  if ($(validity.field).is('.js-ajax-validate')) {
					  var name = $(validity.field).val();
					  return $.ajax({
						type:"POST",
		  				url:"Search_Author.action",
		  				data:{"authorName":name},
		  				dataType:"text",
						}).then(function (data){
	  					/* $("InsertAuthorSucceed").style.visibility="visible"; */
	  					comparer(data, name);
	  					return validity;
	  				}, function(){
	  					validity.valid = false;
		  				return validity;
		  			});
				  }
			  }
			  if ($(validity.field).is('.js-sync-validate')) {
			        //comparer(10, v);
			        // return validity;
				  var name = $(validity.field).val();
				  if(name == null || name == undefined || name == ''){
					  validity.valid = false;
					  var $field = $(validity.field);
				      var $group = $field.closest('.am-form-group');
				      var $alert = $group.find('.am-alert');
				      var msg = "书名不能为空";
				      if (!$alert.length) {
				        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
				          appendTo($group);
				      }
				      $alert.html(msg).show();
				  }
				  else{
					  validity.valid = true;
					  $(validity.field).closest('.am-form-group').find('.am-alert').hide();
				  }
			  }
			  if ($(validity.field).is('.js-isbn-validate')) {
			        //comparer(10, v);
			        // return validity;
			        
				  var reg = /^[0-9]*$/;
				  var name = $(validity.field).val();
				  if(name == null || name == undefined || name == '' || !reg.test(name) || (name.length!=10 && name.length!=13)){
					  validity.valid = false;
					  var $field = $(validity.field);
				      var $group = $field.closest('.am-form-group');
				      var $alert = $group.find('.am-alert');
				      var msg = "ISBN必须为10或13位纯数字";
				      if (!$alert.length) {
				        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
				          appendTo($group);
				      }
				      $alert.html(msg).show();
				  }
				  else{
					  validity.valid = true;
					  $(validity.field).closest('.am-form-group').find('.am-alert').hide();
				  }
			  }
			  if ($(validity.field).is('.js-price-validate')) {
			        //comparer(10, v);
			        // return validity;
			        var reg = /^\d+\.\d+$/;
			        var reg2 = /^-?\d+$/;
				  var name = $(validity.field).val();

				  if(reg.test(name) || reg2.test(name) || name == null || name == undefined || name == ''){
					  validity.valid = true;
					  $(validity.field).closest('.am-form-group').find('.am-alert').hide();
				  }
				  else{
					  validity.valid = false;
					  var $field = $(validity.field);
				      var $group = $field.closest('.am-form-group');
				      var $alert = $group.find('.am-alert');
				      var msg = "价格必须为数字，可以有小数";
				      if (!$alert.length) {
				        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
				          appendTo($group);
				      }
				      $alert.html(msg).show();
				  }
			  }
		  }
	  });
	});
</script>
</head>
<body>
<%	Book book = DB.getBook((String)request.getParameter("isbnn")); %>
<div class="am-g am-g-fixed">
 <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
 <form action="" class="am-form" id="BookUpdate" target="nm_iframe">
	  <fieldset>
	  	<div class="am-form-group">
	      <label for="doc-vld-name-2-1">ISBN：</label>
	      <input type="text" id="BookUpdateIsbn" value="<%=book.getIsbn()%>" class="js-isbn-validate" readonly/>
	    </div>	
	    <div class="am-form-group">
	      <label for="doc-vld-name-2-1">书名：</label>
	      <input type="text" id="BookUpdateName" value="<%=book.getName()%>" class="js-sync-validate" placeholder="书名不能为空" required/>
	    </div>				    
	    <div class="am-form-group">
	      <label for="doc-vld-ajax-count">作者：</label>
	      <input id="BookUpdateAuthor" value="<%=DB.getPerson(book.getAuthor()).getName()%>" class="js-ajax-validate" type="text" placeholder="输入作者姓名" data-validate-async/>
	    </div>
	    <div class="am-form-group">
	      <label for="doc-vld-name-2-1">出版社：</label>
	      <input type="text" value="<%=book.getPress()%>" id="BookUpdatePress" placeholder="输入出版社"/>
	    </div>
	    <%int date =  book.getPublicationDate();%>
	    <div class="am-form-group">
	      <label for="doc-vld-name-2-1">出版时间：</label>
	      <input type="month" value="<%=date==-1?"":(date/100 + "-" + date%100/10 + date%10)%>"id="BookUpdateDate"/>
	    </div>
	    <%int price = book.getPrice(); %>
	    <div class="am-form-group">
	      <label for="doc-vld-name-2-1">价格（元）：</label>
	      <input type="text" id="BookUpdatePrice" value="<%=price==-1?"":(price/100+"." + price%100/10 + price%10)%>" class="js-price-validate" placeholder="输入价格(可以有两位小数)"/>
	    </div>
	
	    <div class="am-form-group">
	      <label for="doc-vld-ta-2-1">简介：</label>
	      <textarea id="BookInsretIntroduction" minlength="0" maxlength="2000"><%=book.getIntroduction()%></textarea>
	    </div>
	
	    <input type="button" value="提交" class="am-btn am-btn-secondary" onclick="BookUpdateBtn();"/>
	    <!-- <input type="button" value="返回" onclick="history.back()" class="am-btn am-btn-default"/> -->
	    <a onclick="history.back()" class="am-btn am-btn-default">返回</a>
	    <div data-am-sticky>
	  <span id="UpdateBookSucceed" style="display:none; color:#0e90d2">提交成功</span>
	</div>
							  </fieldset>
							</form>
</div>
</body>
</html>