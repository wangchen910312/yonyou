<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<section id="content">
<!-- Barcode 목록  [Start] -->
<!-- Barcode 목록  [Start] -->
<!-- Barcode 목록  [Start] -->

<!-- content_remark-->
    <section id="content_remark" class="content_remark" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.lbl.remark" /></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr>
                        <th scope="row"><spring:message code="mob.lbl.barcode" /><!-- 바코드 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="remark_barcode" name="remark_barcode" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종--></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="remark_carlineNm" name="remark_carlineNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.remark" /><!-- 비고 --></th>
                        <td>
                            <textarea rows="10" id=remark_remark name="remark_remark" cols="" class="f_textarea"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div><span id="btnClose" class="btnd1"><span><spring:message code="global.btn.close" /><!-- 닫기 --></span></span></div>
            <div><span id="btnSaveRemark" class="btnd1"><span><spring:message code="global.btn.save" /><!-- 저장 --></span></span></div>
        </div>
    </section>

    <!-- content_list -->
    <section id="content_list_1">
        <div class="content_title conttitlePrev">
            <h2><spring:message code='sal.label.scancar.mob' /><!--  스캔차량 --></h2>
            <div class="title_btn">
                <%-- <span class="tbtn01" id="stockCreate"><spring:message code='sal.btn.stockCreate' /></span> --%>
                <dms:access viewId="VIEW-D-12625" hasPermission="${dms:getPermissionMask('READ')}">
                    <span class="tbtn01" id="selAll"><spring:message code='par.lbl.selectAll' /></span>
                </dms:access>
            </div>
        </div>
        <div class="listarea">
            <div class="listhead checkitem">
                <span style="width:20%;"><spring:message code='mob.lbl.barcode' /></span>
                <span style="width:40%; text-align: center;"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
                <span style="width:25%;"><spring:message code='sal.lbl.remark' /><!-- 비고 --></span>
                <span style="width:15%;"><spring:message code='global.title.result' /><!-- 결과 --></span>
            </div>
            <iframe id="mainList2" border="0" frameborder="0" width="100%" height=""></iframe>
        </div>
        <div class="btnfixed">
            <div class="con_btnarea btncount2">
                <dms:access viewId="VIEW-D-12624" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="btn_scan"><spring:message code='mob.lbl.scan' /></span></div><!-- 스캔 -->
                </dms:access>
                <dms:access viewId="VIEW-D-12623" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제--></span></div>
                </dms:access>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12622" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1"><span class="search" id="btn_wearingSearch"><spring:message code='par.menu.inInvest' /><spring:message code='global.lbl.target' /><spring:message code='mob.title.search' /><!-- 실사대상조회  --></span></span></div>
                </dms:access>
            </div>
        </div>
    </section>


<!-- Barcode 목록  [End] -->
<!-- Barcode 목록  [End] -->
<!-- Barcode 목록  [End] -->

<!-- 중복차량체크  [Start] -->
<!-- 중복차량체크  [Start] -->
<!-- 중복차량체크  [Start] -->


    <section id="content_list_2" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code='global.lbl.dupCarRemove' /><!-- 중복차량제거 --></h2>
        </div>
        <div id="duplConfirmWearingListArea"></div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12621" hasPermission="${dms:getPermissionMask('READ')}">
                <span class="btnd1" id="btn_wearingDuplChk"><spring:message code='ser.lbl.check' /><!-- 선택 --></span>
            </dms:access>
        </div>
    </section>

<!-- 중복차량체크  [End] -->
<!-- 중복차량체크  [End] -->
<!-- 중복차량체크  [End] -->


<!-- 실사대상 목록  [Start] -->
<!-- 실사대상 목록  [Start] -->
<!-- 실사대상 목록  [Start] -->

    <section id="content_list_3" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code='global.lbl.stock' /><spring:message code='sal.label.invlist.mob' /><!-- 실사대상 --></h2>
            <div class="title_btn">
                 <span class="tbtn01" id="selAll2"><spring:message code='par.lbl.selectAll' /></span>
            </div>
        </div>

        <div class="listarea">
            <div class="listhead checkitem" id="secondHeader">
                <span style="width:65%;"><spring:message code='global.lbl.vinNum' /></span>
                <span style="width:35%;"><spring:message code='mob.lbl.barcode' /><!-- 바코드 --></span>
                <span style="width:65%"><spring:message code="global.lbl.ocn" /><!-- OCN -->/<spring:message code="global.lbl.model" /><!-- 차관 --></span>
                <span style="width:35%;"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
                <span style="width:65%;"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
                <span style="width:35%;"><spring:message code="par.lbl.inInvestYn" /><!-- 실사여부 --></span>
                <span style="width:100%;"><spring:message code="sal.lbl.remark" /><!-- 비고 --></span>
            </div>
            <iframe id="confirmWearingList" border="0" frameborder="0" width="100%" height="300"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData9"><span></span></div>
        </div>
         <div class="con_btnarea btncount2">
            <div><span id="btnClose2" class="btnd1"><span><spring:message code="global.btn.close" /><!-- 닫기 --></span></span></div>
            <dms:access viewId="VIEW-D-12620" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btnReceiveCnfrm"><spring:message code="mob.sal.btn.doStock" /><!-- 실사 --></span></div>
            </dms:access>
        </div>
    </section>
