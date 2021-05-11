<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 구매오더 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.purcOrdInfo" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11585" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11584" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" readonly class="form_input form_readonly" />
                            <input id="sBpTp" name="sBpTp" class="form_input hidden"  required data-name="<spring:message code="par.lbl.custTp" />" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpNm" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpNm" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcReqTp" /><!-- 구매요청유형 --></th>
                        <td>
                            <input id="sPurcReqTp" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcReqDt" /><!-- 구매요청일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcReqStartDt" class="form_datepicker"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcReqEndDt" class="form_datepicker"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid"  class="resizable_grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>

<!-- script -->
<script>
var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    sessionBpCd         = "${bpCd}",
    sessionBpNm         = "${bpNm}",
    sessionBpTp         = "${bpTp}",
    purcReqTpList       = [],
    purcReqTpObj        = {},
    abcIndList          = [],
    abcIndObj           = {},
    carlineCdList       = [],
    carlineCdObj        = {},
    strgeCdList         = [],
    strgeNmObj          = {},
    minDate             = new Date(sevenDtBf),
    maxDate             = new Date(toDt),
    toYY,
    toMM,
    toDD,
    frYY,
    frMM,
    frDD;

<c:forEach var="obj" items="${purcReqTpList}" varStatus="status">
    purcReqTpList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
    purcReqTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${abcIndList}" varStatus="status">
    abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
    abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

strgeNmObj[' '] = "";
<c:forEach var="obj" items="${strgeCdList}" varStatus="status">
    strgeCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    strgeNmObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

$(document).ready(function() {

    $("#sPurcReqTp").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:purcReqTpList
       ,optionLabel:" "
       ,index:0
   });

    $("#sAbcInd").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:abcIndList
       ,optionLabel:" "
       ,index:0
   });

    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"itemNm"
       ,dataValueField:"itemCd"
       ,dataSource:carlineCdList
       ,optionLabel:" "
       ,index:0
   });

    $("#sPurcReqStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sPurcReqEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    /************************************************************
            그리드 설정
    *************************************************************/
    $("#grid").kendoExtGrid({
    gridId:"G-PAR-0923-162866"
    ,dataSource:{
        transport:{
            read:{
                url:"<c:url value='/par/cmm/selectPurcReqsPop.do' />"
                , dataType:"json"
                , type:"POST"
                , contentType:"application/json;"
            }
            , parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sItemCd"] = $("#sItemCd").val();
                    params["sItemNm"] = $("#sItemNm").val();
                    params["sPurcReqTp"] = $("#sPurcReqTp").data("kendoExtDropDownList").value();
                    params["sPurcReqStartDt"] = $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value();
                    params["sPurcReqEndDt"] = $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value();
                    params["sAbcInd"] = $("#sAbcInd").data("kendoExtDropDownList").value();
                    params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                    return kendo.stringify(params);
                }
            }
        }
        ,navigatable:false
        ,serverPaging:true
        ,schema:{
            data:"data"
            ,total:"total"
            ,model:{
                id:"purcReqNo"
                ,fields:{
                    dlrCd         :{ type:"string" }
                    ,purcReqTp     :{ type:"string" }
                    ,purcReqNo     :{ type:"string" }
                    ,purcReqLineNo :{ type:"number" }
                    ,refDocNo      :{ type:"string" }
                    ,refDocLineNo  :{ type:"number" }
                    ,itemCd        :{ type:"string" }
                    ,itemNm        :{ type:"string" }
                    ,purcReqStatCd :{ type:"string" }
                    ,purcReqQty    :{ type:"number" }
                    ,purcPrc       :{ type:"number" }
                    ,purcReqUnitCd :{ type:"string" }
                    ,abcInd        :{ type:"string" }
                    ,purcLeadHm    :{ type:"string" }
                    ,carlineCd     :{ type:"string" }
                    ,grStrgeCd     :{ type:"string" }
                    ,strgeCd       :{ type:"string" }
                    ,purcReqDt     :{ type:"date"   }
                    ,regUsrId      :{ type:"string" }
                    ,regDt         :{ type:"date" }
                    ,avlbStockQty  :{ type:"number", editable:false }
                    ,borrowQty     :{ type:"number", editable:false }
                    ,rentQty       :{ type:"number", editable:false }
                    ,stockQty      :{ type:"number", editable:false }
                    ,resvStockQty  :{ type:"number", editable:false }
                }
            }
            ,parse:function(d) {
                if(d.data){
                    $.each(d.data, function(idx, elem) {
                        elem.regDt = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        elem.purcReqDt = kendo.parseDate(elem.purcReqDt, "<dms:configValue code='dateFormat' />");
                        elem.purcReqTp = changePurcReqTp(elem.purcReqTp);
                        elem.strgeCd = changeStrgeCd(elem.strgeCd);
                        elem.carlineCd = changeCarlineCd(elem.carlineCd);
                    });
                }

                return d;
            }
        }
    }
    ,selectable:"row"
    ,editable:false
    ,autoBind:false
    ,appendEmptyColumn:true
    ,height:280
    ,columns:[
        {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105,hidden:true}//딜러 코드
        ,{field:"grStrgeCd" ,title:"<spring:message code='par.lbl.grStrgeCd' />" ,width:140,hidden:true}//입고창고
        ,{field:"purcReqTp" ,title:"<spring:message code='par.lbl.purcReqTp' />" ,width:100}//결품유형
        ,{field:"regDt" ,title:"<spring:message code='par.lbl.regDt' />"
            ,width:100
            ,attributes:{"class":"ac tooltip-disabled"}
            ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
        }//등록일
        ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:120 }//부품번호
        ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200 }//부품명
        ,{field:"purcReqQty" ,title:"<spring:message code='par.lbl.qty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:90}//구매요청수량
        ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeNm' />" ,width:140}//창고
        ,{field:"regUsrId" ,title:"<spring:message code='par.lbl.regUsrId' />" ,width:80 }//등록자
        ,{field:"purcReqNo" ,title:"<spring:message code='par.lbl.regDocNo' />" ,width:140}//구매요청번호
        ,{field:"purcReqLineNo" ,title:"<spring:message code='par.lbl.lineNm' />" ,attributes:{ "class":"ac"} ,width:40}//구매요청라인번호
        ,{field:"abcInd" ,title:"<spring:message code='par.lbl.abcInd' />" ,width:60}//ABC CLASS
        ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:60}//차종
        ,{field:"purcLeadHm" ,title:"<spring:message code='par.lbl.purcLeadHm' />" ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,width:80 ,hidden:true}//구매리드타임
        ,{field:"purcReqUnitCd" ,title:"<spring:message code='par.lbl.unitNm' />" ,attributes:{ "class":"ac"} ,width:80}//단위
        ,{field:"purcReqDt" ,title:"<spring:message code='par.lbl.periodDeliveryReqDt' />"
            ,width:100
            ,attributes:{"class":"ac tooltip-disabled"}
            ,template:"#if (purcReqDt !== null ){# #= kendo.toString(data.purcReqDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
        }//납기요청일
        ,{field:"purcPrc" ,title:"<spring:message code='par.lbl.purcPrc' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:80}//구매단가
        ,{field:"remark" ,title:"<spring:message code='par.lbl.remark' />" ,width:150}//단위
        ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:0}//재고수량
        ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:0}//가용수량
        ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:0}//예약수량
        ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:0}//대여수량
        ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:0}//차입수량
    ]
    });

    //  결품유형
    changePurcReqTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcReqTpObj[val];
        }
        return returnVal;
    };

    //  ABC CLASS
    changeAbcInd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = abcIndObj[val];
        }
        return returnVal;
    };

    // 차형
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };

    // 창고
    changeStrgeCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(strgeNmObj[val])){
                returnVal = strgeNmObj[val];
            }else{
                returnVal = "";
            }
        }
        return returnVal;
    };

    initPage();
});

