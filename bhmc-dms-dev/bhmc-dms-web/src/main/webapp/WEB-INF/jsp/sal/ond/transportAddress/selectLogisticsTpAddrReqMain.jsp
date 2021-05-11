<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 용품마스터 관리 -->
<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.logisReq" /><!-- 물류운송주소 신청 --></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button type="button" class="btn_m" id="btnNew"><spring:message code="global.lbl.new" /><!-- 신규 --></button>
            <button type="button" class="btn_m" id="btnReq"><spring:message code="sal.btn.commReqBtn" /><!-- 제보 --></button>
            <button type="button" class="btn_m" id="btnDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.evalRslt" /><!-- 심사결과 --></th>
                    <td>
                        <input id="sEvalRsltCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.receiveComNm" /><!-- 수령회사명칭 --></th>
                    <td>
                        <input id="sCompanyNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.reqDt" /><!-- 신청일자 --></th>
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

//딜러코드
var dealerNames = [];
dealerNames.push({"dealerNm":"Y"});
dealerNames.push({"dealerNm":"N"});

//심사결과
var evalRsltCdList = [];
var evalRsltObj = {};

<c:forEach var="obj" items="${evalRsltCdList}">
    if("${obj.cmmCd}" != '04'){ // 04 코드가 이유 없이 들어가 있음..
        evalRsltCdList.push({evalRsltNm:"${obj.cmmCdNm}", evalRsltCd:"${obj.cmmCd}"});
        evalRsltObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    }
</c:forEach>

//var evalRsltCdArr = dms.data.arrayToMap(evalRsltCdList, function(obj){return obj.cmmCd;});

//성 조회
var shipToProvList = [];
var shipToProvObj = [];
<c:forEach var="obj" items="${shipToProvList}">
    shipToProvList.push({shipToProvNm:"${obj.saleDlrSungNm}", shipToProvCd:"${obj.saleDlrSungCd}"});
    shipToProvObj["${obj.saleDlrSungCd}"] = "${obj.saleDlrSungNm}";
</c:forEach>

//위치
var locDSList = [];
var locCdObj = {};

