<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 계약품의진척(간반차트) -->
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.contractProgressKanban" /></h1><!-- 계약품의진척(간반차트) -->
        <div class="btn_right">
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sale.lbl.saleEmpNo' /></th><!-- 판매사원 -->
                    <td>
                        <input id="sSaleEmpNo" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                    <td>
                        <input id="sContractTp" type="text" class="form_comboBox">
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
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

<div class="kanban_list">
    <ul class="kanban_title">
        <li class="color_r"><spring:message code='global.lbl.contract' />(${cnt10}/${cnt20})</li><!-- 계약 -->
        <li class="color_b"><spring:message code='global.lbl.contractAcpt' />(${cnt21})</li><!-- 계약승인 -->
        <li class="color_p"><spring:message code='global.lbl.assign' />(${cnt30})</li><!-- 배정 -->
        <li class="color_g"><spring:message code='global.lbl.releaseReq' />(${cnt40}/${cnt41})</li><!-- 출고요청 -->
        <li class="color_g2"><spring:message code='global.lbl.custDelivery' />(${cnt50})</li><!-- 고객인도 -->
        <li class="color_o"><spring:message code='global.lbl.contractCancelReq' />(${cnt90}/${cnt91})</li><!-- 계약취소요청 -->
    </ul>


    <div class="kanban_content">
        <ul>
            <li>
                <div id="unit10"></div>
                <div class="bg_gray"><div id="unit20"></div></div>
            </li>
            <li id="unit21"></li>
            <li id="unit30"></li>
            <li>
                <div id="unit40"></div>
                <div class="bg_gray"><div id="unit41"></div></div>
            </li>
            <li id="unit50"></li>
            <li>
                <div id="unit90"></div>
                <div class="bg_gray"><div id="unit91"></div></div>
            </li>
        </ul>
    </div>
</div>



</section>



<!-- script -->
<script>

//판매유형 Array
var contractTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${contractTpList}">
    contractTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [{"saleEmpNm":"", "saleEmpCd":""}];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"${obj.saleEmpNm}", saleEmpCd:"${obj.saleEmpCd}"});
</c:forEach>


$(document).ready(function(){

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

    //조회조건 - 영업사원
    $("#sSaleEmpNo").kendoExtDropDownList({
       dataTextField :"saleEmpNm"
      ,dataValueField:"saleEmpCd"
      ,dataSource:selectSaleEmpDSList
      //,optionLabel:" "  // 전체
    });


    //조회조건 - 판매유형
    $("#sContractTp").kendoExtDropDownList({
      dataTextField:"cmmCdNm",
      dataValueField:"cmmCd",
      dataSource:contractTp
      //,optionLabel:" "  // 전체
    });

    $("#sContractStartDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);
    $("#sContractEndDt").on('change',   {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);



    setPannelList = function(listType,searchUser){

        var params = {sSaleEmpNo:$("#sSaleEmpNo").data("kendoExtDropDownList").value()
                     ,sContractTp:$("#sContractTp").val()
                     ,sContractStartDt:$("#sContractStartDt").data("kendoExtMaskedDatePicker").value()
                     ,sContractEndDt:$("#sContractEndDt").data("kendoExtMaskedDatePicker").value()
                     }


        $.ajax({
            url:"<c:url value='/sal/cnt/contractCondition/selectPannelList.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(data,status,error){
                //globalNotification.show(JSON.parse(data.responseText).error, "error");
            },
            success:function(data){

                var name = "";
                switch(listType){
                        case '10':
                        var content = "";
                        for(i=0;i<data.pannelList.length;i++){
                            if(data.pannelList[i].contractStatCd == '10'){
                                name = dms.string.strNvl(data.pannelList[i].custNm);
                                content += "<div class=\'txt_box\' >";
                                content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 10);\" style='cursor:pointer'>";
                                content += "<span class=\'name\'>";
                                content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                content += "</a>";
                                content += "</div>";
                            }

                        }
                        $("#unit10").html(content);
                        break;
                        case '20':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '20'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    //content += "<div class=\'bg_gray\'>";
                                    content += "<div class=\'txt_box\' >";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 20);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                    //content += "</div>";
                                }
                            }
                            $("#unit20").html(content);
                            break;
                        case '21':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '21'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    content += "<div class=\'txt_box\' >";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 21);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                }

                            }
                            $("#unit21").html(content);
                            break;
                        case '30':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '30'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 30);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                }
                            }
                            $("#unit30").html(content);
                            break;
                        case '40':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '40'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 40);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                }
                            }
                            $("#unit40").html(content);
                            break;
                        case '41':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '41'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    //content += "<div class=\'bg_gray\'>";
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 41);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                    //content += "</div>";
                                }
                            }
                            $("#unit41").html(content);
                            break;
                        case '50':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '50'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 50);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                }
                            }
                            $("#unit50").html(content);
                            break;
                        case '90':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '90'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 90);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                }
                            }
                            $("#unit90").html(content);
                            break;
                        case '91':
                            var content = "";
                            for(i=0;i<data.pannelList.length;i++){
                                if(data.pannelList[i].contractStatCd == '91'){
                                    name = dms.string.strNvl(data.pannelList[i].custNm);
                                    //content += "<div class=\'bg_gray\'>";
                                    content += "<div class=\'txt_box\'>";
                                    content += "<a href=\"javascript:goContractInfo(\'"+data.pannelList[i].contractNo+"\', 91);\" style='cursor:pointer'>";
                                    content += "<span class=\'name\'>";
                                    //content += "<span class=\'name\' onclick=\"goContractInfo(\'"+data.pannelList[i].contractNo+"\', 91); return false;\" style='cursor:pointer'>";
                                    content += "<strong>"+data.pannelList[i].contractNo+" ("+name+")</strong></span>";
                                    content += "<span class=\'car_name\'>"+data.pannelList[i].modelCd+"</span>";
                                    content += "<span class=\'date\'>"+kendo.toString(kendo.parseDate(data.pannelList[i].contractDt),"<dms:configValue code='dateFormat' />")+"</span>";
                                    content += "</a>";
                                    content += "</div>";
                                    //content += "</div>";
                                }
                            }
                            $("#unit91").html(content);
                            break;
                    default:break;
                }
            }
        });

    }

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if( ($("#sContractStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sContractEndDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sContractEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sContractStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                  //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
              }

            searchData();
        }
    });

    searchData();


});


