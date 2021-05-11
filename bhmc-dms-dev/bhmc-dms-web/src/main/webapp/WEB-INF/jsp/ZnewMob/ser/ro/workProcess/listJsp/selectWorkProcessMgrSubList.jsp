<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.repInfo" /><!-- 정비내역--></h2>
    </div>
    <div class="co_view" >
        <div class="listarea01">
            <div id="listhead" class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드--></span>
                <span style="width:50%"><spring:message code="ser.lbl.rpirNm" /><!-- 수리명칭--></span>
                <span style="width:50%"><spring:message code="ser.lbl.processWorkStat" /><!-- 정비진도상태  --></span>
                <span style="width:50%"><spring:message code="ser.lbl.wrkStartDt" /><!-- 수리시작시간  --></span>
                <span style="width:50%"><spring:message code="ser.lbl.wrkEndDt" /><!-- 수리완료시간  --></span>
                <span style="width:50%"><spring:message code="ser.lbl.tecNm" /><!-- 정비사  --></span>
                <span style="width:50%"><spring:message code="ser.lbl.paintStatus" /><!-- 판금페인트상태  --></span>
                <span style="width:50%"><spring:message code="ser.lbl.pauseCau" /><!-- 일시정지원인 --></span>
            </div>
            <div>
                <div id="subListView" style="height: 300px; overflow: scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
    <div class="dlistitem" onclick="javascript:subListViewClick(subListData._view[#:rnum-1 #], this);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">#:trimNull(rpirCd) #</span>
        <span style="width:50%">#:trimNull(rpirNm) #</span>
        <span style="width:50%">#:progressStatGrid(wrkStatCd) #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(wrkStartDt) #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(wrkEndDt) #</span>
        <span style="width:50%">#:trimNull(realTecNm) #</span>
        <span style="width:50%">#:paintStatGrid(paintStatCd) #</span>
        <span style="width:50%">#:pauseStatGrid(pauseCauCd) #</span>
    </div>
</script>

<script>
//정비중지 팝업에서 데이터를 가져오기 위한 사용
var selectedItem;
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/ser/ro/workAssign/selectWorkAssignSubLists.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sDlrCd"] = dlrCd;
                params["sRoDocNo"] = $("#roDocNo").val();
                params["assignYn"] = "Y";
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    //,pageSize:pageSize
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change :function(e){
    }
    ,error:function(e){
        console.log(e);
    }
});
function subListViewClick(item,_this){
    selectedItem = item;
    $("div.dlistitem").removeClass("dlist_selected");
    $(_this).addClass("dlist_selected");
    fnContentProcessDetail(item);
}

progressStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(progressStatMap[val] != null){
            returnVal = progressStatMap[val].cmmCdNm;
        }
    }
    return returnVal;
}

//정비중지 팝업에서 selectedItem의 정보를 가져간다
function getSelectedItem(){

    return selectedItem;
}

//수리상태
rpirStatGrid = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(rpirStatMap[val] != null){
         returnVal = rpirStatMap[val].cmmCdNm;
     }
 }
 return returnVal;
}

//일시정지원인
pauseStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(pauseStatMap[val] != undefined)
        returnVal = pauseStatMap[val].cmmCdNm;
    }
    return returnVal;
};

