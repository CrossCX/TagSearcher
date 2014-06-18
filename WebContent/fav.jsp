<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/tagsearcher.js"></script>
<link rel="stylesheet" type="text/css" href="css/tagsSearcher.css">
<style type="text/css">
	body {
	    background: none repeat scroll 0 0 #fff;
	    color: #666;
	    font: 16px/150% Arial,Verdana,"宋体";
	}
	
	#tagFilter{
		height : 50;
		line-height: 50px;
		position: relative;
		top:50%;
	}
	
	#tagFilter tag_title{
		vertical-align: middle;
		height : 50;
		line-height: 50px;
		position: relative;
		top:50%;
	}
	
	.tagDetail .tag_title{
		font-weight: bold;
	}
	
	.tagDetail .tag_list .tagItem{
		margin:5px 10px;
	}
</style>
</head>
<body>
	<div>
		<div id="tagFilter">
			<div id="tags" class="tags"></div>
		</div>
		<div class="tagDetail">
			<label class="tag_title">工作类型：</label>
			<span class="tag_list">
				<a href="javascript:;" id="suanming" class="tagItem" onclick="onAddTag('suanming','算命')">算命</a>
				<a href="javascript:;" id="jiemeng" class="tagItem" onclick="onAddTag('jiemeng','解梦')">解梦</a>
				<a href="javascript:;" id="qiming" class="tagItem" onclick="onAddTag('qiming','起名')">起名</a>
				<a href="javascript:;" id="fengshui" class="tagItem" onclick="onAddTag('fengshui','风水')">风水</a>
				<a href="javascript:;" id="shengxiao" class="tagItem" onclick="onAddTag('shengxiao','生肖')">生肖</a>
				<a href="javascript:;" id="mianxiang" class="tagItem" onclick="onAddTag('mianxiang','面相')">面相</a>
				<a href="javascript:;" id="shouxiang" class="tagItem" onclick="onAddTag('shouxiang','手相')">手相</a>
				<a href="javascript:;" id="xingzuo" class="tagItem" onclick="onAddTag('xingzuo','星座')">星座</a>
			</span>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#tags').tagsSearcher({
			'defaultText':'',
			interactive : false,
		    width:'auto',
		    height:'32px',
		    'removeWithBackspace' : true , 
		    onAddTag:function(obj){
		        console.log(['增加了'+ obj.name + obj.value]);
		        onSearch();
		    },
		    onRemoveTag:function(obj){
		        console.log('删除了'+obj.name + obj.value);
		        $("#" + obj.value).css("display","");
		        onSearch();
		    }
		});
	});
	
	function onAddTag(tagValue, tagName){
		var obj = {
				name : tagName,
				value : tagValue 
		};
		$("#" + tagValue).css("display","none");
		$('#tags').addTag(obj);
	}
	
	function onSearch(){
		var tags = "";
		$("#tags_tagsSearcher .searchTagLabel").each(function(item) {
			var tagId = $(this).attr("id");
			if(tagId != undefined && tagId != ""){
				tags = tags+ tagId + ",";
			}
			
		});
		if(tags != ""){
			tags = tags.substring(0,tags.length-1);	
		}
// 		alert(tags);
	}
</script>
</body>
</html>