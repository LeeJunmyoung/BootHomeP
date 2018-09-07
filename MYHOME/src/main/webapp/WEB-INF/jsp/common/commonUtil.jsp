<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
$(document).ready(function() {
	var message = '${message}';
	if (message != "")
    {
       alert(message);
       $("#message").val("");
    }
	
	//TABLE에서 TR선택시 해당 ROW를 ACTIVE표시
	$("table").delegate('tbody > tr', 'click', function(event) {
		var table = $(this).parent().children("tr");
		table.removeClass("active");
		$(this).addClass("active");
	});
	
	// Jquery draggable
    $(".modal").draggable({
        handle: ".modal-header"
    });
	
	$(".numeric").keyup(function (e) { 
    	/*
    	// Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }*/
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });
	
	$("#selAllCheck1").click(function() {
		$(".selAllCheck1").each(function() {
			this.attr('checked',true);
		});
	});
	
	
	//ip 유효성 검사
	$("[class~= ipAddress]").blur(function(){
		
		var expUrl = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
		 if(!expUrl.test(this.value) && this.value!= ""){
		   $("[class~= ipAddress]").val("");
		   $("[class~= ipAddress]").focus();
	       alert("IP 형식이 아닙니다.");
	   }
		 
	});
	
	//mac 유효성 검사
	$("[class~= macAddress]").blur(function(){
		
		
		var regExp = /^([0-9A-Fa-f]{2}[:-]?){5}([0-9A-Fa-f]{2})$/;
		
		if(!regExp.test(this.value) && this.value!=""){
			$("[class~= macAddress]").val("");
			$("[class~= macAddress]").focus();
			alert("잘못된 MAC주소 형식입니다. MAC주소 형식으로 입력 해주세요.");
			return false;
			
		}
	});
	 
	
});

//검색조건 하나의 스트링으로 만들기
function makeSearchCondition()
{
   var arr = $('[class~=searchCondition]');
   var searchCondition = "";
   
   for(var i=0; i < arr.length; i++) {
      if(arr[i].type == "checkbox") {
         if(arr[i].checked == true) {
            searchCondition += arr[i].id + "||";
            var str = $("#"+arr[i].id).val();
            if(str != "") {
               searchCondition += str + "||";
            }
            else {
               searchCondition += "null||" ;
            }
         }
      }
      else if(arr[i].type == "radio") {
         if(arr[i].checked == true) {
            searchCondition += arr[i].id + "||";
            var str = $("input:radio[name="+arr[i].id+"]:checked").val();
            if(str != "") {
               searchCondition += str + "||";
            }
            else {
               searchCondition += "null||" ;
            }
         }
      }
      else {
         searchCondition += arr[i].id + "||";
         var str = $("#"+arr[i].id).val();
         if(str != "") {
            searchCondition += str + "||";
         }
         else {
            searchCondition += "null||" ;
         }
      }
   }
   
   $("#searchCondition").val(searchCondition);
}

//검색조건 초기화
function initSearchCondition()
{
   var arr = $('[class~=searchCondition]');
   
   $(arr).each(
                 function()
                 {
                    $(this).val("");
                    $(this).prop("checked",false);
                 }
              );
}