<!-- 실사대상 목록  [End] -->
<!-- 실사대상 목록  [End] -->
<!-- 실사대상 목록  [End] -->


</section>
<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var sysDate="${sysDate}";

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locDSList = [];
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>

// 차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//재고월령범위
var agingCntList = [];
<c:forEach var="obj" items="${agingCntDSList}">
    agingCntList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var duplCheck = false;
var currentContent_list=1;
$(document).ready(function() {
    // 타이틀
    $("#header_title").html("<spring:message code="sal.menu.stockRealSearch" />"); //실사확정

    //$("#header_title").on("click", function (){moveSearch2(currentContent_list);});
    //$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList2").attr("src", "<c:url value='/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceList.do' />");
    currentContent_list=1;
    var mainList2Height=$("#mwrap").height()-$("#header").height()-$(".content_title:eq(1)").height()-$("#content_list_1 .listhead").height()*3-$(".btnfixed").height();
    $("#mainList2").height(mainList2Height);
    //var confirmWearingTotalListHeight=$("#mwrap").height()-$("#header").height()-$(".content_title:eq(1)").height()-$("#selAll").height()*8;
    //$("#confirmWearingTotalList").height(confirmWearingTotalListHeight);
    //$("#listarea_noData").height(confirmWearingTotalListHeight);

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list_1").css("display") == "block") {
            mob.loading.show();
            goMain();
        } else if ($("#content_list_2").css("display") == "block") {
            $("#content_list_2").hide();
            $("#content_list_1").show();
        } else if ($("#content_list_3").css("display") == "block") {
            if(duplCheck){//중복체크 여부
                $("#content_list_2").show();
            }else{
                $("#content_list_1").show();
            }
            $("#content_list_3").hide();
        } else if ($("#content_remark").css("display") == "block") {
            $("#content_remark").css("display","none");
            $("#content_detail").css("display","none");
            $("#content_list_1").css("display","none");
            $("#content_list_2").css("display","none");
            $("#content_list_3").css("display","none");
            $("#header_title span").attr("class","search_open");
            $("#content_list_1").css("display","block");
        }
    });

    $("#btnClose, #btnClose2").kendoButton({
        click:function(e) {
            $("#docu_prev").click();
        }
    });



    $("#btnSaveRemark").kendoButton({
        click:function(e) {
            try{
                var where={"VEHICLE_CD":$("#remark_barcode").val().replace("remark_","")};
                var fields={"REMARK":$("#remark_remark").val()};

                var userAgent = navigator.userAgent.toLowerCase();
                if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                    || (userAgent.search("ipad") > -1))
                {
                    document.location="bhmccp://UPDATE?TABLE_NM=Stock_Actual&WHERE="+JSON.stringify(where)+"&REMARK="+$("#remark_remark").val()+"&return_func=resultUpdate";
                }else
                {
                    window.bhmccp.UPDATE('Stock_Actual',JSON.stringify(where),JSON.stringify(fields),'resultUpdate');
                }
            }catch(e){

            }
            //contentList();
        }
    });

    //init();

});
function resultUpdate(obj){
    if(obj=="Y") mob.notification.info("<spring:message code="global.info.success" />");
    contentList();
}

function contentRemark(remarkId,remarkCarNm,remarkText) {
    $("#content_list_1").css("display", "none");
    $("#content_list_2").css("display", "none");
    $("#content_list_3").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#content_remark").css("display", "block");

    $("#remark_barcode").val(remarkId.replace("remark_",""));
    $("#remark_carlineNm").val(remarkCarNm);
    $("#remark_remark").val(remarkText);
}

