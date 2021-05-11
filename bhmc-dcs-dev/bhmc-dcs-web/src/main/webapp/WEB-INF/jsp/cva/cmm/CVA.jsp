<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDcptRptMain.jsp
    Description:고객전체현황
    author Yoon Se Ran
    since selectCustomerTotalStatus.jsp
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 11. 27   Yoon Se Ran              최초 생성
--%>

<form method="post" name="frmMainStatus" id="frmMainStatus">
<div class="header_area">
    <h1 class="title_basic"><spring:message code="crm.menu.customerTotalStatus" /></h1><!--고객전체현황 -->
    <div class="btn_right">
        <button type="button" class="btn_s" id="btnTargetDcptRptSearch" name="btnTargetDcptRptSearch"><spring:message code="global.btn.search" /></button>
    </div>
</div>
<br>
<div class="table_form" role="search" data-btnid="btnSearch">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:11%;">
            <col style="width:12%;">
            <col style="width:11%;">
            <col style="width:12%;">
            <col style="width:11%;">
            <col style="width:12%;">
            <col style="width:11%;">
            <col>

        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code="global.lbl.division" /><!-- 사업부 --></th>
                <td>
                    <input id="sDiviCd" class="form_comboBox" style="width:100%" />
                </td>
                <th scope="row"><spring:message code="crm.lbl.officeNm" /><!-- 사무소 --></th>
                <td>
                    <input id="sOffCd" class="form_comboBox" style="width:100%" />
                </td>
                <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                <td>
                    <input id="sSungCd" class="form_comboBox" style="width:100%" />
                </td>
                <th scope="row"><spring:message code="global.lbl.glYear" /><!-- 출고년도 --></th>
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input id="sStartYr" class="form_comboBox">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sFinishYr" class="form_comboBox">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="global.lbl.dealer" /><!-- 딜러 --></th>
                <td>
                    <input id="sDlrCd" class="form_comboBox" style="width:100%" />
                </td>
                <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                <td>
                    <input id="sCarlineCd" class="form_comboBox" style="width:100%" />
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table_info table_info_v1">
<iframe id="iframeCustomerTotalStatusRptMain" name="iframeCustomerTotalStatusRptMain" src="" frameborder="0" scrolling="no" width="100%" height="1150"></iframe>
</div>
</form>


<script type="text/javascript">

var sDiviCdDropDownList;
var sOffCdDropDownList;
var sSungCdDropDownList;
var sDlrCdDropDownList;


/************* 사업부 SELECT BOX  *******************/
var divisionCdDs = [];
<c:forEach var="obj" items="${sdptCdList}">
divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
</c:forEach>
//var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd});

 /************* 출고년도 SELECT BOX  *******************/
 var yearInfo = [];
 <c:forEach var="obj" items="${yearInfo}">
 yearInfo.push({"yearCd":"${obj.yearCd}", "yearNm":"${obj.yearNm}"});
 </c:forEach>


$(document).ready(function() {
    //사업부
    sDiviCdDropDownList = $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
//            $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
//            $("#sOffCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.diviCd == ""){
               sOffCdDropDownList.setDataSource([]);
               sSungCdDropDownList.setDataSource([]);
               sDlrCdDropDownList.setDataSource([]);
               sOffCdDropDownList.enable(false);
               sSungCdDropDownList.enable(false);
               sDlrCdDropDownList.enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });

           sOffCdDropDownList.setDataSource(responseJson.data);
           sSungCdDropDownList.setDataSource([]);
           sDlrCdDropDownList.setDataSource([]);
           sOffCdDropDownList.enable(true);
           sSungCdDropDownList.enable(false);
           sDlrCdDropDownList.enable(false);
       }
    }).data("kendoExtDropDownList");

    // 사무소
    sOffCdDropDownList = $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
//            $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
//            $("#sSungCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.offCd == ""){
               sSungCdDropDownList.setDataSource([]);
               sDlrCdDropDownList.setDataSource([]);
               sSungCdDropDownList.enable(false);
               sDlrCdDropDownList.enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerSung.do' />"
               ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd})
               ,async:false
           });

           sSungCdDropDownList.setDataSource(responseJson.data);
           sSungCdDropDownList.enable(true);
           sDlrCdDropDownList.setDataSource([]);
           sDlrCdDropDownList.enable(false);
       }
       ,optionLabel:" "   // 전체
    }).data("kendoExtDropDownList");
    sOffCdDropDownList.enable(false)

    //성
    sSungCdDropDownList = $("#sSungCd").kendoExtDropDownList({
        dataTextField:"saleDlrSungNm"
        ,dataValueField:"saleDlrSungCd"
        ,optionLabel:" "    // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            if(dataItem.saleDlrSungCd == ""){
               sDlrCdDropDownList.setDataSource([]);
               sDlrCdDropDownList.enable(false);
               return false;
           }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/cva/cmm/selectCvaDealer.do' />"
                ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value(),"sSaleDlrSungCd":dataItem.saleDlrSungCd})
                ,async:false
            });

            sDlrCdDropDownList.setDataSource(responseJson.data);
            sDlrCdDropDownList.enable(true);
        }
    }).data("kendoExtDropDownList");
    sSungCdDropDownList.enable(false);

    //딜러
    sDlrCdDropDownList = $("#sDlrCd").kendoExtDropDownList({
        dataTextField:"dlrNm"
        ,dataValueField:"dlrCd"
        ,optionLabel:" "   // 전체
    }).data("kendoExtDropDownList");
    sDlrCdDropDownList.enable(false);

    //출고년도(Start)
     $("#sStartYr").kendoExtDropDownList({
         dataTextField:"yearNm"
         , dataValueField:"yearCd"
         , dataSource:yearInfo
     });


    //출고년도(Finish)
     $("#sFinishYr").kendoExtDropDownList({
        dataTextField:"yearNm"
        , dataValueField:"yearCd"
        , dataSource:yearInfo
     });

// 차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

     //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체


    });
});

    $("#btnTargetDcptRptSearch").kendoButton({
        click:function(e) {

            var sDiviCd       = $("#sDiviCd").val();
            var sOffCd        = $("#sOffCd").val();
            var sSungCd       = $("#sSungCd").val();
            var sStartYr      = $("#sStartYr").val();
            var sFinishYr     = $("#sFinishYr").val();
            var sDlrCd        = $("#sDlrCd").val();
            var sCarlineCd    = $("#sCarlineCd").val();
            var mainStatusUrl = "<c:url value='/ReportServer?reportlet=cva/SCR_0001.cpt'/>";
            $("#iframeCustomerTotalStatusRptMain").attr("src", mainStatusUrl);
        }
    });
</script>
