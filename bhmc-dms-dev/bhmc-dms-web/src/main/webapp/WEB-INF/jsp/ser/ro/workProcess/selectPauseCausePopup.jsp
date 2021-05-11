<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.date.js' />"></script>
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_m" id="btnConf"><spring:message code='global.btn.confirm' /><!-- 확인 --></button>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:25%;">
                <col style="width:25%;">
                <col style="width:25%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.expcDlvDt' /></th>
                    <td class="readonly_area">
                        <input id="operEndDt" name="operEndDt" class="form_datepicker" readonly>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.opChgExpcDlDt' /></th>
                    <td>
                        <input id="chgExpcDlDt" name="chgExpcDlDt" class="form_datepicker">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="pauseGrid" class="grid"></div>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="lbrAdd" class="btn_s btn_add btn_s_min5 btn"><spring:message code="global.btn.add" /></button>
            <button type="button" id="lbrDel" class="btn_s btn_delete btn_s_min5 btn"><spring:message code="global.btn.del" /></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="lbrGrid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">

    //중지원인 Array
    var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${pauseStatList}">
    pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var pauseStatArr = dms.data.arrayToMap(pauseStatList, function(obj){return obj.cmmCd;});

    //공통코드:정비유형(수리유형)
    var lbrTpCdList = [];
    <c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

    // 정비유형(수리유형)
    lbrTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(lbrTpCdArr[val] != undefined)
                returnVal = lbrTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    // 중지원인
    pauseStatGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(pauseStatArr[val] != undefined)
                returnVal = pauseStatArr[val].cmmCdNm;
        }
        return returnVal;
    };

