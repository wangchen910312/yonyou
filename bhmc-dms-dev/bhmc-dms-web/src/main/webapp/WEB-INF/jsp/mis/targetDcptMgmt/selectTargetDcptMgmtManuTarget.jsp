<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
        <input type="text" id=sManuTargetYyMmDd name="sManuTargetYyMmDd" value="" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtManuTargetSearch" name="btnTargetDcptMgmtManuTargetSearch">조회</button><!-- 제조사목표자료조회  -->
    </div>
</div>
<br>
<div class="table_info table_info_v1">
    <div class="table_grid">
        <div id="targetAllGrid"></div>
    </div>
</div>
<br>
<div class="table_info table_info_v2 mt10">
    <div class="table_grid">
        <div id="detailGrid"></div>
    </div>
</div>
<script type="text/javascript">

$(document).ready(function() {

    $("#sManuTargetYyMmDd").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
       ,parseFormats:["yyyyMM"]
   });

   $("#sManuTargetYyMmDd").kendoMaskedTextBox({
       mask:"######"
   });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    $("#sManuTargetYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2));

    $("#btnTargetDcptMgmtManuTargetSearch").kendoButton({
        click:function(e) {
            $('#targetAllGrid').data('kendoExtGrid').dataSource.page(1);
            $('#detailGrid').data('kendoExtGrid').dataSource.page(1);

           }
    });

    //그리드 설정
    $("#targetAllGrid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-MIS-0901-093600"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/mis/tdm/selectTargetDcptMgmtManuTargetAllGrid.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sManuTargetYyMmDd"] = $("#sManuTargetYyMmDd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"totGoalPrefVal"
                    ,fields:{
                        totGoalPrefVal:{type:"number", validation:{required:true}, editable:false}
                    }
                }
            }
        }
        ,height:80
        ,filterable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,editable:false
        ,sortable:false
        ,pageable:false
        ,columns:[
            {field:"totGoalPrefVal", title:"<spring:message code='mis.lbl.monthalltarget' />", width:220, format:"{0:n0}", attributes:{"class":"ac"}

            }
        ]
    });

    //그리드 설정
    $("#detailGrid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-MIS-0811-163124"
        ,dataSource:{
            requestEnd:function(e) {
            }
            ,transport:{
                read:{
                    url:"<c:url value='/mis/tdm/selectTargetDcptMgmtManuTargetGrid.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sManuTargetYyMmDd"] = $("#sManuTargetYyMmDd").val();

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
                        rnum:{type:"number"}
                        ,carlineCd:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,goalPrefVal:{type:"string"}
                        ,goalRstfVal:{type:"string"}
                        ,goalRstRate:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.lstUpdtDtFormat = kendo.parseDate(elem.lstUpdtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:550
        ,editable:false
        ,filterable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,sortable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"carlineCd", title:"<spring:message code='mis.lbl.carlineCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"carlineNm", title:"<spring:message code='mis.lbl.carlineNm' />", width:200

            }
            ,{field:"goalPrefVal", title:"<spring:message code='mis.lbl.goalPrefVal' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"goalRstfVal", title:"<spring:message code='mis.lbl.goalRstfVal' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"goalRstRate", title:"<spring:message code='mis.lbl.goalRstRate' />", width:150
                ,attributes:{"class":"ac"}
            }
        ]
    });
});
</script>