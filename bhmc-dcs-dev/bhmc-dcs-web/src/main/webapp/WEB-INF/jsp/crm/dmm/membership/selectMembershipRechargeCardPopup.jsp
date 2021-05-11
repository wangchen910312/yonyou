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
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/dmm/membershipCard/insertMembershipCardUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">충전카드번호</span></th> <!-- 충전카드번호 -->
                    <td colspan="2" class="required_area">
                        <div class="form_search">
                            <input id="cardNo" name="cardNo" class="form_input" placeholder="" data-json-obj="true" /><!-- // 충전카드 조회 -->
                            <a href="javascript:;" id="rechargeCardSearch"><spring:message code="crm.title.porintCardSearch"/><!-- 포인트카드 조회 --></a>
                            <!-- <input type="hidden" id="cardTpCd" name="cardTpCd" data-json-obj="true" > -->
                            <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rchgAmt'/></span></th> <!-- 충전금액 -->
                    <td  colspan="2" >
                        <input id="occrPointVal" name="occrPointVal" class="form_numberic" maxlength="10"/>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>

    <div id="progressSection"></div>
<!--
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
     -->
</section>

<script type="text/javascript">
var dlrCd = "${dlrCd}";
var membershipNo = "${membershipNo}";
var cardTpCd = "${cardTpCd}";
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

    $("#occrPointVal").kendoExtNumericTextBox({
        format:"n0"
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#sCardTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cardTpList
        , index:0
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            if(dms.string.isEmpty($("#cardNo").val())){

                //충전카드번호은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgCardNo' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }

            if(dms.string.isEmpty($("#occrPointVal").val())){
                //충전금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }

            if($("#occrPointVal").data("kendoExtNumericTextBox").value() <= 0){
                //충전금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }

            // form 데이터
            var param =
                $("#transForm").serializeObject(
                    $("#transForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            param["dlrCd"] = dlrCd;
            param["cardNo"] = $("#cardNo").val();
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;
            param["pointTp"] = "+";
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["realTotAmt"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["extcTargYn"] = "Y";
            param["insertFlag"] = "02";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용

            var url = "<c:url value='/crm/dmm/membership/insertRechargeCard.do' />";

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    parent.$('#cardListGrid').data('kendoExtGrid').dataSource.read();
                    parent.membershipCardSearch.close();
                }
            }).done(function(result) {
                console.log("rechargCardSave Done!!!!");
            });
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

                        params["sCardTpCd"]   = cardTpCd;
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

    /*************************************************************
     * 포인트카드 검색팝업
     *************************************************************/
    $("#rechargeCardSearch").click(function(){

        // form 데이터
        var param = {};
        param["sDlrCd"] = dlrCd;
        param["sCardTpCd"] = "02";

        var url = "<c:url value='/crm/dmm/membershipCard/selectMembershipCardOne.do'/>";

        $.ajax({
            url:url
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                console.log(jqXHR);
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result){
                $("#cardNo").val(result.cardNo);
            }
        }).done(function(result) {
            console.log("rechargCardSave Done!!!!");
        });
    });

});


</script>









