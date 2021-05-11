<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 쿠폰선택 팝업 -->
<section class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="dealerSet" class="btn_s btn_s_min5" ><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
            <button type="button" id="dealerCancel" class="btn_s btn_s_min5" ><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
        </div>
    </div>
    <div class="table_grid mt05">
        <div id="dlrPointGrid" class="grid"></div>
    </div>
    <input type="hidden" id="custNo" name="custNo" >
    <input type="hidden" id="custPayAmt" name="custPayAmt" >
</section>
<!-- //쿠폰선택 팝업 -->

<script type="text/javascript">

    //BM쿠폰용도 Array
    var bmCupnTpList = [];
    <c:forEach var="obj" items="${bmCupnTpList}">
    bmCupnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //BM쿠폰용도  Map
    var bmCupnTpMap = dms.data.arrayToMap(bmCupnTpList, function(obj){ return obj.cmmCd; });

    //BM쿠폰용도
    setBmCupnTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(bmCupnTpMap[value] != undefined)
                resultVal = bmCupnTpMap[value].cmmCdNm;
        }
        return resultVal;
    };
    var gridRow;
    $(document).ready(function() {

        var options = parent.popupWindow.options.content.data;
        if (options.params.custNo != null ){
        //if (options.params.custNo != null && options.params.telNo != ""){
            $("#custNo").val(options.params.custNo);
        }
        if (options.params.custPayAmt!= null ){
            $("#custPayAmt").val(options.params.custPayAmt);
        }

        //딜러포인트 그리드
        $("#dlrPointGrid").kendoExtGrid({
            gridId:"G-CRM-0510-152400"
            ,dataSource:{
                transport:{
                   read:{
                       url:"<c:url value='/sal/acc/itemSales/selectDealerMemberShipInfo.do' />"
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
                       }
                   }
               }
            }
            ,dataBound:function (e) {
                if ( e.sender.dataSource._total > 0 ) {
                    $("#dealerSet").data("kendoButton").enable(true)
                    $("#dealerCancel").data("kendoButton").enable(true)

                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                };
            }
            ,pageable:false
            ,height:150
            ,selectable:"row"
            ,enableTooltip:true               //Tooltip 적용, default:falzse
            ,edit:function(e){
                var fieldName = e.container.find("input").attr("name");
                var fieldName2 = $(e.container.find("input")[1]).attr("name");

                if(fieldName == "membershipNm" ||
                        fieldName == "custNm" ||
                        fieldName == "membershipNo" ||
                        fieldName == "gradeNm" ||
                        fieldName == "lastPointVal" ||
                        fieldName == "dlrUseAmt") {
                    this.closeCell();
                }

                if(fieldName2 == "dlrUseAmt") {
                    this.closeCell();
                }
            }
            ,columns:[
                 {field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:110,attributes:{"class":"ac"}} //멥버십 번호
                ,{field:"custNm", title:"<spring:message code='ser.lbl.dlrMembNm' />", width:100}     // 회원명
                ,{field:"gradeNm", title:"<spring:message code='ser.lbl.membGrade' />", width:60}         // 회원등급
                ,{field:"lastPointVal", title:"<spring:message code='ser.lbl.avlbPoint' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"}   // 이번가용포인트
                ,{field:"lastPointVal", title:"<spring:message code='ser.lbl.savePoint' />", width:75, attributes:{"class":"ar"}, format:"{0:n0}"}   // 누적포인트
                ,{field:"occrPointVal", title:"<spring:message code='ser.lbl.thisUsePoint' />", width:95, attributes:{"class":"ar"} // 이번사용포인트
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            min:0
                            ,decimals:0
                            ,spinners:false
                            ,change:function(e){

                                var grid = $("#dlrPointGrid").data("kendoExtGrid");
                                //var rowData = grid.dataItem("tr:eq(0)");
                                var rowData = grid.dataItem(grid.select());

                                var membershipNo;
                                if(rowData != null){
                                    membershipNo = rowData.membershipNo;
                                    gridRow     = grid.select().index();

                                    var maxPoint = Number("${membershipPointUseMaxPoint}");
                                    var pointExchgScale = Number("${membershipPointExchgMoney}") / Number("${membershipPointExchgPoint}") ;

                                    var custPayAmt = Number($("#custPayAmt").val());
                                    var custUseAmt = (rowData.occrPointVal * Number(pointExchgScale)).toFixed(2);
                                    var custUsePint = (custPayAmt / Number(pointExchgScale)).toFixed(2);
                                    if(custUseAmt > custPayAmt  ){
                                        dms.notification.info("<spring:message code='sal.lbl.custPayAmt' var='custPayAmt'/><spring:message code='ser.info.validation.amt' arguments='${custPayAmt}["+custPayAmt+"]' />");
                                        rowData.set("occrPointVal", custUsePint);
                                        rowData.set("dlrUseAmt", custPayAmt);
                                        this.max(rowData.lastPointVal);
                                    }
                                    if(rowData.occrPointVal > maxPoint){
                                        dms.notification.info("<spring:message code='global.lbl.limitPoint' var='limitPoint'/><spring:message code='ser.info.validation.amt' arguments='${limitPoint}["+maxPoint+"]' />");
                                        rowData.set("occrPointVal", maxPoint);
                                        rowData.set("dlrUseAmt", (maxPoint * Number(pointExchgScale)).toFixed(2));
                                        this.max(rowData.lastPointVal);
                                    } else {
                                        rowData.set("dlrUseAmt", (Number(rowData.occrPointVal) * Number(pointExchgScale)).toFixed(2));
                                        this.max(rowData.lastPointVal);
                                    };
                                }
                                $.each(grid.dataSource.data() , function(idx , obj){

                                    if(obj.membershipNo != membershipNo){
                                    console.log(membershipNo+"/"+obj.membershipNo)
                                        obj.set("occrPointVal","");
                                        obj.set("dlrUseAmt","");
                                    }
                                });
                                grid.refresh();



                            }
                        });
                    }
                }
                ,{field:"dlrUseAmt", title:"<spring:message code='ser.lbl.thisUseAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}      // 이번사용금액
                ,{field:"dlrUsePurpose", title:"<spring:message code='ser.lbl.purposeOfUse' />", width:75
                    ,attributes:{"class":"ac"}
                    ,template:"#=setBmCupnTpMap('03')#"
                }   // 사용용도
                ,{field:"cardNo", hidden:true}
                ,{field:"membershipNo", hidden:true}
                ,{field:"membershipPointUseMaxPoint", hidden:true}
            ]

        });

        // 딜러멤버스 적용
        $("#dealerSet").kendoButton({
            click:function(e) {

                var grid = $("#dlrPointGrid").data("kendoExtGrid");
                var rowData = grid.dataItem(grid.select());

                //var rowData = grid.dataItem("tr:eq(0)");
                if( rowData != null ){
                    var dlrUseAmt = Number(rowData.dlrUseAmt);  // 이번사용금액
                    var dlrUsePurpose = rowData.dlrUsePurpose;  // 사용용도
                    // 가용포인트보다 클수 없다
                    if(rowData.lastPointVal < rowData.occrPointVal){
                        rowData.set("occrPointVal", 0);
                        rowData.set("dlrUseAmt", 0);
                        dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.avlbPoint' var='avlbPoint' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${avlbPoint}' />");
                        return false;
                    } else {


                        if( dms.string.isEmpty(rowData.occrPointVal)){ //{0}할 {1}을(를) 선택하십시오.
                            dms.notification.info("<spring:message code='ser.lbl.thisUse' var='thisUse' /><spring:message code='global.lbl.membershipNo' var='membershipNo' /><spring:message code='global.info.chkselect' arguments='${thisUse}, ${membershipNo}' />");
                        }else{
                            options.callbackFunc(rowData, "Y");
                            parent.popupWindow.close();
                        }
                    };
                }else{
                    dms.notification.info("<spring:message code='global.info.required.select' />");
                    return;
                }
            }
            ,enable:false
        });

        // 딜러멤버스 취소
        $("#dealerCancel").kendoButton({
            click:function(e) {
                var rowData;
                options.callbackFunc(rowData, "N");
                parent.popupWindow.close();
            }
            ,enable:false
        });

    });
</script>