//스트링으로 만들어진 검색조건 나누어서 각각의 검색조건에 셋팅하기
function setSearchCondition()
{
   var searchCondition = $("#searchCondition").val();
   
   if(searchCondition != "")
   {
      var arr = searchCondition.split("||");
      
      if(arr != "")
      {
         for(var i = 0; i < arr.length; i+=2)
         {
            if($("#"+arr[i]).attr("type") == "checkbox")
            {
               if($("#"+arr[i]).val() == arr[i+1])
               {
                  $("#"+arr[i]).attr("checked",true);
               }
            }
            else if($("#"+arr[i]).attr("type") == "radio")
            {
               $("input:radio[name=" + arr[i] + "]:input[value=" + arr[i+1] + "]").attr("checked", true); 
            }
            else if($("#"+arr[i]).prop("tagName") == "SELECT")
            {

                if(arr[i+1] == "null")
                {
                   $("#"+arr[i]).val("");
                }
                else
                {
                   $("#"+arr[i]).val(arr[i+1]);
                }
            }
            else
            {
               if(arr[i+1] == "null")
               {
                  $("#"+arr[i]).val("");
               }
               else
               {
                  $("#"+arr[i]).val(arr[i+1]);
               }
            }
         }
      }
      
   }
}
/**
 *	@function getNumber
 *	@author 양우정
 * @param obj : input value
 * @return boolean :  검증 여부
 *	@brief 숫자만 입력
 * 사용 : input : onclick='getNumber(this);' onKeyUp='getNumber(this);' 입력해주시면됩니다.
 */
function getNumber(obj){
var key = obj.value;
var str = "1234567890";
    for(var i=0;i<key.length;i++){
        if(str.indexOf(key.charAt(i))<0){
        	alert('숫자만입력가능합니다.');
            obj.value="";
            obj.focus();
             return false;
        }
    }
}
 
/**
 *	@function getNumber
 *	@author 장총명
 * @param obj : input value
 * @return boolean :  검증 여부
 *	@brief 핸드폰 번호 체크
 */
function getPhoneNumber(obj){

	 var inText = obj.value;
	    var ret;
	    for (var i=0; i<inText.length; i++)
	    {
	        ret = inText.charCodeAt(i);
	        if (ret != 45)
	        {
	            if ((ret<48) || (ret>57))
	            {
	                alert("숫자 또는 하이푼만 기입하여 주시기 바랍니다.");
	                obj.value = "";
	                obj.focus();
	                return false
	            }    
	        }
	    }
	 
}


/**
 *	@function getHex
 *	@author 양우정
 * @param obj : input value
 * @return boolean :  검증 여부
 *	@brief Hex 만 입력
 */
function getHex(obj){
	var key = obj.value;

	var str = /[0-9a-fA-F.;\-]/;
	for( var i=0; i<key.length; i++){
		if(parseInt(key,16) > 31 || str.test(key.charAt(i)) == false  || key.length > 3){
	        obj.value="";
	        obj.focus();
	        return false;
	    }
	}
}


/**
 *	@function getEngNumber
 *	@author 양우정
 * @param obj : input value
 * @return boolean :  검증 여부
 *	@brief 영문 숫자만 입력가능합니다.
 * 사용 : input : onclick='getEngNumber(this);' onKeyUp='getEngNumber(this);' 입력해주시면됩니다
 */
function getEngNumber(obj){
var key = obj.value;
var str = /[0-9a-zA-Z.;\-]/;
    for( var i=0; i<key.length; i++){
        if(key.charAt(i) != " " && str.test(key.charAt(i)) == false ){
            obj.value="";
            obj.focus();
            return false;
        }
    }
}


/**
 *	@function EngNumber
 *	@author 양우정
 * @param obj : input value
 * @return boolean :  검증 여부
 *	@brief 대문자영문 숫자만 입력가능합니다.
 * 사용 : input : onclick='EngNumber(this);' onKeyUp='EngNumber(this);' 입력해주시면됩니다
 */
function EngNumber(obj){
var key = obj.value;
var str = /[0-9A-Z.;\-]/;
  for( var i=0; i<key.length; i++){
      if(key.charAt(i) != " " && str.test(key.charAt(i)) == false ){
          obj.value="";
          obj.focus();
          return false;
      }
  }
}


/**
 * @function dateSetCalenderOne
 * @author 양우정
 * @param dateId : input id
 * @brief 하나의 달력 Input box 를 설정함
 */
function dateSetCalenderOne(dateId){
	var date = $("#" + dateId);
	$(date).datepicker({
	    format: "yyyy-mm-dd",
	    autoclose: true,
	    todayHighlight: true
	});
}

