<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!DOCTYPE html>
<html lang="ko">          
<head>    
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.common.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.rtl.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.default.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.dataviz.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/kendo/kendo.dataviz.default.min.css">
<link rel="stylesheet" type="text/css" href="/bhmc-dms-web/resources/css/common.css">


<script type="text/javascript" src="/bhmc-dms-web/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/kendo/kendo.all.min.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/kendo/cultures/kendo.culture.ko.min.js"></script>
<!--[if lt IE 9]>
    <script src="/bhmc-dms-web/resources/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript">var _contextPath = "/bhmc-dms-web";</script>

<script type="text/javascript" src="/bhmc-dms-web/cmm/sci/js/selectCultureSettings.do"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/dms.common-1.0.js"></script>


<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/kendo.ui.ext-1.0.js"></script>




<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/jquery.ext-1.0.js"></script>
<script type="text/javascript" src="/bhmc-dms-web/resources/js/dms/jquery.xml2json.js"></script>
<script type="text/javascript">
kendo.culture("ko");
</script>
</head>
<body>
	<!-- content -->
	<section id="content_iframe">
		<button id="btn">btn</button>
		
		<!-- 멤법십 사용현황 -->
		<section class="group" style="height: 500%">   
			<!-- 탭메뉴 전체 영역 -->
			<div class="tab_area tab_iframe">
				<!-- 탭메뉴 -->
				<ul>
					<li id="Tab01" class="k-state-active">판매고문개인능력분석<!-- 판매고문개인능력분석 --></li>
					<li id="Tab02">차형 능력분석<!-- 차형 능력분석 --></li>
					<li id="Tab03">채널 분석<!-- 채널 분석--></li>
					<li id="Tab04">의향차형 분석<!-- 의향차형 분석 --></li>
					<li id="Tab05">판매고문 차형 등급분석<!-- 판매고문 차형 등급분석 --></li>
					<li id="Tab06">고객흐름 시간단위분석<!-- 고객흐름 시간단위분석 --></li>
					<li id="Tab07">의향등급분석<!-- 의향등급분석 --></li>
					<li id="Tab08">판매고문 의향 등급별 분포량 분석<!-- 판매고문 의향 등급별 분포량 분석 --></li>
					<li id="Tab09">평균대응시간분석<!-- 평균대응시간분석 --></li>
					<li id="Tab10">대응시간 만족률 분석<!-- 대응시간 만족률 분석 --></li>
					<li id="Tab11">재방문율분석<!-- 재방문율분석 --></li>
					<li id="Tab12">시승율분석<!-- 시승율분석 --></li>
					<li id="Tab13">회원등급통계보고서<!-- 회원등급통계보고서 --></li>
					<li id="Tab14">회원통계분석<!-- 회원통계분석 --></li>
				</ul>
				<!-- //탭메뉴 -->

				<!-- 판매고문개인능력분석 -->
				<div class="mt0">
					판매고문개인능력분석
				</div>
				<!-- //판매고문개인능력분석 -->

				<!-- 차형 능력분석 -->
				<div class="mt0">
					차형 능력분석
				</div>
				<!-- //차형 능력분석 -->

				<!-- 채널 분석 -->
				<div class="mt0">
					채널 분석
				</div>
				<!-- //채널 분석 -->

				<!-- 의향차형 분석 -->
				<div class="mt0">
					의향차형 분석
				</div>
				<!-- //의향차형 분석 -->

				<!-- 판매고문 차형 등급분석 -->
				<div class="mt0">
					판매고문 차형 등급분석
				</div>
				<!-- //판매고문 차형 등급분석 -->

				<!-- 고객흐름 시간단위분석 -->
				<div class="mt0">
					고객흐름 시간단위분석
				</div>
				<!-- //고객흐름 시간단위분석 -->

				<!-- 의향등급분석 -->
				<div class="mt0">
					의향등급분석
				</div>
				<!-- //의향등급분석 -->

				<!-- 판매고문 의향 등급별 분포량 분석 -->
				<div class="mt0">
					판매고문 의향 등급별 분포량 분석
				</div>
				<!-- //판매고문 의향 등급별 분포량 분석 -->

				<!-- 대응시간 만족률 분석 -->
				<div class="mt0">
					대응시간 만족률 분석
				</div>
				<!-- //대응시간 만족률 분석 -->

				<!-- 대응시간 만족률 분석 -->
				<div class="mt0">
					대응시간 만족률 분석
				</div>
				<!-- //대응시간 만족률 분석 -->

				<!-- 재방문율분석 -->
				<div class="mt0">
					재방문율분석
				</div>
				<!-- //재방문율분석 -->

				<!-- 시승율분석 -->
				<div class="mt0">
					시승율분석
				</div>
				<!-- //시승율분석 -->

				<!-- 회원등급통계보고서 -->
				<div class="mt0">
					회원등급통계보고서
				</div>
				<!-- //회원등급통계보고서 -->

				<!-- 회원통계보고서 -->
				<div class="mt0">
					회원통계보고서
				</div>
				<!-- //회원통계보고서 -->
			</div>
			<!-- //탭메뉴 전체 영역 -->
		</section>
		<!-- //목표분해도 -->
		<script type="text/javascript">
// 			function scrollTab(){
// 				$(".k-tabstrip-wrapper ul.k-tabstrip-items").css({"margin-left":"-100px"});
// 			}
		</script>
		<script type="text/javascript">  
			$(document).ready(function() {
				$(".tab_area").kendoExtTabStrip({
					animation : false
					,displayScrollButton:true
		            ,scrollWidth:20
				});
				
// 				$("#btn").click(function(e){
// 					$(".k-tabstrip-wrapper ul.k-tabstrip-items").css({"overflow-x":"hidden", "overflow-y":"hidden", "height":"26px"});
// 					$(".k-tabstrip-wrapper div.k-tabstrip-top").css({"overflow-x":"hidden"});
// 					$(".k-tabstrip-wrapper div.k-tabstrip-top").prepend("<div style=\"position:fixed;right:0;margin-right:10px;z-index:60000;\"><div style='height:27px;width:13px;border:1px solid #d8d8d8;cursor:pointer;float:left;background:url(/bhmc-dms-web/resources/img/ico_prev.png) #F1F1F1 no-repeat 2px 1px;'></div><div style='height:27px;width:13px;padding:0px 2px;border:1px solid #d8d8d8;cursor:pointer;margin-left:14px;background:url(/bhmc-dms-web/resources/img/ico_next.png) #F1F1F1 no-repeat 2px 1px;'></div></div>");
// 				});
			});
		</script>
	</section>
</body>
</html>