<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- content -->
<section id="content">

    <!-- content_search -->
    <section id="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.title.contractCt" /> <spring:message code="global.title.searchCondition" /><!-- 조회조건  --></h2>
        </div>
        <div class="formarea" role="search" data-btnid="btnSearch">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.customer" /><!-- 고객 --></span></th>
                        <td>
                            <div class="f_text"><input type="text" id="sContractCustNm" data-json-obj="true"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.salPrsnNm' /></th><!-- 판매담당자 -->
                        <td>
                           <div class="f_text"><input type="text" id="sSaleEmpNo" data-json-obj="true" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
        <div class="con_btnarea" style="display:none">
            <!-- 견적번호 -->
            <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

            <!-- 저장 후 선택될 계약번호 -->
            <input id="savedContractNo" value="" />

            <!-- 판매기회번호 -->
            <input id="saleOpptNo" name="saleOpptNo" />
        </div>
    </section>
    <!-- //content_seach -->


    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.title.contractCt" /><!-- 계약체결관리 --></h2>
            <div class="title_btn">
                <span class="tbtn" id="btnAdd"><spring:message code="global.btn.new" /><!-- 신규 --></span>
            </div>
        </div>



        <div class="tabarea2 removeArea_ifr">
            <ul class="tabmenu tabmenu_v1">
                <input type="radio" id="cntTp01" name="cntTp" value="1" class="f_radio" /><label for="cntTp01"><spring:message code='sal.lbl.cntTpOne' /><!-- 체결대기 --></label>
                <input type="radio" id="cntTp02" name="cntTp" value="2" class="f_radio" /><label for="cntTp02"><spring:message code='sal.lbl.cntTpTwo' /><!-- 기체결 --></label>
                <input type="hidden" id="cntTp" />
            </ul>
        </div>

        <div class="listarea" id="salesOpptProgGrid">
            <div class="listhead dlistitem">
                <span style="width:35%"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></span>
                <span style="width:30%"><spring:message code='global.lbl.contractDt' /><!-- 계약일자 --></span>
                <span style="width:35%"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span>
                <span class="clboth" style="width:35%"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
                <span style="width:65%"><spring:message code='global.lbl.model' /><!-- 차관 --></span>
                <span class="clboth" style="width:35%"><spring:message code='global.lbl.extColorNm' /><!-- 외장색명 --></span>
                <span style="width:65%"><spring:message code='global.lbl.intColor' /><!-- 내장색명 --></span>
            </div>
            <iframe src="" id="mainList" name="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="checkitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>
    <!-- //content_list -->

    <!-- content_detail -->
<%--      <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h1><spring:message code='sal.title.contractCt' /> <spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></h1>
                    <div class="title_btn">
                        <span class="tbtn" id="btnUpdate"><spring:message code="par.btn.update" /><!-- 수정 --></span>
                    </div>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code='sal.title.contractCt' /><spring:message code='global.lbl.dtlInfo' /><!-- 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.dlReqDt' /></span> <!-- 인도요청일 --> </th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="dlReqDt" name="dlReqDt" data-json-obj="true" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /><!-- 판매담당자 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="saleEmpNm" name="saleEmpNm" data-json-obj="true" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="contractCustNm" name="contractCustNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.mathDocTp' /><!-- 증서유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input id="ssnCrnTp_01" name="ssnCrnTp_01" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /><!-- 증서번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="ssnCrnNo_01" name="ssnCrnNo_01" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 이동전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="telNo1_01" name="telNo1_01" data-json-obj="true" disabled="disabled" >
                                            <input type="hidden" id="telNo2_01">         <!-- 전화번호2 화면에 없음 -->
                                            <input type="hidden" id="emailNm_01" />      <!-- 이메일 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.detlAddr' /><!-- 상세주소 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="addrDetlCont_01" name="addrDetlCont_01" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.vinNum' /><!-- 차량VIN --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vinNo" name="vinNo" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="carlineNm" name="carlineNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="modelNm" name="modelNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.ocn' /><!-- ocn --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="ocnNm" name="ocnNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="extColorNm" name="extColorNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intColorCd" name="intColorCd" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /><!-- 지도가 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="retlAmt" name="retlAmt" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /><!-- 2급딜러여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="lv2DlrYn" name="lv2DlrYn" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <input type="hidden" id="seq" name="seq" data-json-obj="true" />
                    </div>

                </div>
            </div>

            <!-- 버튼 set -->
            <div class="con_btnarea">
                <div><span class="btnd1" id="btnClose"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
            <input type="hidden" id="leadStatCd" value="" />

        </section>
    </div> --%>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

</section>

<script type="text/javascript">
<!--

