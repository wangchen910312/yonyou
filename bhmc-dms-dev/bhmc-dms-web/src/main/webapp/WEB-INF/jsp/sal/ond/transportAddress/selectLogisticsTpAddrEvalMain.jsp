<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 용품마스터 관리 -->
<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.onLineDlrRcvAddrAppr'/><!-- 물류운송주소 신청 --></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button type="button" class="btn_m" id="btnConfirm"><spring:message code='sal.lbl.confrim'/><!-- 비준 --></button>
            <button type="button" class="btn_m" id="btnRefuse"><spring:message code='sal.btn.reject'/><!-- 거절 --></button>
            <button type="button" class="btn_m" id="btnDelete"><spring:message code='sal.btn.contsancel'/><!-- 폐기 --></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                        <label for="sRadioY" class="label_check">
                            <input type="radio" id="sRadioY" name="sRadio" value="Y" checked class="form_check" onClick="javascript:changedRadio(true);"/>
                            <spring:message code='sal.lbl.waitEval'/>
                        </label>
                        <label for="sRadioN" class="label_check">
                            <input type="radio" id="sRadioN" name="sRadio" value="N" class="form_check" onClick="javascript:changedRadio(false);"/>
                           <spring:message code='sal.lbl.eval'/>
                        </label>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.eMarketCd'/><!-- 전상코드 --></th>
                    <td>
                        <input id="sJunSangCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.receiveComNm'/><!-- 수령회사명칭 --></th>
                    <td>
                        <input id="sCompanyNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.reqDt'/><!-- 신청일자 --></th>
                    <td>
                        <input id="sStartReqDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                        ~
                        <input id="sEndReqDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">

//심사결과
var evalRsltCdList = [];
var evalRsltObj = {};

<c:forEach var="obj" items="${evalRsltCdList}">
    if("${obj.cmmCd}" != '04'){ // 04 코드가 이유 없이 들어가 있음..
        evalRsltCdList.push({evalRsltNm:"${obj.cmmCdNm}", evalRsltCd:"${obj.cmmCd}"});
        evalRsltObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    }
</c:forEach>

