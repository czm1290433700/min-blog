/**
 * 博客输入框验证
 */
$(function(){
	$("input[value='发表']").click(checkTitle).click(checkContent).click(checkTitle2);
	function checkTitle(){
		var btitle=$("input[name='btitle']").val();
		var $btitle=$(".btitle");
		if(btitle==""){
			$btitle.html("博客标题不能为空").css("color","red");
			return false;
		}
		else{
			$btitle.html("");
			return true;
		}
	}
	function checkTitle2(){
		var btitle=$("input[name='btitle']").val();
		var $btitle=$(".btitle");
		var maxwidth=26;
		if($("input[name='btitle']").val().length > maxwidth) {
	    	$btitle.html("博客标题过长").css("color","red");
			return false;
	    }
	    else{
	    	$btitle.html("");
			return true;
	    }
	}
	function checkContent(){
		var bcontent=CKEDITOR.instances.bcontent.getData();
		var $bcontent=$(".bcontent");
		if(bcontent==""){
			$bcontent.html("博客内容不能为空！").css("color","red");
			return false;
		}
		else{
			$bcontent.html("");
			return true;
		}
	}
	function checkAll(){
		if(checkTitle()==true&&checkContent()==true&&checkTitle2()==true){
			return true;
		}
		else{
			return false;
		}
	}
})