var dateFormat =  '<dms:configValue code="dateFormat" />';
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var pageMode = "insert"; //update
var selectedItem = null;

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매관리자 여부 : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우D ]
var saleAdminYn = "${saleAdminYn}";

//임시 작업
if(userId == "admin2"){ saleAdminYn = "Y"; }


//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
  selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];
var contractTpList = [];    // 집단판매 제외, 직접
<c:forEach var="obj" items="${contractTpDS}">

  <c:if test="${obj.cmmCd ne 'G' and obj.cmmCd ne 'D' }">
      contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>

  sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태 SAL002
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
  contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//할인레벨 SAL156
var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
  dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
  ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

$(document).ready(function() {

    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y" && saleAdminYn == "N"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    // 체결대기
    $("#cntTp01").click(function(){
        $("#cntTp").val("1");
        contentList();
        //var grid = $("#contGrid").data("kendoExtGrid");
        //grid.dataSource._destroyed = [];
        //grid.dataSource.page(1);
    });
    // 기체결
    $("#cntTp02").click(function(){
        $("#cntTp").val("2");
        contentList();
        //var grid = $("#contGrid").data("kendoExtGrid");
        //grid.dataSource._destroyed = [];
        //grid.dataSource.page(1);
    });
    $("#cntTp").val("1");
    $("#cntTp01").prop("checked", true);

//////////////////////////////////////////////////
//////////////////////////////////////////////////
    /*
    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                if(grid.select().length > 1){
                    //목록을 1건만 선택하여 주십시오.
                    mob.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }else{
                    viewDetailPopup(selectedItem);
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                mob.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });
    */

    $("#btnAdd").click(function(){  // 신규
            viewDetailPopup();

    });


    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){

             mob.loading.show();
             contentList();
         }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //버튼-닫기
    $("#btnClose").click(function(){

        contentListNonRefresh();
    });


    /** 판매기회 정보 셋팅 **/
    var saleOpptNo = '${saleOpptNo}';       // 판매기회 데이터
    if(saleOpptNo != ""){
        reSearch(saleOpptNo);
        $("#cntTp").val("1");
        $("#cntTp01").prop("checked", true);
        //$("#savedContractNo").val(saleOpptNo);
    }
    /** 판매기회 정보 셋팅 END **/

    if('${orderNo}' != ""){
        $("#cntTp").val("2");
        $("#cntTp02").prop("checked", true);
        reSearch('${orderNo}');
    }else if('${estimateNo}' != ""){
        reSearch('${estimateNo}');
        $("#cntTp").val("1");
        $("#cntTp01").prop("checked", true);
    }


    //$("#cntTp").val("1");

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.contractCt' />"); //계약체결관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#mainList").attr("src", "<c:url value='/mob/sal/cnt/contract/selectContractMntList.do' />");
     /********************************************************************************************************************************************************/

});
//end document ready


//메인화면 가기
function goMain() {
   window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
   $("#content_search").css("display","none");
   $("#content_detail").css("display","none");
   $("#content_list").css("display","block");
   $("#header_title span").attr("class","search_open");

   document.getElementById("mainList").contentWindow.document.location.reload();
   setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
     $("#content_list").css("display","none");
     $("#content_detail").css("display","none");
     $("#content_search").css("display","block");
}


function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
}

//검색조건
function reSearch(contNo){
    //$("#savedContractNo").val(contNo);  // 계약번호
    $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    $("#vContractCustNm").val("");
    $("#sContractCustNo").val("");
    $("#cntTp").val("2");
    $("#cntTp02").prop("checked", true);
}

//상세페이지
function contentDetail(dataItem) {
     $("#content_list").css("display","none");
     $("#content_search").css("display","none");
     $("#content_detail").css("display","block");

     $("#header_title span").removeAttr("class");
     mob.loading.show();
     viewDetailPopup(dataItem);
     //getContentDetail(dataItem);
     //console.log(dataItem);
     //selectedItem = dataItem;
     //mob.loading.show();

/*      $("#dlrCd").val(dataItem.dlrCd);
     $("#contractNo").val(dataItem.contractNo);
     $("#contractCustNo").val(dataItem.contractCustNo);
     $("#custNm").val(dataItem.custNm);
     $("#grpContractNo").val(dataItem.grpContractNo);
     $("#contractTpNm").val(dataItem.contractTpNm);
     $("#contractStatNm").val(dataItem.contractStatNm);
     $("#carlineNm").val(dataItem.carlineNm);
     $("#modelNm").val(dataItem.modelNm);
     $("#ocnNm").val(dataItem.ocnNm);
     $("#extColorNm").val(dataItem.extColorNm);
     $("#intColorNm").val(dataItem.intColorNm);
     $("#retlAmt").val(dataItem.retlAmt);
     $("#lv2DlrYn").val(dataItem.lv2DlrYn); */
}

