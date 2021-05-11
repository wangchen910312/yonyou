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

var lastAchkResCdTpArray = [];

lastAchkResCdTpArray['OK'] = 'OK';
lastAchkResCdTpArray['NOK'] = 'NOK';
lastAchkResCdTpArray[''] = '';

lastAchkResCdTpArray.push({cmmCdNm:"", cmmCd:""});
lastAchkResCdTpArray.push({cmmCdNm:"OK", cmmCd:"OK"});
lastAchkResCdTpArray.push({cmmCdNm:"NOK", cmmCd:"NOK"});

</script>


<section id="windows" class="pop_wrap">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>
        </div>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

<form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic">Redeploy Policy</h2>
        </div>

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:23%;">
                    <col style="width:15%;">
                    <col style="width:23%;">
                    <col style="width:24%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.deployStartDt' /></th>
                        <td>
                            <input id="deployStartDt" name="deployStartDt" style="width:90%"  data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code='global.lbl.deployEndDt' /></th>
                        <td>
                            <input id="deployEndDt" name="deployEndDt" style="width:90%"  data-json-obj="true" >
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>

</form>


</section>

<script type="text/javascript">
$(document).ready(function() {

    // 팝업 옵션
    var parentOptions = parent.searchRedeployPopupWin.options.content.data;

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
//                     url:"<c:url value='/dply/spec/specMng/selectDmsPopupList.do' />"
                    url:"<c:url value='/dply/spec/dplyHist/selectDmsPopupListForRedeploy.do' />"
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
/*
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
 */
                        params["sSpecCd"] = parentOptions.specCd;
                        params["sDeployVerNo"] = parentOptions.deployVerNo;

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
        ,dataBound:function(e) {
            var i = 0;
        }
        ,multiSelectWithCheckbox:true
//         ,selectable:"row"
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,height:250
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:120
            }

//             ,{field:"deployTargYn", title:"DEPLOY대상여부", width:100
//                 ,attributes:{"class":"ac"}
//             }
            ,{field:"lastAchkReqDt", title:"<spring:message code='global.lbl.lastAchkReqDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"lastAchkResCd", title:"<spring:message code='global.lbl.lastAchkResCd' />", width:100
                ,attributes:{"class":"ac"}
//                 ,template:"#=lastAchkResCdTpArray[lastAchkResCd]#"
            }
/*
            ,{field:"lastAchkResMsgCont", title:"최종ALIVECHECK응답메세지내용", width:200
            }
*/

            ,{field:"sqlDeploy", title:"<spring:message code='global.lbl.sqlDeploy' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"repoDeploy", title:"<spring:message code='global.lbl.repositoryDeploy' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"fileDeploy", title:"<spring:message code='global.lbl.fileDeploy' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployProcess", title:"<spring:message code='global.lbl.deployProcess' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"resultMsg", title:"<spring:message code='global.lbl.lastAchkResMsgCont' />", width:200
                ,attributes:{"class":"ac"}
            }

            ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"ip", title:"<spring:message code='global.lbl.dmsIpNm' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"port", title:"<spring:message code='global.lbl.dmsPortNm' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"homepageUrl", title:"<spring:message code='global.lbl.homepageUrl' />", width:300
                ,attributes:{"class":"ac"}
            }


            ,{title:""}
         ]

    });

/*
    //그리드 설정
    $("#dmsGrid").kendoExtGrid({
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
                        params["sDeployTargYn"] = $("#sDeployTargYn").data("kendoExtDropDownList").value();

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
                        ,lastDplyDt        :{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,height:350
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"dlrCd", title:"DMS Code", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"DMS Name", width:200
            }

            ,{field:"deployTargYn", title:"DEPLOY대상여부", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastAchkReqDt", title:"최종ALIVECHECK요청일자", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"lastAchkResDt", title:"최종ALIVECHECK응답일자", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"lastAchkResCd", title:"최종ALIVECHECK응답코드", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"lastAchkResMsgCont", title:"최종ALIVECHECK응답메세지내용", width:200
            }


            ,{field:"telNo", title:"Tel No", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"ip", title:"IP Address", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"port", title:"Port", width:50
                ,attributes:{"class":"ac"}
            }
            ,{field:"homepageUrl", title:"URL", width:300
                ,attributes:{"class":"ac"}
            }


            ,{title:""}
        ]

    });
 */
    if(parentOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();

    }

//     alert(kendo.stringify(parentOptions));

    // DEPLOY시작일자
    $("#deployStartDt").kendoDateTimePicker({
        format:vDtyyyyMMddHHmm
        ,value:parentOptions.deployStartDt

    });

    // DEPLOY종료일자
    $("#deployEndDt").kendoDateTimePicker({
        format:vDtyyyyMMddHHmm
        ,value:parentOptions.deployEndDt

    });

    //버튼 -
    $("#btnSave").kendoButton({
        click:function(e) {
            addDmsForRedeploy();
        }
    });



    // DMS 추가
//     function addDms() {
    function addDmsForRedeploy() {

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
            ,"specCd"       :parentOptions.specCd
            ,"deployVerNo"  :parentOptions.deployVerNo
            ,"deployStartDt":$('#deployStartDt').data('kendoDateTimePicker').value()
            ,"deployEndDt"  :$('#deployEndDt').data('kendoDateTimePicker').value()
        }

//         alert(JSON.stringify(param));
//         return;


        $.ajax({
//             url:"<c:url value='/dply/spec/specMng/insertDplyDlr.do' />",
            url:"<c:url value='/dply/spec/dplyHist/insertDplyDlrForRedeploy.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                alert("error");

            },
            success:function(jqXHR, textStatus) {
//                 alert("Success !!!");
//                 alert(jqXHR.specCd);
//                 alert(jqXHR.deployVerNo);

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");

                $('#dplyGrpGrid').data('kendoExtGrid').dataSource.read();
            }
        });

    }


});
</script>









