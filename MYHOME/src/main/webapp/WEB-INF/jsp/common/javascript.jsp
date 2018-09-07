<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--=== JavaScript ===-->
<!-- <script src="/js/common/authorize/jquery.cookie.js" type="text/javascript"></script> -->
<!-- <script src="/js/common/authorize/jquery.bxslider.min.js" type="text/javascript"></script> -->
<!-- <script src="/js/common/jquery.form.min.js" type="text/javascript"></script> -->
<!-- <script type="text/javascript" src="/melon/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script> -->
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]><script src="/melon/assets/js/libs/html5shiv.js"></script><![endif]-->
 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- inpinia -->
<script type="text/javascript" src="/inspinia/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="/inspinia/js/jquery-ui.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/inspinia/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/inspinia/js/inspinia.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/pace/pace.min.js"></script>
<script type="text/javascript" src="/inspinia/js/bootstrap-filestyle.js"></script>
<script type="text/javascript" src="/inspinia/js/bootstrap-filestyle.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/chartist/chartist.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/footable/footable.all.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/chartJs/Chart.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/canvasjs/canvasjs.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/jqGrid/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/inspinia/js/jssor.slider-21.1.mini.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/chosen/chosen.jquery.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/starrating/star-rating.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/tinycon/tinycon.min.js""></script>
<script type="text/javascript" src="/inspinia/js/plugins/select2/select2.full.min.js"></script>
<script type="text/javascript" src="/inspinia/js/plugins/jquery.form.js"></script>
<!-- Input Mask-->
<script type="text/javascript" src="/inspinia/js/plugins/jasny/jasny-bootstrap.min.js"></script>
<!-- Common Util -->
<jsp:include page="/WEB-INF/jsp/common/commonUtil.jsp" />
<!-- 페이지별 js -->
<%-- <script type="text/javascript" src="/js/${fn:replace(fn:substringAfter(pageContext.request.requestURI, '/WEB-INF/js/'), '.js', '.js')}"></script> --%>
<!-- favicon -->
<LINK REL="KT ICON" href="/img/ktlogo.png">