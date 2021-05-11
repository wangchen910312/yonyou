<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 계약품의진척 -->
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.contractProgress" /></h1><!-- 계약품의진척 -->
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
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" type="text" class="form_input">
                                    <a href="javascript:selectBpPopupWindow();"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" type="text" readonly class="form_input form_readonly">
                            </div>
                        </div>
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
                    <th scope="row">OCN</th>
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

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area"></div>
    <!-- 그리드 기능 버튼 종료 -->

    <div id="tabstrip" class="tab_area">
        <ul>
            <li id="contractStatAll" class="k-state-active" selected><spring:message code='global.lbl.all' /><!-- 전체 --></li>
            <li id="contractStat10"><spring:message code='global.lbl.contractReg' /><!-- 계약등록 --></li>
            <li id="contractStat20"><spring:message code='sal.btn.contractCreate' /><!-- 계약생성 --></li>
            <li id="contractStat50"><spring:message code='global.lbl.custDelivery' /><!-- 고객인도 --></li>
            <li id="contractStat91"><spring:message code='global.lbl.contractDel' /><!-- 계약삭제 --></li>
            <li id="contractStat92"><spring:message code='sal.lbl.contractRemove' /><!-- 계약해지 --></li>
        </ul>

        <!--전체 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="gridAll" class="grid"></div>
            </div>
        </div>
        <!--전체 탭 영역 -->

        <!--계약등록 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="grid10" class="grid"></div>
            </div>
        </div>
        <!--계약등록 탭 영역 -->

        <!--계약생성 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="grid20" class="grid"></div>
            </div>
        </div>
        <!--계약생성 탭 영역 -->

        <!--고객인도 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="grid50" class="grid"></div>
            </div>
        </div>
        <!--고객인도 탭 영역 -->

        <!--계약삭제 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="grid91" class="grid"></div>
            </div>
        </div>
        <!--계약삭제 탭 영역 -->

        <!--계약해지 탭 영역 -->
        <div>
            <div class="table_grid">
                <div id="grid92" class="grid"></div>
            </div>
        </div>
        <!--계약해지 탭 영역 -->
    </div>

</section>



<!-- script -->
<script>

var custNo ;

//차량
var carLineCdList = [{"carlineNm":"", "carlineCd":""}];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


//외장색 데이터셋
var extColorList = [{"extColorNm":"", "extColorCd":""}];
<c:forEach var="obj" items="${extColorNames}">
extColorList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
</c:forEach>



//내장색 데이터셋
var intColorList = [{"intColorNm":"", "intColorCd":""}];
<c:forEach var="obj" items="${intColorNames}">
intColorList.push({intColorNm:"${obj.intColorNm}", intColorCd:"${obj.intColorCd}"});
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



/*************************** 검색조건 END ******************************************/

function fnCheckCustValue(){
    if($("#sContractCustNo").val() != custNo){
        $("#sContractCustNm").val("");
    }
}

$(document).ready(function() {

    // 탭
    var selectTabId = "contractStatAll";
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId); // 탭 조회
        }
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
    $("#sContractTpT2").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:contractTp
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
            // 탭 조회
            selectTab(selectTabId);
        }
    });


    //그리드 설정 - 전체탭 그리드
    $("#gridAll").kendoExtGrid({
        gridId:"G-SAL-0721-113314"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    });



    //그리드 설정 - 계약등록 그리드
    $("#grid10").kendoExtGrid({
        gridId:"G-SAL-0721-113315"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드
                        params["sContractStatCd"] = "10";                                   //계약등록탭조회

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    });



    //그리드 설정 - 계약생성 그리드
    $("#grid20").kendoExtGrid({
        gridId:"G-SAL-0721-113316"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드
                        params["sContractStatCd"] = "20";                                   //계약등록탭조회

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    })



    //그리드 설정 - 고객인도 그리드
    $("#grid50").kendoExtGrid({
        gridId:"G-SAL-0721-113317"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드
                        params["sContractStatCd"] = "50";                                   //계약등록탭조회

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    })



    //그리드 설정 - 계약삭제 그리드
    $("#grid91").kendoExtGrid({
        gridId:"G-SAL-0721-113318"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드
                        params["sContractStatCd"] = "91";                                   //계약등록탭조회

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    })



    //그리드 설정 - 계약해지 그리드
    $("#grid92").kendoExtGrid({
        gridId:"G-SAL-0721-113319"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractCondition/selectProgress.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();          //계약일(시작일)
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();              //계약일(종료일)
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드
                        params["sModelCd"] = $("#sModelCd").val();                          //모델코드
                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").val();                    //내장색코드
                        params["sContractStatCd"] = "92";                                   //계약등록탭조회

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
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
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd :{type:"string"}                   //차종코드
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelCd   :{type:"string"}                   //모델코드
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnCd     :{type:"string"}                   //OCN코드
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}                   //외장색상코드
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorCd:{type:"string"}                   //내장색상코드
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,realPayAmt:{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,height:385
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:110, attributes:{"class":"ac"}}               //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:100, attributes:{"class":"ac"}
              ,template:"# if(contractTpMap[contractTp] != null) { # #= contractTpMap[contractTp].cmmCdNm# # }#"                                  //판매유형
             }
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:110, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(contractStatMap[contractStatCd] != null) { # #= contractStatMap[contractStatCd].cmmCdNm# # }#"                      //계약상태
             }
            ,{field:"custNm",        title:"<spring:message code='global.lbl.customer' />",     width:100, attributes:{"class":"ac"}}               //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='global.lbl.saleEmpNo' />",    width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150, attributes:{"class":"al"}}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220, attributes:{"class":"al"}}
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:180, attributes:{"class":"al"}}
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"al"}}                      //내장색명
            ,{field:"realPayAmt", title:"<spring:message code='global.lbl.carAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"}    //차량가격
        ]
    })






});

/**
 *  탭별 데이터 조회
 */
function selectTab(tabId){

    switch (tabId){
        case 'contractStatAll':       // 전체 탭
            $("#gridAll").data("kendoExtGrid").dataSource.read();
            break;
        case 'contractStat10':        // 계약등록 탭
            $("#grid10").data("kendoExtGrid").dataSource.read();
            break;
        case 'contractStat20':        // 계약생성 탭
            $("#grid20").data("kendoExtGrid").dataSource.read();
            break;
        case 'contractStat50':        // 고객인도 탭
            $("#grid50").data("kendoExtGrid").dataSource.read();
            break;
        case 'contractStat91':        // 계약삭제 탭
            $("#grid91").data("kendoExtGrid").dataSource.read();
            break;
        case 'contractStat92':        // 계약해지 탭
            $("#grid92").data("kendoExtGrid").dataSource.read();
            break;
        default :
            break;
    }
}



//고객 팝업 열기 함수.
function selectBpPopupWindow(){

    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    $("#sContractCustNo").val(data[0].custNo);
                    $("#sContractCustNm").val(data[0].custNm);
                    custNo = data[0].custNo;

                    popupWindow.close();
                }
            }
        }
    });
}



</script>
<!-- //script -->










