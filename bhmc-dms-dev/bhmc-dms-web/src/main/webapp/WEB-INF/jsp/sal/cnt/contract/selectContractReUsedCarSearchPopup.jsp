<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 중고차 조회 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.documentNo' /></th><!-- 매입번호 -->
                    <td>
                        <input id="sPurcNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <span style="display:none">
        <!-- 딜러코드 -->
        <input type="hidden" id="sDlrCd"  />
    </span>

</section>
<!-- //계약 차량조회(차량마스터) 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//브랜드 COM019
var carBrandCdDs = [];
<c:forEach var="obj" items="${carBrandCdList}">
    carBrandCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carBrandCdMap = dms.data.arrayToMap(carBrandCdDs, function(obj){ return obj.cmmCd; });


//중고차매입상태
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj){ return obj.cmmCd; });


//중고차사용용도 SAL213
var usedCarUsgeCdList = [{cmmCd:"" , cmmCdNm : "" , useYn:""}];
<c:forEach var="obj" items="${usedCarUsgeCdList}">
usedCarUsgeCdList.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
var usedCarUsgeCdMap = dms.data.arrayToMap(usedCarUsgeCdList , function(obj){return obj.cmmCd;});



$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;


    //브랜드
    $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:""
        ,optionLabel:" "  // 전체
    });

    /**중고차사용용도**/
    setUsedCarUsgeCdMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(usedCarUsgeCdMap[value] != undefined)
            resultVal =  usedCarUsgeCdMap[value].cmmCdNm;
        }
        return resultVal;
    };


    $("#sDlrCd").val(options.sDlrCd);
    if(dms.string.strNvl(options.sVinNo) != ""){
        $("#sVinNo").val(options.sVinNo);
    }

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1018-100101"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractMnt/selectPurcMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPurcNo"]    = $("#sPurcNo").val();       //매입번호
                        params["sVinNo"]     = $("#sVinNo").val();        // VIN NO
                        params["sDlrCd"]     = $("#sDlrCd").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"purcNo"
                    ,fields:{
                        purcNo      :{type:"string"}
                        ,purcCustNm :{type:"string"}
                        ,carBrandCd :{type:"string"}
                        ,modelCd    :{type:"string"}
                        ,carDispQty :{type:"string"}
                        ,ocnCd      :{type:"string"}
                        ,extColorNm :{type:"string"}
                        ,intColorNm :{type:"string"}
                        ,regUsrNm   :{type:"string"}
                        ,purcRegDt  :{type:"date"}
                        ,evalDt     :{type:"date"}
                        ,evalAmt    :{type:"number"}
                        ,exchYn     :{type:"string"}
                        ,retlDt     :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        ,selectable :"row"
        ,height  :374
        ,columns:[
             {field:"purcNo"          ,title:"<spring:message code='sal.lbl.documentNo' />"   ,width:140    ,attributes:{"class":"ac"}}  //매입번호
            ,{field:"purcCustNm"      ,title:"<spring:message code='par.lbl.custNm' />"       ,width:70     ,attributes:{"class":"ac"}}  //고객명
            ,{field:"carBrandNm"      ,title:"<spring:message code='sal.lbl.oldVhBrand' />"      ,width:80     ,attributes:{"class":"ac"}
                //,template:"# if(carBrandCdMap[carBrandCd] != null) { # #= carBrandCdMap[carBrandCd].cmmCdNm# # }#"
             }  //제조브랜드
            ,{field:"vinNo"           ,title:"<spring:message code='global.lbl.vinNum' />"    ,width:120    ,attributes:{"class":"al"}}  //VIN NO
            ,{field:"modelNm"         ,title:"<spring:message code='global.lbl.model' />"     ,width:80     ,attributes:{"class":"al"}}  //모델
            ,{field:"ocnNm"           ,title:"<spring:message code='global.lbl.ocn' />"       ,width:100    ,attributes:{"class":"al"}}  //OCN
            ,{field:"extColorNm"      ,title:"<spring:message code='global.lbl.extColor' />"  ,width:80     ,attributes:{"class":"al"}}  //외장색
            ,{field:"intColorNm"      ,title:"<spring:message code='global.lbl.intColor' />"  ,width:80     ,attributes:{"class":"al"},hidden:true}  //내장색
            ,{field:"regUsrNm"        ,title:"<spring:message code='global.lbl.prsNm' />"    ,width:80     ,attributes:{"class":"al"}}  //담당자
            ,{field:"purcRegDt"       ,title:"<spring:message code='sal.lbl.purcRegDt' />"    ,width:80     ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}  //매입거래일자
            ,{field:"evalDt"          ,title:"<spring:message code='global.lbl.evalScheDt' />",width:80     ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}  //평가일자
            ,{field:"purcTotAmt"      ,title:"<spring:message code='sal.lbl.purcTotAmt' />"   ,width:80     ,attributes:{"class":"ar"},format :"{0:n0}"}  //매입총금액
            ,{field:"exchAmt"         ,title:"<spring:message code='sal.lbl.exchAmt' />"      ,width:80     ,attributes:{"class":"ar"},format :"{0:n0}"}  //치환금액
            ,{field:"exchYn"          ,title:"<spring:message code='sal.lbl.uatcCarPurc' />"  ,width:60     ,attributes:{"class":"ac"}
                ,template:"#= setUsedCarUsgeCdMap(exchYn)#"
            }  //치환여부
            ,{field:"purcStatCd"      ,title:"<spring:message code='global.lbl.statNm' />"    ,width:70    ,attributes:{"class":"ac"}
                ,template:"# if(purcStatCdMap[purcStatCd] != null) { # #= purcStatCdMap[purcStatCd].cmmCdNm# # }#"
             }//상태
        ]
    });


    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});
</script>
<!-- //script -->