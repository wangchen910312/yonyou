<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 부품 -->
<div>
    <div class="table_grid">
       <div id="partGrid" class="grid"></div>
    </div>
</div>
<!-- //부품 -->

<script type="text/javascript">


var partPreFixId;
var partDocNo;
var partGridId;

var selectShareStockGiItemPopupWindow;
var itemSalePrcPopupWindow;
var workPackagePopup;

preFixId = "RE";

if(preFixId == "RE") {
    partGridId = "G-SER-0720-154002";
} else if(preFixId == "RO") {
    partGridId = "G-SER-0722-154102";
} else if(preFixId == "PRE") {
    partGridId = "G-SER-0803-161001";
} else if(preFixId == "CA") {
    partGridId = "G-SER-0801-154002";
} else if(preFixId == "ET") {
    partGridId = "G-SER-0803-160502";
} else if(preFixId == "PRC") {
    partGridId = "G-SER-0722-154002";
} else if(preFixId == "RES") {
    partGridId = "G-SER-0803-160801";
}

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

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
        returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}

$(document).ready(function(){


    // 부품 그리드
    $("#partGrid").kendoExtGrid({
        gridId:partGridId
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = partPreFixId;
                        params["sDocNo"] = partDocNo;

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
                        ,itemPrc:{type:"number", editable:false}
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,paymTp:{type:"string"}
                        ,pkgItemCd:{type:"string", editable:false}
                        ,itemTotAmt:{type:"number"}
                        ,calcUnitCd:{type:"string", editable:false}
                        ,itemQty:{type:"number"}
                        ,comItemPrc:{type:"number"}
                        ,giQty:{type:"number"}
                        ,reqQty:{type:"number"}
                    }
                }
            }
        }
        ,height:166
        ,pageable:false
        ,autoBind:false
        ,resizable:false
        ,sortable:false
        //,appendEmptyColumn:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,editable:false
        ,dataBound:function(e){
            if(preFixId == "CA"){
                if(dms.string.strNvl($("#calcDocNo").val()) == "") {
                    var data = getPartData();
                    $.each(data, function(i, v){
                        changePermTp(data[i], "par");
                    });
                }
            }
        }
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        
        ,columns:[
             {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100} // 부품번호
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:170} // 부품명
            ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:70}  // 계산단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }// 부품수량
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000000
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }// 부품단가
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParAmt' />", width:90, attributes:{"class":"ar"}
                ,template:function(data){
                    var itemTotAmt = 0;
                    if(data.itemTotAmt != null){
                        itemTotAmt = data.itemTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(itemTotAmt);
                }
            }  // 예정부품대
            ,{field:"reqQty", title:"<spring:message code='ser.lbl.reqQty' />", width:70, attributes:{"class":"ar"}}    // 요청수량
            ,{field:"giQty", title:"<spring:message code='ser.lbl.giQty' />", width:70, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,decimal:0
                ,template:function(data){
                    var giQty = 0;
                    if(data.giQty != null){
                        giQty = data.giQty;
                    }
                    return giQty;
                }
            }    // 출고수량
            
            /*
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100}    // 캠페인번호
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100}    // 캠페인명
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 }
            }   // 캠페인유형
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:70 , hidden:true
                ,template:"#=roTpCdGrid(roTp)#"
                ,editor:function(container, options){
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:roTpCdList
                        ,optionLabel:"<spring:message code='global.btn.select' />"
                        ,index:0
                    });
                }
            }   // RO유형
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}  // 패키지코드
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                    });
                }
            }// 결제유형
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payerNm' />", width:100, hidden:true}        // 결제자
            ,{field:"comItemNm", title:"<spring:message code='ser.lbl.comItemNm' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="comItemNm" data-name="<spring:message code='ser.lbl.bayNo'/>" class="form_input" readonly="true" /><a href="#" onclick="comItemAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="comItemNm"></span>')
                    .appendTo(container);
                 }
            }      // 부품대체수령
            ,{field:"comItemPrc", title:"<spring:message code='ser.lbl.comItemPrc' />", width:100, attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000000
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }    // 부품대체차액
            ,{field:"", title:"<spring:message code='ser.lbl.itemAmt' />", width:100}//부품금액
            ,{field:"", title:"<spring:message code='ser.lbl.dcRate' />", width:100}//할인율
            ,{field:"", title:"<spring:message code='ser.lbl.dcAmt' />", width:100}//할인금액
            ,{field:"", title:"<spring:message code='ser.lbl.payerCd' />", width:100}// 결제자번호
            ,{field:"", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 정비코드
            ,{field:"", title:"<spring:message code='ser.lbl.OldItemHandTp' />", width:100}// 고품처리
            ,{field:"", title:"<spring:message code='ser.lbl.stockStat' />", width:100}// 재고상태
            ,{field:"", title:"可用数量 ", width:100}// 가용수량
            ,{field:"", title:"预留数量", width:100}// 미리남겨두는 수량
            ,{field:"", title:"发件者", width:100}// 발송자
            ,{field:"", title:"领用状态 ", width:100}// 수령상태
            ,{field:"", title:"领用者", width:100}// 수령자
            ,{field:"", title:"领用时间 ", width:100}// 수령시간
            ,{field:"", title:"领用号码 ", width:100}// 수령번호
            ,{field:"calcUnitNm", hidden:true}  // 계산단위명
            ,{field:"grStrgeCd", hidden:true}   // 입고창고코드
            ,{field:"giStrgeCd", hidden:true}   // 출고창고코드
            ,{field:"comItemCd", hidden:true}   // 대체품목코드
            ,{field:"giTp", title:"<spring:message code='global.lbl.giTp' />", width:100, hidden:true} // 출고유형
            ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:70, hidden:true} // 지불사
            ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:100, hidden:true} // 예약비고
            */
        ]
    });


    partInfo = function(docNo, preFixId) {
        partPreFixId = preFixId;
        partDocNo = docNo;
        $("#partGrid").data("kendoExtGrid").dataSource.read();
    }

    getPartData = function(){
        var partGrid = $("#partGrid").data("kendoExtGrid");
        var partSaveData = partGrid.dataSource.data();

        return partSaveData;
    }

    chkPartExtStatus = function() {

        var status = true;
        $.each(getPartData(), function(index, item) {
            if(Number(this.giQty) > 0){
                status = false;
                return false;
            }
        })

        return status;
    }
});

</script>