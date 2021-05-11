<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 수선시스템 - 인증리스트 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.shenheList" /></h1><!-- 중고차인증리스트 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:16%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.requestStat" /></th><!-- 신청상태 -->
                    <td>
                        <input type="text" id="sShenheState" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.oldCarVinNo" /></th><!-- (구)VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.requestTime" /></th><!-- 신청시간 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCreateStartTime" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCreateEndTime" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<!-- //수선시스템 - 인증리스트 -->
</div>

<!-- script -->
<script>
var selectTabId;



//신청상태(인증정보상태)
var shenheStateDs = [];
<c:forEach var="obj" items="${shenheStatList}">
    shenheStateDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//신청상태(인증정보상태) Map
var shenheStateMap = dms.data.arrayToMap(shenheStateDs, function(obj){ return obj.cmmCd; });



$(document).ready(function() {
    //신청상태
    $("#sShenheState").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:shenheStateDs
        ,optionLabel:" "  // 전체
    });



    //신청시간 - 시작일
    var sStartDtPicker = $("#sCreateStartTime").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //신청시간 - 종료일
    var sEndDtPicker = $("#sCreateEndTime").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sCreateStartTime").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");


    /*************************** 검색 조건 영역 END **************************************************/



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    /*************************** 버튼  영역 END **************************************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/topSelection/selectCreditList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sShenheStat"]     = $("#sShenheState").data("kendoExtDropDownList").value();                       // CAR ID
                        params["sVinNo"]          = $("#sVinNo").val();                                                         // VIN NO
                        params["sCreateStartTime"]= $("#sCreateStartTime").data("kendoExtMaskedDatePicker").value();            // 브랜드
                        params["sCreateEndTime"]  = $("#sCreateEndTime").data("kendoExtMaskedDatePicker").value();              // 차량명

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        vin     :{type:"string"}
                        ,id     :{type:"string"}
                        ,carId  :{type:"string"}
                        ,carstyle:{type:"string"}
                        ,shenhesubmittimes:{type:"number"}
                        ,createtime:{type:"date"}
                        ,shenhestate:{type:"string"}
                    }
                }
            }
        }
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var carId = selectedVal.carId;

            }
        }
        ,editable:false
        //,autoBind:false
        ,columns:[ {field:"vin"              ,title:"<spring:message code = 'sal.lbl.oldCarVinNo'/>"  ,width:120 ,attributes:{"class":"ac"}}          //중고차 VIN
                    ,{field:"carstyle"         ,title:"<spring:message code = 'sal.lbl.oldCarNm'/>"     ,width:130 ,attributes:{"class":"ac"}
                        ,template:"<a class='k-link' onclick=\"goCarInfo('#= carId #','#= id #'); \">#= carstyle #</a>"
                     }          //중고차명칭
                    ,{field:"shenhesubmittimes",title:"<spring:message code = 'sal.lbl.submitCount'/>"  ,width:100 ,attributes:{"class":"ac"}
                        ,template:"# if(shenhesubmittimes > 1) { # <spring:message code = 'sal.lbl.someSubmitTime'/>  # }else if( shenhesubmittimes == 1) {# <spring:message code = 'sal.lbl.submitFirstTime'/> #} else{# <spring:message code = 'sal.lbl.noSubmit'/># }#"
                     }//제출회수
                    ,{field:"createtime"       ,title:"<spring:message code = 'sal.lbl.requestTime'/>"  ,width:100 ,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }//신청시간
                    ,{field:"shenhestate"      ,title:"<spring:message code = 'sal.lbl.requestStat'/>"  ,width:100 ,attributes:{"class":"ac"}
                        ,template:"# if(shenheStateMap[shenhestate] != null) { # #= shenheStateMap[shenhestate].cmmCdNm# # }#"
                     }//신청상태
                    ,{field:""                 ,title:"",width:100 ,attributes:{"class":"al"}}          //조작
                   ]
    });


});


    function goCarInfo(carId,id){
        /* var lastSelectedSignDocNo = "";
        var lastSelectedSignDocId = "";

        window.parent._createOrReloadTabMenu("<spring:message code='global.title.signInfo' />"
                , "<c:url value='/cmm/apr/sign/selectSignApprMain.do?signDocNo="+lastSelectedSignDocNo+"&signDocId="+lastSelectedSignDocId+"&viewMode=V '/>"); //결재정보
 */
        window.parent._createOrReloadTabMenu("<spring:message code = 'ser.title.carInfo'/>"
                , "<c:url value='/sal/usc/topSelection/selectVehicleMain.do?carId="+carId+"&id="+id+" '/>");
    }

</script>
<!-- //script -->