$(document).ready(function() {
    /************************************************************
            팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var parentData = parent.pauseCausePopup.options.content.data;
    var expcDlDt = parentData.expcDlDt;
    var chgExpcDlDt = parentData.chgExpcDlDt;
    var editableYn = true;
    var sWrkStopYn = "N";
    var _selectable = parentData.selectable;

    if(parentData.hasOwnProperty("sWrkStopYn")){
        sWrkStopYn = parentData.sWrkStopYn;
        editableYn = false;
    }

    $("#operEndDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:expcDlDt
        ,minTime:"08:00"
        ,maxTime:"20:00"
        ,editable:false
    });

    $("#chgExpcDlDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:chgExpcDlDt == null ? expcDlDt : chgExpcDlDt
        ,minTime:"08:00"
        ,maxTime:"20:00"
    });

    // 정비 팝업
    $("#lbrAdd").kendoButton({
       click:function(e) {

           var data = [];
           var iframe = "pauseCausePopup";
           parent.lbrCodePopup(iframe);
           // 정비 팝업 열기 함수.
       }
      ,enable: (sWrkStopYn ==="Y") ? false : true
    });

    // 공임추가 공통
    lbrAdd = function(lbrData){

        var lbrGrid = $('#lbrGrid').data('kendoExtGrid');
        var lbrDataItem = lbrGrid.dataSource._data;
        var lineNo = 1;

        $.each(lbrData, function(idx, data){

            var copyData;
            var checkVal = true;
            var campaignCnt = 0; // 그리드이 캠페인 입력된 갯수
            var popTzCdCnt = 0; // 공임팝업에서 선택한 TT,ZZ CODE 수
            var gridTzCnt=0;    //그리드에 입력된 TT,ZZ 코드 수
            var pupLbrCd = data.lbrCd; //팝업 공임 코드
            var popSubLbrCd =  pupLbrCd.substring(pupLbrCd.length-2 , pupLbrCd.length); // 공임코드 뒷2 자리
            var totLbrHm = 0;


            // 중복값 체크
            $.each(lbrDataItem, function(idx, obj){
                var gridLbrCd = obj.lbrCd; //그리드 공임 코드
                var subLbrCd =  gridLbrCd.substring(gridLbrCd.length-2 , gridLbrCd.length); //그리드에 있는 공임 뒤 코드 2자리

                if(data.lbrCd == obj.lbrCd){
                    checkVal = false;
                }
                totLbrHm += obj.lbrHm;

                if(subLbrCd == "ZZ" || subLbrCd == "TT") gridTzCnt++; // TT , ZZ 코드 체크
            });


            var lbrRate = data.lbrRate;
            var roTpCd = "01";
            var wartRoTp = (data.dstinCd == "H" && (checkVal)) ? true : false;

            // ZZ CODE , TT CODE 는 1개만 입력 가능하게 체크
            if(popSubLbrCd == "ZZ" || popSubLbrCd == "TT") popTzCdCnt++;
            if( (gridTzCnt >= 1 && popTzCdCnt > 0) &&
                    (popSubLbrCd == "ZZ" || popSubLbrCd == "TT")) checkVal = false;
            if(popSubLbrCd == "ZZ") lbrRate = 0;

            var lbrTp = dms.string.isEmpty(data.lbrTp) ? "01" : data.lbrTp;


            if(checkVal) {
                copyData = {
                     lbrTp: lbrTp
                    ,lbrCd:data.lbrCd                                   // 정비코드
                    ,lbrNm:data.lbrNm                                   // 정비항목
                    ,lbrHm: (roTpCd == "02" ) ? data.lbrHm : Number(dms.string.defaultString(data.payLbrHm,data.lbrHm))          // 공임시간
                    ,lbrPrc: data.lbrPrc                                // 공임단가
                    ,serCnt: Number(data.serCnt)                        // 정비건수
                    ,dstinCd:data.dstinCd
                    ,vinNo:$("#vinNo").val()
                    ,lineNo:lineNo++
                };
                lbrGrid.dataSource.add(copyData);
            }
        });
    };

    $("#lbrDel").kendoButton({
       click:function(e) {

           var grid = $("#lbrGrid").data("kendoExtGrid");
           var rows = grid.select();

           rows.each(function(index, row) {
               grid.removeRow(row);
           });
       }
      ,enable: (sWrkStopYn ==="Y") ? false : true
    });

    // 그리드 더블 클릭 이벤트.
    /* $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    }); */

    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 확인 버튼.
    $("#btnConf").kendoButton({
        click:function(e){

            var pauseGrid = $("#pauseGrid").data("kendoExtGrid");
            var grid = $("#lbrGrid").data("kendoExtGrid");

            var pauseDataItem = pauseGrid.dataSource._data;
            var dataItem = grid.dataSource._data;

            parentData.callbackFunc(pauseDataItem, dataItem, $("#chgExpcDlDt").data("kendoExtMaskedDateTimePicker").value());
            parent.pauseCausePopup.close();

        }
        ,enable: (sWrkStopYn ==="Y") ? false : true
    });


    /************************************************************
                그리드 설정
    *************************************************************/
    // 정비중지 그리드
    $("#pauseGrid").kendoExtGrid({
        gridId:"G-SER-0325-010029"
        ,dataSource:{
            transport:{
                read:{
                    url: "<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sRoDocNo"] = parentData.roDocNo;
                        params["sWrkStopYn"] = sWrkStopYn;

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
                        dlrCd:{type:"string" , editable:false}
                        ,rpirCd:{type:"string" , editable:false}
                        ,rpirNm:{type:"string" , editable:false}
                        ,rpirTp:{type:"string" , editable:false}
                        ,realTecNm:{type:"string" , editable:false}
                    }
                }//model
            }//schema
        }
        ,selectable:"row"
        ,height:190
        ,pageable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,autoBind:false
        ,editable:editableYn
        ,columns:[
             {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80}// 공임코드
            ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:100
                /* ,editor:function(container, options) {
                    $('<input required type="text" name="lbrNm" data-name="<spring:message code="ser.lbl.rpirNm" />" data-bind="value:' + options.field + '"  maxLength="200" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="lbrNm"></span>')
                    .appendTo(container);
                 } */
             }// 공임명
            ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=lbrTpCdGrid(rpirTp)#"
            } // 공임유형(정비유형)
            ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:80} // 정비사
            ,{field:"pauseCauCd", title:"<spring:message code='ser.lbl.pauseCau' />", width:100, attributes:{"class":"ac"}
                ,template:"#=pauseStatGrid(pauseCauCd)#"
                ,editor:function(container, options){
                    $('<input required name="pauseCauCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:pauseStatList
                        ,index:0
                    });
                }
            }   // RO유형
            ,{field:"pauseCauRmk", title:"<spring:message code='ser.lbl.pauseRemark' />", width:120, attributes:{"class":"al"} }// 비고
            ,{field:"allocStartDt", title:"<spring:message code='ser.lbl.preStartDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                    $('<input required name="allocStartDt" id="allocStartDt" data-name="<spring:message code='ser.lbl.preStartDt' />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,minTime:"08:00"
                        ,maxTime:"20:00"
                    })
                    .kendoMaskedTextBox({
                        mask:"####-##-## ##:##"
                    });
                    $('<span class="k-invalid-msg" data-for="allocStartDt"></span>').appendTo(container);
                }
            }
            ,{field:"allocEndDt", title:"<spring:message code='ser.lbl.preCompDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                    $('<input required name="allocEndDt" id="allocEndDt" data-name="<spring:message code='ser.lbl.preCompDt' />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,minTime:"08:00"
                        ,maxTime:"20:00"
                    })
                    .kendoMaskedTextBox({
                        mask:"####-##-## ##:##"
                    });
                    $('<span class="k-invalid-msg" data-for="allocEndDt"></span>').appendTo(container);
                }
            }
        ]
    });

    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:"G-SER-1011-000097"
        ,dataSource:{
            transport:{
                read:{
                    url: "<c:url value='/ser/ro/workPause/selectWorkPauses.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sRoDocNo"] = parentData.roDocNo;
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
                        dlrCd:{type:"string", editable:false}
                        ,lbrCd:{type:"string", editable:false}
                        ,lbrNm:{type:"string", editable:false, validation:{required:true}}
                        ,lbrTp:{type:"string", editable:false}
                        ,lbrHm:{type:"number"}
                        ,serCnt:{type:"number"}
                        ,dstinCd:{type:"string"}
                        ,regDt:{type:"date"}
                    }
                }//model
            }//schema
        }
        ,height:100
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,editable:editableYn
        ,selectable:"row"
        ,editable:{
            confirmation:false
        }
        ,columns:[
             {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200}// 공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lbrTpCdGrid(lbrTp)#"
            } // 공임유형(정비유형)
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n1}"
                ,editor:function(container, options){
                    $('<input name="lbrHm" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0.0
                        ,max:100000
                        ,spinners:false
                    });
                }
            } // 수불공임
            ,{field:"allocHm", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="serCnt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0
                        ,max:100
                        ,spinners:false
                    });
                }

            }// 정비건수
            ,{field:"pauseRemark", title:"<spring:message code='ser.lbl.lbrSuggestRemark' />", width:160, attributes:{"class":"al"} }// 비고
            ,{field:"dstinCd", title:"dstinCd", hidden:true}
            ,{field:"vinNo", title:"vinNo", hidden:true}
            ,{field:"lineNo", title:"lineNo", hidden:true}

        ]
    });

    if(sWrkStopYn == "Y"){
        $("#lbrGrid").data("kendoExtGrid").dataSource.page(1);
        $("#pauseGrid").data("kendoExtGrid").dataSource.page(1);
    } else {
        $.each(parentData.workPauseData, function(idx, data){
            var pauseGrid = $("#pauseGrid").data("kendoExtGrid");

            var copyData ={
                rpirCd:data.rpirCd
                ,rpirNm:data.rpirNm
                ,rpirTp:data.rpirTp
                ,pauseCauCd:""
                ,pauseCauNm:""
                ,realTecNm:data.realTecNm
                ,allocStartDt:data.allocStartDt
                ,allocEndDt:data.allocEndDt
            };
            pauseGrid.dataSource.add(copyData);
        });
    }
});

</script>









