<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_m btn_save " id="btnInit"><spring:message code="global.btn.init" /></button>
                <button type="button" class="btn_m btn_Save" id="btnSave" ><spring:message code="global.btn.save" /></button>
            </div>
        </div>
        <form id="laborManageForm" name="laborManageForm" method="post" action="/">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:24%;">
                        <col style="width:18%;">
                        <col style="width:24%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.gubun" /></th>
                            <td>
                                <input type="text" id="dstinCd" name="dstinCd" class="form_comboBox" style="width:100%" /> <!-- 구분 -->
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th>
                            <td >
                                <input type="text" id="lbrTp" name="lbrTp"  class="form_comboBox" /> <!-- 수량 -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.lbrCd" /></span></th>
                            <td class="required_area">
                                <input type="text" id="lbrCd" name="lbrCd" maxlength="8" value="" class="form_input" style="width:100%" /> <!-- 공임코드 -->
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.lbrChnNm" /></th>
                            <td class="required_area">
                                <input type="text" id="lbrChnNm" name="lbrChnNm" maxlength="150" class="form_input" style="width:100%" />
                            </td>

                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.lbrEnNm" /></th>
                            <td class="required_area">
                                <input type="text" id="lbrEnNm" name="lbrEnNm" maxlength="150" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.brand' /></th>
                            <td>
                                <input id="brandCd" name="brandCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </section>
</div>
<script type="text/javascript">


//구분
var dstinCdList = [];
<c:forEach var="obj" items="${dstinDs}">
 <c:if test="${obj.cmmCd eq 'E' or obj.cmmCd eq 'G'}" >
    dstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:if>
</c:forEach>
var dstinMap = dms.data.arrayToMap(dstinCdList, function(obj){return obj.cmmCd;});


/** 브랜드 코드 **/
var brandCdList = [];
<c:forEach var="obj" items="${brandCdDs}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});


//수리유형
 var lbrTpCdList =[];
 <c:forEach var="obj" items="${lbrTpCdDs}">
   lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var lbrTpCdMap = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

$(document).ready(function() {

    var parentData = parent.laborRegCodePopup.options.content.data;

    //수리유형
    setLbrTpCdMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(lbrTpCdMap[value] != undefined)
            resultVal = lbrTpCdMap[value].cmmCdNm
        }

        return resultVal;
    };

    //구분
    $("#dstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource   :dstinCdList
       ,value        :'D'
       //,enable : false

    });

    /**  브랜드 **/
    $("#brandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:brandCdList
       ,index:0

    });

    /** 수리유형 **/
    $("#lbrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource: lbrTpCdList
       ,index:0
    });


 // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.laborRegCodePopup.close();
        }
    });


  // 저장버튼
    $("#btnSave").kendoButton({
        click:function (e){

            if(!saveCheckValue()){
                return false;
            }
            //form data
            var saveData =  $("#laborManageForm").serializeObject() ;
            saveData.dstinCd= $("#dstinCd").val();
            //saveData.lbrQty = $("#lbrQty").data("kendoExtNumericTextBox").value();

                $.ajax({
                    url :"<c:url value='/ser/svi/laborManage/insertCheckLaborMaster.do' />"
                   ,data:JSON.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function (jqXHR, textStatus){
                       dms.notification.success("<spring:message code='global.info.success' />");

                       var data = {"dstinCd":$("#dstinCd").data("kendoExtDropDownList").value()};
                       parentData.callbackFunc(data);
                       parent.laborRegCodePopup.close();
                   }
                   ,beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }
                });

        }
    });

    /** 초기화 버튼**/
    $("#btnInit").kendoButton({

        click:function (e){
            initFieldClear();
        }

    });

    /** 필드 초기화**/
    initFieldClear = function(){

        $("#lbrEnNm").val("");
        $("#lbrChnNm").val("");
        $("#lbrCd").val("");


    };

    /** 저장 필수값 체크 **/
    saveCheckValue = function (e){


        var msgText;
        var result = true;
    /*     if( Number(dms.string.defaultString($("#lbrQty").data("kendoExtNumericTextBox").value() ,"0") ) < 1 ) {
            msgText = "<spring:message code='ser.lbl.qty' var='global_lbl_qty' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_qty}' />";
            $("#lbrQty").focus();
            result =  false;

        }else  */
        if(  dms.string.isEmpty($("#lbrCd").val())  ){
            msgText = "<spring:message code='ser.lbl.lbrCd' var='global_lbl_lbrCd' />"+
            "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrCd}' />";
            $("#lbrCd").focus();
            result =  false;

        }else if( dms.string.isEmpty($("#lbrEnNm").val() )  ){
            msgText = "<spring:message code='ser.lbl.lbrEnNm' var='global_lbl_lbrEnNm' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrEnNm}' />";
            $("#lbrEnNm").focus();
            result =  false;

        }else if( dms.string.isEmpty($("#lbrChnNm").val() ) ){
            msgText = "<spring:message code='ser.lbl.lbrChnNm' var='global_lbl_lbrChnNm' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrChnNm}' />";
            $("#lbrChnNm").focus();
            result =  false;
        }

        if(!result) dms.notification.warning(msgText);
        return result;


    };

    $("#lbrCd").bind("keyup",function(){
        $(this).val($(this).val().toUpperCase());
     });

});




</script>