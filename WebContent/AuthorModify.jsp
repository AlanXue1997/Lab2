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
function AuthorUpdateBtn(){
	var id = $("#AuthorUpdateId").val();
	var name = $("#AuthorUpdateName").val();
	var age = $("#AuthorUpdateAge").val();
	var country = $("#AuthorUpdateCountry").val();
	var introduction = $("#AuthorUpdateIntroduction").val();
	  $.ajax({
			type:"POST",
			url:"Update_Author.action",
			data:{"authorName":name, "authorAge":age, "authorCountry":country, "authorIntroduction":introduction, "authorId": id},
			dataType:"text",
			success:function (data){
				if(data=="yes"){
					$("#UpdateAuthorSucceed").show();
					$("#UpdateAuthorSucceed").delay(1000).hide(0);
					$("#AuthorUpdate")[0].reset();
				}
			},
			error:function(data){
			}
			
		});
	  setTimeout(function(){window.location.reload();}, 1000);
	  $("#AuthorUpdate").submit();
}
$(function() {
	  $('#AuthorUpdate').validator({
		  validate: function(validity) {
			  var comparer = function(v, name){
				  if(false/* v == "yes" || name == null || name == undefined || name == '' */){
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
	  					/* $("UpdateAuthorSucceed").style.visibility="visible"; */
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
</script>
</head>
<body>
<%	Person person = DB.getPerson(Integer.parseInt(request.getParameter("id"))); %>
<div class="am-g am-g-fixed">
 <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
 <form class="am-form" id="AuthorUpdate" target="nm_iframe">
						  <fieldset>
						  	<input type="hidden" id="AuthorUpdateId" value="<%=person.getId()%>"/> 
						    <div class="am-form-group">
						      <label for="doc-vld-name-2-1">姓名：</label>
						      <input type="text" id="AuthorUpdateName" value="<%=person.getName()%>"class="js-ajax-validate" minlength="1" placeholder="作者姓名" data-validate-async readonly/>
						    </div>
						    <div class="am-form-group">
						      <label for="doc-select-1">国籍：</label>
<!-- 						      <input type="text" id="AuthorUpdateCountry" placeholder="输入作者所属国家"/> -->
						      <select id="AuthorUpdateCountry" class="js-sync-validate" data-validation-message="请选择作者所属国家" required>
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
							<script>
							 document.getElementById("AuthorUpdateCountry").value="<%=person.getCountry()%>"
							</script>
						    </div>
						
						    <div class="am-form-group">
						      <label for="doc-select-1-1">年龄</label>
						      <select id="AuthorUpdateAge" name="authorAge" required>
						    		<option value="-1">未知</option>
						    		<option value="1">&lt=10</option>
						    	<%for(int i = 11; i < 100; ++i){ %>
						    		<option value="<%=i%>"><%=i%></option>
						    	<%} %>
						    		<option value="2">&gt=100</option>
						    	</select>
						    	<script>
								 document.getElementById("AuthorUpdateAge").value="<%=person.getAge()%>"
								</script>
						      <%-- <span class="am-form-caret"></span> --%>
						    </div>
						
						    <div class="am-form-group">
						      <label for="doc-vld-ta-2-1">简介：</label>
						      <textarea id="AuthorUpdateIntroduction" minlength="0" maxlength="2000"><%=person.getIntroduction()%></textarea>
						    </div>
						
						    <input type="button" value="提交" class="am-btn am-btn-secondary" onclick="AuthorUpdateBtn();"/>
						    <input type="button" value="返回" onClick="history.back()" class="am-btn am-btn-default"/>
						    <div data-am-sticky>
	  <span id="UpdateAuthorSucceed" style="display:none; color:#0e90d2">提交成功</span>
	</div>
						  </fieldset>
						</form>
</div>
</body>
</html>