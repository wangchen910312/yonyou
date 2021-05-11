<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col style="width:17%;">
                <col style="width:13%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:30%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.specCd' /></th>
                    <td>
                        <input id="sSpecCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.specNm' /></th>
                    <td>
                        <input id="sSpecNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.regDt' /></th>		<!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartRegDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndRegDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var options = parent.searchSpecPopupWin.options.content.data;


    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);
                parent.searchSpecPopupWin.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.searchSpecPopupWin.close();
        }
    });

    // 등록 시작일
    $("#sStartRegDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:oneDay
   });

    // 등록 종료일
    $("#sEndRegDt").kendoExtMaskedDatePicker({
         format:"{0:"+vDtyyyyMMdd+"}"
        ,patternToMask:vDtyyyyMMdd
        ,value:toDay
    });


    /************************************************************
                조회조건 설정
    *************************************************************/
    if (options.specCd) {
        $("#sSpecCd").val(options.specCd);
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specList/selectSpecList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSpecCd"] = $("#sSpecCd").val();
                        params["sSpecNm"] = $("#sSpecNm").val();

                        // 등록일자
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"]   = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"cntryCd"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,cntryCd:{type:"string", validation:{required:true}}
                        ,cntryNm:{type:"string", validation:{required:true}}
                        ,langCd:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,autoBind:false
        ,pageable:false
        ,height:305
        ,columns:[
            {field:"specCd", title:"<spring:message code='global.lbl.specCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"specNm", title:"<spring:message code='global.lbl.specNm' />", width:200

            }
            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:"+vDtyyyyMMdd+"}"
            }
            ,{field:"schdlDt", title:"<spring:message code='global.lbl.deployStartDt' />", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"dmsCnt", title:"<spring:message code='global.lbl.dmsCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"bdlCnt", title:"<spring:message code='global.lbl.appCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"commandCnt", title:"<spring:message code='global.lbl.commandCount' />", width:85
                ,attributes:{"class":"ac"}
            }
            ,{field:"sqlCnt", title:"<spring:message code='global.lbl.sqlCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"propCnt", title:"<spring:message code='global.lbl.propertyCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"fileCnt", title:"<spring:message code='global.lbl.fileCount' />", width:80
                ,attributes:{"class":"ac"}
            }

            ,{field:"workCnt", title:"Working", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"readyCnt", title:"Ready", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"runCnt", title:"Running", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"endCnt", title:"Completed", width:80
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
         ]

    });

    if(options.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
</script>









