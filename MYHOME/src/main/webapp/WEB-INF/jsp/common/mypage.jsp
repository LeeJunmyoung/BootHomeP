<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/common/include-header.jspf"%> 
<script type="text/javascript">

//사용자ID 체크결과
//0:중복검사x, 1:정상, 2:아이디 중복 

function reInput(){

	$("#currentPass").val("");
	$("#newPass").val("");
	$("#newPass2").val("");
	
}

function updatePass(){
	if($("#newPass").val()==$("#newPass2").val()){
		$.ajax({
			type : "POST" ,
			url : '/system/user/updatePassword.ajax',
			data : {
					currentpass : $("#currentPass").val(), 
					newpass : $("#newPass").val(),
					newpass2 : $("#newPass2").val(),
			},
			cache : false ,
			async : false ,
			success : function(data){
				console.log(data);
				if(data=='SUCCESS'){
					alert('비밀번호 변경이 완료 되었습니다.');
					location.reload();
				}else if(data=="FAIL"){
					alert('현재 비밀번호를 확인 해주세요');
					$("#currentPass").focus();
					$("#currentPass").val("");
				}else{
					alert(data);
					$("#newPass").val("");
					$("#newPass2").val("");
					$("#newPass").focus();
				}
				
				
			},
			error : function(request, status, error){
				alert("비밀번호 변경중 오류가 발생하였습니다.")
			}
			
		});
	}else{
		alert("새 비밀번호가 일치하지 않습니다.");
		$("#newPass").val("");
		$("#newPass2").val("");
		$("#newPass").focus();
	}
}

</script>
</head>
<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row" style="margin-bottom:20px;">
	        <div class="col-md-3" style="margin-left: 320px">
	            	<h2>MY PAGE</h2>
	        </div>
        </div>
	    <div class="row">
	    <div class="col-lg-2"></div>
	        <div class="col-lg-8">
	           <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>비밀번호 변경</small></h5>
                        </div>
                        <div class="ibox-content">
                            <form method="post" class="form-horizontal">
                                <div class="form-group"><label class="col-sm-2 control-label">현재 비밀번호</label>

                                    <div class="col-sm-8"><input type="password" id="currentPass" class="form-control" autocomplete="off"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">새 비밀번호</label>
                                    <div class="col-sm-8"><input type="password" id="newPass" class="form-control" autocomplete="off">
                                     <span class="help-block m-b-none">* 10 ~ 16자 이내 영문 소문자+숫자+특수기호 조합으로 입력해주세요.<br/>
                                     * 아이디, 전화번호, 생일 등 개인정보와 관련된 것, 연속된 숫자/문자는 사용하지 않는 것이 좋습니다.</span>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">새 비밀번호 확인</label>

                                    <div class="col-sm-8"><input type="password" id="newPass2" class="form-control" autocomplete="off">
                                    	<span class="help-block m-b-none">입력하신 비밀번호를 다시 한번 입력해 주세요.</span>
                                    </div>
                                    
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <input type="button" class="btn btn-white" value="다시입력" onclick="reInput();">
                                        <input type="button" class="btn btn-primary" value="확인" onclick="updatePass();">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
	        </div>
	    </div>
	</div>

<!-- 상단 사용자(필수 : 팝업 제외) -->
<%@ include file="/WEB-INF/jsp/common/include-footer.jspf"%>
</html>