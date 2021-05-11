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

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>

// REPOSITORY
var repositoryList = [];
<c:forEach var="obj" items="${repositoryDS}">
repositoryList.push({cmmCdNm:"${obj.repoUrlCont}", cmmCd:"${obj.repoUrlNm}"});
</c:forEach>

var repositoryArray = [];
$.each(repositoryList, function(idx, obj){
    repositoryArray[obj.cmmCd] = obj.cmmCdNm;
});

//REPOSITORY 작업명령어코드:COM042
var repositoryOperCmdTpList = [];
<c:forEach var="obj" items="${repositoryOperCmdTpDS}">
    repositoryOperCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var repositoryOperCmdTpArray = [];
$.each(repositoryOperCmdTpList, function(idx, obj){
    repositoryOperCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnAdd" class="btn_m btn_Select"><spring:message code="global.btn.add" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.operCmdNm'/></th>
                    <td>
                        <input id="repository_operCmdNm" name="repository_operCmdNm" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.rollbackOperCmdNm'/></th>
                    <td>
                        <input id="repository_rollbackOperCmdNm" name="repository_rollbackOperCmdNm" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.operTryCnt'/></th>                       <!-- 작업시도횟수 -->
                    <td>
                        <input id="repository_operTryCnt" name="repository_operTryCnt" class="form_input" data-json-obj="true" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.failAftCtnuPgssYn'/></th>                         <!-- 실패이후계속진행여부 -->
                    <td>
                        <input id="repository_failAftCtnuPgssYn" name="repository_failAftCtnuPgssYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.failAftRollbackYn'/></th>                         <!-- 실패이후롤백여부 -->
                    <td>
                        <input id="repository_failAftRollbackYn" name="repository_failAftRollbackYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"></th>
                    <td>

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
     var parentOptions = parent.searchRepositoryPopupWin.options.content.data;


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
            parent.searchRepositoryPopupWin.close();
        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e) {
            addRepository();
        }
    });

/*
    //
    $("#repository").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryList
    });
*/
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

    // repository 실패이후계속진행여부
    $("#repository_failAftCtnuPgssYn").kendoExtDropDownList({
        dataSource:["Y", "N"]
    });

    // repository 실패이후롤백여부
    $("#repository_failAftRollbackYn").kendoExtDropDownList({
        dataSource:["Y", "N"]
    });

    // repository 작업명령어명
    $("#repository_operCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryOperCmdTpList
    });

    // repository rollback 작업명령어명
    $("#repository_rollbackOperCmdNm").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryOperCmdTpList
    });






    /************************************************************
                조회조건 설정
    *************************************************************/
    if (parentOptions.specCd) {
//         $("#sSpecCd").val(parentOptions.specCd);
    }

    if (parentOptions.displayGrid) {

    }


    /************************************************************
                그리드 설정
    *************************************************************/

    // 그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectRepository.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"repoUrlNm"
                    ,fields:{
                        repoUrlNm   :{type:"string"}
                        ,repoUrlCont :{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,height:260
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"repoUrlNm", title:"<spring:message code='global.lbl.repoUrlNm' />", width:400
            }
            ,{field:"repoUrlCont", title:"<spring:message code='global.lbl.repoUrlCont' />", width:200
            }

            ,{title:""}
        ],dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(0)");

            if(row.length > 0) {
                grid.select(grid.tbody.find(">tr"));
            } else {

            }
        }



    });

    if(parentOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }


    initDefaultValue();


    // Repository 추가
    function addRepository() {

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var insertList = [];

        if(rows !== null) {
            $.each(rows, function(idx, row){
                var objRow = grid.dataItem(row);
                var obj = {repoUrlNm        :objRow.repoUrlNm
                         , operCmdNm        :$('#repository_operCmdNm').data('kendoExtDropDownList').value()
                         , rollbackOperCmdNm:$('#repository_rollbackOperCmdNm').data('kendoExtDropDownList').value()
                         , operTryCnt       :$('#repository_operTryCnt').val()
                         , failAftCtnuPgssYn:$('#repository_failAftCtnuPgssYn').data('kendoExtDropDownList').value()
                         , failAftRollbackYn:$('#repository_failAftRollbackYn').data('kendoExtDropDownList').value()
                          };
                insertList.push(obj);
            });
        }


        var param = {
            "insertList":insertList
        }

        parentOptions.callbackFunc(param);
        parent.searchRepositoryPopupWin.close();
    }



    function initDefaultValue() {
//         $('#repository_operCmdNm').data('kendoExtDropDownList').value('ADD');
//         $('#repository_rollbackOperCmdNm').data('kendoExtDropDownList').value('DELETE');
//         $('#repository_operTryCnt').val(3);
//         $('#repository_failAftCtnuPgssYn').data('kendoExtDropDownList').value('Y');
//         $('#repository_failAftRollbackYn').data('kendoExtDropDownList').value('Y');


        $('#repository_operCmdNm').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.repository.operCmdNm']);
        $('#repository_rollbackOperCmdNm').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.repository.rollbackOperCmdNm']);
        $('#repository_operTryCnt').val(cmmPrtyListObj['specReg.repository.operTryCnt']);
        $('#repository_failAftCtnuPgssYn').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.repository.failAftCtnuPgssYn']);
        $('#repository_failAftRollbackYn').data('kendoExtDropDownList').value(cmmPrtyListObj['specReg.repository.failAftRollbackYn']);


    }

});
</script>









