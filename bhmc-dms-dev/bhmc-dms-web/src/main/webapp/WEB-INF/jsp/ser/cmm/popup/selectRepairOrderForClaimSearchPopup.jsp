<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <input type="hidden" id="roDocNo" name="roDocNo">
    <input type="hidden" id="calcDocNo" name="calcDocNo">
    <input type="hidden" id="close" name="close" />
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="global.btn.searchCondition" /><!-- 조회조건 --></h1> --%>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <%-- <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> --%>
        </div>
    </div>

    <form id="roHistoryForm">
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                <col style="width:16%;">
                <col style="width:24%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.roDocNo' /></span></th><!-- VIN -->
                    <td class="readonly_area" >
                        <input type="text" id="sRoDocNo" name="sRoDocNo" readonly class="form_input upper" data-name="<spring:message code="ser.lbl.roDocNo" />" required />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
            </table>
        </div>
        <input type="hidden" id="sDlrCd" name="sDlrCd" />
        <input type="hidden" id="sLtsModelCd" name="sLtsModelCd" />
        <input type="hidden" id="sClaimDt" name="sClaimDt" />
    </form>
        <div id="tabstrip1" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.lbr" /><!-- 공임 --></li>
                <li><spring:message code="ser.lbl.item" /><!-- 부품 --></li>
                <li><spring:message code="ser.lbl.npnPart" /><!-- NPN 부품 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 공임 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- //공임 -->

            <!-- 부품 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부품 -->
            <!-- NPN 부품 -->
            <div style="min-height:205px;">
                <div class="table_grid">
                    <div id="npnGrid" class="grid"></div>
                </div>
            </div>
            <!-- //NPN 부품 -->

        </div>
</section>

<script type="text/javascript">

var rolbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoLabour.do' />";
var roPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoPart.do' />";

var roGoodWilllbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoGoodWillLabour.do' />";
var roGoodWillPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoGoodWillPart.do' />";

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

//공통코드:결제유형
var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});


//공통코드:정비유형(수리유형)
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

setLbrTpMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(lbrTpCdArr[value] != undefined)
        resultVal =  lbrTpCdArr[value].cmmCdNm;
    }
    return resultVal;
};

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
            returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

setKendoDate = function( dtValue){
    return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
};

