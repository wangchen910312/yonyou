<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:600px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
            <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/dmm/membershipCard/insertMembershipCardUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"> <spring:message code='global.lbl.cardNo'/> </th> <!-- 카드번호 -->
                    <td>
                        <input type="text" id="sCardNo" name="sCardNo" class="form_input" maxlength="30">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.regDt'/></th> <!-- 등록일 -->
                    <td>
                         <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker" data-type="maskDate" >
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" name="sEndDt" class="form_datepicker" data-type="maskDate" >
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.cardTpCd'/></th> <!-- 카드종류 -->
                    <td>
                        <input id="sCardTpCd" name="sCardTpCd" class="form_select">
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>

    <div id="progressSection"></div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
var options = parent.membershipCardSearch.options.content.data;

/*************************************************************
 *드랍다운 리스트 셋팅
 *************************************************************/
 //카드종류구분 Array
 var cardTpList = [{"cmmCd":"", "cmmCdNm":""}];
 <c:forEach var="obj" items="${cardTpCdList}">
 cardTpList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>
 //카드종류구분 Map
 var cardTpMap = [];
 $.each(cardTpList, function(idx, obj){
     cardTpMap[obj.cmmCd] = obj.cmmCdNm;
 });

 //카드형태구분 Array
 var cardFormList = [{"cmmCd":"", "cmmCdNm":""}];
 <c:forEach var="obj" items="${cardFormCdList}">
 cardFormList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>
 //카드형태구분 Map
 var cardFormMap = [];
 $.each(cardFormList, function(idx, obj){
     cardFormMap[obj.cmmCd] = obj.cmmCdNm;
 });


$(document).ready(function() {

    $("#sCardTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cardTpList
        , index:0
    });

    //조회조건-등록일일 선택
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //버튼 - 파일업로드
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                })
                options.callbackFunc(data);
                parent.membershipCardSearch.close();
            } else {
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

       }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membershipCard/selectMembershipCardPopups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCardNo"]       = $("#sCardNo").val();
                        params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sCardTpCd"]   = $("#sCardTpCd").val();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                    model:{
                        id:"seq"
                        ,fields:{
                            dlrCd:{type:"string"}
                            ,pltCd:{type:"string"}
                            ,seq:{type:"string"}
                            ,membershipSeq:{type:"string"}
                            ,cardTpCd:{type:"string", validation:{required:true}} //카드종류
                            ,cardNo:{type:"string", validation:{required:true}} //카드번호
                            ,cardUseDt:{type:"date",  validation:{required:true}} // 카드사용기한
                            ,cardFormCd:{type:"string", validation:{required:true}} //카드형태
                        }
                    }
            }
        }
        ,height:250
        ,pageable:{
            info:true
        }
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        ,editable:false
        ,multiSelectWithCheckbox:false
        ,selectable:"row"
        ,columns:[
          /*  {title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            } */
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
           ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}// 사업장코드
           ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo' />"}// 카드번호
           ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd' />"
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardTpList
                   });
                }
               ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
           }// 카드종류
           ,{field:"cardUseDt", title:"<spring:message code='global.lbl.cardUseDt'/>"
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
               ,editor:function(container, options) {
                   $('<input required name="cardUseDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' />"
                       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                   });
                   $('<span class="k-invalid-msg" data-for="cardUseDt"></span>').appendTo(container);
               }
           }// 사용기한
           ,{field:"cardFormCd", title:"<spring:message code='global.lbl.cardFormCd'/>"
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardFormList
                   });
                }
               ,template:'#if(cardFormCd !== ""){# #= cardFormMap[cardFormCd]# #}#'
           }// 카드형태
        ]
    });

});
</script>









