<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 용품마스터 관리 -->
<div id="resizableContainer">
<section class="group">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code='cmm.title.dealerInfo' /></h1><!-- 딜러정보 -->
    </div>
    <br>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per"  role="search">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span><spring:message code="par.lbl.dlrCd" /></span></th> <!-- 딜러코드 -->
                    <td>
                        <input name="dmrDlrCd" id="dmrDlrCd" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="par.lbl.dlrNm" /></span></th> <!-- 딜러명 -->
                    <td>
                        <input name="dmrDlrNm" id="dmrDlrNm" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="par.lbl.pdcCd" /></span></th> <!-- PDC코드 -->
                    <td>
                        <input name="dmrPdc" id="dmrPdc" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="par.lbl.dlrTpNm" /></span></th> <!-- 딜러타입 -->
                    <td>
                        <input name="dmrDlrTyp" id="dmrDlrTyp" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="global.lbl.startDt" /></span></th> <!-- 시작일 -->
                    <td>
                        <input name="dmrTrdBizStr" id="dmrTrdBizStr" type="text" disabled class="form_datepicker form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="global.lbl.EndDt" /></span></th> <!-- 종료일 -->
                    <td>
                        <input name="dmrTrdBizEnd" id="dmrTrdBizEnd" type="text" disabled class="form_datepicker form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="par.lbl.manager" /></span></th> <!-- 부품담당 -->
                    <td>
                        <input name="dmrPnoMrnm" id="dmrPnoMrnm" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="par.lbl.comMng" /></span></th> <!--  회사관리자 -->
                    <td>
                        <input name="dmrAreaMrnm" id="dmrAreaMrnm" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="global.lbl.tel" /></span></th> <!-- 전화 -->
                    <td>
                        <input name="dmrPnoMgrTel" id="dmrPnoMgrTel" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="global.lbl.cellphone" /></span></th> <!-- 핸드폰 -->
                    <td>
                        <input name="dmrPnoMgrCell" id="dmrPnoMgrCell" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="par.lbl.zipCd" /></span></th> <!-- 우편번호 -->
                    <td>
                        <input name="dmrZip" id="dmrZip" type="text" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row"><span><spring:message code="par.lbl.prsnFaxNo" /></span></th> <!-- FAX -->
                    <td>
                        <input name="dmrPnoMgrFax" id="dmrPnoMgrFax" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="global.lbl.emailNm" /></span></th> <!-- 이메일 -->
                    <td>
                        <input name="dmrPnoMgrEmail" id="dmrPnoMgrEmail" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span><spring:message code="par.title.venderAddr" /></span></th> <!--  주소 -->
                    <td colspan=3>
                        <input name="dmrIpAdr" id="dmrIpAdr" type="text" disabled class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>


    <!-- 그리드 시작 -->
    <!--
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    -->
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">

var dlPdcCdList = [];
var dlPdcCdObj = {};

var dlTypeList = [];
var dlTypeObj = {};

dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

dlTypeList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${dlTypeList}" varStatus="status">
    dlTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlTypeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

changePrcTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = dlPdcCdObj[val];
    }
    return returnVal;
};

changeTypeTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = dlTypeObj[val];
    }
    return returnVal;
};

