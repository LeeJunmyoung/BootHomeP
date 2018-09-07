<%@ page contentType="text/html; charset=utf-8"%>
<!-- 메세지 정보 -->
<input type="hidden" id="message" name="message" value="${message}"/>
<input type="hidden" id="prevMessage" name="prevMessage" value="${prevMessage}"/>
<!-- 에러 페이지 정보 -->
<input type="hidden" id="errorTarget" name="errorTarget" value="${errorTarget}"/>
<!-- 검색조건 -->
<input type="hidden" id="searchCondition" name="searchCondition" value="${searchCondition}"/>

<!-- 선택 된 메뉴 -->
<input type="hidden" id="selTopMenu" name="selTopMenu" value="${ selTopMenu }" />

<!-- 중복 등록 방지를 위한 토큰 정보 -->
<input type="hidden" id="TOKEN" name="TOKEN" value="${sessionScope.TOKEN }"/>

<!-- 파일다운로드를 위한 정보 -->
<input type="hidden" id="fileName" name="fileName"/>
<input type="hidden" id="filePath" name="filePath"/>
<input type="hidden" id="deleteFileList" name="deleteFileList" value=""/>

<!-- 최초 공지사항 팝업 카운트 -->
<input type="hidden" id="popupNoticeCnt" value="${popupNoticeCnt }" />