function getItemListInit(initFl){
    //네이티브연동 불가시 임시 테스트
    //네이티브 연동테스트 사용
    //테스트 결과 네이티브에서는 return함수를 메인에서 사용함
    //적용시 수정 필요
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://getStockList?return_func=setItemList';
        }else
        {
            window.bhmccp.getStockList('setItemList');
        }
    }catch(e){
        var resultList ;
        if(initFl) {
            resultList = "{\"data\":[{\"VEHICLE_CD\":\"11111111\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                +"{\"VEHICLE_CD\":\"96262073\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                +"{\"VEHICLE_CD\":\"96263388\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"},"
                +"{\"VEHICLE_CD\":\"96194394\",\"INSERT_DATE\":\"2016-09-07\",\"CREATE_DATE\":\"2016-09-07\",\"RET\":\"9\"}]}";
        } else { //저장후 reload
            resultList = {'data':[
         {"CREATE_DATE":"2016-12-30", "INSERT_DATE":"2016-07-29", "VEHICLE_CD":"11111111"},
         {"CREATE_DATE":"2016-12-30", "INSERT_DATE":"2016-07-30", "VEHICLE_CD":"22222222"}
            ]};
        }

        setItemList(resultList);
    }

}

function setItemList(param){
    carNameMap ={};
    carNameList = [];
    var _result = JSON.parse(param);

    /* for(var n=0; n<_result.data.length; n++){
        _result.data[n]["ret"] = "1"; //1:노말 2:입고확정성공 9:입고확정실패
    } */

    var rowCount = _result.data.length;

    if(rowCount > 0){
        $.each(_result.data , function(i , row){
            $.ajax({
                url:"<c:url value='/sal/sti/confirmWearingVehicle/getCarNameByBarcode.do' />"
                ,data:JSON.stringify(row.VEHICLE_CD)
                //,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    //parent.mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    //parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    //app.hideLoading();
                }
                ,success:function(result) {
                    if(result.data.length > 0){
                        carNameList.push({carlineNm:result.data[0].carlineNm, barcodeNo:row.VEHICLE_CD});
                        carNameMap[row.VEHICLE_CD] = result.data[0].carlineNm;
                    }else{//차량이름에 없는 바코드
                        carNameList.push({carlineNm:"", barcodeNo:row.VEHICLE_CD});
                        carNameMap[row.VEHICLE_CD] = "";
                    }

                    rowCount --;
                    if(rowCount == 0) document.getElementById("mainList2").contentWindow.getItemList(param);
                }
            });

        });
    }
}

</script>

<script>
//메인화면 가기
var isSelAll=false;
var isSelAll2=false;
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
    $("#content_remark").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#content_list_1").css("display", "block");
    $("#content_list_2").css("display", "none");
    $("#content_list_3").css("display", "none");

    document.getElementById("mainList2").contentWindow.document.location.reload();
}

//버튼 - 전체선택
$("#selAll").bind("click", function()
{
    if(isSelAll){
        $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
            $("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked = false;
        });
        isSelAll=false;
    }else{
        $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
            $("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked = true;
        });
        isSelAll=true;
    }
});

//버튼 - 전체선택2
$("#selAll2").bind("click", function()
{
    if(isSelAll2){
        $("#confirmWearingList").contents().find("input[name='check_confirm']").each(function(cnt){
            $("#confirmWearingList").contents().find("input[name='check_confirm']")[cnt].checked = false;
        });
        isSelAll2=false;
    }else{
        $("#confirmWearingList").contents().find("input[name='check_confirm']").each(function(cnt){
            $("#confirmWearingList").contents().find("input[name='check_confirm']")[cnt].checked = true;
        });
        isSelAll2=true;
    }
});