function searchData(){
    setPannelList('10','');
    setPannelList('20','');
    setPannelList('21','');
    setPannelList('30','');
    setPannelList('40','');
    setPannelList('41','');
    setPannelList('50','');
    setPannelList('90','');
    setPannelList('91','');
}




function goContractInfo(contractNo, type){
    var sType = -1;

    if(dms.string.strNvl(contractNo) == ""){
        // 계약번호을(를) 확인하여 주세요.
        dms.notification.warning("<spring:message code='global.lbl.contractNo' var='globalLblContractNo' /><spring:message code='global.info.confirmMsgParam' arguments='${globalLblContractNo}' />");
        return false;
    }

    // 계약번호로 type을 재조회하여 이동하도록 변경.
    $.ajax({
         url:"<c:url value='/sal/cnt/contractCondition/selectPannelList.do' />"
        ,data:JSON.stringify({"sContractNo":contractNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(data,status,error){
            //계약번호을(를) 확인하여 주세요.
            dms.notification.error("<spring:message code='global.lbl.contractNo' var='globalLblContractNo' /><spring:message code='global.info.confirmMsgParam' arguments='${globalLblContractNo}' />");
            return false;
        }
        ,success:function(data){
            sType = Number(data.pannelList[0].contractStatCd);  // 계약상태 코드
        }
    });

    switch(sType){
        case 10:
        case 20:
        case 90:
        case 91:
            // 계약품의관리
            //window.open("<c:url value='/sal/cnt/contract/selectContractMain.do'/>?orderNo="+contractNo, "_self");
            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contReqMgmt' />","<c:url value='/sal/cnt/contract/selectContractMain.do'/>?orderNo="+contractNo);
            break;
        case 21:
            // 배정화면
            //window.open("<c:url value='/sal/ass/vehicleAssign/selectAssignMngMain.do'/>?contNo="+contractNo, "_self");
            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.vehicleAssignMgmt' />","<c:url value='/sal/ass/vehicleAssign/selectAssignMngMain.do'/>?contNo="+contractNo);
            break;
        case 30:
            // 출고요청
            //window.open("<c:url value='/sal/ctm/deliveryAsk/selectDeliveryAskMain.do'/>?contNo="+contractNo, "_self");
            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.deliveryReqMgmt' />", "<c:url value='/sal/ctm/deliveryAsk/selectDeliveryAskMain.do'/>?contNo="+contractNo);
            break;
        case 40:
            // 출고확정
            //window.open("<c:url value='/sal/ctm/deliveryFix/selectDeliveryFixMain.do'/>?contNo="+contractNo, "_self");
            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.deliveryConfMgmt' />", "<c:url value='/sal/ctm/deliveryFix/selectDeliveryFixMain.do'/>?contNo="+contractNo);
            break;
        case 41:
        case 50:
            // 고객인도화면으로 이동
            //window.open("<c:url value='/sal/dlv/vehicleDelivery/selectDeliveryMngMain.do'/>?contNo="+contractNo, "_self");
            window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.custDeliveryMgmt' />", "<c:url value='/sal/dlv/vehicleDelivery/selectDeliveryMngMain.do'/>?contNo="+contractNo, "VIEW-D-10404");
            break;
        default:
            break;
    }

}

</script>
<!-- //script -->










