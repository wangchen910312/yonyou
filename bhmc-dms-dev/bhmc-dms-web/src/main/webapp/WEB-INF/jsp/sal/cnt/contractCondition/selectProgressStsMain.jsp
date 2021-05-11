<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 계약품의현황 -->
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.contractProgressSts" /></h1><!-- 계약품의현황 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

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
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" type="text"  class="form_input">
                                    <a href="javascript:selectBpPopupWindow();"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" type="text" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sale.lbl.saleEmpNo' /></th><!-- 판매사원 -->
                    <td>
                        <input id="sSaleEmpNo" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                    <td>
                        <input id="sContractTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th><!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sContractStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sContractEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                    <td>
                        <input id="sOcnCd" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td class="bor_none">
                        <input id="sIntColorCd" type="text" class="form_comboBox">
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
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>



<!-- script -->
<script>

var custNo;

//차량
var  carLineCdList = [{"carlineNm":"", "carlineCd":""}];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//판매유형 Array
var contractTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${contractTpList}">
    contractTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매유형 Map
var contractTpMap = dms.data.arrayToMap(contractTp, function(obj){ return obj.cmmCd; });


//계약상태 Array
var contractStat = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${contractStatList}">
contractStat.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//계약상태 Map
var contractStatMap = dms.data.arrayToMap(contractStat, function(obj){ return obj.cmmCd; });

//판매사원 리스트
var selectSaleEmpDSList = [{"saleEmpNm":"", "saleEmpCd":""}];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"${obj.saleEmpNm}", saleEmpCd:"${obj.saleEmpCd}"});
</c:forEach>

/*************************** 검색조건 END ******************************************/

function fnCheckCustValue(){
    if($("#sContractCustNo").val() != custNo){
        $("#sContractCustNm").val("");
    }
}

$(document).ready(function() {

    //판매사원(영업사원)
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField:"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
    });

    //조회조건 - 계약일(기간)- START
    $("#sContractStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    //조회조건:시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        if(dms.string.isEmpty(e.data.from.val())){return;}
        if(dms.string.isEmpty(e.data.to.val())){return;}

        var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
        var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
        if(startDt > endDt){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
            $(this).focus();
        }
    }

    //조회조건 - 판매유형
    $("#sContractTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTp
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });



    //조회조건 - 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractStat
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       //,optionLabel:"<spring:message code="global.lbl.all" />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);


    $("#sContractCustNo").on('change', fnCheckCustValue);
    $("#sContractStartDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);
    $("#sContractEndDt").on('change',   {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            if( ($("#sContractStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sContractEndDt").data("kendoExtMaskedDatePicker").value() == null)
              ||($("#sContractEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sContractStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113320"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgressSts.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();  //판매사원코드
                        params["sContractTp"] = $("#sContractTp").val();                    //판매유형
                        params["sContractStatCd"] = $("#sContractStatCd").val();            //계약상태
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();   //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();       //계약일(종료일))
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            /*
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            */
            ,schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        contractNo     :{type:"string"}
                        ,contractTp    :{type:"string"}
                        ,contractDt    :{type:"date"}
                        ,contractStatCd:{type:"string"}
                        ,contractCustNo:{type:"string"}
                        ,custNm        :{type:"string"}
                        ,saleEmpNm     :{type:"string"}
                        ,carlineNm     :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnNm         :{type:"string"}
                        ,extColorNm    :{type:"string"}
                        ,intColorNm    :{type:"string"}
                        ,carAmt        :{type:"number"}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,autoBind:false
        ,height  :384
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:130, attributes:{"class":"ac"}} //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:130, attributes:{"class":"al"}
            ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                      //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:130, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:130, attributes:{"class":"al"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"        //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:130, attributes:{"class":"al"}} //고객
            ,{field:"saleEmpNm",     title:"<spring:message code='sale.lbl.saleEmpNo' />",      width:130, attributes:{"class":"al"}} //영업사원
            ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carLine' />",      width:130, attributes:{"class":"al"}} //차종
            ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",        width:130, attributes:{"class":"al"}} //모델
            ,{field:"ocnNm",         title:"OCN",      width:130, attributes:{"class":"al"}}    //OCN
            ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColor' />",     width:130, attributes:{"class":"al"}} //외장색
            ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColor' />",     width:130, attributes:{"class":"al"}} //내장색
            ,{field:"carAmt",        title:"<spring:message code='global.lbl.vehiclePrice' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"} //차량가격
        ]
    });


});


//고객 팝업 열기 함수.
function selectBpPopupWindow(){

    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
                , "closeYn":"Y"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    $("#sContractCustNo").val(data[0].custNo);
                    $("#sContractCustNm").val(data[0].custNm);
                    custNo = data[0].custNo;
                //    popupWindow.close();
                }
            }
        }
    });
}

</script>
<!-- //script -->