//실사대상조회
var selList      = [];
var remarkMap={};
$("#btn_wearingSearch").bind("click", function()
{
    var listCnt = 0;
    var checkFlag = true;
    selList =[];
    $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked == true){
            selList.push($("#mainList2").contents().find("input[name='barcodeNo']")[cnt].value);
            var temp=$("#mainList2").contents().find(".remark")[cnt].id;
            remarkMap[temp]=$("#mainList2").contents().find("#text_"+temp).val();
            listCnt ++;
        }
    });
    var searchData = {sDlrCd:dlrCd,barcodeList:selList};
    var resultDataList = [];
    if(listCnt == 0){
        mob.notification.info("<spring:message code='global.info.unselected' />");
    //체크건수가 존재하는경우
    } else {
        var data = [];
        var rowIndex = 0;
        var duplRowNum = [];
        $.ajax({
            url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailMobSearch.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result) {
                if(result.data!=null){
                    rowTotal = result.data.length;

                    var prevBarcodeNo = "";
                    $.each(result.data , function(i , row){
                        resultDataList.push({rowIdx:rowIndex,
                            dstbCmpNm   :row.dstbCmpNm,
                            carRegNo    :row.carRegNo,
                            ordNo       :row.ordNo,
                            vinNo       :row.vinNo,
                            carDumpCd   :row.carDumpCd,
                            carlineCd   :row.carlineCd,
                            carlineNm   :row.carlineNm,
                            modelCd     :row.modelCd,
                            modelNm     :row.modelNm,
                            ocnCd       :row.ocnCd,
                            ocnNm       :row.ocnNm,
                            extColorCd  :row.extColorCd,
                            extColorNm  :row.extColorNm,
                            intColorCd  :row.intColorCd,
                            intColorNm  :row.intColorNm,
                            ordTp       :row.ordTp,
                            manufactYyMmDt:row.manufactYyMmDt,
                            asdy        :row.asdy,
                            vinNo1      :row.vinNo1,
                            vinNo2      :row.vinNo2,
                            carId       :row.carId,
                            prty        :row.prty,
                            grDt        :row.grDt,
                            enginNo     :row.enginNo,
                            certNo      :row.certNo,
                            chrgCd      :row.chrgCd,
                            updtUsrId   :row.updtUsrId,
                            updtUsrNm   :row.updtUsrNm,
                            carStatCd   :row.carStatCd,
                            chgCarStatCd:row.chgCarStatCd,
                            confirmYn:row.confirmYn,
                            barcodeNo   :row.barcodeNo,
                            stockDt   :row.stockDt
                         });
                         rowIndex++;
                        if(row.barcodeNo == prevBarcodeNo) {
                            duplCheck = true;
                            duplRowNum.push(i-1); //이전데이터 중복항목추가
                            duplRowNum.push(i);   //현데이터 중복항목추가
                        }
                        prevBarcodeNo = row.barcodeNo;
                    });
                    duplRowNum.removeDup();//중복데이터 row에 데이터 정리

                    if(duplCheck){ //중복데이터 존재
                        drawConfirmWearingVehicleDupl(resultDataList,duplRowNum);
                    } else { //중복데이터 미존재
                        drawConfirmWearingVehicle(resultDataList,[]);
                    }
                }else{
                    mob.notification.error("<spring:message code='global.info.nonexistPhysicalInfData' />");
                }
            }
        });
        listCnt = 0;
    }
});

$("#btn_delete").bind("click", function()
{
    var checkFlag = true;
    selList=[];

    $("#mainList2").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList2").contents().find("input[name='isSaveName']")[cnt].checked == true){
            selList.push($("#mainList2").contents().find("input[name='barcodeNo']")[cnt].value);
        }
    });

    if(selList.length == 0){
        mob.notification.info("<spring:message code='global.info.unselected' />");

    } else {//체크건수가 존재하는경우
        var _sqlHost="";
        for(var i=0; i<selList.length; i++){
            if(i==0){
                _sqlHost+=selList[i];
            }else{
                _sqlHost+=","+selList[i];
            }
        }

        try{
            var userAgent = navigator.userAgent.toLowerCase();
            if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
            {
                document.location="bhmccp://DELETE_IN?TABLE_NM=Stock_Actual&WHERE=VEHICLE_CD&IN="+_sqlHost+"&return_func=isDeleted";
            }else
            {
                window.bhmccp.DELETE_IN("Stock_Actual","VEHICLE_CD",_sqlHost,"isDeleted");
            }
        }catch(e){

        }finally{
            //$("#docu_prev").click();
        }


      document.getElementById("mainList2").contentWindow.document.location.reload();

      //오프라인 바코드 데이타 삭제
    }
});

