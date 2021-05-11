<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
<div id="resizableContainer">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSearch" class="btn_m"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                   <th scope="row"><spring:message code="sal.lbl.bpCd" /><!-- 업체코드  --></th>
                   <td>
                       <input type="text" id="sBpCd" name="sBpCd" class="form_input form_readonly" readonly />
                    </td>
                   <th scope="row"><spring:message code="sal.lbl.bpNm" /><!-- 업체명 --></th>
                   <td>
                       <input type="text" id="sBpNm" name="sBpNm" class="form_input form_readonly" readonly />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.bpTp" /><!-- 업체유형 --></th>
                    <td>
                        <input type="text" id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.etcGrDocNo" /><!-- 입고문서번호 --></th>
                    <td>
                        <input type="text" id="sEtcGrDocNo" name="sEtcGrDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.invcGrDt" /><!-- 입고일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sInvcGrDtFr" name="sInvcGrDtFr" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sInvcGrDtTo" name="sInvcGrDtTo" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</div>
</section>

<script type="text/javascript">
//업체유형
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}" varStatus="status">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//송장상태
var invcStatCdList = [];
<c:forEach var="obj" items="${invcStatCdList}">
invcStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//송장상태 Map
var invcStatCdMap = dms.data.arrayToMap(invcStatCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //팝업옵션
    var popupWindow = parent.$("#inputDocSearchPopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    //버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null){
                var data = [];

                if(rows.length < 1){
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                popupOptions.callbackFunc(data);
            }
        }
    });

    //조회조건 - 업체유형
    $("#sBpTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:bpTpList
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 입고일자 조회시작일
    $("#sInvcGrDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtFr}' />", "yyyy-MM-dd")
        ,max:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtTo}' />", "yyyy-MM-dd")
    });

    //조회조건 - 입고일자 조회종료일
    $("#sInvcGrDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtTo}' />", "yyyy-MM-dd")
        ,min:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtFr}' />", "yyyy-MM-dd")
    });

    //그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    //조회조건 설정
    $("#sBpCd").val(popupOptions.bpCd);
    $("#sBpNm").val(popupOptions.bpNm);
    if(!dms.string.isEmpty(popupOptions.bpTp)){
        $("#sBpTp").data("kendoExtDropDownList").value(popupOptions.bpTp);
        $("#sBpTp").data("kendoExtDropDownList").enable(false);
    }

    $("#grid").kendoExtGrid({
         gridId:"G-SAL-0205-222301"
        ,dataSource:{
            transport:{
                read:{
                   url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDocs.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sEtcGrDocNo"] = $("#sEtcGrDocNo").val();
                        params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();
                        params["sBpCd"] = $("#sBpCd").val();
                        params["sBpNm"] = $("#sBpNm").val();
                        params["sEtcGrDocTp"] = popupOptions.etcGrDocTp
                        params["sInvcGrDtFr"] = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sInvcGrDtTo"] = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"mobisInvcNo"
                    ,fields:{
                        dlrCd:{type:"string"}           //딜러코드
                        ,invcTp:{type:"string"}         //입고유형
                        ,invcDocNo:{type:"string"}      //입고번호
                        ,invcStatCd:{type:"string"}     //입고상태
                        ,invcGrDt:{type:"date"}         //입고일자
                        ,itemQty:{type:"number"}        //입고수량
                        ,itemCnt:{type:"number"}        //목록수
                        ,bpCd:{type:"string"}           //업체코드
                        ,bpNm:{type:"string"}           //업체명
                        ,regUsrId:{type:"string"}       //등록자ID
                        ,regUsrNm:{type:"string"}       //등록자명
                        ,dcRate:{type:"number"}         //세율
                        ,vatAmt:{type:"number"}         //세금액
                        ,grTotAmt:{type:"number"}       //입고금액(세금제외)
                        ,grTotIncTaxAmt:{type:"number"} //입고금액(세금포함)
                    }
                }
                ,parse:function(d){

                    if(d.data != null){
                        $.each(d.data, function(idx, dataItem){
                           switch(dataItem.invcStatCd){
                               case "01":dataItem["invcStatCd"]="00";break;
                               case "02":dataItem["invcStatCd"]="03";break;
                               case "03":dataItem["invcStatCd"]="04";break;
                               default:dataItem["invcStatCd"]="";break;
                           }
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,height:280
        ,filterable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:true
        , columns:[
             {field:"invcDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:140}   //입고문서번호
            ,{field:"invcStatCd", title:"<spring:message code='sal.lbl.invcStatCd' />"  //입고상태
                ,width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem != null){

                        //입고대기
                        if(dataItem.invcStatCd == "00"){
                            return "<span class='txt_label bg_gray'>"+invcStatCdMap[dataItem.invcStatCd].cmmCdNm+"</span>";
                        //등록
                        }else if(dataItem.invcStatCd == "01"){
                            return "<span class='txt_label bg_gray'>"+invcStatCdMap[dataItem.invcStatCd].cmmCdNm+"</span>";
                        //확정
                        }else if(dataItem.invcStatCd == "02"){
                            return "<span class='txt_label bg_yellow'>"+invcStatCdMap[dataItem.invcStatCd].cmmCdNm+"</span>";
                        //입고완료
                        }else if(dataItem.invcStatCd == "03"){
                            return "<span class='txt_label bg_blue'>"+invcStatCdMap[dataItem.invcStatCd].cmmCdNm+"</span>";
                        }
                    }
                    return "";
                }


            }
            ,{field:"invcGrDt", title:"<spring:message code='sal.lbl.invcGrDt' />", width:90, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}    //입고일자
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.itemQty' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"}  //입고수량
            ,{field:"itemCnt", title:"<spring:message code='sal.lbl.itemCnt' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"}  //입고건수
            ,{field:"regUsrNm", title:"<spring:message code='sal.lbl.wrhsCnfmNm' />", width:120}   //입고확인자
            ,{field:"bpNm", title:"<spring:message code='sal.lbl.bpNm' />", width:140 } //업체명
            ,{field:"dcRate", title:"<spring:message code='sal.lbl.taxRate' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"} //세율
            ,{field:"vatAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"} //세액
            ,{field:"grTotAmt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}  //입고금액(세금제외)
            ,{field:"grTotIncTaxAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}    //입고금액(세금포함)
       ]
    });

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
</script>

