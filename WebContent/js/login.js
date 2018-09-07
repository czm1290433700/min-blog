/**
 * 表单验证
 */
$(function(){
	$("input[name='name']").blur(checkName);
	$("input[name='tel']").blur(checkTel);
	$("input[name='nickname']").blur(checkNick);
	$("input[name='pwd']").blur(checkPwd);
	$("input[name='okpwd']").blur(checkOkpwd);
	$("input[value='REGISTER']").click(checkInterst).click(checkName).click(checkTel).click(checkNick).click(checkPwd).click(checkOkpwd);
	function checkName(){
		var name=$("input[name='name']").val();
		var $name=$(".name");
		if(name==""){
			$name.html("姓名不能为空，请输入姓名！").css("color","red");
			return false;
		}
		else{
			$name.html("");
			return true;
		}
	}
	function checkTel(){
		var tel=$("input[name='tel']").val();
		var $tel=$(".tel");
		var id=/^1\d{10}$/;
		if(id.test(tel)==false){
			$tel.html("无效电话号码，请重新输入！").css("color","red");
			return false;
		}
		else{
			$tel.html("");
			return true;
		}
	}
	function checkNick(){
		var nickname=$("input[name='nickname']").val();
		var $nickname=$(".nickname");
		var maxwidth=8;
		if(nickname==""){
			$nickname.html("昵称不能为空，请输入姓名！").css("color","red");
			return false;
		}
		else{
			$nickname.html("");
			if($("input[name='nickname']").val().length > maxwidth) {
		    	$nickname.html("昵称不应超过8个字").css("color","red");
				return false;
		    }
		    else{
		    	$nickname.html("");
				return true;
		    }
		}
	}
	function checkPwd(){
		var pwd=$("input[name='pwd']").val();
		var $pwd=$(".pwd");
		var id=/^\w{4,10}$/;
		if(id.test(pwd)==false){
			$pwd.html("密码长度应在4-10个字符之间!").css("color","red");
			return false;
		}
		else{
			$pwd.html("");
			return true;
		}
	}
	function checkOkpwd(){
		var okpwd=$("input[name='okpwd']").val();
		var pwd=$("input[name='pwd']").val();
		var $okpwd=$(".okpwd");
		if(okpwd!=pwd){
			$okpwd.html("前后密码不一致!").css("color","red");
			return false;
		}
		else{
			$okpwd.html("");
			return true;
		}
	}
	function checkInterst(){
		var checked=$("input[name='interest']:checked");
		var $interest=$(".interest");
		if(checked.length==0){  
            $interest.html("请至少选择一个兴趣").css("color","red");  
            return false;  
        } 
		else{
			$interest.html("");
			return true;
		}
	}
	function checkAll(){
		if(checkName()==true&&checkTel()==true&&checkNick()==true&&checkPwd()==true&&checkOkpwd()==true&&checkInterest()==true){
			return true;
		}
		else{
			return false;
		}
	}		
})