//var shipToProvArr = dms.data.arrayToMap(shipToProvList, function(obj){return obj.saleDlrSungCd;});

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

    // 심사결과
    $("#sEvalRsltCd").kendoExtDropDownList({
        dataTextField:"evalRsltNm"
       ,dataValueField:"evalRsltCd"
       ,dataSource:evalRsltCdList
       ,optionLabel:" "
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

    //버튼 - 제보
    $("#btnReq").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            /* if(!grid.isModified()){
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            } */

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            //Validation
            var errors = [];
            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dataItem.dirty || dataItem.isNew()){
                    if(dms.string.isEmpty(dataItem.shipToIdno)){
                        errors.push({"errorMessage":"<spring:message code='sal.lbl.receiveComNm'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToAddr)){
                        errors.push({"errorMessage":"<spring:message code='sal.lbl.logisAddr'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToProv)){
                        errors.push({"errorMessage":"<spring:message code='global.lbl.sung'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToCity)){
                        errors.push({"errorMessage":"<spring:message code='sal.lbl.cityCd'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToRecv)){
                        errors.push({"errorMessage":"<spring:message code='par.lbl.receiveNm'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToRecvTel)){
                        errors.push({"errorMessage":"<spring:message code='sal.lbl.receiverTelNo'/>"+"<spring:message code='global.info.required.field'/>"});
                    }

                    if(dms.string.isEmpty(dataItem.shipToAdocNo)){
                        errors.push({"errorMessage":"<spring:message code='sal.lbl.receiveAuthDocNo'/>"+"<spring:message code='global.info.required.field'/>"});
                    }
                }
                return errors.length == 0? true:false;
            });

            if(errors.length > 0){
                dms.notification.info(errors);
                return;
            }

            $.ajax({
                url:"<c:url value='/sal/ond/transportAddress/saveLogisticsTpAddrReqList.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //버튼 - 추가
    $("#btnNew").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                is4sYn:"Y"
                ,evalRsltCd:"A"
                ,shipToProv:"AH"
                ,fileDocNo:""
            });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0303-130001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ond/transportAddress/selectLogisticsTpAddrReqList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sEvalRsltCd"] = $("#sEvalRsltCd").val();
                        params["sCompanyNm"] = $("#sCompanyNm").val();
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"] = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();

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
                         reqNoChar:{type:"string", editable:false}//번호
                        ,reqNo:{type:"number"}
                        ,is4sYn:{type:"string"}             //딜러여부
                        ,shipToDlrCd:{type:"string"}              //딜러코드
                        ,shipToIdno:{type:"string"}              //수령회사명칭
                        ,shipToAddr:{type:"string"}         //물류운송주소
                        ,shipToProv:{type:"string"}         //성
                        ,shipToCity:{type:"string"}         //시
                        ,shipToRecv:{type:"string"}         //수령인
                        ,shipToAdocNo:{type:"string"}              //수령인증서번호
                        ,shipToRecvTel:{type:"string"}      //수령인 전화
                        ,test3:{type:"string", editable:false}              //수령권한문서 UPLOAD
                        ,shipToAdocNo:{type:"string"}       //수령권한문서번호
                        ,reqDt:{type:"date", editable:false}                //신청일자
                        ,evalRsltCd:{type:"string", editable:false}         //심사결과
                        ,evalDt:{type:"date", editable:false}               //심사일자
                        ,pevalName:{type:"string", editable:false}            //심사인
                    }
                }
            }
        }
        ,edit:function(e){
            var that = this;
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            /* if(fieldName == "reqNoChar"
                    || fieldName == "is4sYn"
                    || fieldName == "test3"
                    || fieldName == "evalRsltCd"
                    || fieldName == "evalDt"
                    || fieldName == "pevalName"){
                that.closeCell();
                return;
            }

            //4S 딜러 인 경우
            if(e.model.is4sYn == "Y" && (fieldName != "shipToAdocNo" && fieldName != "shipToDlrCd")){
                that.closeCell();
            } */
        }
        ,columns:[
              {field:"reqNoChar", title:"<spring:message code='global.lbl.no'/>", width:80, attributes:{"class":"ac"}} //번호
             ,{field:"is4sYn", title:"<spring:message code='sal.lbl.dealerIs'/>", width:80
                 ,attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                     $('<input name="is4sYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         ,dataSource:dealerNames
                         ,dataTextField:"dealerNm"
                         ,dataValueField:"dealerNm"
                     });
                 }
              }  //딜러여부
             ,{field:"shipToDlrCd", title:"<spring:message code='global.lbl.dlrCd'/>", width:80
                 ,attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                     $('<div class="form_search"><input type="text" name="shipToDlrCd" data-name="<spring:message code='global.lbl.dlrCd' />" class="form_input" readonly="true" /><a href="#" onclick="dealerSearchPopup()" >&nbsp;</a></div>')
                     .appendTo(container);
                     $('<span class="k-invalid-msg" data-for="shipToDlrCd"></span>')
                     .appendTo(container);
                 }
              }  //딜러코드
             ,{field:"shipToIdno", title:"<spring:message code='sal.lbl.receiveComNm'/>", width:200}  //수령회사명칭
             ,{field:"shipToAddr", title:"<spring:message code='sal.lbl.logisAddr'/>", width:300}  //물류운송주소
             ,{field:"shipToProv", title:"<spring:message code='global.lbl.sung'/>", width:80
                 ,attributes:{"class":"ac"}
                 ,template:"#= dms.string.strNvl(shipToProvObj[shipToProv]) #"
                 ,editor:function(container, options) {
                     $('<input name="shipToProv" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          valuePrimitive:true
                         ,dataSource:shipToProvList
                         ,dataTextField:"shipToProvNm"
                         ,dataValueField:"shipToProvCd"
                     });
                 }
             }  //성
             ,{field:"shipToCity", title:"<spring:message code='sal.lbl.cityCd'/>", width:80
                 ,attributes:{"class":"al"}
                 ,editor:function (container, options){
                     if(dms.string.strNvl(options.model.shipToProv) == ""){return false;}

                     if(locDSList == null || locDSList.length == 0){
                         var responseJson = dms.ajax.getJson({
                             url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                            ,data:JSON.stringify({"sSaleDlrSungCd":options.model.shipToProv})
                            ,async:false
                         });
                         locDSList = responseJson.data;
                         locCdObj = {};
                         $.each(locDSList, function(idx, obj){
                             locCdObj[obj.locCd] = obj.locNm;
                         });
                     }

                     $('<input name="shipToCity" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                           ,valuePrimitive:true
                         , dataTextField :"saleDlrCityNm"
                         , dataValueField:"saleDlrCityCd"
                         , dataSource:locDSList
                         ,select:function(e){
                             var dataItem = this.dataItem(e.item);
                             options.model.shipToCity = dataItem.saleDlrCityNm;
                         }
                     });

                     locDSList = [];
                     locCdObj = {};
                 }
             }  //시
             ,{field:"shipToRecv", title:"<spring:message code='sal.lbl.getPrsnNm'/>", width:200}  //수령인
             ,{field:"shipToAdocNo", title:"<spring:message code='sal.lbl.receiverSsnCrnNo'/>", width:80}  //수령인증서번호
             ,{field:"shipToRecvTel", title:"<spring:message code='sal.lbl.receiverTelNo'/>", width:80}  //수령인전화
             ,{field:"test3", title:"<spring:message code='sal.lbl.receiveAuthDoc'/>", width:110, attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_blue' onClick='fileUploadPopup(\"#=uid#\")'><spring:message code='sal.lbl.receiveAuthDoc'/></span>"
             }  //수령권한문서 UPLOAD
             ,{field:"shipToAdocNo", title:"<spring:message code='sal.lbl.receiveAuthDocNo'/>", width:80}  //수령권한문서번호
             ,{field:"reqDt", title:"<spring:message code='sal.lbl.reqDt'/>", width:80, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}}  //신청일자
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
             }  //심사결과
             ,{field:"evalDt", title:"<spring:message code='sal.lbl.confirmDt'/>", width:80, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}}  //심사일자
             ,{field:"pevalName", title:"<spring:message code='global.lbl.pevalId'/>", width:100}  //심사인
        ]
    });

});