/**
 * @function bootstrapCalenderTwo
 * @author 양우정
 * @param startDateId : 시작 input id
 * @param endDateId : 종료 input id
 * @param termDate : 오늘날짜를 기준으로 입력한 숫자만의 뒷 날짜를 default 값으로 지정할 수 있다.
 * @brief 2개의 달력 Input box 를 설정함
 * 사용 :	
  	ex1) termDate : 0 (오늘)
  	ex2) termDate : 30 (한 달 뒤)
  	- ex2 의 경우 ID만기일이 한 달 뒤일때 사용하면 달력 디폴트 날짜가 한달 뒤로 설정됨.
 *
 */
function bootstrapCalenderTwo(startDateId, endDateId, termDay){
	var startDate = $("#" + startDateId);
	var endDate = $("#" + endDateId);

	var today = new Date();
    var chgDate = new Date();
    chgDate.setDate( today.getDate() - termDay );

	startDate.datepicker({
		format: "yyyy-mm-dd",
		autoclose: true,
		todayHighlight: true
	}).on('changeDate', function(ev) {
		endDate.datepicker('setStartDate', startDate.datepicker("getDate") );
	});

	endDate.datepicker({
	    format: "yyyy-mm-dd",
	    autoclose: true,
	    todayHighlight: true
	}).on('changeDate', function(ev) {
    	startDate.datepicker('setEndDate', endDate.datepicker("getDate") );
	});

	startDate.datepicker('setDate', chgDate);
	startDate.datepicker('setEndDate', today);

	endDate.datepicker('setDate', today);
	endDate.datepicker('setEndDate', today);
	endDate.datepicker('setStartDate', chgDate);
}

function essentialValChk() {
	var arr = $('[class~=essVal]');
	var chkFlag = true;
	
	$(arr).each(function() {
		var type = $(this).attr("type"); 
		
		if($(this).attr("disabled") != "disabled" && $(this).css('display') != "none")
        {
			if($(this).val() == "")
            {
               alert("필수값은 모두 입력하셔야합니다.");
               $(this).focus();
               chkFlag = false;
               return false;
            }
        } 
	});
	
	if(chkFlag == false)
   {
      return false;
   }
}

function essentialValChkID(id) {
	var arr = $(id +' [class~=essVal]');
	var chkFlag = true;
	
	$(arr).each(function() {
		var type = $(this).attr("type");
		
		if($(this).attr("disabled") != "disabled" && $(this).css('display') != "none")
        {
			if($(this).val() == "")
            {
               alert("필수값은 모두 입력하셔야합니다.");
               $(this).focus();
               chkFlag = false;
               return false;
            }
        } 
	});
	
	if(chkFlag == false)
   {
      return false;
   }
}

//데이터 전송할 폼의 id를 넣으면 object형태로 변환시켜줌
function convertFormToObject(formid) {
	//전송할 form이름
	var disabled = $("#"+formid).find(':disabled').removeAttr('disabled');
	
	var formdata = $("#"+formid).serialize();
	disabled.attr('disabled','disabled');
	
	//var param = JSON.parse('{"' + decodeURI(formdata.replace(/&/g, "\",\"").replace(/=/g,"\":\"").replace(/\+/g, '%20')) + '"}');
	var param = JSON.parse('{"' + decodeURIComponent(formdata.replace(/&/g, "\",\"").replace(/=/g,"\":\"").replace(/\+/g, '%20')) + '"}');
	return param;
}

//object의 키와 & ID에 맵핑되어 값을 셋팅
function valIntoForm(obj) {
	for(key in obj) {
			$("#"+[key]).val(obj[key]);
	}
}

//폼 내부의 input 및 select 값들을 초기화
function cleanForm(formName) {
	$("#"+formName+" input").each(function() {
		//코드가 등록 될 그룹코드를 제외한 나머지 input 초기화
		$(this).val("");
	});
	$("#"+formName+" select").each(function() {
		//코드가 등록 될 그룹코드를 제외한 나머지 input 초기화
		$(this).val("");
	});
}