$(document).ready(function() {

    $("#tabstrip1").kendoExtTabStrip({
        animation:false
    });

    /**
     * 팝업 옵션
     */
     var options = parent.repairOrderNotUsedSearchPopup.options.content.data;

     $("#sRoDocNo").val(options.roDocNo);
     $("#sLtsModelCd").val(options.ltsModelCd);
     $("#sClaimDt").val(setKendoDate(options.claimDt));
     $("#close").val( (options.close == undefined || options.close == "") ? "N":options.close  );


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
            $("#partGrid").data("kendoExtGrid").dataSource.data([]);

            $("#lbrGrid").data("kendoExtGrid").dataSource.transport.options.read.url = rolbrUrl;
            $("#partGrid").data("kendoExtGrid").dataSource.transport.options.read.url = roPartUrl;

            /*
            if(options.claimTp == "G"){
                $("#lbrGrid").data("kendoExtGrid").dataSource.transport.options.read.url = roGoodWilllbrUrl;
                $("#partGrid").data("kendoExtGrid").dataSource.transport.options.read.url = roGoodWillPartUrl;
            }else{
                $("#lbrGrid").data("kendoExtGrid").dataSource.transport.options.read.url = rolbrUrl;
                $("#partGrid").data("kendoExtGrid").dataSource.transport.options.read.url = roPartUrl;
            } */

            $("#lbrGrid").data("kendoExtGrid").dataSource.read();
            $("#partGrid").data("kendoExtGrid").dataSource.read();
        }
    });


   $("#lbrGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#lbrGrid").data("kendoExtGrid");
      // var rows = grid.select();

       selectedGridData(grid,"LBR");
   });

   $("#partGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#partGrid").data("kendoExtGrid");
       //var rows = grid.select();
       selectedGridData(grid,"PART");
   });

   $("#npnGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#npnGrid").data("kendoExtGrid");
       //var rows = grid.select();
       selectedGridData(grid,"NPN");
   });

   //Grid Data Save
   selectedGridData = function(grid,bizId){

       var rows = grid.select();

       if(rows != null){

          if(bizId == "NPN"){

            if(dms.string.strNvl(options.claimTp) == ""){
                dms.notification.warning("<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
                        "<spring:message code='global.info.check.field' arguments='${claimTp}' />");
              return;
            }else if(options.claimTp != "W" && options.claimTp != "S"){
                dms.notification.warning("<spring:message code='ser.info.notSelNpnPart'  />");
              return;
            }

          }
          var data = [];

          $.each( rows  , function(idx , obj){
              if(bizId == "NPN"){
                  data.push({
                       itemCd     : grid.dataItem(obj).npnpPartNo
                      ,itemNm     : grid.dataItem(obj).npnpPartNm
                      ,itemQty    : grid.dataItem(obj).npnpMaxPerQty
                      ,saleUnitCd : "EA"
                      ,itemPrc    : grid.dataItem(obj).npnpMaxUnitAmt
                      ,itemAmt    : grid.dataItem(obj).npnpMaxUnitAmt
                      ,cauItemYn  : ""
                      ,npnpYn     : grid.dataItem(obj).npnpYn
                      ,npnpMaxAmt : grid.dataItem(obj).npnpMaxPerAmt
                  })
              }else{
                  data.push(grid.dataItem(obj));
              }
          });

          options.callbackFunc(data,bizId);

          // if($("#close").val() == "Y")parent.repairOrderNotUsedSearchPopup.close();

       }

   };


    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:"G-SER-1011-000026"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForRoLabour.do' />"
                    //url:null
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sLtsModelCd"] = $("#sLtsModelCd").val();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string", editable:false}
                        ,lbrCd:{type:"string", editable:false}
                        ,lbrNm:{type:"string", editable:false}
                        ,lbrPrc:{type:"number"}
                        ,lbrAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:true
        ,editable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,columns:[
             {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80}                              // 정비코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250}                             // 정비항목
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:60, attributes:{"class":"ar"}}   // 정비공임
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:60, attributes:{"class":"ar"} ,format:"{0:n0}" }// 정비수량
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}      // 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}  // 예정공임비
            ,{field:"relCauLbrYn", hidden : true}
            ,{field:"dstinCd", hidden : true}
            ,{field:"lbrTp", hidden : true}
        ]
    });

    // 부품 그리드
    $("#partGrid").kendoExtGrid({
        gridId:"G-SER-1011-000027"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForRoPart.do' />"
                    //url:null
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sRoDocNo"]   = $("#sRoDocNo").val();
                        params["sClaimDt"]   = kendo.parseDate( $("#sClaimDt").val());
                        params["sNpnPartYn"] = "Y";

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false, validation:{required:true}}
                        ,itemQty:{type:"number"}
                        ,itemPrc:{type:"number", editable:false}
                        ,itemAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:true
        ,editable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:250}                                // 부품명
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
            ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80, attributes:{"class":"ac"}}                             // 계산단위
            ,{field:"giTp", title:"<spring:message code='ser.lbl.giTp' />", width:80}                                 // 출고유형
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}  // 부품단가
            ,{field:"itemAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}                     // 예정부품대
            ,{field:"npnpYn" , hidden:true}                     // NPN YN
        ]
    });

    // NPN 부품 그리드
    $("#npnGrid").kendoExtGrid({
        gridId:"G-SER-0222-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectNpnParts.do' />"
                    //url:null
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sClaimDt"]   = kendo.parseDate( $("#sClaimDt").val());

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         npnpPartNo:{type:"string", editable:false}
                        ,npnpPartNm:{type:"string", editable:false, validation:{required:true}}
                        ,npnpMaxPerQty:{type:"number"}
                        ,npnpMaxUnitAmt:{type:"number", editable:false}
                        ,npnpMaxPerAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:true
        ,editable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:false
        ,columns:[
             {field:"npnpPartNo", title:"<spring:message code='ser.lbl.itemCd' />", width:100}                                 // 부품번호
            ,{field:"npnpPartNm", title:"<spring:message code='ser.lbl.itemNm' />", width:250}                                // 부품명
            ,{field:"npnpMaxPerQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}}    // 부품수량
            ,{field:"npnpMaxUnitAmt", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:80, attributes:{"class":"ar"} ,format:"{0:n2}"}  // 부품단가
            ,{field:"npnpMaxPerAmt" , hidden:true}                     // NPN MAX AMT
            ,{field:"npnpYn" , hidden:true}                     // NPN YN
        ]
    });

    //var onlyNumAlpha = new RegExp("[^A-Z0-9]");
    $(".upper").bind("keyup", function(){
        $(this).val($(this).val().toUpperCase());
    });

    //$("#btnSearch").click();

});
$(".btn_right_absolute").hide();
$(".form_search a").hide();
</script>

<style>
.uppercase
 {
  text-transform:uppercase;
 }
 </style>