$(document).ready(function() {

    $.ajax({
        url:"<c:url value='/par/pmm/dealerInfo/selectDealerInfoList.do' />",
        data:JSON.stringify({dmrDlrCd: "${dlrCd}" }),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }

    }).done(function(result) {

        $("#dmrDlrCd").val(result.dealer.dmrDlrCd);
        $("#dmrDlrNm").val(result.dealer.dmrDlrNm);
        $("#dmrPdc").val(changePrcTp(result.dealer.dmrPdc));
        $("#dmrDlrTyp").val(changeTypeTp(result.dealer.dmrDlrTyp));
        $("#dmrTrdBizStr").data('kendoExtMaskedDatePicker').value(result.dealer.dmrTrdBizStr);
        $("#dmrTrdBizEnd").data('kendoExtMaskedDatePicker').value(result.dealer.dmrTrdBizEnd);
        $("#dmrPnoMrnm").val(result.dealer.dmrPnoMrnm);
        $("#dmrAreaMrnm").val(result.dealer.dmrAreaMrnm);
        $("#dmrPnoMgrTel").val(result.dealer.dmrPnoMgrTel);
        $("#dmrPnoMgrCell").val(result.dealer.dmrPnoMgrCell);
        $("#dmrZip").val(result.dealer.dmrZip);
        $("#dmrPnoMgrFax").val(result.dealer.dmrPnoMgrFax);
        $("#dmrPnoMgrEmail").val(result.dealer.dmrPnoMgrEmail);
        $("#dmrIpAdr").val(result.dealer.dmrIpAdr);

    });

    $("#dmrTrdBizStr").kendoExtMaskedDatePicker({
        format : "{0:<dms:configValue code='dateFormat' />}",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dmrTrdBizEnd").kendoExtMaskedDatePicker({
        format : "{0:<dms:configValue code='dateFormat' />}",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0728-173000"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/par/pmm/dealerInfo/selectDealerInfoList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dmrDlrCd"
                    ,fields:{
                         dmrDlrCd:{type:"string"}          //딜러코드
                        ,dmrDlrNm:{type:"string"}          //딜러명
                        ,dmrPdc:{type:"string"}         //PDC코드
                        ,dmrDlrTyp:{type:"string"}         //딜러타입
                        ,dmrTrdBizStr:{type:"date"}      //시작일
                        ,dmrTrdBizEnd:{type:"date"}      //종료일
                        ,dmrPnoMrnm:{type:"string"}        //부품담당
                        //,dmrAreaMrnm:{type:"string"}     //회사관리자
                        ,dmrPnoMgrTel:{type:"string"}      //전화
                        ,dmrPnoMgrCell:{type:"string"}     //핸드폰
                        ,dmrZip:{type:"string"}            //우편번호
                        ,dmrPnoMgrFax:{type:"string"}      //FAX
                        ,dmrPnoMgrEmail:{type:"string"}    //EMAIL
                        //,dmrIpAdr:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,sortable:true
        ,appendEmptyColumn:true
        ,columns:[
              {field:"dmrDlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}              //딜러코드
             ,{field:"dmrDlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:250}              //딜러명
             ,{field:"dmrPdc", title:"<spring:message code='par.lbl.pdcCd' />", width:100, attributes:{"class":"ac"}}             //PDC코드
             ,{field:"dmrDlrTyp", title:"<spring:message code='par.lbl.dlrTpNm' />", width:100, attributes:{"class":"ac"}}           //딜러타입
             ,{field:"dmrTrdBizStr", title:"<spring:message code='global.lbl.startDt' />", width:100,
                 format:"{0:<dms:configValue code='dateFormat' />}"
             }     //시작일
             ,{field:"dmrTrdBizEnd", title:"<spring:message code='global.lbl.EndDt' />", width:100,
                 format:"{0:<dms:configValue code='dateFormat' />}"
             }       //종료일
             ,{field:"dmrPnoMrnm", title:"<spring:message code='par.lbl.manager' />", width:100}          //부품담당
             ,{field:"dmrPnoMgrTel", title:"<spring:message code='global.lbl.tel' />", width:100}         //전화
             ,{field:"dmrPnoMgrCell", title:"<spring:message code='global.lbl.cellphone' />", width:100}  //핸드폰
             ,{field:"dmrZip", title:"<spring:message code='par.lbl.zipCd' />", width:100}                //우편번호
             ,{field:"dmrPnoMgrFax", title:"<spring:message code='par.lbl.prsnFaxNo' />", width:100}      //FAX
             ,{field:"dmrPnoMgrEmail", title:"<spring:message code='global.lbl.emailNm' />", width:200}   //EMAIL

        ]
    });
});
</script>