function QueryString(qs)
{
	var qs = "key1=&key2&search=Rock+%26+Roll&rock%26roll=here+to+stay&key3=dog&key3=cat&key3=mouse&weird=%26%CE%A8%E2%88%88";
    this.dict= {};

    // If no query string  was passed in use the one from the current page
    if (!qs) qs= location.search;

    // Delete leading question mark, if there is one
    if (qs.charAt(0) == '?') qs= qs.substring(1);

    // Parse it
    var re= /([^=&]+)(=([^&]*))?/g;
    while (match= re.exec(qs))
    {
        var key= decodeURIComponent(match[1].replace(/\+/g,' '));
        var value= match[3] ? QueryString.decode(match[3]) : '';
        if (this.dict[key])
            this.dict[key].push(value);
        else
            this.dict[key]= [value];
    }
}

QueryString.decode= function(s)
{
    s= s.replace(/\+/g,' ');
    s= s.replace(/%([EF][0-9A-F])%([89AB][0-9A-F])%([89AB][0-9A-F])/gi,
        function(code,hex1,hex2,hex3)
        {
            var n1= parseInt(hex1,16)-0xE0;
            var n2= parseInt(hex2,16)-0x80;
            if (n1 == 0 && n2 < 32) return code;
            var n3= parseInt(hex3,16)-0x80;
            var n= (n1<<12) + (n2<<6) + n3;
            if (n > 0xFFFF) return code;
            return String.fromCharCode(n);
        });
    s= s.replace(/%([CD][0-9A-F])%([89AB][0-9A-F])/gi,
        function(code,hex1,hex2)
        {
            var n1= parseInt(hex1,16)-0xC0;
            if (n1 < 2) return code;
            var n2= parseInt(hex2,16)-0x80;
            return String.fromCharCode((n1<<6)+n2);
        });
    s= s.replace(/%([0-7][0-9A-F])/gi,
        function(code,hex)
        {
            return String.fromCharCode(parseInt(hex,16));
        });
    return s;
};

QueryString.prototype.value= function (key)
{
    var a= this.dict[key];
    return a ? a[a.length-1] : undefined;
};

QueryString.prototype.values= function (key)
{
    var a= this.dict[key];
    return a ? a : [];
};

QueryString.prototype.keys= function ()
{
    var a= [];
    for (var key in this.dict)
        a.push(key);
    return a;
};



function ValChk() {
	var arr = $('[class~=network]');
	var chkFlag = true;
	
	$(arr).each(function() {
		 
		
		if($(this).attr("disabled") != "disabled" && $(this).css('display') != "none")
        {
			var type="";
			if($(this).hasClass('mac')){
				type="MAC";
			}else if($(this).hasClass('ip')){
				type="IP";
			}else if($(this).hasClass('subnet')){
				type="SUBNET";
			}
			
        	if($(this).val() != ""){
        		var ip = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
        	
				if(type=="MAC")
	            {
				   var macExpression = /^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$/;
				   if(!macExpression.test($(this).val())){
					   alert("Mac 형식이 아닙니다.");
					   $(this).focus();
					   chkFlag = false;
		               return false;
				   }
	               
	            }else if(type=="IP"){
	            	var ipExpression = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
	            	if(!ipExpression.test( $(this).val() ) ){
	            		alert("IP 형식이 아닙니다.");
	            		$(this).focus();
	            		chkFlag=false;
	            		return false;
	            	}
	            }else if(type=="SUBNET"){
	            	var ipExpression = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
	            	if(!ipExpression.test($(this).val())){
	            		alert("Subnet Mask 형식이 아닙니다.");
	            		$(this).focus();
	            		chkFlag=false;
	            		return false;
	            	}
	            }
        	}
        } 
	});
	
	if(chkFlag == false)
   {
      return false;
   }
}



</script>
