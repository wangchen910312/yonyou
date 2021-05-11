<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 쿠폰선택 팝업 -->
<section class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="dcSet" class="btn_s btn_s_min5" ><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
            <button type="button" id="dcCancel" class="btn_s btn_s_min5" ><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
        </div>
    </div>
    <div class="table_grid mt0">
        <input type="hidden" id="custNo" name="custNo" >
        <div id="dcGrid" class="grid"></div>
    </div>
</section>
<!-- //쿠폰선택 팝업 -->

<script type="text/javascript">

//할인유형
var dcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${dcTpList}">
dcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//할인유형 Map
var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){ return obj.cmmCd; });

//DC 구분
dcTpCdGrid = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(dcTpMap[val] != undefined)
     returnVal = dcTpMap[val].cmmCdNm;
 }
 return returnVal;
};


var custPayAmt = 0;
$(document).ready(function() {

    var options = parent.popupWindow.options.content.data;
    if (options.params.custNo != null ){
        $("#custNo").val(options.params.custNo);
        custPayAmt = options.params.custPayAmt;
    }

    //기타할인 그리드 설정 : 쿠폰할인
    $("#dcGrid").kendoExtGrid({
        gridId:"G-CRM-0510-105600"
        ,dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/sal/acc/itemSales/selectEtcDcTarget.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sCustNo"] = $("#custNo").val();
                       params["sDcUseTp"] = "02";   // 할인사용구분 : CRM052(판매)
                       params["sDcCd"] = "02";      // 할인방식 : CRM051(금액)
                       params["sDcTp"] = "01";      // 금액

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"rnum"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,dcCd:{type:"string"}
                       ,dcTp:{type:"string"}
                       ,dcNm:{type:"string"}
                       ,lbrDcAmt:{type:"number"}
                       ,parDcAmt:{type:"number"}
                       ,subDcAmt:{type:"number"}
                       ,dcApplyStartDt:{type:"date"}
                       ,dcApplyEndDt:{type:"date"}
                       ,dcScoreVal:{type:"string"}
                       ,dcUseYn:{type:"string"}
                       ,totCnt:{type:"number"}
                       ,useCnt:{type:"number"}
                   }
               }
           }
        }
        ,dataBound:function (e) {

            if ( e.sender.dataSource._total > 0 ) {
                $("#dcSet").data("kendoButton").enable(true)
               // $("#dcCancel").data("kendoButton").enable(true)
            };

        }
        ,height:95
        ,width:800
        ,selectable:"row"
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,scrollable:true
        ,pageable:false
        ,sortable:false
        ,editable:false
        ,autoBind:true
        ,columns:[
            {field:"dcCd", title:"<spring:message code='ser.lbl.custDcCd' />", width:100}  //할인코드
            ,{field:"dcNm", title:"<spring:message code='ser.lbl.custDcNm' />", width:189}  //할인명
            ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.custDcStartDt' />", width:90, attributes:{"class":"ar"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }      // 할인시작일자
            ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.custDcEndDt' />", width:90, attributes:{"class":"ar"}
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }   // 할인마감일자
            ,{field:"dcTp", title:"<spring:message code='ser.lbl.custDcTp' />", width:90, attributes:{"class":"ac"} //할인적용방식
                 ,template:"#=dcTpCdGrid(dcTp)#"
            }
            ,{field:"subDcAmt", title:"<spring:message code='ser.lbl.dc' />", width:90
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }   // 할인
            ,{field:"dcDstinCd", title:"<spring:message code='ser.lbl.dcDstinTp' />", width:90, attributes:{"class":"ac"}, hidden:true}  //할인유형(딜러(特约店) 디폴트) ser.lbl.dealer
        ]
    });

    // 기타할인 적용
    $("#dcSet").kendoButton({
        click:function(e) {
            // TODO 용품판매정보 쿠폰 번호, 금액 dataSet
            var grid = $("#dcGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(rowData != null){
                if(rowData.dcPermTp == "02" && (rowData.totCnt - rowData.useCnt) <= 0){
                    dms.notification.info("<spring:message code='ser.info.dcCntNotUse'/>");
                    return false;
                }
                // 할인은 금액만 사용가능.
                if(rowData.subDcAmt > 0){
                    if( rowData.subDcAmt > custPayAmt ){
                        dms.notification.info("<spring:message code='sal.lbl.custPayAmt' var='custPayAmt'/><spring:message code='ser.info.validation.amt' arguments='${custPayAmt}["+custPayAmt+"]' />");
                        return;
                    }
                    options.callbackFunc(rowData, "Y");
                    parent.popupWindow.close();
                }  
            }
        }
        ,enable:false
    });

    // 기타할인 취소
    $("#dcCancel").kendoButton({
        click:function(e) {

            // TODO 용품판매정보 쿠폰 번호, 금액 dataSet 취소
            /**
            *   확인사항 : 용품판매정보 팝업 > 쿠폰 정보는 초기화??
            *   1. 사용한 쿠폰이 되돌아옴
            *   2. 쿠폰 사용이 완료된경우 사용한 쿠폰만 나타남
            *   3. 취소 후 사용 가능한 쿠폰목록이 나타남.
            */
            var rowData;
            options.callbackFunc(rowData, "N");
            parent.popupWindow.close();
        }
        //,enable:false
    });

    console.log("search Popup Option ##########");
    console.log(options.autoBind);

});
</script>