<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name : selectSalesReceiptUploadTimeMgmt.jsp
    Description : 기준정보 > 영수증업로드시간대관리
    author chibeom.song
    since 2017. 2. 17.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 2. 17.   chibeom.song     최초 생성
--%>

<!-- [DMS] 영수증업로드시간대관리 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.ReceiptUploadTimeMgmt" /></h1><!-- 영수증업로드시간대관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12805" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.outyyyymm" /></th><!-- 출고년월 -->
                    <td>
                        <input type="text" id="sSaleDt" name="sSaleDt" value="" class="form_comboBox" style="width:150px;">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.invoiceTp" /></th><!-- 영수증 유형 -->
                    <td>
                        <input id="sReceiptTp" name="sReceiptTp" class="form_comboBox" style="width:200px;">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12804" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s" id="btnSave"><spring:message code='global.btn.save' /></button>                         <!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12803" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_add" id="btnAdd"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12802" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_delete" id="btnDel"><spring:message code='global.btn.rowDel' /></button>       <!-- 행삭제 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12801" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_cancel" id="btnCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
            </dms:access>
        </div>
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
var receiptTpList = [];
<c:forEach var="obj" items="${receiptTpList}">
receiptTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var receiptTpListMap = dms.data.arrayToMap(receiptTpList, function(obj){ return obj.cmmCd; });

var controlChkList = [];
<c:forEach var="obj" items="${controlChkList}">
controlChkList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var controlChkListMap = dms.data.arrayToMap(controlChkList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    $("#sSaleDt").kendoDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyyMM"
    });

    $("#sSaleDt").kendoMaskedTextBox({
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

    $("#sSaleDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    $("#sReceiptTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:receiptTpList
        ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e) {

            //필터가 적용된 상태체크
            if($('#grid').data('kendoExtGrid').dataSource.filter()){
                dms.notification.info("<spring:message code='global.info.clearFilter'/>");
                return;
            }

        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
         click:function(e){

             var rows = $("#grid").data("kendoExtGrid").tbody.find("tr");
             if(rows.length > 0){
                 return ;
             }

             $('#grid').data('kendoExtGrid').dataSource.insert(0, {

              });

             var grid = $("#grid").data("kendoExtGrid");
             var rows = grid.tbody.find("tr:eq(0)").closest('tr');
             rows.addClass("k-state-selected");
         }
    });

    // 삭제 버튼
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    // 취소 버튼
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/veh/receipt/multiSalesReceiptUploadTimeSave.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data, textStatus, jqXHR) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    // 영수증업로드시간대관리 그리드 시작
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-2017-051902"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/receipt/selectSalesReceiptUploadTimeMgmtSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSaleDt"] = $("#sSaleDt").val();
                        params["sReceiptTp"] = $("#sReceiptTp").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"outYyyymm"
                    ,fields:{
                         rSeq:{type:"string", editable:false}
                        ,outYyyymm:{type:"string", editable:true}
                        ,receiptTp:{type:"string", editable:true}
                        ,upStdt:{type:"string", editable:true}
                        ,upEddt:{type:"string", editable:true}
                        ,controlSc:{type:"string", editable:false}
                        ,controlChk:{type:"string", editable:true}
                        ,dlrCd:{type:"string", editable:true}
                        ,dlrNm:{type:"string", editable:false}
                        ,useYn:{type:"string", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"string", editable:false}
                        ,updtUsrId:{type:"string", editable:false}
                        ,updtDt:{type:"string", editable:false}
                    }
                }
            }
        }
        ,navigatable:false
        ,pageable:true
        //,selectable:"row"
        ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,sortable:false
        ,columns:[
             {field:"rSeq", title:"", hidden:true }           /* 시퀀스 */
            ,{field:"outYyyymm", title:"<spring:message code='sal.lbl.outyyyymm' />", width:100, attributes:{"class":"ac"}
             , format:"{0:yyyyMM}"
             }        /* 출고년월 */
            ,{field:"receiptTp", title:"<spring:message code='sal.lbl.invoiceTp' />", width:200
                , attributes:{"class":"ac"}
                ,template:"# if(receiptTpListMap[receiptTp] != null) { # #= receiptTpListMap[receiptTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input name="receiptTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         autoBind:false
                        ,dataSource:receiptTpList
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                    })
                    $('<span class="k-invalid-msg" data-for="receiptTp"></span>').appendTo(container);
                }
            }        /* 영수증유형 */
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:150, attributes:{"class":"ac"} }           /* 딜러코드 */
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:250 }                                        /* 딜러명 */
            ,{field:"upStdt", title:"<spring:message code='sal.lbl.UploadImprovTime' />", width:200
                , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm:00}"}     /* 업로드가능시점 */
            ,{field:"upEddt", title:"<spring:message code='sal.lbl.UploadEndTime' />", width:200
                , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' /> HH:mm:00}"}        /* 업로드마감시점 */
            ,{field:"controlChk", title:"<spring:message code='sal.lbl.ctrlYn' />", width:100, attributes:{"class":"ac"}
                ,template:"# if(controlChkListMap[controlChk] != null) { # #= controlChkListMap[controlChk].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input name="controlChk" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         autoBind:false
                        ,dataSource:controlChkList
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                    })
                    $('<span class="k-invalid-msg" data-for="controlChk"></span>').appendTo(container);
                }

            }           /* 딜러통제범위 */
            ,{field:"updtUsrId", title:"<spring:message code='sal.lbl.lastUpdtUser' />", width:150, attributes:{"class":"ac"}}      /* 최종수정자 */
            ,{field:"updtDt", title:"<spring:message code='sal.lbl.lastUpdtDt' />", width:150, attributes:{"class":"ac"}}           /* 최종수정일자 */
        ]
    });
    // 영수증업로드시간대관리 그리드 종료

});


</script>
<!-- [DMS] 영수증업로드시간대관리 -->