<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

// 공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>


//DEPLOY유형:COM023
var deployTpList = [];
<c:forEach var="obj" items="${deployTpDS}">
 deployTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTpArray = [];
$.each(deployTpList, function(idx, obj){
 deployTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY상태:COM024
var deployStatList = [];
<c:forEach var="obj" items="${deployStatDS}">
 deployStatList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployStatArray = [];
$.each(deployStatList, function(idx, obj){
 deployStatArray[obj.cmmCd] = obj.cmmCdNm;
});

//스케줄유형코드:COM034
var scheduleTpList = [];
<c:forEach var="obj" items="${scheduleTpDS}">
 scheduleTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var scheduleTpArray = [];
$.each(scheduleTpList, function(idx, obj){
 scheduleTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
 operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//PROPERTY파일타입코드:COM038
var prtyFileTpList = [];
<c:forEach var="obj" items="${prtyFileTpDS}">
prtyFileTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var prtyFileTpArray = [];
$.each(prtyFileTpList, function(idx, obj){
 prtyFileTpArray[obj.cmmCd] = obj.cmmCdNm;
});
prtyFileTpArray[""] = "";


</script>

<section id="windows" class="pop_wrap">
<form id="basicForm" name="basicForm" method="POST" onsubmit="return false;">

    <!-- SPEC 기본정보 -->
    <section class="group">

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">SPEC코드</th>                       <!-- SPEC코드 -->
                        <td>
                            <input id="specCd" name="specCd" readonly class="form_input form_readonly" style="width:60%" data-json-obj="true">
                        </td>
                        <th scope="row">SPEC명</th>                         <!-- SPEC명 -->
                        <td>
                            <input id="specNm" name="specNm" class="form_input" style="width:90%" data-json-obj="true">
                        </td>
                        <th scope="row">등록일</th>                         <!-- 등록일 -->
                        <td>
                            <input id="regDt" name="regDt" readonly class="form_datepicker" style="width:70%"  data-json-obj="true">
                        </td>
                        <th scope="row"></th>
                        <td>

                        </td>
                    </tr>

                    <tr>
                        <th scope="row">Note</th>       <!-- Note -->
                        <td colspan="7">
                            <textarea id="specCont" name="specCont" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </section>
    <!-- SPEC 기본정보 -->

</form>


        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active">SQL</li>
                <li>PROPERTY</li>
                <li>FILE</li>
                <li>POLICY</li>
            </ul>
            <!-- //탭메뉴 -->
            <!-- SQL -->
            <div>
                <div class="table_form form_width_100per max191" id="genInfoForm01">

<form id="sqlForm" name="sqlForm" method="POST" onsubmit="return false;">
    <!-- SQL Scripts LIST -->
    <section class="group">
        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="sqlGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:13%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">작업시도횟수</th>                       <!-- 작업시도횟수 -->
                        <td>
                            <input id="operTryCnt" name="operTryCnt" class="form_input" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">실패이후계속진행여부</th>                         <!-- 실패이후계속진행여부 -->
                        <td>
                            <input id="failAftCtnuPgssYn" name="failAftCtnuPgssYn" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">실패이후롤백여부</th>                         <!-- 실패이후롤백여부 -->
                        <td>
                            <input id="failAftRollbackYn" name="failAftRollbackYn" style="width:70%"  data-json-obj="true" >
                        </td>
                        <th scope="row">롤백우선순위값</th>                         <!-- 롤백우선순위값 -->
                        <td>
                            <input id="rollbackProrVal" name="rollbackProrVal" class="form_input" style="width:70%"  data-json-obj="true" >
                        </td>
                    </tr>

                    <tr>
                        <th scope="row">SQL Scripts</th>        <!-- SQL텍스트내용 -->
                        <td colspan="7">
                            <textarea id="sqlTextCont" name="sqlTextCont" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">ROLLBACK SQL</th>       <!-- 롤백SQL텍스트내용 -->
                        <td colspan="7">
                            <textarea id="rollbackSqlTextCont" name="rollbackSqlTextCont" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>



    </section>
    <!--  SQL Scripts LIST -->
</form>

                </div>
            </div>
            <!-- //SQL -->


            <!-- PROPERTY -->
            <div>
                <div class="table_form form_width_100per max191" id="genInfoForm02">


<form id="prtyForm" name="prtyForm" method="POST" onsubmit="return false;">
    <!-- PROPERTY LIST -->
    <section class="group">

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="prtyGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:13%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">작업시도횟수</th>                       <!-- 작업시도횟수 -->
                        <td>
                            <input id="prty_operTryCnt" name="prty_operTryCnt" class="form_input" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">PROPERTY파일명</th>                         <!-- PROPERTY파일명 -->
                        <td>
                            <input id="prty_prtyFileNm" name="prty_prtyFileNm" class="form_input" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">PROPERTY키명</th>                         <!-- PROPERTY키명 -->
                        <td>
                            <input id="prty_prtyKeyNm" name="prty_prtyKeyNm" class="form_input"  style="width:70%"  data-json-obj="true" >
                        </td>
                        <th scope="row">PROPERTY키값</th>                         <!-- PROPERTY키값 -->
                        <td>
                            <input id="prty_prtyKeyVal" name="prty_prtyKeyVal" class="form_input" style="width:70%"  data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">실패이후계속진행여부</th>                       <!-- 실패이후계속진행여부 -->
                        <td>
                            <input id="prty_failAftCtnuPgssYn" name="prty_failAftCtnuPgssYn" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">실패이후롤백여부</th>                         <!-- 실패이후롤백여부 -->
                        <td>
                            <input id="prty_failAftRollbackYn" name="prty_failAftRollbackYn" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row"></th>
                        <td>

                        </td>
                        <th scope="row"></th>
                        <td>

                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </section>
    <!--  PROPERTY LIST -->
</form>

                </div>
            </div>
            <!-- //PROPERTY -->


            <!-- FILE -->
            <div>
                <div class="table_form form_width_100per max191" id="genInfoForm03">


<form id="fileForm" name="fileForm" method="POST" onsubmit="return false;">
    <!-- FILE LIST -->
    <section class="group">
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="fileGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:13%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">작업시도횟수</th>                       <!-- 작업시도횟수 -->
                        <td>
                            <input id="file_operTryCnt" name="file_operTryCnt" class="form_input" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">딜러코드자동추가여부</th>                         <!-- 딜러코드자동추가여부 -->
                        <td>
                            <input id="file_dlrCdAutoAddYn" name="file_dlrCdAutoAddYn" style="width:70%" data-json-obj="true" >
                        </td>
                        <th scope="row">실패이후계속진행여부</th>                         <!-- 실패이후계속진행여부 -->
                        <td>
                            <input id="file_failAftCtnuPgssYn" name="file_failAftCtnuPgssYn" style="width:70%"  data-json-obj="true" >
                        </td>
                        <th scope="row">실패이후롤백여부</th>                         <!-- 실패이후롤백여부 -->
                        <td>
                            <input id="file_failAftRollbackYn" name="file_failAftRollbackYn" style="width:70%"  data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">소스파일경로명</th>                       <!-- 소스파일경로명 -->
                        <td colspan="3">
                            <input id="file_srcFilePathNm" name="file_srcFilePathNm" class="form_input" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">대상파일경로명</th>                         <!-- 대상파일경로명 -->
                        <td colspan="3">
                            <input id="file_targFilePathNm" name="file_targFilePathNm" class="form_input" style="width:90%" data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">백업대상파일경로명</th>                       <!-- 백업대상파일경로명 -->
                        <td colspan="3">
                            <input id="file_bakTargFilePathNm" name="file_bakTargFilePathNm" class="form_input" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row"></th>                         <!--  -->
                        <td colspan="3">

                        </td>
                    </tr>

                </tbody>
            </table>
        </div>



    </section>
    <!--  FILE LIST -->
</form>

                </div>
            </div>
            <!-- //FILE -->


            <!-- POLICY -->
            <div>
                <div class="table_form form_width_100per max191" id="genInfoForm04">


<form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">
    <!-- DEPLOY MASTER LIST -->
    <section class="group">

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="dplyMastGrid"></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:13%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">DEPLOY버전번호</th>                       <!-- DEPLOY버전번호 -->
                        <td>
                            <input id="deployVerNo" name="deployVerNo" readonly class="form_input form_readonly" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">DEPLOY유형코드</th>                         <!-- DEPLOY유형코드 -->
                        <td>
                            <input id="deployTpCd" name="deployTpCd" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">DEPLOY시작일자</th>                         <!-- DEPLOY시작일자 -->
                        <td>
                            <input id="deployStartDt" name="deployStartDt" style="width:90%"  data-json-obj="true" >
                        </td>
                        <th scope="row">DEPLOY종료일자</th>                         <!-- DEPLOY종료일자 -->
                        <td>
                            <input id="deployEndDt" name="deployEndDt" style="width:90%"  data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">DEPLOY상태코드</th>                       <!-- DEPLOY상태코드 -->
                        <td>
                            <input id="deployStatCd" name="deployStatCd" readonly class="form_readonly" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">DEPLOY재시도횟수</th>                         <!-- DEPLOY재시도횟수 -->
                        <td>
                            <input id="deployRetryCnt" name="deployRetryCnt" class="form_input" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">DEPLOY재시도간격값</th>                         <!-- DEPLOY재시도간격값 -->
                        <td>
                            <input id="deployRetryIvalVal" name="deployRetryIvalVal" class="form_input"  style="width:90%"  data-json-obj="true" >
                        </td>
                        <th scope="row">결과수신타임아웃시간</th>                         <!-- 결과수신타임아웃시간 -->
                        <td>
                            <input id="rsltReceiveTmoutHm" name="rsltReceiveTmoutHm" class="form_input" style="width:90%"  data-json-obj="true" >
                        </td>
                    </tr>

                    <tr>
                        <th scope="row">ALIVECHECK실패허용여부</th>                       <!-- DEPLOY상태코드 -->
                        <td>
                            <input id="achkFailAlwYn" name="achkFailAlwYn" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">ALIVECHECK실패허용건수</th>                         <!-- ALIVECHECK실패허용건수 -->
                        <td>
                            <input id="achkFailAlwCnt" name="achkFailAlwCnt" class="form_input" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">허용실패DMS건수</th>                         <!-- 허용실패DMS건수 -->
                        <td>
                            <input id="alwFailDmsCnt" name="alwFailDmsCnt" class="form_input"  style="width:90%"  data-json-obj="true" >
                        </td>
                        <th scope="row">DMS그룹건수</th>                         <!-- DMS그룹건수 -->
                        <td>
                            <input id="dmsGrpCnt" name="dmsGrpCnt" class="form_input" style="width:90%"  data-json-obj="true" >
                        </td>
                    </tr>

                    <tr>
                        <th scope="row">처리결과공지여부</th>                       <!-- 실패이후계속진행여부 -->
                        <td>
                            <input id="procRsltNotiYn" name="procRsltNotiYn" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">처리결과공지완료여부</th>                       <!-- 처리결과공지완료여부 -->
                        <td>
                            <input id="procRsltNotiEndYn" name="procRsltNotiEndYn" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row">처리결과공지완료일자</th>                       <!-- 처리결과공지완료일자 -->
                        <td>
                            <input id="procRsltNotiEndDt" name="procRsltNotiEndDt" readonly class="form_datepicker" style="width:90%" data-json-obj="true" >
                        </td>
                        <th scope="row"></th>
                        <td>

                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

        <div>
            <section style=" float:left; width:150px;">
                <div class="table_grid">
                    <div id="dplyGrpGrid"></div>
                </div>
            </section>
            <section style=" overflow:hidden; margin-left:160px;">
                <div class="table_grid">
                    <div id="dplyDlrGrid"></div>
                </div>
            </section>
        </div>

    </section>
    <!--  DEPLOY MASTER LIST -->
</form>

                </div>
            </div>
            <!-- //POLICY -->


        </div>


</section>

<script type="text/javascript">

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
    var options = parent.searchSpecInfoPopupWin.options.content.data;
//     alert(options.specCd);

//     initPage();
    $("#specCd").val(options.specCd);
    searchSpecInfo();

    // 등록일
    $("#regDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:toDay
   });

    // SQL Scripts 그리드 설정
    $("#sqlGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecSqlBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'SQL';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,sqlTextCont:{type:"string"}
                        ,operTryCnt:{type:"number"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                        ,rollbackSqlTextCont:{type:"string"}
                        ,rollbackProrVal:{type:"number"}
                    }
                }
            }
            ,requestEnd:function(e) {

                // 아래 코드는 테스트용
                var jioongrid = $("#sqlGrid").data("kendoExtGrid");

                var grid_data = jioongrid.dataSource.data();

                var i = 0;

            }
        }

        ,dataBinding:function(e) {
//             initSqlForm();
        }
        ,height:200
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"sqlTextCont", title:"SQL Scripts", width:300
                ,attributes:{"class":"ac"}
            }
            ,{field:"operTryCnt", title:"작업시도횟수", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"실패이후계속진행여부", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"실패이후롤백여부", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackProrVal", title:"롤백우선순위값", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            //if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

                gv_sqlGridModel_currUid = selectedVal.uid;

                $('#operTryCnt').val(selectedVal.operTryCnt);
                $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#rollbackProrVal').val(selectedVal.rollbackProrVal);
                $('#sqlTextCont').val(selectedVal.sqlTextCont);
                $('#rollbackSqlTextCont').val(selectedVal.rollbackSqlTextCont);

            } else {
                $('#operTryCnt').val(null);
                $('#failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#rollbackProrVal').val(null);
                $('#sqlTextCont').val(null);
                $('#rollbackSqlTextCont').val(null);
            }

        }

    });

    // SQL 실패이후계속진행여부
    $("#failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // SQL 실패이후롤백여부
    $("#failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // SPEC PROPERTY 그리드 설정
    $("#prtyGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecPrtyBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'PROPERTY';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,operTryCnt:{type:"number"}
                        ,prtyFileNm:{type:"string"}
                        ,prtyKeyNm:{type:"string"}
                        ,prtyKeyVal:{type:"string"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                    }
                }
            }
        }

        ,dataBinding:function(e) {
//             initPrtyForm();
        }
        ,height:140
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"prtyFileNm", title:"PROPERTY파일명", width:400
                ,attributes:{"class":"ac"}
            }
            ,{field:"prtyKeyNm", title:"PROPERTY키명", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"prtyKeyVal", title:"PROPERTY키값", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"operTryCnt", title:"작업시도횟수", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"실패이후계속진행여부", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"실패이후롤백여부", width:120
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

//             if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

//                this.customized_curr_data = selectedVal;

                gv_prtyGridModel_currUid = selectedVal.uid;

                $('#prty_operTryCnt').val(selectedVal.operTryCnt);
                $('#prty_prtyFileNm').val(selectedVal.prtyFileNm);
                $('#prty_prtyKeyNm').val(selectedVal.prtyKeyNm);
                $('#prty_prtyKeyVal').val(selectedVal.prtyKeyVal);
                $('#prty_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#prty_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);

            } else {
                $('#prty_operTryCnt').val(null);
                $('#prty_prtyFileNm').val(null);
                $('#prty_prtyKeyNm').val(null);
                $('#prty_prtyKeyVal').val(null);
                $('#prty_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#prty_failAftRollbackYn').data("kendoExtDropDownList").value(null);
            }

        }

    });

    // PROPERTY 실패이후계속진행여부
    $("#prty_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // PROPERTY 실패이후롤백여부
    $("#prty_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // SQL FILE 그리드 설정
    $("#fileGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectSpecFileBySpecCd.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sSpecCd"] = $("#specCd").val();
                        params["sSpecTpNm"] = 'FILE';

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,specTpNm:{type:"string"}
                        ,seq:{type:"number", editable:false}
                        ,operTryCnt:{type:"number"}
                        ,srcFilePathNm:{type:"string"}
                        ,targFilePathNm:{type:"string"}
                        ,dlrCdAutoAddYn:{type:"string"}
                        ,failAftCtnuPgssYn:{type:"string"}
                        ,failAftRollbackYn:{type:"string"}
                        ,bakTargFilePathNm:{type:"string"}
                    }
                }
            }
        }

        ,dataBinding:function(e) {
//             initFileForm();
        }
        ,height:140
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"srcFilePathNm", title:"소스파일경로명", width:400
                ,attributes:{"class":"ac"}
            }
            ,{field:"operTryCnt", title:"작업시도횟수", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCdAutoAddYn", title:"딜러코드자동추가여부", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftCtnuPgssYn", title:"실패이후계속진행여부", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"failAftRollbackYn", title:"실패이후롤백여부", width:120
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
//         ,customized_curr_data:null
        ,change:function(e) {

//             if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());

//                this.customized_curr_data = selectedVal;

                gv_fileGridModel_currUid = selectedVal.uid;

                $('#file_operTryCnt').val(selectedVal.operTryCnt);
                $('#file_srcFilePathNm').val(selectedVal.srcFilePathNm);
                $('#file_targFilePathNm').val(selectedVal.targFilePathNm);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(selectedVal.dlrCdAutoAddYn);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(selectedVal.failAftCtnuPgssYn);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(selectedVal.failAftRollbackYn);
                $('#file_bakTargFilePathNm').val(selectedVal.bakTargFilePathNm);

            } else {
                $('#file_operTryCnt').val(null);
                $('#file_srcFilePathNm').val(null);
                $('#file_targFilePathNm').val(null);
                $('#file_dlrCdAutoAddYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftCtnuPgssYn').data("kendoExtDropDownList").value(null);
                $('#file_failAftRollbackYn').data("kendoExtDropDownList").value(null);
                $('#file_bakTargFilePathNm').val(null);
            }

        }

    });

    // File 딜러코드자동추가여부
    $("#file_dlrCdAutoAddYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // File 실패이후계속진행여부
    $("#file_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // File 실패이후롤백여부
    $("#file_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // Deploy Master 그리드 설정
    $("#dplyMastGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyMastByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sSpecCd"] = $("#specCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }

        ,dataBinding:function(e) {

            $("#dplyGrpGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:120
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"deployVerNo", title:"DEPLOY버전번호", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployTpCd", title:"DEPLOY유형코드", width:140
                ,attributes:{"class":"ac"}
                ,template:"#=deployTpArray[deployTpCd]#"
            }
            ,{field:"deployStatCd", title:"DEPLOY상태코드", width:140
                ,attributes:{"class":"ac"}
                ,template:"#=deployStatArray[deployStatCd]#"
            }
            ,{field:"dmsGrpCnt", title:"DMS그룹건수", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployStartDt", title:"DEPLOY시작일자", width:170
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"deployEndDt", title:"DEPLOY종료일자", width:170
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var selectedVal = this.dataItem(this.select());
                gv_dplyMastGridModel_currUid = selectedVal.uid;

                $('#deployVerNo').val(selectedVal.deployVerNo);
                $('#deployTpCd').data("kendoExtDropDownList").value(selectedVal.deployTpCd);
                $('#deployStartDt').data("kendoDateTimePicker").value(selectedVal.deployStartDt);
                $('#deployEndDt').data("kendoDateTimePicker").value(selectedVal.deployEndDt);
                $('#deployStatCd').data("kendoExtDropDownList").value(selectedVal.deployStatCd);
                $('#deployRetryCnt').val(selectedVal.deployRetryCnt);
                $('#deployRetryIvalVal').val(selectedVal.deployRetryIvalVal);
                $('#rsltReceiveTmoutHm').val(selectedVal.rsltReceiveTmoutHm);
                $('#achkFailAlwYn').data("kendoExtDropDownList").value(selectedVal.achkFailAlwYn);
                $('#achkFailAlwCnt').val(selectedVal.achkFailAlwCnt);
                $('#alwFailDmsCnt').val(selectedVal.alwFailDmsCnt);
                $('#dmsGrpCnt').val(selectedVal.dmsGrpCnt);
                $('#procRsltNotiYn').data("kendoExtDropDownList").value(selectedVal.procRsltNotiYn);
                $('#procRsltNotiEndYn').data("kendoExtDropDownList").value(selectedVal.procRsltNotiEndYn);
                $('#procRsltNotiEndDt').data("kendoDateTimePicker").value(selectedVal.procRsltNotiEndDt);


                var grid = $("#dplyMastGrid").data("kendoExtGrid");
                dataItem = grid.dataItem(grid.select());

                if($("#specCd").val() != null && $("#specCd").val() != 'undefined' && dataItem.deployVerNo != null && dataItem.deployVerNo != 'undefined') {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();
                } else {
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#dplyGrpGrid').data('kendoExtGrid').dataSource.data([]);
                }

            } else {
                $('#deployVerNo').val(null);
                $('#deployTpCd').data("kendoExtDropDownList").value(null);
                $('#deployStartDt').data("kendoDateTimePicker").value(null);
                $('#deployEndDt').data("kendoDateTimePicker").value(null);
                $('#deployStatCd').data("kendoExtDropDownList").value(null);
                $('#deployRetryCnt').val(null);
                $('#deployRetryIvalVal').val(null);
                $('#rsltReceiveTmoutHm').val(null);
                $('#achkFailAlwYn').data("kendoExtDropDownList").value(null);
                $('#achkFailAlwCnt').val(null);
                $('#alwFailDmsCnt').val(null);
                $('#dmsGrpCnt').val(null);
                $('#procRsltNotiYn').data("kendoExtDropDownList").value(null);
                $('#procRsltNotiEndYn').data("kendoExtDropDownList").value(null);
                $('#procRsltNotiEndDt').data("kendoDateTimePicker").value(null);
            }
        }

    });


    // Spect Policy ALIVECHECK실패허용여부
    $("#achkFailAlwYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // Spect Policy 처리결과공지여부
    $("#procRsltNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // Spect Policy 처리결과공지완료여부
    $("#procRsltNotiEndYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    // DEPLOY유형코드
    $("#deployTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployTpList
    });

    // DEPLOY상태코드
    $("#deployStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:deployStatList
    });

    // DEPLOY시작일자
    $("#deployStartDt").kendoDateTimePicker({

    });

    // DEPLOY종료일자
    $("#deployEndDt").kendoDateTimePicker({

    });

    // 처리결과공지완료일자
    $("#procRsltNotiEndDt").kendoDateTimePicker({

    });

    // Deploy Group 그리드 설정
    $("#dplyGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyGrpByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyMastGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"] = $("#specCd").val();
                        params["sDeployVerNo"] = dataItem.deployVerNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            $("#dplyDlrGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"deployGrpId", title:"DEPLOY그룹ID", width:120
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                $('#dplyDlrGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyDlrGrid').data('kendoExtGrid').dataSource.read();

            } else {

            }
        }

    });


    // Deploy Dealer 그리드 설정
    $("#dplyDlrGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyDlrByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyGrpGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"] = $("#specCd").val();
                        params["sDeployVerNo"] = dataItem.deployVerNo;
                        params["sDeployGrpId"] = dataItem.deployGrpId;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                         specCd               :{type:"string"}
                        ,deployVerNo          :{type:"string"}
                        ,deployGrpId          :{type:"string"}
                        ,dlrCd                :{type:"string"}
                        ,deployExcpYn         :{type:"string"}
                        ,deployExcpReasonCont :{type:"string"}
                        ,regUsrId             :{type:"string"}
                        ,regDt                :{type:"date"}
                        ,updtUsrId            :{type:"string"}
                        ,updtDt               :{type:"date"}
                        ,deployProcCnt        :{type:"number"}
                        ,lastDeployProcDt     :{type:"date"}
                        ,deployReqEndYn       :{type:"string"}
                    }
                }
            }
        }