$("#btn_scan").bind("click", function()
{
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location="bhmccp://openBarcodeReader?type=stock&isOnline=Y&return_func=resultOpenBarcode";
        }else
        {
            window.bhmccp.openBarcodeReader("stock","Y","resultOpenBarcode");
        }
    }catch(e){

    }finally{
        //$("#docu_prev").click();
    }
});
function resultOpenBarcode(retval){
    if(retval == "Y"){
        document.getElementById("mainList2").contentWindow.document.location.reload();
    }else{
        mob.notification.error("<spring:message code='mob.lbl.scan' /><spring:message code='global.btn.failed' />");
    }
}
function rowDuplChk(duplLowArr,i){
    for(var j = 0 ; j < duplLowArr.length;j++){
        if(i == duplLowArr[j]){
            return true;
            break;
        }
    }
    return false;
}
var resultDataListAll;
function drawConfirmWearingVehicleDupl(resultDataList,duplLowArr){
    var txt = '';
    var prevBarcodeNo = '';
    var firstChk = false;
    resultDataListAll = resultDataList;
    $.each(resultDataList , function(i , row){
        if(rowDuplChk(duplLowArr,i)){ //현재 row가 중복데이터 여부 확인
            if(prevBarcodeNo != row.barcodeNo) {
                //첫번째루프가 아니면 이전 화면 에서 오는 바코드 데이터가 틀린경우 이전목록div(listarea01과 영역 분리
                if(firstChk){
                    txt +='</div>';  //
                    txt +='<div class="pb10"></div>';
                } else {
                    firstChk = true;
                }
                txt +='<div class="listarea01">';
                txt +='  <div class="dlistitem listhead">';
                txt +='      <span><spring:message code='mob.lbl.barcode' />:'+row.barcodeNo+'</span>';
                txt +='  </div>';

            }
            txt +='  <div class="checkitem">';
            txt +='      <span class="check">';
            txt +='       <input type="checkbox" id="check_'+i+'" name="check_dupl_'+row.barcodeNo+'" class="f_check" onclick="checkBoxClickDupl(this);"/><label for="check_'+i+'"></label>';
            txt +='       <input type="hidden" name="hidden_dupl_row" value="'+row.rowIdx+'"/>';
            txt +='      </span>';
            txt +='      <span style="">'+row.vinNo+'</span>';
            txt +='      <span class="clboth" style="width:60%;">'+row.carlineNm+'</span>';
            txt +='      <span style="width:40%;">'+row.extColorNm+'/'+row.intColorNm+'</span>';
            txt +='      <span class="clboth">'+row.modelNm+'</span>';
            txt +='      <span class="clboth">'+row.ocnNm+'</span>';
            txt +='      <span class="clboth">'+row.confirmYn+'</span>';
            txt +='      <span class="clboth">'+row.stockDt+'</span>';
            txt +='  </div>';
            prevBarcodeNo = row.barcodeNo;
        }

    });

    txt +='</div>'; // 마지막 div(listarea01) 닫기
    $("#duplConfirmWearingListArea").html(txt);
    $("#content_list_2").show();
    $("#content_list_1").hide();
}

//실사대상 목록 표시
var resultDataListForSub = [] ;
var duplDelArrForSub  = [] ;
var lastInventoryData = [];
var failInventoryData = [];
function drawConfirmWearingVehicle(resultDataList,duplDelArr){
    resultDataListForSub = resultDataList;
    duplDelArrForSub = duplDelArr;
    $("#confirmWearingList").attr("src", "<c:url value='/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceSelList.do' />");

    $("#content_list_3").show();
    $("#content_list_2").hide();
    $("#content_list_1").hide();
}


//중복차량 체크 선택
$("#btn_wearingDuplChk").bind("click", function(){
    var duplDelArr = [];

    $(":checkbox[name ^='check_dupl_']").each(function(index){
         if($("input[name ^='check_dupl_']")[index].checked == false){
             duplDelArr.push($("input[name='hidden_dupl_row']")[index].value);
         }
    });
    drawConfirmWearingVehicle(resultDataListAll,duplDelArr);
});
//실사취소
$("#btnReceiveCncl").kendoButton({
    click:function(e) {
        save(null, "50", "C");

    }
});

$("#btnReceiveCnfrm").bind("click", function(){

    var confirmWearingArr = [];

    confirmWearingArr = document.getElementById("confirmWearingList").contentWindow.getConfirmWearingArr();
    var i=0;
    for(i=0; i<confirmWearingArr.length; i++){
        confirmWearingArr[i].confirmYn="Y";
    }

    var row = {};
    var strVinNo = "";
    var strCarStatCd = "";

    save(null, "60", "D",confirmWearingArr);
});


var _sqlHostFromSave="";

