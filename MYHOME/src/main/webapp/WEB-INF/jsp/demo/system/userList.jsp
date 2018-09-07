<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="/WEB-INF/jsp/common/include-header.jspf"%> 

<script type="text/javascript">
var cnt=0;
$(document).ready(function() {
	
	var $changeEvnt = $('[id$="id"]');
	$changeEvnt.on("change", function() {
		if($("#id").val() != '') {
			$("#userUpdBtn").addClass('btn-default');
			$("#userDelBtn").addClass('btn-default');
		} else {
			$("#userUpdBtn").removeClass('btn-default');
			$("#userDelBtn").removeClass('btn-default');
		}
	}).triggerHandler('change');
	
});

//체크박스 전체선택 및 선택해제 
function checkAll(){
	var checkCnt = 0;

	if(checkCnt==0){
		$("input[name=checkAll]").prop('checked',true);
		
		$('[name="delUser"]').each(function(i,elements) {

			if($('[name="delUser"]:eq('+checkCnt+')').is(':visible') == true ){
				
				$('[name="delUser"]:eq('+checkCnt+')').prop("checked", true);
				$("#userDelBtn").addClass('btn-default');
			}
			checkCnt++;
		});
	} else if(checkCnt==1){
		$("input[name=checkAll]").prop('checked',false);
		$("input[name=delUser]").prop("checked", false);
		$("#userDelBtn").removeClass('btn-default');
		
		checkCnt=0;
	}
}

//Modal 창에서 저장버튼 클릭 시
function saveUser() {
	$('#myModal').modal('hide');
	
	var urlGubun = $("#gubun").val();
	var url="/demo/insertUser.ajax";
	
	var data = convertFormToObject("insertForm");
	
	if(essentialValChk() != false) {
		$.ajax({
			type    : 'POST',
			url     : url,
			//TODO id?
			data    : data,
			cache   : false,
			async   : false,
			success : function(response) {
				if(urlGubun == 'update') {
					alert("사용자 수정이 완료되었습니다.");
				} else {
					alert("사용자 등록이 완료되었습니다.");
				}
				$("form").attr("action", "<c:url value='/'/>").attr("method", "post").submit();
			},
			error   : function(request, status, error) {
				if(urlGubun == 'update') {
					alert("수정 중 오류가 발생하였습니다.");
				} else {
					alert("등록 중 오류가 발생하였습니다.");
				}
			}
		});
	}
}

//등록버튼 눌렀을 때 상태변화
function setAddStat() {
	cleanForm("insertForm");
	
	$("#gubun").val("add");
	$("#id").attr("disabled", false);
	$("#myModal").modal('toggle');
}

//수정버튼 클릭 시 이벤트
function setUpdStat() {
	var id = $("#sel_id").val();
	
	$("#id").attr("disabled", true);
	if(id == "") {
		alert("선택 된 사용자가 없습니다.");
		return false;
	}
	
	//등록과 업데이트 구분을 위함
	$("#gubun").val("update");
	
	$.ajax({
		type    : 'POST',
		url     : "/demo/selectUser.ajax",
		data    : {id : id},
		cache   : false,
		async   : false,
		success : function(result) {
			valIntoForm(result);
		}
	});
	//모달 팝업
	$("#myModal").modal('toggle');
}

//삭제버튼 클릭 시 이벤트
function delUser() {
	var index = 0;
	var id_arr = new Array();

	var id;
	$('input[name="delUser"]').each(function() {
		if(this.checked) {
			id_arr[index] = this.value;
			index++;
		}
	});

	if(index == 0) {
		alert("삭제 할 사용자를 선택 해 주세요.");
		return false;
	} else {
		if(confirm("선택한 사용자를 삭제 하시겠습니까?")) {
			if(id_arr!="") {
				id = id_arr.toString();
			}
			
			//삭제 처리
			$.ajax({
				type    : 'POST',
				url     : "/demo/deleteUser.ajax",
				data    : {id : id},
				cache   : false,
				async   : false,
				success : function(result) {
					alert("삭제 완료되었습니다.");
					$("form").attr("action", "<c:url value='/'/>").attr("method", "post").submit();
				},
				error   : function(request, status, error) {
					alert("삭제 중 오류가 발생하였습니다.");
				}
			});
		}
	}
}

function setID(id) {
	$("#sel_id").val(id);
}
</script>

<div class="wrapper wrapper-content animated fadeInRight" >
	<!-- 화면 공통 기본정보 -->
	<!-- 페이징 정보(선택 : 페이징이 있는 화면에서만 -->
	<!-- 검색조건 -->
	<div id="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-md-4" style="margin-bottom:20px">
				
				</div>
				<div class="col-md-8 right_padding_zero" style="margin-bottom:20px">
					<button class="btn btn-w-m btn-default  pull-right" type="button" onclick="delUser();" id="userDelBtn">&nbsp;&nbsp;삭제&nbsp;&nbsp;</button>
					<button class="btn btn-w-m btn-default pull-right right_margin" type="button" onclick="setUpdStat();" id="userUpdBtn">&nbsp;&nbsp;수정&nbsp;&nbsp;</button>
					<button class="btn btn-w-m btn-platform pull-right right_margin" type="button" onclick="setAddStat();" id="userAddBtn">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
				</div>
			
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="table-responsive">
						<input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="Search in table">
						<table class="footable table-hover table" data-page-size="10" data-filter=#filter>
							<thead>
								<tr class="center">
									<th id="firstTh" style="text-align: center;"><input name="checkAll" type="checkbox" onclick="checkAll();"></th>
									<th>사용자 ID</th>
									<th>사용자 명</th>
									<th>E-mail</th>
									<th>주소</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(userList) > 0}">
										<c:forEach items="${userList}" var="row" varStatus="rowCnt">
											<tr onclick="setID('${row.id}')"/>
												<td><input type="checkbox" name="delUser" value="${row.id}"></td>
												<td>${row.id}</td>
												<td>${row.name}</td>
												<td>${row.email}</td>
												<td>${row.addr}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</tbody>
							<tfoot>
								<tr>
									<td colspan="5">
										<ul class="pagination pull-right"></ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- 등록/수정  MODAL 창 -->
	<div class="modal fade" id="myModal" tabindex="1" role="dialog"	area-labelledby="myModallabel">


		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">&times;</a>
				</div>
				<div class="modal-body">
					<!-- form -->
					<form class="form-horizontal" id="insertForm" name="insertForm">
						<input type="hidden" id="gubun" value="" />
						<input type="hidden" id="sel_id" value=""/> 

						<div class="form-group">
							<label class="col-sm-2 control-label essential">아이디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control essVal" name="id" id="id">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">사용자 명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name" id="name">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email" id="email">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="addr" id="addr">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success pull-right" type="button"
						onclick="saveUser();">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</div>
	<!--FOOTER  -->
	<%@ include file="/WEB-INF/jsp/common/include-footer.jspf"%>