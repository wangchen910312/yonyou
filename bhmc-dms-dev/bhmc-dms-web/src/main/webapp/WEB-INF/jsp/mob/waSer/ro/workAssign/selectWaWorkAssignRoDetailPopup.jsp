<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/mob/mobCommon.js"/>"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <!-- RO 상세조회 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m" id="btnConfirm"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <input id="driverNm" type="text"  readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <input id="carRegNo" type="text"  readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.repairStat" /><!-- 수리상태 --></th>
                        <td>
                            <input id="roStatCdNm" type="text"  readonly class="form_input form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /> <!-- RO번호 --></th>
                        <td>
                            <input id="roDocNo" type="text"  readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roDt" /> <!-- RO일자 --></th>
                        <td>
                            <input id="roDt" type="text"  readonly class="form_input form_readonly" >
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.roTp" /> <!-- RO유형 --></th>
                        <td>
                            <input id="roTpNm" type="text"  readonly class="form_input form_readonly">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.lbrOperInfo" /><!-- 작업정보 --></h2>
        </div>
        <div class="table_grid">
            <div id="workAssignGrid"></div>
        </div>

    </section>

<script>

//배정상태 Array
var allocStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${allocStatCdList}">
allocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 배정상태 Map
var allocStatCdMap = dms.data.arrayToMap(allocStatCdList, function(obj){ return obj.cmmCd; });

//배정상태
allocStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(allocStatCdMap[val] != undefined)
        returnVal = allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
}


$(document).ready(function() {

    var options = parent.detailPop.options.content.data;
    $("#roDocNo").val(options.roDocNo);
    $("#driverNm").val(options.driverNm);
    $("#carRegNo").val(options.carRegNo);
    $("#roStatCdNm").val(options.roStatCdNm);
    $("#roDt").val(options.roDt);
    $("#roTpNm").val(options.roTpNm);

    $("#btnConfirm").click(function(){
        parent.detailPop.close();
    });

    //그리드 설정
    $("#workAssignGrid").kendoExtGrid({
        gridId:"G-SER-0519-173718"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sRoDocNo"] = $("#roDocNo").val();
                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"lineNo"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                        ,lineNo:{type:"string"}
                        ,bayNo:{type:"string"}
                        ,bayNm:{type:"string"}
                        ,rpirCd:{type:"string", editable:false}
                        ,rpirNm:{type:"string", editable:false}
                        ,rpirDstinCd:{type:"string", editable:false}
                        ,wrkStatCd:{type:"string"}
                        ,qtTestCd:{type:"string", editable:true }
                        ,realTecId:{type:"string"}
                        ,realTecNm:{type:"string"}
                        ,wkgrpNo:{type:"string"}
                        ,wkgrpNm:{type:"string"}
                        ,wrkStartDt:{type:"date"}
                        ,allocStartDt:{type:"date"}
                        ,allocEndDt:{type:"date"}
                        ,wrkEndDt:{type:"date", validation:{required:true}}
                        ,planHm:{type:"number", editable:false}
                        ,shtCnt:{type:"number", editable:false}
                        ,paintCnt:{type:"number", editable:false}
                        ,diffVal:{type:"number", editable:false}
                        ,lbrCnt:{type:"number", editable:false}
                    }
                }
            }
        }
        ,change:function(e){
        }
        ,height:150
        ,dataBound:function(e) {
            var dataItem = e.sender.dataSource._data;
            var tecNms = [];
            var bays = [];
            var wkgrps = [];
            var sAllocHms = [];
            var vwrkStartDts = [];
            var vwrkEndDts = [];
            $.each(dataItem,function(i,v){
                if($.inArray(v.realTecNm,tecNms)==-1){
                    tecNms.push(v.realTecNm)
                }
                if($.inArray(v.bayNo,bays)==-1){
                    bays.push(v.bayNo)
                }
                if($.inArray(v.wkgrpNm,wkgrps)==-1){
                    wkgrps.push(v.wkgrpNm)
                }
                if($.inArray(v.allocHm,sAllocHms)==-1){
                    sAllocHms.push(v.allocHm)
                }
                if($.inArray(kendo.toString(v.wrkStartDt,"<dms:configValue code='dateFormat' /> HH:mm"),vwrkStartDts)==-1){
                    vwrkStartDts.push(kendo.toString(v.wrkStartDt,"<dms:configValue code='dateFormat' /> HH:mm"))
                }
                if($.inArray(kendo.toString(v.wrkEndDt,"<dms:configValue code='dateFormat' /> HH:mm"),vwrkEndDts)==-1){
                    vwrkEndDts.push(kendo.toString(v.wrkEndDt,"<dms:configValue code='dateFormat' /> HH:mm"))
                }
            });
            $("#vTecNm").val(tecNms);
            $("#bayNo").val(bays);
            $("#vWkgrpNo").val(wkgrps);
            $("#sAllocHm").val(sAllocHms);
            $("#vwrkStartDt").val(vwrkStartDts);
            $("#vwrkEndDt").val(vwrkEndDts);
        }
        ,autoBind:false
        ,pageable:false
        ,sortable:false
        ,editable:false
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,multiSelectWithCheckbox:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100//정비코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"rpirNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250//정비항목
                ,attributes:{"class":"ac"}
            }
            ,{field:"allocStatCd", title:"<spring:message code='ser.lbl.assignStat' />", width:80, attributes:{"class":"ac"}, template:"#=allocStatCdGrid(allocStatCd)#"}
            ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.assignStartDt' />", width:130//예정시작시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.assignEndDt' />", width:130//예정완료시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field:"wrkStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:130//예정시작시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                   $('<input id="wrkEndDt" required name="wrkEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' /> HH:mm"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg }' />"
                   });
                   $('<span class="k-invalid-msg" data-for="wrkEndDt"></span>').appendTo(container);
               }
            }
            ,{field:"wrkEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:130//예정완료시간
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                   $('<input id="wrkEndDt" required name="wrkEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' /> HH:mm"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   });
                   $('<span class="k-invalid-msg" data-for="wrkEndDt"></span>').appendTo(container);
               }
            }//수리시간
            ,{field:"realTecId", hidden:true}//테크니션
            ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                    .appendTo(container)
                }
            }//테크니션
            ,{field:"wkgrpNo", hidden:true}//테크니션
            ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:80, attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                    .appendTo(container)
                }
            }//소조
            ,{field:"bayNo", hidden:true}//bayNo
            ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNo' />", width:80, attributes:{"class":"ac"}
            }//bayNm
            ,{field:"planHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, attributes:{"class":"ac"}}
            ,{field:"allocHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, attributes:{"class":"ac"}}
            ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree'/>", width:60, attributes:{"class":"ac"}}
            ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree'/>", width:60, attributes:{"class":"ac"}}
            ,{field:"paintColorCd", title:"<spring:message code='ser.lbl.paintColor' />", width:60, attributes:{"class":"ac"}}
            ,{field:"shtCnt", title:"<spring:message code='ser.lbl.sheetMetalQty'/>", width:60, attributes:{"class":"ac"}}
            ,{field:"paintCnt", title:"<spring:message code='ser.lbl.paintQlt'/>", width:60, attributes:{"class":"ac"}}
        ]

    });

    $("#workAssignGrid").data("kendoExtGrid").dataSource.read();

});
</script>
