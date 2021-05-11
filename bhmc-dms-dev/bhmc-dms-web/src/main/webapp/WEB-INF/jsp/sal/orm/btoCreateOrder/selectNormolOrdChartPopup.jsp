<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 자원표 -->
<section id="window" class="pop_wrap">

   <section class="group">
        <div class="header_area">
            <div class="btn_right">

                <button class="btn_s" type="button" id="btnExcelExport" ><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
        </div>

        <div class="table_grid">
            <div id="grid"></div>
        </div>
    </section>

<!-- hidden값  -->
<span style="display:none">

</span>
</section>
<!-- //자원표 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

var YnObj = {"Y":"是", "N":"否"};
var YnList = [];
YnList.push({"cmmCd":"Y", "cmmCdNm":"是", "useYn":"Y"});
YnList.push({"cmmCd":"N", "cmmCdNm":"否", "useYn":"Y"});

var ordTpList = [];
<c:forEach var="obj" items="${ordTpInfo}">
var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}"
  <c:if test="${obj.cmmCd eq 'N1' || obj.cmmCd eq 'AD' || obj.cmmCd eq 'AS'}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
  </c:if>
</c:forEach>
var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});

$(document).ready(function() {
    var cData = parent.popupWindow.options.content.data;
    var strYn = cData.strYn;
    //var ordYymm = cData.ordYymm;
    //var ordWeek = cData.ordWeek;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            var tUseYn = "";
            $("input[name='tUseYn']:checked").each(function(index,row){tUseYn = row.value;});
            tUseYn = dms.string.isEmpty(tUseYn)?"Y":dms.string.strNvl(tUseYn);
            dms.ajax.excelExport({
                "beanName":"btoCreateOrderService"
                ,"templateFile":"NormolOrdChart.xlsx"
                ,"fileName":"DownloadExcel.xlsx"
                ,"tUseYn":tUseYn
                ,"strYn":strYn
                //,"sOrdYymm":ordYymm
                //,"sOrdWeek":ordWeek
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0412-112509"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectnormolOrdChartSerch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var tUseYn = "";
                        $("input[name='tUseYn']:checked").each(function(index,row){tUseYn = row.value;});
                        params["tUseYn"] = dms.string.isEmpty(tUseYn)?"Y":dms.string.strNvl(tUseYn);
                        params["strYn"] = strYn;
                        //params["sOrdYymm"] = ordYymm;
                        //params["sOrdWeek"] = ordWeek;

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
                         rnum:{type:"number"}
                        ,carlineCd:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnDesc:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorDesc:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorDesc:{type:"string"}
                        ,ordTp:{type:"string"}
                        ,msrp:{type:"number"}
                        ,qty:{type:"number"}
                        ,emissnStnd:{type:"string"}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,sortable:{mode:"single"}
        ,editable:false
        ,autoBind:false
        ,height:402
        ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
             }
            ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", width:100, attributes:{"class":"ac"}}
            ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />", width:100, attributes:{"class":"ac"}}
            ,{field:"ocnDesc", title:"<spring:message code='sal.lbl.ocnNm' />", width:100, attributes:{"class":"al"}}
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", width:100, attributes:{"class":"ac"}}
            ,{field:"extColorDesc", title:"<spring:message code='global.lbl.extColorNm' />", width:100, attributes:{"class":"al"}}
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", width:100, attributes:{"class":"ac"}}
            ,{field:"intColorDesc", title:"<spring:message code='sal.lbl.intColorNm' />", width:100, attributes:{"class":"al"}}
            ,{_field:"ordTp", title:"<spring:message code='sal.lbl.ordCd' />", hidden:true, width:100, attributes:{"class":"ac"}, template:"# if(ordTpArr[ordTp] != null) { # #= ordTpArr[ordTp].cmmCdNm# # }#"}     //주문유형
            ,{field:"msrp", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"qty", title:"<spring:message code='sal.lbl.avlbStockQty' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}
            ,{field:"emissnStnd", title:"<spring:message code='sal.lbl.dispGradeCd' />", width:100, attributes:{"class":"al"}}
            ,{field:"useYn", title:"<spring:message code='global.lbl.use' />", width:100, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(YnObj[useYn])#"}
        ]
    });

    if (cData.autoBind) {
        $("#btnSearch").click();
    }

});

//-->
</script>