function initPage(){
    var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;
    //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    $("#grid").data("kendoExtGrid").dataSource.data([]);

    /************************************************************
                조회조건 설정
    *************************************************************/
    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#sPurcReqTp").data("kendoExtDropDownList").select(0);
    $("#sCarlineCd").data("kendoExtDropDownList").select(0);
    $("#sAbcInd").data("kendoExtDropDownList").select(0);

    // 조회조건 설정
    $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value(minDate);
    $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value(maxDate);
    $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    $("#sBpCd").val(sessionBpCd);
    $("#sBpNm").val(sessionBpNm);
    $("#sBpTp").val(sessionBpTp);
}

function fnChkDateValue(e){

   var  elmt  = e.sender.element[0],
        id    = elmt.id,
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

   if(this.value() == null){
       if(id === 'sPurcReqStartDt'){
           var minDate = new Date(sevenDtBf);
           frYY = minDate.getFullYear();
           frMM = minDate.getMonth();
           frDD = minDate.getDate();
           $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
           $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
       }else if(id === 'sPurcReqEndDt'){
           var maxDate = new Date(toDt);
           toYY = maxDate.getFullYear();
           toMM = maxDate.getMonth();
           toDD = maxDate.getDate();

           $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);
           $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
       }
   }else{
       if(id === 'sPurcReqStartDt'){
           frYY = this.value().getFullYear();
           frMM = this.value().getMonth();
           frDD = this.value().getDate();
           $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
       }else if(id === 'sPurcReqEndDt'){
           toYY = this.value().getFullYear();
           toMM = this.value().getMonth();
           toDD = this.value().getDate();
           $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
       }
   }


}

</script>
<!-- //script -->