//페인트상태
paintStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paintStatMap[val] != undefined)
        returnVal = paintStatMap[val].cmmCdNm;
    }
    return returnVal;
};
fnContentProcessDetail = function(dataItem) {
    $("#rpipStart").prop("disabled", false).removeClass("disabled");
    $("#rpipComplete").prop("disabled", false).removeClass("disabled");
    $("#rpipCancel").prop("disabled", false).removeClass("disabled");
    _listClick++;
    $("#dlrCd").val(dataItem.dlrCd);
    $("#roDocNo").val(dataItem.roDocNo);
    $("#lineNo").val(dataItem.lineNo);
    $("#bayNo").val(dataItem.bayNo);
    $("#rpirTp").val(dataItem.rpirTp);
    $("#rpirCd").val(dataItem.rpirCd);
    $("#rpirNm").val(dataItem.rpirNm);
    $("#rpirDstinCd").val(dataItem.rpirTp);
    $("#wrkStatCd").val(dataItem.wrkStatCd);
    $("#qtTestCd").val(dataItem.qtTestCd);
    $("#wrkStartDt").val(chgDateTimeStampKendo(dataItem.wrkStartDt));
    if (dataItem.wrkEndDt != null) {
        $("#wrkEndDt").val(chgDateTimeStampKendo(dataItem.wrkEndDt));
    }
    else {
        $("#wrkEndDt").val(null);
    }
    $("#planHm").val(dataItem.planHm);
    $("#pauseCauCd").val(dataItem.pauseCauCd);
    $("#pauseCauRmk").val(dataItem.pauseCauRmk);

    if(dataItem.realTecId==null){
        $("#saId1").val(loginUsrId);

    }else{
        $("#saId1").val(dataItem.realTecId);

    }

    if(dataItem.realTecNm==null){
        $("#saNm1").val(loginUsrNm);
    }else{
        $("#saNm1").val(dataItem.realTecNm);
    }
    /**
     * wrkStatCd
     *
     * 각 단계별 버튼 활성화
     * 01 : 정비대기 상태 -> 정비시작 활성화
     * 02 : 정비시작 상태 -> 정비중지 & 정비완료 & 정비취소 활성화
     * 03 : 정비중지 -> 정비재개 & 정비취소 활성화
     * 04 : 정비재개 -> 정비중지 & 정비완료 & 정비취소 활성화
     * 05 : 정비완료 -> 정비취소 활성화
     *
     * data-for="wrk01" : 정비완료 & 정비취소 버튼
     *
     * 이벤트별 상태
     * 정비취소 -> 정비대기
     * 정비대기 -> 정비시작 -> 정비시작
     * 정비시작 -> 정비중지 -> 정비중지
     * 정비중지 -> 정비재개 -> 정비재개
     * 정비재개 -> 정비완료 -> 정비완료
     *
     *
     */

    if(dataItem.wrkStatCd === "01"){
        $('[data-for="wrk01"]').each(function(){
            $(this).prop("disabled", true).addClass("disabled");
        })
        $("#changableBtn").html("<span id='rpipStart' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"02\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStart' /><!-- 정비시작 --></span></span>");
    }
    if(dataItem.wrkStatCd === "02"){
         $('[data-for="wrk01"]').each(function(){
             $(this).prop("disabled", false).removeClass("disabled");
         })
         $("#changableBtn").html("<span id='rpipPause' data-for='wrk01' class='btnd1' onclick='saveWorkProceeByPause(\"03\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStop' /><!-- 정비중지 --></span>");
    }
    if(dataItem.wrkStatCd === "03"){
         $('[data-for="wrk01"]').each(function(){
             $(this).prop("disabled", true).addClass("disabled");
         })
         $("#rpipCancel").prop("disabled", false).removeClass("disabled");
         $("#changableBtn").html("<span id='rpipContinue' data-for='wrk01' class='btnd1' onclick='saveWorkProcee(\"04\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrRestart' /><!-- 정비재개 --></span>");
    }
    if(dataItem.wrkStatCd === "04"){
         $('[data-for="wrk01"]').each(function(){
             $(this).prop("disabled", false).removeClass("disabled");
         })
         $("#changableBtn").html("<span id='rpipPause' data-for='wrk01' class='btnd1' onclick='saveWorkProceeByPause(\"04\", \"saNm1\", \"saId1\", \"04\")'><spring:message code='ser.btn.lbrStop' /><!-- 정비중지 --></span>");
    }
    if(dataItem.wrkStatCd === "05"){
         $('[data-for="wrk01"]').each(function(){
             $(this).prop("disabled", true).addClass("disabled");
         })
         $("#rpipCancel").prop("disabled", false).removeClass("disabled");
    }


}

// 버튼 - 저장
function saveWorkProcee(stat, saNm, saId, type) {
    if (_listClick == 0) {
        return;
    }

    var saveYn = true;
    var saveYn1 = true;
    var dataItem = {};
    dataItem.dlrCd = $("#dlrCd").val();
    dataItem.roDocNo = $("#roDocNo").val();
    dataItem.lineNo = $("#lineNo").val();
    dataItem.bayNo = $("#bayNo").val();
    dataItem.rpirTp = $("#rpirTp").val();
    dataItem.rpirCd = $("#rpirCd").val();
    dataItem.rpirNm = $("#rpirNm").val();
    dataItem.rpirTp = $("#rpirDstinCd").val();
    dataItem.wrkStatCd = $("#wrkStatCd").val();
    dataItem.qtTestCd = $("#qtTestCd").val();
    dataItem.wrkStartDt = $("#wrkStartDt").val();
    dataItem.wrkEndDt = $("#wrkEndDt").val();
    dataItem.planHm = $("#planHm").val();
    dataItem.pauseCauCd = $("#pauseCauCd").val();
    dataItem.pauseCauRmk = $("#pauseCauRmk").val();
    var jsonData = {
        "dlrCd":$("#dlrCd").val()
        ,"roDocNo":$("#roDocNo").val()
        ,"roGrpNo":$("#roGrpNo").val()
        ,"realTecId":$("#" + saId).val()
        ,"realTecNm":$("#" + saNm).val()
        ,"wrkStatCd":stat
        ,"type":type
    }
    // 작업및페인트
    if(type == "04" || type == "01") {
        dataItem.realTecId = $("#" + saId).val();
        dataItem.realTecNm = $("#" + saNm).val();
        dataItem.wrkStatCd = stat;
        dataItem.roGrpNo = $("#roGrpNo").val();
        dataItem.type = type;
        //dataItem.wrkEndDt = null;
        jsonData = dataItem;
    }
    if($("#" + saId).val() == "" && saId == "saId1") {
        mob.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }

    mob.loading.show();

        $.ajax({
            url:"<c:url value='/ser/ro/workProcess/insertWorkProcess.do' />",
            data:JSON.stringify(jsonData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                mob.loading.hide();
            },
            success:function(jqXHR, textStatus) {
                mob.notification.success("<spring:message code='global.info.success'/>");
                _listClick = 0;
                mob.loading.hide();
                subListData.read();
            }
        });


}

function saveWorkProceeByPause(stat, saNm, saId, type) {

    if (_listClick == 0) {
        return;
    }

    mob.loading.show();

    var saveYn = true;
    var saveYn1 = true;
    var dataItem = {};
    dataItem.dlrCd = $("#dlrCd").val();
    dataItem.roDocNo = $("#roDocNo").val();
    dataItem.lineNo = $("#lineNo").val();
    dataItem.bayNo = $("#bayNo").val();
    dataItem.rpirTp = $("#rpirTp").val();
    dataItem.rpirCd = $("#rpirCd").val();
    dataItem.rpirNm = $("#rpirNm").val();
    dataItem.rpirTp = $("#rpirDstinCd").val();
    dataItem.wrkStatCd = $("#wrkStatCd").val();
    dataItem.qtTestCd = $("#qtTestCd").val();
    dataItem.wrkStartDt = $("#wrkStartDt").val();
    dataItem.wrkEndDt = $("#wrkEndDt").val();
    dataItem.planHm = $("#planHm").val();
    dataItem.pauseCauCd = $("#pauseCauCd").val();
    dataItem.pauseCauRmk = $("#pauseCauRmk").val();
    dataItem.expcDlDt = $("#expcDlDt").val();

    // 작업및페인트
    if(type == "04" || type == "01") {
        dataItem.realTecId = $("#" + saId).val();
        dataItem.realTecNm = $("#" + saNm).val();
        dataItem.wrkStatCd = stat;
        dataItem.roGrpNo = $("#roGrpNo").val();
        dataItem.type = type;
        //dataItem.wrkEndDt = null;
    }
    if($("#" + saId).val() == "" && saId == "saId1") {
        mob.notification.info("<spring:message code='ser.lbl.tecNm' var='tecId' /><spring:message code='global.info.required.field' arguments='${tecId},' />");
        return;
    }

    var url = "<c:url value='/mob/ser/ro/workProcess/selectPauseCausePopup.do'/>"

    pauseCustPopupWindow = mob.window.popup({
        windowId:"selectPauseCausePopup"
      , content:{
          url:url
          ,data:{
              "autoBind":false
              ,"selectable":"multiple"
              ,"sLtsModelCd":"HP**A"
              ,"type":"custom1"
              ,"roDocNo":dataItem.roDocNo
              ,"lineNo":dataItem.lineNo
              ,"rpirCd":dataItem.rpirCd
              ,"allocEndDt":dataItem.allocEndDt
              ,"expcDlDt":dataItem.expcDlDt
              ,"rpirCd":dataItem.rpirCd
              ,"rpirNm":dataItem.rpirNm
              ,"callbackFunc":function(data,dataset){
                  if(data != dataItem.expcDlDt){
                      $("#chgExpcDlDt").val(data);
                  }
                  $("#pauseCauCd").val(dataset.pauseCauCd);
                  $("#pauseRemark").val(dataset.pauseRemark);
                  saveWorkProcee('03','saNm1','saId1','04');
                  subListData.read();
              }
          }
      }
    });

}
$(document).ready(function() {
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template: kendo.template($("#subTemplate").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
})
</script>