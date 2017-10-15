<%@ page language="java" import="java.util.LinkedList, exp2.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="图书SaaS" /></title>
<link type="text/css" href="<%=request.getContextPath()%>/assets/css/amazeui.css" rel="stylesheet"/>
<style type="text/css">
<!-- /* 	html, body{
		/* height: 100%; */
		 /* width: 100%; 
		min-height: 0px;
	}
	.am-con{
		position: absolute; 
 		width: 100%;
	} */ -->
	.am-g {
	  margin: 20 auto;
	  width: 100%;
	}
	
	.am-g-fixed {
	  max-width: 600px;
	}
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
	function AuthorInsertHidden(){
 		$("#one").removeClass("am-active");
 		$("#tab1").removeClass("am-active");
	}
	function BookInsertHidden(){
 		$("#two").removeClass("am-active");
 		$("#tab2").removeClass("am-active");
	}
	function BookInsertFunc(){
		$("#one").addClass("am-active");
 		$("#tab1").addClass("am-active");
		$("#two").removeClass("am-active");
 		$("#tab2").removeClass("am-active");
	}
	function BookInsertBtn(){
		var name = $("#BookInsertName").val();
		var isbn = $("#BookInsertIsbn").val();
		var author = $("#BookInsertAuthor").val();
		var press = $("#BookInsertPress").val();
		var date = $("#BookInsertDate").val();
		var price = $("#BookInsertPrice").val();
		var introduction = $("#BookInsretIntroduction").val();
		  $.ajax({
				type:"POST",
				url:"Insert_Book.action",
				data:{"bookName":name, "bookIsbn":isbn, "bookAuthor":author, "bookPress":press, "bookDate":date, "bookPrice":price, "bookIntroduction":introduction},
				dataType:"text",
				success:function (data){
					if(data=="yes"){
  					$("#InsertBookSucceed").show();
  					$("#InsertBookSucceed").delay(2000).hide(0);
  					$("#BookInsert")[0].reset();
					}
				},
				error:function(data){
				}
				
			});
		  $("#BookInsert").submit();
	}
	function AuthorInsertBtn(){
		var name = $("#AuthorInsertName").val();
		var age = $("#AuthorInsertAge").val();
		var country = $("#AuthorInsertCountry").val();
		var introduction = $("#AuthorInsertIntroduction").val();
		  $.ajax({
				type:"POST",
				url:"Insert_Author.action",
				data:{"authorName":name, "authorAge":age, "authorCountry":country, "authorIntroduction":introduction},
				dataType:"text",
				success:function (data){
					if(data=="yes"){
  					$("#InsertAuthorSucceed").show();
  					$("#InsertAuthorSucceed").delay(2000).hide(0);
  					$("#AuthorInsert")[0].reset();
					}
				},
				error:function(data){
				}
				
			});
		  $("#AuthorInsert").submit();
	}
	
	$(document).ready(function(){
		/* $("#AuthorInsert").submit(function(){
			var name = $("#AuthorInsertName").val();
			var age = $("#AuthorInsertAge").val();
			var country = $("#AuthorInsertCountry").val();
			var introduction = $("#AuthorInsretIntroduction").val();
			  $.ajax({
  				type:"POST",
  				url:"Insert_Author.action",
  				data:{"authorName":name, "authorAge":age, "authorCountry":country, "authorIntroduction":introduction},
  				dataType:"text",
  				success:function (data){
  					if(data=="yes"){
	  					$("#InsertAuthorSucceed").show();
	  					$("#InsertAuthorSucceed").delay(2000).hide(0);
	  					$("#AuthorInsert")[0].reset();
  					}
  				},
  				error:function(data){
  				}
  				
  			});
		}); */
		
		/* $("#BookInsert").submit(function(){
			var name = $("#BookInsertName").val();
			var isbn = $("#BookInsertIsbn").val();
			var author = $("#BookInsertAuthor").val();
			var press = $("#BookInsertPress").val();
			var date = $("#BookInsertDate").val();
			var price = $("#BookInsertPrice").val();
			var introduction = $("#BookInsretIntroduction").val();
			  $.ajax({
  				type:"POST",
  				url:"Insert_Book.action",
  				data:{"bookName":name, "bookIsbn":isbn, "bookAuthor":author, "bookPress":press, "bookdate":date, "bookPrice":price, "bookIntroduction":introduction},
  				dataType:"text",
  				success:function (data){
  					if(data=="yes"){
	  					$("#InsertAuthorSucceed").show();
	  					$("#InsertAuthorSucceed").delay(2000).hide(0);
	  					$("#BookInsert")[0].reset();
  					}
  				},
  				error:function(data){
  				}
  				
  			});
		}); */
		
		$("#BookInsertButton").click(function(){
			var name = $("#BookInsertName").val();
			var isbn = $("#BookInsertIsbn").val();
			var author = $("#BookInsertAuthor").val();
			var press = $("#BookInsretPress").val();
			var year = $("#BookInsretDateYear").val();
			var month = $("#BookInsretDateMonth").val();
			var price = $("#BookInsretPrice").val();
			var introduction = $("#BookInsretIntroduction").val();
			  $.ajax({
  				type:"POST",
  				url:"Insert_Book.action",
  				data:{"bookName":name, "bookIsbn":isbn, "bookAuthor":author, "bookPress":press, "bookYear":year, "bookMonth":month, "bookPrice":price, "bookIntroduction":introduction},
  				dataType:"text",
  				success:function (data){
  					$("#InsertAuthorSucceed").show();
  					$("#InsertAuthorSucceed").delay(2000).hide(0);
  					$("#BookInsert")[0].reset();
  				},
  				error:function(data){
  					alert(data);
  				}
  				
  			});
		});
		
		$("#BookInsertAuthor").change(function(){
			var name = $("#BookInsertAuthor").val();
			$.ajax({
				type:"POST",
  				url:"Search_Author.action",
  				data:{"authorName":name},
  				dataType:"text",
  				success:function (data){
  					/* $("InsertAuthorSucceed").style.visibility="visible"; */
  					if(data == "no"){
	 					$("#existauthor").show();
  					}
  					else{
  						$("#existauthor").hide();
  					}
  				},
  				error:function(data){
  				}
			});
		});
		
		$("#BookInsertIsbn").change(function(){
			var isbn = $("#BookInsertIsbn").val();
			$.ajax({
				type:"POST",
  				url:"Isbn_Validate.action",
  				data:{"bookIsbn":isbn},
  				dataType:"text",
  				success:function (data){
  					/* $("InsertAuthorSucceed").style.visibility="visible"; */
  					if(data == "no"){
	 					$("#invalidIsbn").show();
  					}
  					else{
  						$("#invalidIsbn").hide();
  					}
  				},
  				error:function(data){
  				}
			});
		});
		
	});
	$(function() {
		  $('#AuthorInsert').validator({
			  validate: function(validity) {
				  var comparer = function(v, name){
					  if(v == "yes" || name == null || name == undefined || name == ''){
						  validity.valid = false;
						  var $field = $(validity.field);
					      var $group = $field.closest('.am-form-group');
					      var $alert = $group.find('.am-alert');
					      var msg = "该姓名已经存在（为方便书籍信息录入，姓名不能重复）";
					      if(name == null || name == undefined || name == '') msg = "作者不能为空";
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
					  if(name == ""){
						  validity.valid = false;
						  var $field = $(validity.field);
					      var $group = $field.closest('.am-form-group');
					      var $alert = $group.find('.am-alert');
					      var msg = "请选择国籍";
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
			  }
		  });
		});
	$(function() {
		  $('#doc-vld-jax').validator({
 		    onValid: function(validity) {
		      $(validity.field).closest('.am-form-group').find('.am-alert').hide();
		    },

		    onInValid: function(validity) {
		      var $field = $(validity.field);
		      var $group = $field.closest('.am-form-group');
		      var $alert = $group.find('.am-alert');
		      // 使用自定义的提示信息 或 插件内置的提示信息
		      var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

		      if (!$alert.length) {
		        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
		          appendTo($group);
		      }

		      $alert.html(msg).show();
		      }		  
		  });
		});
	$(function() {
		  $('#BookInsert').validator({
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
					      var msg = "作者不存在，请先<strong><a style=\"\" onclick=\"BookInsertFunc()\">添加作者</a><strong>";
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
	<!-- <div >保存成功</div> -->
	<!-- <div class="box"> -->
	<!-- <div class="am-con" id="container"> -->
		<div class="am-g am-g-fixed">
			<!-- <div class="am-u-md-4 am-u-md-push-4 am-u-sm-6 am-u-sm-push-3 am-u-xs-12"> -->
				  <s:form action="Search_Book" method="post" class="am-form">
			    	<div class="am-form-group">
			    		<div  class="am-u-sm-10 am-u-lg-10">
			    			<input type=text name="bookName" required/>
			    		</div>
				    	<!-- <div  class="am-u-sm-4 am-u-lg-2"> -->
				    		<input class="am-btn am-btn-primary am-u-sm-2 am-u-lg-2" type=submit value="搜索"/>
				    	<!-- </div> -->
			    	</div>
			    </s:form>
			<!-- </div> -->
		</div>
		
		<div class="am-g am-g-fixed">
			<!-- <div class="am-u-md-4 am-u-md-push-4 am-u-sm-6 am-u-sm-push-3 am-u-xs-12"> -->
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-10 am-u-end">
				<div class="am-tabs am-margin" id="doc-my-tabs">
			      <ul class="am-tabs-nav am-nav am-nav-tabs">
			        <li style="" id="one"><a href="#tab1">添加作者</a></li>
			        <li style="" id="two"><a href="#tab2">添加图书</a></li>
			      </ul>
				    <div class="am-tabs-bd">
				    	<div class="am-tab-panel" id="tab1">
				    	<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>  
				    	<form class="am-form" id="AuthorInsert" target="nm_iframe">
						  <fieldset>
						    <div class="am-form-group">
						      <label for="doc-vld-name-2-1">姓名：</label>
						      <input type="text" id="AuthorInsertName" class="js-ajax-validate" minlength="1" placeholder="作者姓名" data-validate-async/>
						    </div>
						
						    <div class="am-form-group">
						      <label for="doc-select-1">国籍：</label>
<!-- 						      <input type="text" id="AuthorInsertCountry" placeholder="输入作者所属国家"/> -->
						      <select id="AuthorInsertCountry" class="js-sync-validate" data-validation-message="请选择作者所属国家" required>
							 <option selected="selected" value="">-选择国家/地区-</option>
							 <option value="未知">未知</option>
							 <option value="澳大利亚">澳大利亚</option>
							 <option value="阿曼">阿曼</option>
							 <option value="安哥拉">安哥拉</option>
							 <option value="阿鲁巴">阿鲁巴</option>
							 <option value="阿塞拜疆">阿塞拜疆</option>
							 <option value="埃塞俄比亚">埃塞俄比亚</option>
							 <option value="爱尔兰">爱尔兰</option>
							 <option value="阿根廷">阿根廷</option>
							 <option value="阿尔巴尼亚">阿尔巴尼亚</option>
							 <option value="阿尔及利亚">阿尔及利亚</option>
							 <option value="阿富汗">阿富汗</option>
							 <option value="阿联酋">阿联酋</option>
							 <option value="埃及">埃及</option>
							 <option value="爱沙尼亚">爱沙尼亚</option>
							 <option value="安道尔">安道尔</option>
							 <option value="安提瓜巴布达">安提瓜巴布达</option>
							 <option value="奥地利">奥地利</option>
							 <option value="冰岛">冰岛</option>
							 <option value="比利时">比利时</option>
							 <option value="巴巴多斯">巴巴多斯</option>
							 <option value="巴布亚新几内亚">巴布亚新几内亚</option>
							 <option value="巴哈马">巴哈马</option>
							 <option value="巴基斯坦">巴基斯坦</option>
							 <option value="巴拉圭">巴拉圭</option>
							 <option value="巴勒斯坦">巴勒斯坦</option>
							 <option value="巴林">巴林</option>
							 <option value="巴拿马">巴拿马</option>
							 <option value="巴西">巴西</option>
							 <option value="白俄罗斯">白俄罗斯</option>
							 <option value="百慕大">百慕大</option>
							 <option value="保加利亚">保加利亚</option>
							 <option value="贝宁">贝宁</option>
							 <option value="波多黎各">波多黎各</option>
							 <option value="波黑">波黑</option>
							 <option value="波兰">波兰</option>
							 <option value="玻利维亚">玻利维亚</option>
							 <option value="伯利兹">伯利兹</option>
							 <option value="博茨瓦纳">博茨瓦纳</option>
							 <option value="不丹">不丹</option>
							 <option value="布基纳法索">布基纳法索</option>
							 <option value="布隆迪">布隆迪</option>
							 <option value="秘鲁">秘鲁</option>
							 <option value="朝鲜">朝鲜</option>
							 <option value="赤道几内亚">赤道几内亚</option>
							 <option value="丹麦">丹麦</option>
							 <option value="德国">德国</option>
							 <option value="东帝汶">东帝汶</option>
							 <option value="多哥">多哥</option>
							 <option value="多米尼加">多米尼加</option>
							 <option value="多米尼克">多米尼克</option>
							 <option value="俄罗斯">俄罗斯</option>
							 <option value="厄瓜多尔">厄瓜多尔</option>
							 <option value="厄立特里亚">厄立特里亚</option>
							 <option value="佛得角">佛得角</option>
							 <option value="法国">法国</option>
							 <option value="菲律宾">菲律宾</option>
							 <option value="斐济">斐济</option>
							 <option value="芬兰">芬兰</option>
							 <option value="冈比亚">冈比亚</option>
							 <option value="刚果(金)">刚果(金)</option>
							 <option value="刚果（布）">刚果（布）</option>
							 <option value="哥伦比亚">哥伦比亚</option>
							 <option value="哥斯达黎加">哥斯达黎加</option>
							 <option value="格林纳达">格林纳达</option>
							 <option value="格鲁吉亚">格鲁吉亚</option>
							 <option value="古巴">古巴</option>
							 <option value="关岛">关岛</option>
							 <option value="圭亚那">圭亚那</option>
							 <option value="古巴共和国">古巴共和国</option>
							 <option value="韩国">韩国</option>
							 <option value="黑山">黑山</option>
							 <option value="洪都拉斯">洪都拉斯</option>
							 <option value="海地">海地</option>
							 <option value="荷兰">荷兰</option>
							 <option value="荷属安的列斯">荷属安的列斯</option>
							 <option value="哈萨克斯坦">哈萨克斯坦</option>
							 <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>
							 <option value="加拿大">加拿大</option>
							 <option value="几内亚比绍">几内亚比绍</option>
							 <option value="基里巴斯">基里巴斯</option>
							 <option value="吉布提">吉布提</option>
							 <option value="几内亚">几内亚</option>
							 <option value="加纳">加纳</option>
							 <option value="加蓬">加蓬</option>
							 <option value="柬埔寨">柬埔寨</option>
							 <option value="捷克">捷克</option>
							 <option value="津巴布韦">津巴布韦</option>
							 <option value="喀麦隆">喀麦隆</option>
							 <option value="卡塔尔">卡塔尔</option>
							 <option value="开曼">开曼</option>
							 <option value="科摩罗">科摩罗</option>
							 <option value="科特迪瓦">科特迪瓦</option>
							 <option value="科威特">科威特</option>
							 <option value="克罗地亚">克罗地亚</option>
							 <option value="肯尼亚">肯尼亚</option>
							 <option value="库克群岛">库克群岛</option>
							 <option value="拉脱维亚">拉脱维亚</option>
							 <option value="莱索托">莱索托</option>
							 <option value="老挝">老挝</option>
							 <option value="黎巴嫩">黎巴嫩</option>
							 <option value="立陶宛">立陶宛</option>
							 <option value="利比里亚">利比里亚</option>
							 <option value="利比亚">利比亚</option>
							 <option value="列支敦士登">列支敦士登</option>
							 <option value="卢森堡">卢森堡</option>
							 <option value="卢旺达">卢旺达</option>
							 <option value="罗马尼亚">罗马尼亚</option>
							 <option value="美国">美国</option>
							 <option value="美属萨摩亚">美属萨摩亚</option>
							 <option value="毛里求斯">毛里求斯</option>
							 <option value="马达加斯加">马达加斯加</option>
							 <option value="马尔代夫">马尔代夫</option>
							 <option value="马耳他">马耳他</option>
							 <option value="马拉维">马拉维</option>
							 <option value="马来西亚">马来西亚</option>
							 <option value="马里">马里</option>
							 <option value="马其顿">马其顿</option>
							 <option value="马绍尔群岛">马绍尔群岛</option>
							 <option value="毛里塔尼亚">毛里塔尼亚</option>
							 <option value="美属维尔京群岛">美属维尔京群岛</option>
							 <option value="蒙古">蒙古</option>
							 <option value="孟加拉">孟加拉</option>
							 <option value="密克罗尼西亚">密克罗尼西亚</option>
							 <option value="缅甸">缅甸</option>
							 <option value="摩尔多瓦">摩尔多瓦</option>
							 <option value="摩洛哥">摩洛哥</option>
							 <option value="摩纳哥">摩纳哥</option>
							 <option value="莫桑比克">莫桑比克</option>
							 <option value="墨西哥">墨西哥</option>
							 <option value="瑙鲁">瑙鲁</option>
							 <option value="尼泊尔">尼泊尔</option>
							 <option value="尼加拉瓜">尼加拉瓜</option>
							 <option value="纳米比亚">纳米比亚</option>
							 <option value="南非">南非</option>
							 <option value="尼日尔">尼日尔</option>
							 <option value="尼日利亚">尼日利亚</option>
							 <option value="挪威">挪威</option>
							 <option value="帕劳">帕劳</option>
							 <option value="葡萄牙">葡萄牙</option>
							 <option value="瑞士">瑞士</option>
							 <option value="日本">日本</option>
							 <option value="瑞典">瑞典</option>
							 <option value="塞尔维亚">塞尔维亚</option>
							 <option value="斯里兰卡">斯里兰卡</option>
							 <option value="塞内加尔">塞内加尔</option>
							 <option value="塞拉利昂">塞拉利昂</option>
							 <option value="萨尔瓦多">萨尔瓦多</option>
							 <option value="萨摩亚">萨摩亚</option>
							 <option value="塞浦路斯">塞浦路斯</option>
							 <option value="塞舌尔">塞舌尔</option>
							 <option value="沙特阿拉伯">沙特阿拉伯</option>
							 <option value="圣多美和普林西比">圣多美和普林西比</option>
							 <option value="圣基茨和尼维斯">圣基茨和尼维斯</option>
							 <option value="圣卢西亚">圣卢西亚</option>
							 <option value="圣马力诺">圣马力诺</option>
							 <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>
							 <option value="斯洛伐克">斯洛伐克</option>
							 <option value="斯洛文尼亚">斯洛文尼亚</option>
							 <option value="斯威士兰">斯威士兰</option>
							 <option value="苏丹">苏丹</option>
							 <option value="苏里南">苏里南</option>
							 <option value="所罗门群岛">所罗门群岛</option>
							 <option value="索马里">索马里</option>
							 <option value="泰国">泰国</option>
							 <option value="塔吉克斯坦">塔吉克斯坦</option>
							 <option value="坦桑尼亚">坦桑尼亚</option>
							 <option value="汤加">汤加</option>
							 <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>
							 <option value="突尼斯">突尼斯</option>
							 <option value="土耳其">土耳其</option>
							 <option value="土库曼斯坦">土库曼斯坦</option>
							 <option value="图瓦卢">图瓦卢</option>
							 <option value="瓦努阿图">瓦努阿图</option>
							 <option value="危地马拉">危地马拉</option>
							 <option value="委内瑞拉">委内瑞拉</option>
							 <option value="文莱">文莱</option>
							 <option value="乌干达">乌干达</option>
							 <option value="乌克兰">乌克兰</option>
							 <option value="乌拉圭">乌拉圭</option>
							 <option value="乌兹别克斯坦">乌兹别克斯坦</option>
							 <option value="西班牙">西班牙</option>
							 <option value="希腊">希腊</option>
							 <option value="新加坡">新加坡</option>
							 <option value="新西兰">新西兰</option>
							 <option value="匈牙利">匈牙利</option>
							 <option value="叙利亚">叙利亚</option>
							 <option value="意大利">意大利</option>
							 <option value="牙买加">牙买加</option>
							 <option value="亚美尼亚">亚美尼亚</option>
							 <option value="也门">也门</option>
							 <option value="伊拉克">伊拉克</option>
							 <option value="伊朗">伊朗</option>
							 <option value="以色列">以色列</option>
							 <option value="印度">印度</option>
							 <option value="印度尼西亚">印度尼西亚</option>
							 <option value="英国">英国</option>
							 <option value="英属维尔京群岛">英属维尔京群岛</option>
							 <option value="约旦">约旦</option>
							 <option value="越南">越南</option>
							 <option value="英格兰">英格兰</option>
							 <option value="中国">中国</option>
							 <option value="赞比亚">赞比亚</option>
							 <option value="乍得">乍得</option>
							 <option value="智利">智利</option>
							 <option value="中非">中非</option>
							 <option value="中华台北">中华台北</option>
							 <option value="中国香港">中国香港</option>
							 <option value="中国澳门">中国澳门</option>
							</select>
						    </div>
						    <div class="am-form-group">
						      <label for="doc-select-1-1">年龄</label>
						      <select id="AuthorInsertAge" name="authorAge" required>
						    		<option value="-1">未知</option>
						    		<option value="1">&lt=10</option>
						    	<%for(int i = 11; i < 100; ++i){ %>
						    		<option value="<%=i%>"><%=i%></option>
						    	<%} %>
						    		<option value="2">&gt=100</option>
						    	</select>
						      <%-- <span class="am-form-caret"></span> --%>
						    </div>
						
						    <div class="am-form-group">
						      <label for="doc-vld-ta-2-1">简介：</label>
						      <textarea id="AuthorInsertIntroduction" minlength="0" maxlength="2000"></textarea>
						    </div>
						
						    <button class="am-btn am-btn-secondary" type="submit" onclick="AuthorInsertBtn();">提交</button>
						    <input type="button" value="收起" onClick="AuthorInsertHidden()" class="am-btn am-btn-default"/>
						    <div data-am-sticky>
	  <span id="InsertAuthorSucceed" style="display:none; color:#0e90d2">提交成功</span>
	</div>
						  </fieldset>
						</form>
					       
					    </div>
					    <div class="am-tab-panel" id="tab2">
						    <form action="" class="am-form" id="BookInsert" target="nm_iframe">
							  <fieldset>
							  	<div class="am-form-group">
							      <label for="doc-vld-name-2-1">ISBN：</label>
							      <input type="text" id="BookInsertIsbn" class="js-isbn-validate" minlength="1" placeholder="ISBN不能为空" required/>
							    </div>	
							    <div class="am-form-group">
							      <label for="doc-vld-name-2-1">书名：</label>
							      <input type="text" id="BookInsertName" class="js-sync-validate" minlength="1" placeholder="书名不能为空" required/>
							    </div>				    
							    <div class="am-form-group">
							      <label for="doc-vld-ajax-count">作者：</label>
							      <input id="BookInsertAuthor" class="js-ajax-validate" type="text" placeholder="输入作者姓名" data-validate-async/>
							    </div>
							    <div class="am-form-group">
							      <label for="doc-vld-name-2-1">出版社：</label>
							      <input type="text" id="BookInsertPress" placeholder="输入出版社"/>
							    </div>
							    <div class="am-form-group">
							      <label for="doc-vld-name-2-1">出版时间：</label>
							      <input type="month" id="BookInsertDate"/>
							    </div>
							    <div class="am-form-group">
							      <label for="doc-vld-name-2-1">价格（元）：</label>
							      <input type="text" id="BookInsertPrice" class="js-price-validate" placeholder="输入价格(可以有两位小数)"/>
							    </div>
							
							    <div class="am-form-group">
							      <label for="doc-vld-ta-2-1">简介：</label>
							      <textarea id="BookInsretIntroduction" minlength="0" maxlength="2000"></textarea>
							    </div>
							
							    <button class="am-btn am-btn-secondary" type="submit" onclick="BookInsertBtn();">提交</button>
							    <input type="button" value="收起" onClick="BookInsertHidden()" class="am-btn am-btn-default"/>
							    <div data-am-sticky>
	  <span id="InsertBookSucceed" style="display:none; color:#0e90d2">提交成功</span>
	</div>
							  </fieldset>
							</form>
					    <%--					    
					      <s:form id="BookInsert" action="Insert_Book" method="post" class="am-form">
					      	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>ISBN：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<input id="BookInsertIsbn" type=text name="bookIsbn"/>
					       		</div>
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>书名：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<input id="BookInsertName" type=text name="bookName"/>
					       		</div>
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>作者：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<input id="BookInsertAuthor" type=text name="bookAuthor"/>
					       		</div>
					       		 <span id="existauthor" style="display:none">
					    		  该作者不存在，
					    		  <input type="button" value="点击添加新作者" onClick="AuthorInsertVisible()"/>
					    		  </span>
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>出版社：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<input id="BookInsertPress" type=text name="bookPress"/>
					       		</div>
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>出版日期：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<div class="am-input-group am-datepicker-date" data-am-datepicker="{format: 'yyyy-mm', viewMode: 'years', minViewMode: 'months'}">
									  <input type="text" class="am-form-field" placeholder="日历组件" readonly name="bookDateYear">
									  <span class="am-input-group-btn am-datepicker-add-on">
									    <button class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
									  </span>
									</div>
					       		</div>
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>价格：</label>
					       		</div>
					       		<div  class="am-u-sm-8">
					       			<input id="BookInsertPrice" type=text name="bookPrice"/>
					       		</div>
					       		<span>元</span>
					       		
					       	</div>
					       	<div class="am-g am-form-group am-margin-top">
					       		<div  class="am-u-sm-3" style="text-align: right;">
					       			<label>简介：</label>
					       		</div>
					       		<div  class="am-u-sm-9">
					       			<textarea id="BookInsertIntroduction" name="bookIntroduction" class="" rows="5" id="doc-ta-1"></textarea>
					       		</div>
					       	</div>
					    	<div class="am-form-group">
					    		<div  class="am-u-sm-9 am-u-sm-push-3">
							    	<input type="button" id="BookInsertButton" value="Insert" class="am-btn am-btn-primary"/>
					    			<input type="button" value="Hide" onClick="BookInsertHidden()" class="am-btn am-btn-default"/>
								</div>
							</div>
					    </s:form> --%>
					    </div>
				    </div>
			    </div>
			<!-- </div> -->
			</div>
		</div>
	<!-- </div> -->
<!-- 	</div> -->
	
     <script type="text/javascript">
     	$("#one").click(function(){
     		$("#two").removeClass("am-active");
     		$("#tab2").removeClass("am-active");
     		$(this).addClass("am-active");
     		$("#tab1").addClass("am-active");
     	});
     	$("#two").click(function(){
     		$("#one").removeClass("am-active");
     		$("#tab1").removeClass("am-active");
     		$(this).addClass("am-active");
     		$("#tab2").addClass("am-active");
     	});
     	
     	verticalMiddle();
     	
     	
     	$(window).resize(function() {
     		verticalMiddle();
   		});
     	
     	
     	function verticalMiddle() {
     		var screenH = document.body.clientHeight;
         	console.log(screenH);
         	var conH = $("#container").outerHeight();
         	console.log(conH);
         	
         	$("#container").css({
         		"top": ((screenH-conH)/2 > 0)?(screenH-conH)/2:0 + "px"
         	});
     	}
     	
     </script>
  
    <!-- 
    
    <input type="button" value="New<%=" "%>Author" onClick="AuthorInsertVisible()"/>
    <input type="button" value="New<%=" "%>Book" onClick="BookInsertVisible()"/>
     
    <s:form id="AuthorInsert" style="display:none" action="Insert_Author" method="post">
    	姓名：<input id="AuthorInsertName" type=text name="authorName"/><br/>
    	国籍：<input id="AuthorInsertCountry" type=text name="authorCountry"/><br/>
    	年龄：<select id="AuthorInsertAge" name="authorAge">
    		<option value="-1">未知</option>
    		<option value="1">&lt=10</option>
    	<%for(int i = 11; i < 100; ++i){ %>
    		<option value="<%=i%>"><%=i%></option>
    	<%} %>
    		<option value="2">&gt=100</option>
    	</select><br/>
    	简介：<input id="AuthorInsretIntroduction"type=text name="authorIntroduction"/><br/>
    	
    	<input type="button" id="AuthorInsertButton" value="Insert"/>
		<input type="button" value="Hide" onClick="AuthorInsertHidden()"/>
    </s:form>
    
    <s:form id="BookInsert" style="display:none" action="Insert_Book" method="post">
    	ISBN：<input id="BookInsertIsbn" type=text name="bookIsbn"/>
    		<span id="invalidIsbn" style="display:none">ISBN必须为10或13位纯数字</span><br/>
    	书名：<input id="BookInsertName" type=text name="bookName"/><br/>
    	作者：<input id="BookInsertAuthor" type=text name="bookAuthor"/>
    		  <span id="existauthor" style="display:none">
    		  该作者不存在，
    		  <input type="button" value="点击添加新作者" onClick="AuthorInsertVisible()"/>
    		  </span><br/>
    	出版社：<input id="BookInsertPress" type=text name="bookPress"/><br/>
    	出版日期：
    	<select id="BookInsertDateYear" name="bookDateYear"/>
    		<option value="-1">未知</option>
    		<%for(int i = 1900; i <= 2017; ++i){ %>
    			<option value="<%=i%>"><%=i%></option>
    		<%} %>
    	</select>年
    	<select id="BookInsertDateMonth" name="bookDateMonth">
    		<option value="-1">未知</option>
    		<%for(int i = 1; i <= 12; ++i){ %>
    			<option value="<%=i%>"><%=i%></option>
    		<%} %>
    	</select>月<br/>
    	价格：<input id="BookInsertPrice" type=text name="bookPrice"/>元<br/>
    	简介：<input id="BookInsertIntroduction" type=text name="bookIntroduction"/><br/>
    	<input type="button" id="BookInsertButton" value="Insert"/>
    	<input type="button" value="Hide" onClick="BookInsertHidden()"/>
    </s:form>
     
     -->
     
</body>
</html>