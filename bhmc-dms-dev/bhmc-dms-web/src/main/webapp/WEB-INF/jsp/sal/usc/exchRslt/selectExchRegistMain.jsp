<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<div id="resizableContainer">
<!-- 중고차치환판매심사결과등록 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.midAgeVehicleChgSaleApprv" /></h1><!-- 중고차치환판매심사결과등록 -->
        <div class="btn_right">
            <button class="btn_m" id="btnExcelImport"><spring:message code="global.btn.excelImport" /></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.division' /></th><!-- 사업부 -->
                    <td>
                        <input id="sDiviCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.sung" /></th><!-- 성 -->
                    <td>
                        <input id="sSungCd" name="sungCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.city" /></th><!-- 시  -->
                    <td>
                        <input id="sCityCd" name="cityCd" type="text" class="form_comboBox" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sUploadStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sUploadEndDt" type="text" class="form_datepicker">
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
                    <th scope="row"><spring:message code='global.lbl.dealer' /></th><!-- 딜러 -->
                    <td >
                        <input id="sDlrCd" type="text" class="form_comboBox">
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


<!-- script -->
<script type="text/javascript">
var exchRegistUploadPopupWin;

//현재일자
var toDay = "${toDay}";
var oneDay = "${oneDay}";
var pageGubun = "${sysCd}";        //"D" : DMS , "I" : DCS




/************* 사업부 SELECT BOX  *******************/
var divisionCdDs = [];
<c:forEach var="obj" items="${sdptCdList}">
divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
</c:forEach>
var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd});
/************* 사업부 SELECT BOX  *******************/


