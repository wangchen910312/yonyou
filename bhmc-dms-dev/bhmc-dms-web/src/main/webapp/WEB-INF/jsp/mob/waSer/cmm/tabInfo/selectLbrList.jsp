<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비항목 -->
<div>
    <div class="table_grid">
        <div id="lbrGrid" class="grid"></div>
    </div>
</div>
<!-- //정비항목 -->

<script type="text/javascript">

var lbrPreFixId;
var lbrDocNo;
var lbrGridId;
var laborSearchPopup;

var preFixId = "RE";

if(preFixId == "RE") {
    lbrGridId = "G-SER-0720-154003";
} else if(preFixId == "RO") {
    lbrGridId = "G-SER-0722-154101"
} else if(preFixId == "CA") {
    lbrGridId = "G-SER-0801-154001";
} else if(preFixId == "ET") {
    lbrGridId = "G-SER-0803-160501";
} else if(preFixId == "PRC") {
    lbrGridId = "G-SER-0722-154001";
} else if(preFixId == "RES") {
    lbrGridId = "G-SER-0721-120201";
}

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});



//공통코드:정비유형(수리유형)
var lbrTpCdList = [];
<c:forEach var="obj" items="${lbrTpCdList}">
lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});

//공통코드:구원유형
var rescueTpCdList = [];
<c:forEach var="obj" items="${rescueTpCdList}">
rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var rescueTpCdArr = dms.data.arrayToMap(rescueTpCdList, function(obj){return obj.cmmCd});

//구원유형(수리유형)
rescueTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rescueTpCdArr[val] != undefined)
        returnVal = rescueTpCdArr[val].cmmCdNm;
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

// 정비유형(수리유형)
lbrTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(lbrTpCdArr[val] != undefined)
        returnVal = lbrTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}

//공통코드:임률정보
var rateList = [];
<c:forEach var ="obj" items="${rateDs}">
  rateList.push({
        rpirTp:"${obj.rpirTp}"
        , rpir01:"${obj.gnlRteRate}"
        , rpir02:"${obj.wartRteRate}"
        , rpir03:"${obj.incRteRate}"
        , rpir04:"${obj.intRteRate}"
        , rpir05:"${obj.rwrkRteRate}"
    });
</c:forEach>

$(document).ready(function(){

    lbrPreFixId = "RE";
    lbrDocNo = $("#resvDocNo").val();
    
    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:lbrGridId
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sPreFixId"] = lbrPreFixId;
                        params["sDocNo"] = lbrDocNo;

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
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,paymTp:{type:"string"}
                        ,paymUsrNm:{type:"string"}
                        ,pkgItemCd:{type:"string", editable:false}
                        ,lbrTp:{type:"string"}
                        ,lbrPrc:{type:"number"}
                        ,lbrHm:{type:"number", editable:false}
                        ,lbrQty:{type:"number"}
                        ,lbrTotAmt:{type:"number"}
                        ,dstbHm:{type:"number", editable:false}
                    }
                }
            }
        }
        ,height:166
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,resizable:false
        //,appendEmptyColumn:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,editable:false
        ,dataBound:function(e){
            if(preFixId == "CA"){
                if(dms.string.strNvl($("#calcDocNo").val()) == "") {
                    var data = getLbrData();
                    $.each(data, function(i, v){
                        changePermTp(data[i], "lbr");
                    });
                }
            }
        }
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        
        ,columns:[
             {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200}// 공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,template:"#=lbrTpCdGrid(lbrTp)#"
            } // 공임유형
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:100
                ,attributes:{"class":"ar"}
            } // 정비공임
            ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}// 배분공임
            ,{field:"lbrPrc", title:"<spring:message code='global.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="lbrPrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000
                        ,decimals:0
                        ,spinners:false
                    });
                }
            }// 공임단가
            ,{field:"", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100}       // 공임금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100}        // 할인율
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                , editor:function(container, options){
                     $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n0"                // n0:###,###, n2:###,###.##
                        ,decimals:0                // 소숫점
                        ,min:1
                        ,value:0
                        ,spinners:false
                 });
                 $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
              }
            }// 정비수량
            /*
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000
                        ,spinners:false
                    });
                }
            } // 할인금액
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", width:100, attributes:{"class":"ar"}
                ,template:function(data){
                    var lbrTotAmt = 0;
                    if(data.lbrTotAmt != null){
                        lbrTotAmt = data.lbrTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(lbrTotAmt);
                }
            }  // 예상공임비
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
            ,{field:"", title:"<spring:message code='ser.lbl.payerCd' />", width:100}         // 결제자번호
            ,{field:"", title:"检查代码", width:100}// 점검코드
            ,{field:"", title:"<spring:message code='ser.lbl.custReqCd' />", width:100}// 의견번호
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="phenCd" data-name="<spring:message code='ser.lbl.phenCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="phenCd"></span>')
                    .appendTo(container);
                 }
            }    //현상코드
            ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="cauCd" data-name="<spring:message code='ser.lbl.cauCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="cauCd"></span>')
                    .appendTo(container);
                 }
            }      //원인코드
            ,{field:"", title:"<spring:message code='ser.lbl.tecNm' />", width:100}// 테크니션
            ,{field:"", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100}// 정비소조
            ,{field:"", title:"<spring:message code='ser.lbl.bayNm' />", width:100}// BAY
            ,{field:"", title:"<spring:message code='ser.lbl.rpipHmDegree' />", width:100}// 공임계수
            ,{field:"", title:"<spring:message code='ser.lbl.difcDegree' />", width:100}// 난의도계수
            ,{field:"", title:"维修件数", width:100}// 정비건수
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}// 패키지코드
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
            ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:100, hidden:true}    //현상코드명
            ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:100, hidden:true}      //원인코드명
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100 , hidden:true
                ,template:"#=roTpCdGrid(roTp)#"
                ,editor:function(container, options){
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:roTpCdList
                    });
                }
            }   // RO유형
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payerNm' />", width:100, hidden:true}// 결제자
            ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100, attributes:{"class":"ar"} , hidden:true}          // 배분시간
            ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:100, hidden:true}                                   // 지불사
            ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:100, hidden:true}                                 // 비고
            */
        ]
    });



    lbrInfo = function(docNo, preFixId) {
        lbrPreFixId = preFixId;
        lbrDocNo = docNo;
        $("#lbrGrid").data("kendoExtGrid").dataSource.read();
    }

    getLbrData = function() {
        var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
        var lbrSaveData = lbrGrid.dataSource.data();

        return lbrSaveData;
    }
    
    
  //캠페인유형
    crTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = crTpMap[val].cmmCdNm;
        }
        return returnVal;
    }
  
});

</script>