// 상세내용 팝업 호출
function viewDetailPopup(data){

     var sDlrCd = dlrCd
       , sContractNo  = "";

     if(typeof(data) != "undefined"){
         sDlrCd = data.dlrCd;
         sContractNo  = data.contractNo;
     }

     mainPopupWindow = mob.window.popup({
         windowId:"contractMntPopup"
         ,content:{
             url:"<c:url value='/mob/sal/cnt/contract/selectContractMntPopup.do'/>"
             ,data:{
                 "type":null
                 ,"autoBind":true
                 ,"sDlrCd":sDlrCd                   // 딜러코드
                 ,"sContractNo":sContractNo         // 딜러명
                 ,"callbackFunc":function(data){
                     if (data.msg == "save"){
                         reSearch(data.cntNo);

                         if (typeof(data.cntTp) != "undefined"){
                             if(data.cntTp == "01"){
                                 $("#cntTp").val("1");
                                 $("#cntTp01").prop("checked", true);
                             }
                         }
                         contentList();
                         //$("#contGrid").data("kendoExtGrid").dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         mob.notification.success("<spring:message code='global.info.success'/>");
                     } else if (data.msg == "refresh") {

                         contentList();

                     } else if (data.msg == "delete") {

                         contentList();
                         mob.notification.success("<spring:message code='global.info.success'/>");
                     }


                  }
             }
         }
     });
}


/********************************
 ** 자식 popup에서 호출
 ********************************/

//2급딜러조회
function bf_searchSecondDealerSearchPopup(obj)  {
    if( obj["lv2DlrYn"] != "Y" ){
        return ;
    }
    popupWindow = dms.window.popup({
        windowId :"secondDealerSearchPopupWin"    // 2급딜러조회 팝업
        ,title :"<spring:message code='sal.title.secondGradeDlrInfo'/>"   // 2급딜러정보
        ,content :{
            url :"<c:url value='/sal/btc/secondDealer/selectSecondDealerSearchPopup.do'/>"
            ,data:{
                "autoBind":false
                , "lv2DlrCd" : obj["lv2DlrOrgCd"]
                ,"callbackFunc" :function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_searchSecondDealerSearchPopupCallBack(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}



// 우편번호 찾기
function bf_pSearchZipCode(obj){

    zipCodeSearchPopupWin = dms.window.popup({
        windowId :"zipCodeSearchPopupWin"
        , title :"<spring:message code='cmm.title.zipcode.search' />"   // 우편번호 조회
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :true
                , "sZipCd":obj["sZipCd"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        data[0].custTp = obj["custTp"];
                        iframeWindowObject.bf_custZipCodeSearchCallBack(data);
                    }
                    zipCodeSearchPopupWin.close();
                }
            }
        }
    });
}

// 용품조회
function bf_pSearchGoodsSearchPopup(obj){

    popupWindow = dms.window.popup({
        windowId:"goodsItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":obj["dlrCd"]
                , "sCarlineCd" :obj["carlineCd"]
                , "sGoodsCd"   :obj["goodsCd"]
                , "sPkgItemCd" :obj["pkgItemCd"]
                //, "onlyItemTab":"Y"
                ,"callbackFunc":function(data, type){
                    var windowElement = $("#contractMntPopup");
                    var iframeDomElement = windowElement.children("iframe")[0];
                    var iframeWindowObject = iframeDomElement.contentWindow;
                    iframeWindowObject.bf_goodsSearchPopupCallBack(data, type);

                    popupWindow.close();
                }
            }
        }
    });
}

// 보험 item 추가
function bf_pSearchIncItem(){
    popupWindow = dms.window.popup({
        windowId:"incItemPopup"
        , title:"<spring:message code='sal.title.incJoinInfoMng' />"   // 보험정보등록
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/inc/incJoinInfo/selectIncItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_incItemPopupCallBack(data, num);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

// 대행업무 item 추가
function bf_pSearchAapItem(){
    popupWindow = dms.window.popup({
        windowId:"aapItemPopup"
        , title:"<spring:message code='sal.lbl.subServices' />"   // 대행업무
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/aap/aapInfo/selectAapInfoItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_aapItemPopupCallBack(data, num);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}


// 중고차 vin no 조회 검색
function bf_pSearchUsedCarVinNo(obj){

    popupWindow = dms.window.popup({
        windowId :"VinNoContractPopup"
        , title :"<spring:message code='sal.title.usedCarSearch' />"   // 중고차조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractRe/selectContractReUsedCarSearchPopup.do'/>"
            , data :{
                "autoBind" :true
                , "type"   :null
                , "sDlrCd" :obj["sDlrCd"]
                , "sVinNo" :obj["sVinNo"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_searchUsedCarVinNoCallBack(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}




//-->

</script>