save = function(cnfrmInfo, carStatCd, prty, confirmWearingArr) {
    var saveData;
    var saveFlag = true;

    var arrSave = [];
//    var confirmWearingArr = document.getElementById("confirmWearingList").contentWindow.getConfirmWearingArr();
    if(confirmWearingArr.length  == 0 ){
        //차량을 선택해주세요.
        mob.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
        return false;
    }else{
        $.each(confirmWearingArr , function(index , dataItem){

            arrSave.push(dataItem);

        });
    }

    if( saveFlag ){

        var saveData = {};

        saveData = { "updateList":arrSave};

        $.ajax({
            url:"<c:url value='/sal/inv/stockDue/multiMobStockDue.do' />",
            //url:"<c:url value='/sal/inv/stockDue/multiStockDue.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                console.log(lastInventoryData);

                var _sqlHost=[];
                _sqlHostFromSave=[];
                for(var i=0; i<lastInventoryData.length; i++){
                    for(var j=0; j<arrSave.length; j++){
                        if(lastInventoryData[i].vinNo == arrSave[j].vinNo){
                            _sqlHost.push(lastInventoryData[j].barcodeNo);
                            break;
                        }
                    }
                }

                failInventoryData=lastInventoryData;
                for(var i=0; i<failInventoryData.length; i++){
                    for(var j=0; j<_sqlHost.length; j++){
                        if(failInventoryData[i].barcodeNo == _sqlHost[j]){
                            //delete failInventoryData[i];
                            failInventoryData.splice(i,1);
                            break;
                        }
                    }
                }


                for(var i=0; i<_sqlHost.length; i++){

                    if(i==0){
                        _sqlHostFromSave+=_sqlHost[i];
                    }else{
                        _sqlHostFromSave+=","+_sqlHost[i];
                    }
                }

                try{
                    var userAgent = navigator.userAgent.toLowerCase();
                    if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                        || (userAgent.search("ipad") > -1))
                    {
                        document.location="bhmccp://DELETE_IN?TABLE_NM=Stock_Actual&WHERE=VEHICLE_CD&IN="+_sqlHostFromSave+"&return_func=isDeletedFromSave";
                    }else
                    {
                        window.bhmccp.DELETE_IN("Stock_Actual","VEHICLE_CD",_sqlHostFromSave,"isDeletedFromSave");
                    }
                }catch(e){

                }finally{
                }

            }
        });
    }
};
/* function contentDetailList(barcodeNo){

    var clickData =[];
    clickData.push(barcodeNo);
    var searchData = {barcodeList:clickData};
    var data = [];
    var rowIndex = 0;
    var duplRowNum = [];
    $.ajax({
        url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailMobSearch.do' />"
        ,data:JSON.stringify(searchData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result) {
            if(result.data!=null){
                //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }else{
                mob.notification.error("<spring:message code='global.info.nonexistPhysicalInfData' />");
            }
        }
    });
} */
function isDeletedFromSave(obj){

    var _sqlHostFromUpdate;

    for(var i=0; i<failInventoryData.length; i++){

        if(i==0){
            _sqlHostFromUpdate+=failInventoryData[i].barcodeNo;
        }else{
            _sqlHostFromUpdate+=","+failInventoryData[i].barcodeNo;
        }
    }

    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {
            document.location="bhmccp://UPDATE_IN?TABLE_NM=Stock_Actual&WHERE=VEHICLE_CD&IN="+_sqlHostFromUpdate+"&FIELD=RET&VALUE=9&return_func=isUpdateFromSave";
        }else
        {
            window.bhmccp.UPDATE_IN("Stock_Actual","VEHICLE_CD",_sqlHostFromSave,"RET","9","isUpdateFromSave");
        }
    }catch(e){
    }finally{
        //$("#docu_prev").click();
    }


};
function isUpdateFromSave(obj){
    _sqlHostFromSave=[];
	mob.notification.success("<spring:message code='global.info.success'/>");
    $("#docu_prev").click();
    document.getElementById("mainList2").contentWindow.document.location.reload();
}
function isDeleted(obj){
    console.log("isDeleted : "+obj);
}
//중복차량 체크 단건 선택
function checkBoxClickDupl(obj){
    $(":checkbox[name = '"+obj.name+"']").each(function(index){
        if(this.id != obj.id)
        this.checked = false;
    });
};

//배열 중복 제거
Array.prototype.valueIndex = function(pval){
    var idx = -1;
    if(this == null || this == undefined || pval == null ||pval == undefined){
    } else {
        for(var i = 0 ; i < this.length;i++){
            if(this[i] == pval){
                idx = i;
                break;
            }
        }
    }
    return idx;
};

Array.prototype.removeDup = function(){
    var resultArray =[];
    if(this == null || this == undefined){
    }else{
        for(var i = 0 ; i < this.length;i++){
            var el = this[i];
            if(resultArray.valueIndex(el) == -1)
                resultArray.push(el);
        }
    }
    return resultArray;
 };


</script>