$(document).ready(function() {
    
    //조회조건 - 사용일시(기간)- START
    $("#sStartReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    //조회조건 - 대행일(기간)- END
    $("#sEndReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
    
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            // 조회조건 일자
            if( ($("#sStartReqDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndReqDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sEndReqDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartReqDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });
    
    //버튼 - 비준
    $("#btnConfirm").kendoButton({
        click:function(e){
            
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            if(rows.length  == 0 ){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return false;
            }
            
            var saveList = [];
            var isFirst = "";
            var status = "";
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                
                if(isFirst != ""){
                    if(isFirst != dataItem.evalRsltCd){
                        alert("<spring:message code='sal.info.evalStd'/>");
                        status = "X";
                        return false;
                        
                    }
                }else{
                    isFirst = dataItem.evalRsltCd;
                }
                
               saveList.push(dataItem);
            });
            
            var param = {"updateList":saveList};
            
            if(status != "X"){
                $.ajax({
                    url:"<c:url value='/sal/ond/transportAddress/confirmLogisticsTpAddrEvalList.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
    
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                }); 
            }
        }
    });
    
    //버튼 - 거절
    $("#btnRefuse").kendoButton({
        click:function(e){
            
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            if(rows.length  == 0 ){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return false;
            }
            
            var saveList = [];
            var isFirst = "";
            var status = "";
            rows.each(function(index, row) {
               var dataItem = grid.dataItem(row);
               
               if(isFirst != ""){
                   if(isFirst != dataItem.evalRsltCd){
                       alert("<spring:message code='sal.info.evalStd'/>");
                       status = "X";
                       return false;
                   }
               }else{
                   isFirst = dataItem.evalRsltCd;
               }
               
               saveList.push(dataItem);
            });
            
            var param = {"updateList":saveList};
            
            if(status != "X"){
                $.ajax({
                    url:"<c:url value='/sal/ond/transportAddress/denyLogisticsTpAddrEvalList.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
    
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        }
    });
    
    //버튼 - 폐기
    $("#btnDelete").kendoButton({
        click:function(e){
            
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            if(rows.length  == 0 ){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return false;
            }
            
            var saveList = [];
            var isFirst = "";
            var status = "";
            rows.each(function(index, row) {
               var dataItem = grid.dataItem(row);
               
               if(isFirst != ""){
                   if(isFirst != dataItem.evalRsltCd){
                       alert("<spring:message code='sal.info.evalStd'/>");
                       status = "X";
                       return false;
                   }
               }else{
                   isFirst = dataItem.evalRsltCd;
               }
               
               saveList.push(dataItem);
            });
            
            var param = {"updateList":saveList};
            
            if(status != "X"){
                $.ajax({
                    url:"<c:url value='/sal/ond/transportAddress/terminateLogisticsTpAddrEvalList.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
    
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        }
    });
    
    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0309-130001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ond/transportAddress/selectLogisticsTpAddrEvalList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["sRadio"] = $('input:radio[name="sRadio"]:checked').val(); 
                        params["sJunSangCd"] = $("#sJunSangCd").val();
                        params["sCompanyNm"] = $("#sCompanyNm").val();
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"] = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();
                        
                        console.log(params);
                        
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,change:function(e){
        
                //그리드 데이터소스가 "itemchange","add","remove","sync" 인 경우
                if(e.action){
        
                    $.each(e.sender.data(), function(idx, dataItem){
                        console.log(idx);
                        
                    });
                    //그리드의 정보를 반영한다.
                    //$("#grid").data("kendoExtGrid").refresh();
                }
            }
            ,schema:{
                model:{
                    id:"reqNo"
                    ,fields:{
                         reqNoChar:{type:"string"}          //번호
                        ,reqNo:{type:"integer"}             //번호
                        ,dlrCd:{type:"string"}              //전상코드
                        ,dlrNm:{type:"string"}              //전상명칭
                        ,is4sYn:{type:"string"}             //딜러여부
                        ,shipToDlrCd:{type:"string"}        //딜러코드
                        ,dlrNm:{type:"string"}              //수령회사명칭
                        ,shipToAddr:{type:"string"}         //물류운송주소
                        ,shipToProv:{type:"string"}         //성
                        ,shipToCity:{type:"string"}         //시
                        ,shipToRecv:{type:"string"}         //수령인
                        ,test3:{type:"string"}              //수령인증서번호
                        ,shipToRecvTel:{type:"string"}      //수령인 전화
                        ,test4:{type:"string"}              //수령권한문서 UPLOAD
                        ,shipToAdocNo:{type:"string"}       //수령권한문서번호
                        ,reqDt:{type:"date"}                //신청일자
                        ,evalRsltCd:{type:"string"}         //심사결과
                        ,evalDt:{type:"date"}               //심사일자
                        ,pevalName:{type:"string"}          //심사인
                    }
                }
            }
        }
        ,appendEmptyColumn:true
        ,editable:false
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
         }
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,columns:[
              {field:"reqNoChar", title:"<spring:message code='global.lbl.no'/>", width:100} //번호
             ,{field:"dlrCd", title:"<spring:message code='sal.lbl.eMarketCd'/>", width:80}
             ,{field:"dlrNm", title:"<spring:message code='sal.lbl.eMarketNm'/>", width:80}
             ,{field:"is4sYn", title:"<spring:message code='sal.lbl.dealerIs'/>", width:80}  //딜러여부
             ,{field:"shipToDlrCd", title:"<spring:message code='par.lbl.dlrCd'/>", width:80}  //딜러코드
             ,{field:"dlrNm", title:"<spring:message code='sal.lbl.receiveComNm'/>", width:200}  //수령회사명칭
             ,{field:"shipToAddr", title:"<spring:message code='sal.lbl.acceptAddr'/>", width:200}  //물류운송주소
             ,{field:"shipToProv", title:"<spring:message code='mis.lbl.sung'/>", width:80}
             ,{field:"shipToCity", title:"<spring:message code='sal.lbl.cityCd'/>", width:80}
             ,{field:"shipToRecv", title:"<spring:message code='sal.lbl.getPrsnNm'/>", width:80}
             ,{field:"test3", title:"<spring:message code='sal.lbl.receiverSsnCrnNo'/>", width:80}
             ,{field:"shipToRecvTel", title:"<spring:message code='sal.lbl.getPrsnTelNo'/>", width:80}
             ,{field:"test4", title:"<spring:message code='sal.lbl.receiveAuthDoc'/>", width:80}
             ,{field:"shipToAdocNo", title:"<spring:message code='sal.lbl.receiveAuthDocNo'/>", width:80}
             ,{field:"reqDt", title:"<spring:message code='sal.lbl.reqDt'/>", width:80, format:"{0:<dms:configValue code='dateFormat' />}"}
             ,{field:"evalRsltCd", title:"<spring:message code='global.lbl.evalRslt'/>", width:80
                 ,attributes:{"class":"ac"}
                 ,template:"#= dms.string.strNvl(evalRsltObj[evalRsltCd]) #"
                 ,editor:function(container, options) {
                     $('<input name="evalRsltCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          valuePrimitive:true
                         ,dataSource:evalRsltCdList
                         ,dataTextField:"evalRsltNm"
                         ,dataValueField:"evalRsltCd"
                     });
                 }     
             }
             ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt'/>", width:80, format:"{0:<dms:configValue code='dateFormat' />}"}
             ,{field:"pevalName", title:"<spring:message code='global.lbl.pevalId'/>", width:80}
        ]
    });
});

//radio 버튼 처리
function changedRadio(flg){
   if(flg){
       $("#btnDelete").show();
   }else{
       $("#btnDelete").hide();
   }    
}
    
</script>