$(document).ready(function() {



    //사업부
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);


           if(dataItem.diviCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
       }
    });

    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sSungCd").data("kendoExtDropDownList").enable(true);


           if(dataItem.offCd == ""){
               $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sSungCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerSung.do' />"
               ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd})
               ,async:false
           });
           $("#sSungCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
       }
       ,optionLabel:" "   // 전체
    });
    $("#sOffCd").data("kendoExtDropDownList").enable(false);




    //성
    $("#sSungCd").kendoExtDropDownList({
        dataTextField:"saleDlrSungNm"
        ,dataValueField:"saleDlrSungCd"
        ,optionLabel:" "    // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sCityCd").data("kendoExtDropDownList").enable(true);

            if(dataItem.sungCd == ""){
                $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sCityCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value(),"sSaleDlrSungCd":dataItem.saleDlrSungCd})
                ,async:false
            });
            $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
        }
    });
    $("#sSungCd").data("kendoExtDropDownList").enable(false);


    //시
    $("#sCityCd").kendoExtDropDownList({
        dataTextField:"saleDlrCityNm"
        ,dataValueField:"saleDlrCityCd"
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sDlrCd").data("kendoExtDropDownList").enable(true);

            if(dataItem.sungCd == ""){
                $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sDlrCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cmm/selectDealer.do' />"
                ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value()
                    ,"sSaleDlrSungCd":dataItem.saleDlrSungCd,"sSaleDlrCityCd":dataItem.saleDlrCityCd})
                ,async:false
            });
            $("#sDlrCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
        ,optionLabel:" "   // 전체
    });
    $("#sCityCd").data("kendoExtDropDownList").enable(false);


    //딜러
    $("#sDlrCd").kendoExtDropDownList({
        dataTextField:"dlrNm"
        ,dataValueField:"dlrCd"
        ,optionLabel:" "   // 전체
    });
    $("#sDlrCd").data("kendoExtDropDownList").enable(false);



    if(pageGubun == 'D'){
        //사업부
        $("#sDiviCd").data("kendoExtDropDownList").setDataSource([{diviCd:"${dealerVO.sdptCd}", diviNm:"${dealerVO.sdptNm}"}]);
        $("#sDiviCd").data("kendoExtDropDownList").enable(false);
        $("#sDiviCd").data("kendoExtDropDownList").value("${dealerVO.sdptCd}");

        //사무소
        $("#sOffCd").data("kendoExtDropDownList").setDataSource([{distOfficeCd:"${dealerVO.distOfficeCd}", distOfficeNm:"${dealerVO.distOfficeNm}"}]);
        $("#sOffCd").data("kendoExtDropDownList").enable(false);
        $("#sOffCd").data("kendoExtDropDownList").value("${dealerVO.distOfficeCd}");

        //성
        $("#sSungCd").data("kendoExtDropDownList").setDataSource([{saleDlrSungCd:"${dealerVO.saleDlrSungCd}", saleDlrSungNm:"${dealerVO.saleDlrSungNm}"}]);
        $("#sSungCd").data("kendoExtDropDownList").enable(false);
        $("#sSungCd").data("kendoExtDropDownList").value("${dealerVO.saleDlrSungCd}");

        //도시
        $("#sCityCd").data("kendoExtDropDownList").setDataSource([{saleDlrCityCd:"${dealerVO.saleDlrCityCd}", saleDlrCityNm:"${dealerVO.saleDlrCityNm}"}]);
        $("#sCityCd").data("kendoExtDropDownList").enable(false);
        $("#sCityCd").data("kendoExtDropDownList").value("${dealerVO.saleDlrCityCd}");

        //딜러
        var dlrCdNm = "["+"${dealerVO.dlrCd}" +"]"+ "${dealerVO.dlrNm}";
        $("#sDlrCd").data("kendoExtDropDownList").setDataSource([{dlrCd:"${dealerVO.dlrCd}", dlrNm:dlrCdNm}]);
        $("#sDlrCd").data("kendoExtDropDownList").enable(false);
        var dlrCdNm = "${dealerVO.dlrCd}" + "${dealerVO.dlrNm}";
        $("#sDlrCd").data("kendoExtDropDownList").value("${dealerVO.dlrCd}");
    }





    /************************************************* 사업부,사무소,성,시 셋팅 END **************************************************/




    //등록일자 - 시작일
    var sStartDtPicker = $("#sUploadStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //등록일자 - 종료일
    var sEndDtPicker = $("#sUploadEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sUploadStartDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");





    //지불년월
    $("#sPayYyMmDt").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay.substring(0, 8)
    });


    /************************************************************ 검색 영업 END **************************************************/


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            $('#grid').data('kendoExtGrid').dataSource.page(1);

        }
    });


    //버튼 - 일괄등록
    $("#btnExcelImport").kendoButton({
        click:function(e) {

            exchRegistUploadPopupWin = dms.window.popup({
                title:"<spring:message code='sal.menu.midAgeVehicleChgSaleApprv' />"                 //중고차치환판매심사결과등록
                ,height:"500px"
                ,windowId:"promotionUploadPopupWin"
                ,content:{
                    url:"<c:url value='/sal/usc/exchRslt/exchRegistUploadPopup.do'/>",
                    data:{
                        "callbackFunc":function(){
                        	$("#sUploadStartDt").data("kendoExtMaskedDatePicker").value(toDay);
                        	$("#sUploadEndDt").data("kendoExtMaskedDatePicker").value(toDay);
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });

    /************************************************************ 버튼영역 END **************************************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115601"
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

                        params["sDlrCd"] = $("#sDlrCd").data("kendoExtDropDownList").value();
                        //params["sSdptCd"] = $("#sDiviCd").val();
                        //params["sOfficeCd"] = $("#sOffCd").val();
                        //params["sSungCd"] = $("#sSungCd").val();
                        //params["sCityCd"] = $("#sCityCd").val();
                        params["sUploadStartDt"] = $("#sUploadStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sUploadEndDt"] = $("#sUploadEndDt").data('kendoExtMaskedDatePicker').value();
                        params["sPayYyMmDt"] = $("#sPayYyMmDt").val().replace('-','');

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
                        ,dlrCd:{type:"string"}
                        ,dlrNm   :{type:"string"}
                        ,cityCd     :{type:"string"}
                        ,sungCd  :{type:"string"}
                        ,officCd     :{type:"string"}
                        ,sdptCd:{type:"string"}
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
                        ,mayYyMmDt:{type:"string"}
                        ,payYyMmDt:{type:"string"}
                    }
                }
            }
        }
        //,pageable:false
        ,editable:false
        //,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
            {field:"uploadDt",        title:"<spring:message code='sal.lbl.uploadDtTime' />",    width:150, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateTimeFormat' />}"} //등록일자
            ,{field:"exchTp",         title:"<spring:message code='global.lbl.type' />",         width:100, attributes:{"class":"al"}} //교환유형
            ,{field:"dlrCd",          title:"<spring:message code='global.lbl.dlrCd' />",        width:100, attributes:{"class":"ac"}} //딜러코드
            ,{field:"dlrNm",          title:"<spring:message code='global.lbl.dlrNm' />",        width:200,  attributes:{"class":"ac"}} //딜러명
            ,{field:"cityNm",         title:"<spring:message code='sal.lbl.city' />",            width:80,  attributes:{"class":"ac"}} //도시
            ,{field:"sungNm",         title:"<spring:message code='global.lbl.sung' />",         width:80,  attributes:{"class":"ac"}} //성
            ,{field:"officeNm",       title:"<spring:message code='crm.lbl.officeNm' />",        width:80,  attributes:{"class":"ac"}} //사무소
            ,{field:"sdptNm",         title:"<spring:message code='global.lbl.division' />",     width:80,  attributes:{"class":"ac"}} //사업부
            ,{field:"ocarMakerTp",    title:"<spring:message code='global.lbl.brand' />",        width:80,  attributes:{"class":"ac"}} //브랜드
            ,{field:"ocarOwnerNm",    title:"<spring:message code='sal.lbl.oldCarOwnerNm' />",   width:80,  attributes:{"class":"ac"}} //기존차차주성명
            ,{field:"ocarMakerNm",    title:"<spring:message code='global.lbl.brand' />",        width:80,  attributes:{"class":"ac"}} //브랜드
            ,{field:"ocarVinNo",      title:"<spring:message code='sal.lbl.carVinNo' />",        width:150,  attributes:{"class":"al"}} //VIN NO
            ,{field:"ocarRcptNo",     title:"<spring:message code='sal.lbl.usedCarBillingNo' />",width:80,  attributes:{"class":"ac"}} //중고차영수증번호
            ,{field:"ocarRcptPliblDt",title:"<spring:message code='sal.lbl.usedCarBillingDate' />",width:100,  attributes:{"class":"ac"}} //중고차영수증발행일자
            ,{field:"ocarNo",         title:"<spring:message code='global.lbl.carNo' />",        width:100,  attributes:{"class":"ac"}} //차량번호
            //,{field:"ocarDlrCd",      title:"<spring:message code='sal.lbl.code' />",            width:80,  attributes:{"class":"ac"}} //코드
            ,{field:"ncarOwnerNm",    title:"<spring:message code='sal.lbl.newCarOwnerNm' />",   width:80,  attributes:{"class":"ac"}} //신차차주명
            ,{field:"ssnCrnNo",       title:"<spring:message code='global.lbl.idCardNo' />",     width:150,  attributes:{"class":"ac"}} //신분증번호
            ,{field:"ncarVinNo",      title:"<spring:message code='sal.lbl.newCarVinNo' />",     width:150,  attributes:{"class":"ac"}} //VIN NO
            ,{field:"ncarCarlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",      width:100,  attributes:{"class":"ac"}} //차종
            ,{field:"ncarGradeCd",    title:"<spring:message code='global.lbl.gradeCd' />",      width:80,  attributes:{"class":"ac"}} //등급
            ,{field:"tmrCd",          title:"<spring:message code='sal.lbl.terminal' />",        width:80,  attributes:{"class":"ac"}} //단말기
            //,{field:"tmrMm",          title:"<spring:message code='sal.lbl.terminalMonth' />",   width:80,  attributes:{"class":"ac"}} //단말기월
            //,{field:"tmrYy",          title:"<spring:message code='sal.lbl.terminalYear' />",    width:80,  attributes:{"class":"ac"}} //단말기년
            //,{field:"evalRsltCd",     title:"<spring:message code='global.lbl.evalRslt' />",     width:80,  attributes:{"class":"ac"}} //심사결과
            ,{field:"payAmt",         title:"<spring:message code='sal.lbl.imsAmt' />",          width:80,  attributes:{"class":"ar"}} //지불금액
            ,{field:"mayYyMmDt",      title:"<spring:message code='sal.lbl.mayYyMmDt' />",       width:80,  attributes:{"class":"ac"}} //자재년월
            ,{field:"payYyMmDt",      title:"<spring:message code='sal.lbl.payYyMmDt' />",       width:80,  attributes:{"class":"ac"}} //지불년월
        ]
    });

});
</script>
<!-- //script -->