//수령권한 문서 파일 업로드 팝업
function fileUploadPopup(uid){
    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataSource.getByUid(uid);

    dms.window.popup({
        windowId:"fileUploadPopup"
        ,title:"<spring:message code='sal.lbl.receiveAuthDoc'/>"
        ,width:600
        ,height:200
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/ond/transportAddress/selectFileUploadPopup.do'/>"
            ,data:{
                "fileDocNo":dataItem.fileDocNo
                ,"callbackFunc":function(fileDocNo, fileNo){
                    dataItem.set("fileDocNo", fileDocNo);
                    dataItem.set("fileNo", fileNo);
                }
            }
        }
    });
}

var dealerSearchPopupWin;
function dealerSearchPopup() {
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                ,"closeAfterSelect":true
                ,"callbackFunc":function(jsonObj){
                    if(jsonObj.length > 0) {

                        var rows = $("#grid").data("kendoExtGrid").tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = $("#grid").data("kendoExtGrid").dataSource._data;
                            if($(this).hasClass("k-state-selected")){
                                dataItem[index].shipToDlrCd = jsonObj[0].dlrCd;
                                dataItem[index].shipToIdno = jsonObj[0].dlrNm;
                                dataItem[index].shipToAddr = jsonObj[0].addr1Nm;
                                dataItem[index].shipToProv = jsonObj[0].saleDlrSungCd;
                                //dataItem[index].shipToCity = jsonObj[0].saleDlrCityCd;
                            }
                        });
                        $("#grid").data("kendoExtGrid").refresh();
                    }
                }
            }
        }

    });
}
</script>