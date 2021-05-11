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

<script type="text/javascript">

//DEPLOY대상여부:COM039
var deployTargYnTpList = [];
<c:forEach var="obj" items="${deployTargYnTpDS}">
    deployTargYnTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var deployTargYnTpArray = [];
$.each(deployTargYnTpList, function(idx, obj){
    deployTargYnTpArray[obj.cmmCd] = obj.cmmCdNm;
});

// 최종ALIVECHECK상태코드:COM043
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
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button  id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:40%;">
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
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">

$(document).ready(function() {

    var options = parent.searchDMSPopupWin.options.content.data;

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
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
                parent.searchDMSPopupWin.close();
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/dms/dmsProfile/selectDmsProfile.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sDeployTargYn"] = "Y";
                        params["sLastAchkResCd"] = "";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        dlrCd              :{type:"string"}
                        ,deployTargYn      :{type:"string"}
                        ,lastAchkReqDt     :{type:"date"}
                        ,lastAchkResDt     :{type:"date"}
                        ,lastAchkResCd     :{type:"string"}
                        ,lastAchkResMsgCont:{type:"string"}
                        ,dlrNm             :{type:"string"}
                        ,dlrEngNm          :{type:"string"}
                        ,crnNo             :{type:"string"}
                        ,telNo             :{type:"string"}
                        ,faxNo             :{type:"string"}
                        ,ip                :{type:"string"}
                        ,port              :{type:"string"}
                        ,homepageUrl       :{type:"string"}
                        ,sqlDeploy         :{type:"string"}
                        ,repoDeploy        :{type:"string"}
                        ,fileDeploy        :{type:"string"}
                        ,deployProcess     :{type:"string"}
                        ,result            :{type:"string"}
                        ,resultMsg         :{type:"string"}
                        ,dmsOperEmailNm    :{type:"string"}
                        ,dmsOperTelNo      :{type:"string"}
/*
                        mesgSeq:{type:"number", editable:false}
                        ,rnum:{type:"number", editable:false}
                        ,bundleNm:{type:"string", validation:{required:true}}
                        ,langCd:{type:"string", validation:{required:true}}
                        ,cntryCd:{type:"string"}
                        ,mesgKey:{type:"string", validation:{required:true}}
                        ,mesgTxt:{type:"string", validation:{required:true}}
                        ,lstUpdtDt:{type:"date", editable:false}
*/
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:true
        ,height:305
        ,autoBind:false
        ,selectable:"single, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:170
            }

            ,{field:"deployTargYn", title:"<spring:message code='global.lbl.deployTargYn'/>", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=deployTargYnTpArray[deployTargYn]#"
            }
            ,{field:"lastAchkReqDt", title:"<spring:message code='global.lbl.lastAchkReqDt'/>", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"lastAchkResCd", title:"<spring:message code='global.lbl.lastAchkResCd'/>", width:90
                ,attributes:{"class":"ac"}
                ,template:"#=lastAchkResCdTpArray[lastAchkResCd]#"
            }

//             ,{field:"sqlDeploy", title:"SQL 배포", width:80
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=lastAchkResCdTpArray[sqlDeploy]#"
//             }
//             ,{field:"repoDeploy", title:"레파지토리 배포", width:100
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=lastAchkResCdTpArray[repoDeploy]#"
//             }
//             ,{field:"fileDeploy", title:"파일 배포", width:70
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=lastAchkResCdTpArray[fileDeploy]#"
//             }
//             ,{field:"deployProcess", title:"배포 Process", width:90
//                 ,attributes:{"class":"ac"}
//                 ,template:"#=lastAchkResCdTpArray[deployProcess]#"
//             }
//             ,{field:"resultMsg", title:"<spring:message code='global.lbl.lastAchkResMsgCont' />", width:170
//                 ,attributes:{"class":"ac"}
//             }

//             ,{field:"dmsOperTelNo", title:"<spring:message code='global.lbl.dmsOperTelNo' />", width:110
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"dmsOperEmailNm", title:"<spring:message code='global.lbl.dmsOperEmailNm' />", width:120
//             }
//             ,{field:"ip", title:"<spring:message code='global.lbl.dlrIpAddrNm' />", width:120
//             }
//             ,{field:"port", title:"<spring:message code='global.lbl.dlrPortNo' />", width:120
//                 ,attributes:{"class":"ac"}
//             }
//             ,{field:"homepageUrl", title:"<spring:message code='global.lbl.URL' />", width:300
//             }


            ,{title:""}
        ],dataBound:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }


    });






//     $('#grid').data('kendoExtGrid').dataSource.page(1);


});



</script>







