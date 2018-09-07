<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/jsp/common/css.jsp" />
<jsp:include page="/WEB-INF/jsp/common/javascript.jsp" />
<%@ page language="java"%>
<%@ page import="prov.LoginManager"%>
<%!
    //싱글톤 패턴을 사용하였기 때문에 생생되어있는 인스턴스를 얻어온다.
    LoginManager loginManager = LoginManager.getInstance(); 
%>
<%
    //login_try에서 로그인을 하지 않을경우 세션에 남아있는 userId를 제거한다.
    session.removeAttribute("logUser");
%>

<script type="text/javaScript" language="javascript">
//엔터키 이벤트 처리
$(document).ready(function() {
	init();
   $("input").keydown(function(event) {
      if(event.keyCode == 13)
      {
         login();
      }
 	});
   
    // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
    if (getCookie("loginCookie"))  { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우

     document.loginForm.log_user_id.value = getCookie("loginCookie"); //input 이름이 id인곳에 getCookie("log_user_id")값을 넣어줌
     document.loginForm.idsave.checked = true; // 체크는 체크됨으로
   }
});
	
  
//쿠키 불러오는 함수
function getCookie(Name) { 
   var search = Name + "=";
   if (document.cookie.length > 0) { 
     // if there are any cookies
     offset = document.cookie.indexOf(search);
     if (offset != -1) { 
  	 // set index of beginning of value
       offset += search.length; 
       // set index of end of cookie value
       end = document.cookie.indexOf(";", offset);

       if (end == -1) {
         end = document.cookie.length;
       }
       return unescape(document.cookie.substring(offset, end));
     }
   }
 }

//초기화
function init() {
	   var message = $("#message").val();
	   if(message !="") {
		   alert(message);
		   $("#message").val("");
	   }
	   $("#log_user_id").focus();
}	

//로그인 실행
function login() {
   if($("#log_user_id").val() == "") {
      $("#log_user_id").focus();
   }
   else if($("#log_user_pw").val() == "") {
      $("#log_user_pw").focus();
   }
   else {
	   //alert($('input[name="isUseCookie"]').val());
	   checkingId();
       //$('form').attr("action", "<c:url value='/common/loginProc.do'/>").submit();
   }
}

function checkingId() {
	$.ajax({
		url : "/common/isUsing.ajax" ,
		data : {
			log_user_id : $("#log_user_id").val() ,
			log_user_pw : $("#log_user_pw").val() ,
		} ,
		cache : false ,
		async : false ,
		success : function(result){
			 if(result=="LOCKED") {
				alert("잠긴 계정입니다. 관리자에게 문의하세요.");
			} else if(result=="REQUIRED") {
				alert("승인되지 않은 계정입니다. 관리자에게 문의하세요.");
			} else if(result=="USING") {
				if(confirm("이미 로그인 된 계정입니다. 로그인 하시겠습니까?")) {
					$('form').attr("action", "<c:url value='/common/loginProc.do'/>").submit();
				} else {
					$("#log_user_id").val("");
					$("#log_user_pw").val("");
					
					$("#log_user_id").focus();
				}
			} else if(result=="SUCCESS") {
				$('form').attr("action", "<c:url value='/common/loginProc.do'/>").submit();
			} else if(result=="FAILED") {
				alert("로그인에 실패했습니다. ID, 패스워드를 확인 해 주세요");
				$("#log_user_pw").val("");
				
				$("#log_user_id").focus();
			}
		},
		error : function(request, status, error){
			alert("로그인 중 오류가 발생 했습니다.");
		}
	});
};
</script>
<title>로그인 페이지</title>
</head>
<body class="gray-bg">
    <form class="form-vertical login-form" id="loginForm" name="loginForm" method="post" autocomplete="off">
    <input type="hidden" id="message" name="message" value="${message}">
    <input type="hidden" name="isUseCookie" value="">
	    <div class="middle-box text-center loginscreen animated fadeInDown">
	        <div>
	            <div class="middle_logo">
	                <h5 class="logo-name">Sync PC</h5>
	            </div>
               <div class="form-group">
                   <input type="text" class="form-control" placeholder="ID (사번)" id="log_user_id" name="log_user_id" required="">
               </div>
               <div class="form-group">
                   <input type="password" class="form-control" placeholder="Password"  id="log_user_pw" name="log_user_pw" required="" autocomplete="off">
               </div>
               <div class="form-actions" style="border:0">
               <!-- 
			          <div class="checkbox pull-left">
                    <input type="checkbox" id="isUseCookie">
                    <label for="checkAll">ID 저장</label>
	        	 -->
                    </div>
			          <button class="btn btn-primary block full-width m-b" onclick="login();">Login</button>
			        </div>
	        	</div>
	    </div>
    </form>
</body>
</html>