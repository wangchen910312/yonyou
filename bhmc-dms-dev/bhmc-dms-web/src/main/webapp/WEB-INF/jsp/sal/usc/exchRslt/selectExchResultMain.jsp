<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<div id="resizableContainer">
<!-- 중고차치환판매심사결과조회 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.midAgeVehicleChgSaleApprvSrch" /></h1><!-- 중고차치환판매심사결과조회 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11003" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
            <!-- Q21012900007二手车置换审核结果查询也增加下载功能 jiaMing 2021-2-8 start-->
             <dms:access viewId="VIEW-D-13324" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_save" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
            <!-- Q21012900007二手车置换审核结果查询也增加下载功能 jiaMing 2021-2-8 end-->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:25%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sUploadStartDt" class="form_datepicker ac" >
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sUploadEndDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.payYyMmDt' /></th>   <!-- 지불월 -->
                    <td>
                        <input id="sPayYyMmDt" name="sPayYyMmDt" class="form_datepicker">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>   <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input">
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
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

<!-- script -->
<script type="text/javascript">

//현재일자
var toDay = "${toDay}";
var oneDay = "${oneDay}";
var toDayMinus7 = "${toDayMinus7}";
var pageGubun = "${sysCd}";        //"D" : DMS , "I" : DCS


$(document).ready(function() {
    //등록일자 - 시작일
//     var sStartDtPicker = $("#sUploadStartDt").kendoExtMaskedDatePicker({
//         format:"{0:<dms:configValue code='dateFormat' />}"
//         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//         ,change:function(){
//             sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
//         }
//     }).data("kendoExtMaskedDatePicker");


    $("#sUploadStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDayMinus7
    });

    //등록일자 - 종료일
//     var sEndDtPicker = $("#sUploadEndDt").kendoExtMaskedDatePicker({
//         format:"{0:<dms:configValue code='dateFormat' />}"
//         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//         ,change:function(){
//             if(dms.string.isEmpty($("#sUploadStartDt").data("kendoDatePicker").value())){
//                 dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
//                 this.value("");
//                 return;
//             }else{
//                 sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
//             }
//         }
//     }).data("kendoExtMaskedDatePicker");

    $("#sUploadEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });


    //지불년월
    $("#sPayYyMmDt").kendoExtMaskedDatePicker({
         value:toDay.substring(0, 8)
        ,start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /************************************************************ 검색 영업 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            $('#grid').data('kendoExtGrid').dataSource.page(1);

        }
    });

    /************************************************************ 버튼영역 END **************************************************/
    //Q21012900007二手车置换审核结果查询也增加下载功能 2021-2-8 start
        
    $("#btnExcel").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"exchResultService"
                ,"templateFile":"MidAgeVehicleChgSaleApprvSrch.xlsx"
                ,"fileName":"<spring:message code='sal.menu.midAgeVehicleChgSaleApprvSrch' />.xlsx"
                ,"sVinNo":$("#sVinNo").val()
                ,"sUploadStartDt":$("#sUploadStartDt").val()
                ,"sUploadEndDt":$("#sUploadEndDt").val()
                ,"sPayYyMmDt":$("#sPayYyMmDt").val().replace('-','')
            });

        }
    });
    //Q21012900007二手车置换审核结果查询也增加下载功能 2021-2-8 end
    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115602"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/usc/exchRslt/selectExchResultList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUploadStartDt"] = $("#sUploadStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sUploadEndDt"] = $("#sUploadEndDt").data('kendoExtMaskedDatePicker').value();
                        params["sPayYyMmDt"] = $("#sPayYyMmDt").val().replace('-','');
                        params["sVinNo"] = $("#sVinNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"uploadDt"
                    ,fields:{
                        uploadDt   :{type:"date"}
                        ,exchTp  :{type:"string"}
                        //,dlrCd:{type:"string"}
                        //,dlrNm   :{type:"string"}
                        //,cityCd     :{type:"string"}
                        //,sungCd  :{type:"string"}
                        //,officeCd     :{type:"string"}
                        //,sdptCd:{type:"string"}
                        ,ocarMakerTp:{type:"string"}
                        ,ocarOwnerNm:{type:"string"}
                        ,ocarMakerNm:{type:"string"}
                        ,ocarVinNo:{type:"string"}
                        ,ocarRcptNo:{type:"string"}
                        ,ocarRcptPliblDt:{type:"string"}
                        ,ocarNo:{type:"string"}
                        //,ocarDlrCd:{type:"string"}
                        ,ncarOwnerNm:{type:"string"}
                        ,ssnCrnNo:{type:"string"}
                        ,ncarVinNo:{type:"string"}
                        ,ncarCarlineCd:{type:"string"}
                        ,ncarGradeCd:{type:"string"}
                        ,tmrCd:{type:"string"}
                        //,tmrMm:{type:"string"}
                        //,tmrYy:{type:"string"}
                        //,evalRsltCd:{type:"string"}
                        ,payAmt:{type:"string"}
                        ,matYyMmDt:{type:"string"}
                        ,payYyMmDt:{type:"string"}
                        ,ocarRcptPublDt:{type:"date"}
                    }
                }
            }
        }
        //,pageable:false
        ,editable:false
        //,autoBind:false
        //,height:485
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
                  {field:"uploadDt",        title:"<spring:message code='sal.lbl.uploadDtTime' />",    width:150, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateTimeFormat' />}"} //등록일자
                  ,{field:"exchTp",         title:"<spring:message code='global.lbl.gubun' />",         width:100, attributes:{"class":"al"}} //교환유형
                  //,{field:"dlrCd",          title:"<spring:message code='global.lbl.dlrCd' />",        width:100, attributes:{"class":"ac"}} //딜러코드
                  //,{field:"dlrNm",          title:"<spring:message code='global.lbl.dlrNm' />",        width:200,  attributes:{"class":"ac"}} //딜러명
                  //,{field:"cityNm",         title:"<spring:message code='sal.lbl.city' />",            width:80,  attributes:{"class":"ac"}} //도시
                  //,{field:"sungNm",         title:"<spring:message code='global.lbl.sung' />",         width:80,  attributes:{"class":"ac"}} //성
                  //,{field:"officeNm",       title:"<spring:message code='crm.lbl.officeNm' />",        width:80,  attributes:{"class":"ac"}} //사무소
                  //,{field:"sdptNm",         title:"<spring:message code='global.lbl.division' />",     width:80,  attributes:{"class":"ac"}} //사업부
                  ,{field:"ocarMakerTp",    title:"<spring:message code='sal.lbl.brandGudge' />",        width:80,  attributes:{"class":"ac"}} //브랜드
                  ,{field:"ocarOwnerNm",    title:"<spring:message code='sal.lbl.oldCarOwnerNm' />",   width:80,  attributes:{"class":"ac"}} //기존차차주성명
                  ,{field:"ocarMakerNm",    title:"<spring:message code='global.lbl.brand' />",        width:80,  attributes:{"class":"ac"}} //브랜드
                  ,{field:"ocarVinNo",      title:"<spring:message code='sal.lbl.carVinNo' />",        width:150,  attributes:{"class":"al"}} //VIN NO
                  ,{field:"ocarRcptNo",     title:"<spring:message code='sal.lbl.usedCarBillingNo' />",width:110,  attributes:{"class":"ac"}} //중고차영수증번호
                  ,{field:"ocarRcptPublDt",title:"<spring:message code='sal.lbl.usedCarBillingDate' />",width:110,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //중고차영수증발행일자
                  ,{field:"ocarNo",         title:"<spring:message code='global.lbl.carNo' />",        width:100,  attributes:{"class":"ac"}} //차량번호
                  //,{field:"ocarDlrCd",      title:"<spring:message code='sal.lbl.code' />",            width:80,  attributes:{"class":"ac"}} //코드
                  ,{field:"ncarOwnerNm",    title:"<spring:message code='sal.lbl.newCarOwnerNm' />",   width:80,  attributes:{"class":"ac"}} //신차차주명
                  ,{field:"ssnCrnNo",       title:"<spring:message code='global.lbl.idCardNo' />",     width:150,  attributes:{"class":"ac"}} //신분증번호
                  ,{field:"ncarVinNo",      title:"<spring:message code='sal.lbl.newCarVinNo' />",     width:150,  attributes:{"class":"ac"}} //VIN NO
                  ,{field:"ncarCarlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",      width:100,  attributes:{"class":"ac"}} //차종
                  ,{field:"ncarGradeCd",    title:"<spring:message code='global.lbl.gradeCd' />",      width:80,  attributes:{"class":"ac"}} //등급
                  //,{field:"tmrCd",          title:"<spring:message code='sal.lbl.terminal' />",        width:80,  attributes:{"class":"ac"}} //단말기
                  //,{field:"tmrMm",          title:"<spring:message code='sal.lbl.terminalMonth' />",   width:80,  attributes:{"class":"ac"}} //단말기월
                  //,{field:"tmrYy",          title:"<spring:message code='sal.lbl.terminalYear' />",    width:80,  attributes:{"class":"ac"}} //단말기년
                  ,{field:"evalRsltCd",     title:"<spring:message code='global.lbl.faultDecisionTp' />",     width:80,  attributes:{"class":"ac"}} //판단(심사결과)
                  ,{field:"payAmt",         title:"<spring:message code='sal.lbl.imsAmt' />",          width:80,  attributes:{"class":"ar"}} //지불금액
                  ,{field:"matYyMmDt",      title:"<spring:message code='sal.lbl.mayYyMmDt' />",       width:80,  attributes:{"class":"ac"}} //자재년월
                  ,{field:"payYyMmDt",      title:"<spring:message code='sal.lbl.payYyMmDt' />",       width:80,  attributes:{"class":"ac"}} //지불년월
        ]
    });

});
</script>
<!-- //script -->










