<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" id="subListView1" data-source="listData2" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="checkitem bgNone">
        <span class="check">
            <input type="checkbox" id="check_confirm_#:rowIdx#" name="check_confirm" class="f_check"/><label for="check_confirm_#:rowIdx#"></label>
            <input type="hidden" name="hidden_confirm" value="#:rowIdx#"/>
            <input type="hidden" name="hidden_confirm_vinNo" value="#:vinNo#"/>
            <input type="hidden" name="hidden_confirm_confirmYn" value="#:confirmYn#"/>
            <input type="hidden" name="hidden_confirm_carStatCd" value="#:carStatCd#"/>
            <input type="hidden" name="hidden_confirm_carId" value="#:carId#"/>
            <input type="hidden" name="hidden_confirm_stockDt" value="#:stockDt#"/>
            <input type="hidden" name="hidden_confirm_remark" value="#:chgRemarkIdToRemark(barcodeNo)#"/>
        </span>
        <span style="width:65%;">#:vinNo#</span>
        <span style="width:35%;">#:barcodeNo#</span>
        <span class="clboth" style="width:65%;">#:ocnCd#/#:modelNm#</span>
        <span style="width:35%">[#:carlineCd #]#:carlineNm #</span>
        <span class="clboth" style="width:65%;">#:extColorNm#/#:intColorCd#</span>
        <span style="width:35%;">#:chgYn2Nm(confirmYn)#</span>
        <span class="clboth" style="width:100%;">#:chgRemarkIdToRemark(barcodeNo)#</span>
    </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData2 = new kendo.data.DataSource({
    transport:{
      read:function(options) {
        if (rowIndex >= rowTotal)
        {
            return;
        }
        app.showLoading();
        pageIndex++;

        var params = {};
        params["recordCountPerPage"] = pageSize;
        params["pageIndex"] = pageIndex;
        params["firstIndex"] = (pageIndex - 1) * pageSize;
        params["lastIndex"] = pageIndex * pageSize;
        var searchData = {sDlrCd:parent.dlrCd,barcodeList:parent.selList};

        $.ajax({
            url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailMobSearch.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                parent.mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                app.hideLoading();
            }
            ,success:function(result) {
                checklistCnt("listarea_noData9",result.data.length,noDatamsg);
                if(result.data!=null){
                    var data = [];
                    $.each(parent.resultDataListForSub , function(i , row){  //조회 결과와 별개로 이전 조회한 결과와 선택한 데이터에서 데이터 필터링 후 실행
                        if(!parent.rowDuplChk(parent.duplDelArrForSub,i)){ //현재 row가 중복 제거 데이터 여부 확인 후 제거 데이터인경우 항목제외
                            rowIndex++;
                            data.push({rowIdx:rowIndex,
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
                              confirmYn   :row.confirmYn,
                              barcodeNo   :row.barcodeNo,
                              stockDt     :row.stockDt,
                              giDdCnt     :row.giDdCnt
                              });//data.push
                        }//if
                    }); //each
                    parent.lastInventoryData=data;
                    options.success(data);
                    parent.setMainListHeightId3("#confirmWearingList",parent.$("#secondHeader").outerHeight(),parent.$("#secondHeader").outerHeight());
                    app.hideLoading();
                }else{
                    parent.setMainListHeightId3("#listarea_noData9",parent.$("#secondHeader").outerHeight(),parent.$("#secondHeader").outerHeight());
                    app.hideLoading();
                }
            }
        });
      }
    },

    pageSize:pageSize,
    serverPaging:true,
    schema:{
        total:function(){ return rowIndex; }
    }
  });


function getConfirmWearingArr(){
    var confirmWearingArr = [];
    var obj = {};
    // 입고확정 대상 데이터 arr로 담기
    $(":checkbox[name ^='check_confirm']").each(function(index){
        if($("input[name ^='check_confirm']")[index].checked == true){
            obj = {};
            obj["carStatCd"] = $("input[name='hidden_confirm_carStatCd']")[index].value;
            obj["vinNo"] = $("input[name='hidden_confirm_vinNo']")[index].value;
            obj["confirmYn"] = $("input[name='hidden_confirm_confirmYn']")[index].value;
            obj["carId"] = $("input[name='hidden_confirm_carId']")[index].value;
            obj["stockDt"] = chgDate($("input[name='hidden_confirm_stockDt']")[index].value);
            obj["remark"] = $("input[name='hidden_confirm_remark']")[index].value;
            confirmWearingArr.push(obj);
         }
    });
    return confirmWearingArr;
}
function chgYn2Nm(obj){
    if(obj=="Y"){
        return "<spring:message code='global.btn.completion' />";
    }else{
        return "<spring:message code='global.lbl.incomplete' />";
    }
}
function chgRemarkIdToRemark(obj){
    var returnVal;
    if(obj!=null||obj != "undefined"){
        returnVal=parent.remarkMap["remark_"+obj];
    }

    if(returnVal == "undefined"){
        returnVal="";
    }
    return returnVal;
}
var app = setKendoMobApp();

</script>
