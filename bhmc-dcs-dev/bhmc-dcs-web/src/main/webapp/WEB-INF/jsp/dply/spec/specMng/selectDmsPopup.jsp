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


//최종ALIVECHECK상태코드:COM043
var lastAchkResCdTpList = [];
<c:forEach var="obj" items="${lastAchkResCdTpDS}">
lastAchkResCdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var lastAchkResCdTpArray = [];
$.each(lastAchkResCdTpList, function(idx, obj){
    lastAchkResCdTpArray[obj.cmmCd] = obj.cmmCdNm;
});
lastAchkResCdTpArray[null] = '';


</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m"><spring:message code="global.btn.search" /></button>
            <button id="btnAdd" class="btn_m"><spring:message code='global.btn.add' /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>
                    <td>
                        <input id="sDlrCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>
                    <td>
                        <input id="sDlrNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='cmm.lbl.openDt' /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sOpenFromDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sOpenToDt" class="form_datepicker">
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
     var parentOptions = parent.searchDmsPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.searchDmsPopupWin.close();
        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e) {
            addDms();
        }
    });

    // 등록 시작일
    $("#sOpenFromDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
   });

    // 등록 종료일
    $("#sOpenToDt").kendoExtMaskedDatePicker({
         format:"{0:"+vDtyyyyMMdd+"}"
        ,patternToMask:vDtyyyyMMdd
    });

/*
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
 */

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (parentOptions.specCd) {
//         $("#sSpecCd").val(parentOptions.specCd);
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDmsPopupList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
 */
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sOpenFromDt"] = $("#sOpenFromDt").val();
                        params["sOpenToDt"] = $("#sOpenToDt").val();

                        params["sSpecCd"] = parentOptions.specCd;
                        params["sDeployVerNo"] = parentOptions.deployVerNo;
                        params["sDeployTpCd"] = parentOptions.deployTpCd;
/*
                        // 등록일자
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"]   = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
 */
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
                    id:"dlrCd"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
//         ,selectable:"row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,autoBind:false
        ,pageable:false
        ,height:305
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:200
            }

//             ,{field:"deployTargYn", title:"<spring:message code='global.lbl.deployTargYn' />", width:100
//                 ,attributes:{"class":"ac"}
//             }
            ,{field:"lastAchkReqDt", title:"<spring:message code='global.lbl.lastAchkReqDt' />", width:160
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
//             ,{field:"lastAchkResDt", title:"<spring:message code='global.lbl.lastAchkResDt' />", width:145
//                 ,attributes:{"class":"ac"}
//                 ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
//             }
            ,{field:"lastAchkResCd", title:"<spring:message code='global.lbl.lastAchkResCd' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[lastAchkResCd]#"
            }
//             ,{field:"lastAchkResMsgCont", title:"최종ALIVECHECK응답메세지내용", width:200
//             }


//             ,{field:"telNo", title:"Tel No", width:100
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"ip", title:"IP Address", width:100
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"port", title:"Port", width:50
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"homepageUrl", title:"URL", width:300
//                 ,attributes:{"class":"ac"}
//             }


            ,{title:""}
         ]

    });

    if(parentOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }

    // DMS 추가
    function addDms() {

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var insertList = [];

        if(rows !== null) {
            $.each(rows, function(idx, row){
//                 insertList.push(grid.dataItem(row));
                var objRow = grid.dataItem(row);
                var obj = {dlrCd:objRow.dlrCd};
                insertList.push(obj);
            });

        }

        var param = {
            "insertList":insertList
            ,"specCd":parentOptions.specCd
            ,"deployVerNo":parentOptions.deployVerNo
        }

        parentOptions.callbackFunc(param);
        parent.searchDmsPopupWin.close();
    }

});
</script>