//         ,multiSelectWithCheckbox:true
//         ,selectable:"row"
        ,height:160
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,columns:[
            {field:"dlrCd", title:"딜러코드", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"딜러명", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcCnt", title:"DEPLOY처리횟수", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastDeployProcDt", title:"최종DEPLOY처리일자", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"DEPLOY요청완료여부", width:140
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

            } else {

            }
        }

    });




});


/******************************************
 * 함수영역 - start
 ******************************************/

/***************************
 * Spec정보 조회
 ***************************/
function searchSpecInfo() {

    var param = {
        "sSpecCd":$("#specCd").val()
    }
    //alert(JSON.stringify(param));

    $.ajax({
        url:"<c:url value='/dply/spec/specMng/selectSpecMng.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            //dms.notification.error(jqXHR.responseJSON.errors);
            alert("error");

        },
        success:function(jqXHR, textStatus) {
            //alert(JSON.stringify(jqXHR));

            $("#specCd").val(jqXHR.specBasicVO.specCd);
            $("#specNm").val(jqXHR.specBasicVO.specNm);
            $("#regDt").data("kendoExtMaskedDatePicker").value(jqXHR.specBasicVO.regDt);
            $("#specCont").val(jqXHR.specBasicVO.specCont);

//             $('#sqlGrid').data('kendoExtGrid').dataSource._destroyed = [];
//             $('#prtyGrid').data('kendoExtGrid').dataSource._destroyed = [];
//             $('#fileGrid').data('kendoExtGrid').dataSource._destroyed = [];
//             $('#dplyMastGrid').data('kendoExtGrid').dataSource._destroyed = [];

            $('#sqlGrid').data('kendoExtGrid').dataSource.read();
            $('#prtyGrid').data('kendoExtGrid').dataSource.read();
            $('#fileGrid').data('kendoExtGrid').dataSource.read();
            $('#dplyMastGrid').data('kendoExtGrid').dataSource.read();

        }
    });

}

/******************************************
 * 함수영역 - end
 ******************************************/

</script>









