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
            <button id="btnDplyStart" class="btn_m">Start</button>
            <button id="btnDplyStop" class="btn_m">Stop</button>
            <button id="btnDplyRestart" class="btn_m">Restart</button>
            <button id="btnDplyCancel" class="btn_m">Cancel</button>
        </div>
    </div>


    <form id="dplyMastForm" name="dplyMastForm" method="POST" onsubmit="return false;">
        <div class="clfix">
            <section class="content_left" style="width:180px;">
                <div class="table_grid">
                    <div id="dplyGrpGrid"></div>
                </div>
            </section>
            <section class="content_right" style="margin-left:190px;">
                <div class="table_grid">
                    <div id="dplyCurrStateGrid"></div>
                </div>
            </section>
        </div>
    </form>

</section>

<script type="text/javascript">
$(document).ready(function() {

/************************************************************
            팝업옵션 설정
*************************************************************/
     // 팝업 옵션
     var parentOptions = parent.searchRunDeployPopupWin.options.content.data;

/************************************************************
            기능버튼 설정
*************************************************************/

    // Deploy Start Button
    $("#btnDplyStart").kendoButton({
        click:function(e){
            var params = {};

            params["mesgGrpCd"]   = 'E';                         // SyncCommandSndr
            params["mesgCd"]      = '10001';                     // Immediately Deploy Request Message
            params["specCd"]      = parentOptions.sSpecCd;
            params["deployVerNo"] = parentOptions.sDeployVerNo;

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);

                },
                success:function(jqXHR, textStatus) {
                    processRsltOfSyncCmd(jqXHR, params);
                }
            });

        }
    });

    function processRsltOfSyncCmd(jqXHR, params) {

        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        if(params["mesgCd"] == '10001') {  // Immediately Deploy Request Message
            var objTarget = $(objXML).find('mesg_code');

        }

    }


    $("#btnDplyCancel").kendoButton({
        click:function(e){

        }
    });

    // 스케쥴유형 'schedule' 일 때
    if(parentOptions.sScheduleTpCd == "S") {
        $("#btnDplyStart").hide();
    }

/*
    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.searchRunDeployPopupWin.close();
        }
    });
*/


/************************************************************
            그리드 설정
*************************************************************/

    // Deploy Group 그리드 설정
    $("#dplyGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyGrpByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sSpecCd"] = parentOptions.sSpecCd;
                        params["sDeployVerNo"] = parentOptions.sDeployVerNo;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                        specCd:{type:"string"}
                        ,deployStartDt:{type:"date"}
                        ,deployEndDt:{type:"date"}
                        ,procRsltNotiEndDt:{type:"date"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            $("#dplyCurrStateGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:347
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"deployGrpId", title:"DEPLOY그룹ID", width:120
                ,attributes:{"class":"ac"}
            }
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                $('#dplyCurrStateGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#dplyCurrStateGrid').data('kendoExtGrid').dataSource.read();

            } else {

            }
        }

    });


    // Deploy Dealer 그리드 설정
    $("#dplyCurrStateGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/specMng/selectDplyCurrentState.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var grid = $("#dplyGrpGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sSpecCd"]      = dataItem.specCd;
                        params["sDeployVerNo"] = dataItem.deployVerNo;
                        params["sDeployGrpId"] = dataItem.deployGrpId;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"specCd"
                    ,fields:{
                          specCd              :{type:"string"}
                        , deployVerNo         :{type:"string"}
                        , deployGrpId         :{type:"string"}
                        , dlrCd               :{type:"string"}
                        , dlrNm               :{type:"string"}
                        , cnt                 :{type:"number"}
                        , retryCnt            :{type:"number"}
                        , status              :{type:"String"}
                        , rollbackStatus      :{type:"String"}
                        , startDt             :{type:"date"}
                        , endDt               :{type:"date"}
                        , duration            :{type:"number"}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:false
//         ,selectable:"row"
        ,height:347
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,columns:[
            {field:"dlrCd", title:"딜러코드", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"딜러명", width:120
            }

            ,{field:"status", title:"Status", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"startDt", title:"Start Dt", width:145
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"endDt", title:"End Dt", width:145
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"duration", title:"Duration", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"retryCnt", title:"Retry Count", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"rollbackStatus", title:"Rollback", width:70
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

            } else {

            }
        }

    });

    if(parentOptions.autoBind){
        $("#dplyGrpGrid").data("kendoExtGrid").dataSource.read();
    }




});
</script>









