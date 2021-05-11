<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 마감시간통계 -->
<div id="resizableContainer">
    <section class="group">
    <!-- 20201217 DCS战略终端控制功能隐藏 from bhit updateby sunzq3 start -->
        <div class="left_areaStyle" style="display: none;">
        <!-- <div class="left_areaStyle"> -->
    <!-- 20201217 DCS战略终端控制功能隐藏 from bhit updateby sunzq3 end -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="sal.title.oneShotLeftTitle" /></h1><!-- 전략출고공제 -->
                    <div class="btn_right">
                        <%-- <button type="button" class="btn_m" id="btnExcelImportLeft"><spring:message code="global.btn.excelImport" /></button> --%><!-- 엑셀임포트 -->
                        <button type="button" class="btn_m btn_search" id="btnSearchLeft"><spring:message code='global.btn.search' /></button><!-- 조회 -->

                        <button type="button" class="btn_m btn_save" id="btnAllOpnSaveLeft"><spring:message code='global.btn.allOpnSave' /></button><!-- 전체해제 -->
                        <button type="button" class="btn_m btn_save" id="btnAllClsSaveLeft"><spring:message code='global.btn.allClsSave' /></button><!-- 전체통제 -->

                        <button type="button" class="btn_m btn_save" id="btnSaveLeft"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearchLeft">
                    <table>
                        <colgroup>
                            <col style="width:18%;">
                            <col style="width:27%;">
                            <col style="width:10%;">
                            <col style="width:25%;">
                            <col style="width:5%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.dlrType' />　</th><!-- 딜러유형 -->
                                <td>
                                    <input type="radio" id="sDlrTypeLeft" name="sDlrTypeLeft" value="" class="form_check"><spring:message code='sal.lbl.all' /><!-- 전부 -->
                                    <input type="radio" id="sDlrTypeLeft" name="sDlrTypeLeft" value="4S" class="form_check"><spring:message code='sal.lbl.fourThDlr' /><!-- 4s점 -->
                                    <input type="radio" id="sDlrTypeLeft" name="sDlrTypeLeft" value="SP" class="form_check"><spring:message code='sal.lbl.specialDlr' /><!-- 특수딜러 -->
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='al.lbl.onKeyStat' />　</th><!-- One key 공제상태 -->
                                <td>
                                    <input type="radio" id="sCtrlYnLeft" name="sCtrlYnLeft" value="" class="form_check"><spring:message code='sal.lbl.all' /><!-- 전부 -->
                                    <input type="radio" id="sCtrlYnLeft" name="sCtrlYnLeft" value="N" class="form_check"><spring:message code='sal.lbl.openFlag' /><!-- OPEN -->
                                    <input type="radio" id="sCtrlYnLeft" name="sCtrlYnLeft" value="Y" class="form_check"><spring:message code='sal.lbl.closeFlag' /><!-- OFF -->
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.division' /></th><!-- 사업부 -->
                                <td>
                                    <input id="sDiviCdL" type="text" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                                <td>
                                    <input id="sOffCdL" type="text" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.dlrCd' />　</th><!-- 딜러코드 -->
                                <td>
                                    <input type="text" class="form_input" id="sDlrCdLeft" style="width:50%;" maxlength="5" onkeyup="this.value=this.value.toUpperCase()"/>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form">
                    <tbody>
                        <table>
                            <colgroup>
                                <col style="width:18%;">
                                <col style="width:27%;">
                                <col style="width:20%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.openDateTime' />　</th><!-- Open시간 -->
                                <td colspan="4">
                                    <input type="text" id="onShotStatL" name="onShotStatL" class="form_comboBox" style="width:20%;">
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </table>
                    </tbody>
                </div>
                <div class="table_grid mt10">
                    <div id="leftGrid"></div>
                </div>
            </section>
        </div>
<!-- 20201217 DCS战略终端控制功能隐藏 from bhit updateby sunzq3 start -->
        <div class="right_areaStyle" style="width:100%">
        <!-- <div class="right_areaStyle" > -->
<!-- 20201217 DCS战略终端控制功能隐藏 from bhit updateby sunzq3 end -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="sal.title.oneShotRightTitle" /></h1>
                    <div class="btn_right">
                        <%-- <button type="button" class="btn_m" id="btnExcelImportRight"><spring:message code="global.btn.excelImport" /> --%></button><!-- 엑셀임포트 -->
                        <button type="button" class="btn_m btn_search" id="btnSearchRight"><spring:message code='global.btn.search' /></button><!-- 조회 -->

                        <button type="button" class="btn_m btn_save" id="btnAllOpnSaveRight"><spring:message code='global.btn.allOpnSave' /></button><!-- 전체해제 -->
                        <button type="button" class="btn_m btn_save" id="btnAllClsSaveRight"><spring:message code='global.btn.allClsSave' /></button><!-- 전체통제 -->

                        <button type="button" class="btn_m btn_save" id="btnSaveRight"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearchRight">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:18%;">
                            <col style="width:27%;">
                            <col style="width:10%;">
                            <col style="width:25%;">
                            <col style="width:5%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.dlrType' />　</th><!-- 딜러유형 -->
                                <td>
                                    <input type="radio" id="sDlrTypeRight" name="sDlrTypeRight" value="" class="form_check"><spring:message code='sal.lbl.all' /><!-- 전부 -->
                                    <input type="radio" id="sDlrTypeRight" name="sDlrTypeRight" value="4S" class="form_check"><spring:message code='sal.lbl.fourThDlr' /><!-- 4s점 -->
                                    <input type="radio" id="sDlrTypeRight" name="sDlrTypeRight" value="SP" class="form_check"><spring:message code='sal.lbl.specialDlr' /><!-- 특수딜러 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.onKeyStat' />　</th><!-- One key 공제상태 -->
                                <td>
                                    <input type="radio" id="sCtrlYnRight" name="sCtrlYnRight" value="" class="form_check"><spring:message code='sal.lbl.all' /><!-- 전부 -->
                                    <input type="radio" id="sCtrlYnRight" name="sCtrlYnRight" value="N" class="form_check"><spring:message code='sal.lbl.openFlag' /><!-- OPEN -->
                                    <input type="radio" id="sCtrlYnRight" name="sCtrlYnRight" value="Y" class="form_check"><spring:message code='sal.lbl.closeFlag' /><!-- OFF -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.division' /></th><!-- 사업부 -->
                                <td>
                                    <input id="sDiviCdR" type="text" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                                <td>
                                    <input id="sOffCdR" type="text" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.dlrCd' />　</th><!-- 딜러코드 -->
                                <td>
                                    <input type="text" class="form_input" id="sDlrCdRight" style="width:50%;" maxlength="5" onkeyup="this.value=this.value.toUpperCase()"/>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form">
                    <tbody>
                        <table>
                            <colgroup>
                                <col style="width:18%;">
                                <col style="width:27%;">
                                <col style="width:20%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.openDateTime' />　</th><!-- Open시간 -->
                                <td colspan="4">
                                    <input type="text" id="onShotStatR" name="onShotStatR" class="form_comboBox" style="width:20%;">
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </table>
                    </tbody>
                </div>
                <div class="table_grid mt10">
                    <div id="rightGrid"></div>
                </div>
            </section>
        </div>
    </section>
</div>

<script type="text/javascript">

var oneDay = "${oneDay}"+" 00:00:00";   // 해당월 1일
var lastDay = "${lastDay}"+" 23:59:59"; // 해당월 마지막일자
var toDay = "${toDay}"+" 23:59:59";     // 오늘 일자

//원샷마감통제상태(SAL189)
var onShotStatCdDs = [];
var onShotStatObj = {};
<c:forEach var="obj" items="${onShotStatList}">
    <c:if test="${obj.cmmCd eq 'Y' || obj.cmmCd eq 'N'}">
      onShotStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    onShotStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/************* 사업부 SELECT BOX  *******************/
var divisionCdDs = [];
<c:forEach var="obj" items="${sdptCdList}">
divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
</c:forEach>
var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd;});
/************* 사업부 SELECT BOX  *******************/

save = function(courseTp) {

    var saveData;
    var saveFlag = true;

    var arrSave = [];

    var grid = [];

    if(courseTp == "L"){
        grid = $("#leftGrid").data("kendoExtGrid");
    }else{
        grid = $("#rightGrid").data("kendoExtGrid");
    }

    var rows = grid.select();

    if(rows.length  == 0 ){
        dms.notification.warning("<spring:message code='global.lbl.saveData' var='saveData' /><spring:message code='global.info.chkSelectItemMsg' arguments='${saveData}' />");
        return false;
    }else{
        rows.each(function(index, row) {
            var dataItem = grid.dataItem(row);

            var check = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

            if(check){
                arrSave.push(dataItem);
            }
        });
    }

    var ctrlYn;
    var startDtTm;
    var endDtTm;

    if(courseTp == "L"){
        ctrlYn = $("#onShotStatL").data("kendoExtDropDownList").value();
    }else{
        ctrlYn = $("#onShotStatR").data("kendoExtDropDownList").value();
    }

    saveData = { "courseTp":courseTp
                ,"ctrlYn":ctrlYn
                ,"updateList":arrSave};

    $.ajax({
        url:"<c:url value='/sal/ctl/oneShotControl/saveOneShotCtrlMng.do' />"
        ,data:JSON.stringify(saveData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(request,status,error){
            dms.notification.error(request.responseJSON.errors[0].errorMessage);
         }
        ,success:function(jqXHR, textStatus) {

            grid.dataSource._destroyed = [];
            grid.dataSource.page(1);

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

saveAll = function(courseTp) {
    var ctrlYn = "";
    var grid, taget, url;

    if(courseTp == "AO"){       // 좌측 전략출고통제 전체해제저장
        ctrlYn = "N";
        grid = $("#leftGrid").data("kendoExtGrid");
        taget = $(".left_areaStyle");
        url = "<c:url value='/sal/ctl/oneShotControl/saveOneShotCtrlMngAll.do' />";
    }else if(courseTp == "AC"){ // 좌측 전략출고통제 전체통제저장
        ctrlYn = "Y";
        grid = $("#leftGrid").data("kendoExtGrid");
        taget = $(".left_areaStyle");
        url = "<c:url value='/sal/ctl/oneShotControl/saveOneShotCtrlMngAll.do' />";
    }else if(courseTp == "BO"){ // 우측 출고통제 전체해제저장
        ctrlYn = "N";
        grid = $("#rightGrid").data("kendoExtGrid");
        taget = $(".right_areaStyle");
        url = "<c:url value='/sal/ctl/oneShotControl/saveOneShotCtrlMngRightAll.do' />";
    }else if(courseTp == "BC"){ // 우측 출고통제 전체통제저장
        ctrlYn = "Y";
        grid = $("#rightGrid").data("kendoExtGrid");
        taget = $(".right_areaStyle");
        url = "<c:url value='/sal/ctl/oneShotControl/saveOneShotCtrlMngRightAll.do' />";
    }else{
        return false;
    }

    saveData = {"ctrlYn":ctrlYn};

    $.ajax({
        url:url
        ,data:JSON.stringify(saveData)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,beforeSend:function(xhr) {
            dms.loading.show(taget);
        }
        ,complete:function(xhr, status) {
            dms.loading.hide(taget);
        }
        ,error:function(request,status,error){
            dms.loading.hide(taget);
            dms.notification.error(request.responseJSON.errors[0].errorMessage);
         }
        ,success:function(jqXHR, textStatus) {

            grid.dataSource._destroyed = [];
            grid.dataSource.page(1);

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

$(document).ready(function() {

  //원샷마감통제상태(SAL189)
    $("#onShotStatL").kendoExtDropDownList({
         dataTextField: "cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:onShotStatCdDs
        ,optionLabel:""   // 전체
    });

    //원샷마감통제상태(SAL189)
    $("#onShotStatR").kendoExtDropDownList({
         dataTextField: "cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:onShotStatCdDs
        ,optionLabel:""   // 전체
    });

    //사업부
    $("#sDiviCdL").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCdL").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCdL").data("kendoExtDropDownList").enable(true);


           if(dataItem.diviCd == ""){
               $("#sOffCdL").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCdL").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });

           $("#sOffCdL").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    //사무소
    $("#sOffCdL").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
        ,dataValueField:"distOfficeCd"
        ,optionLabel:" "   // 전체
    });
    $("#sOffCdL").data("kendoExtDropDownList").enable(false);

    //사업부
    $("#sDiviCdR").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCdR").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCdR").data("kendoExtDropDownList").enable(true);


           if(dataItem.diviCd == ""){
               $("#sOffCdR").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCdR").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });

           $("#sOffCdR").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    //사무소
    $("#sOffCdR").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
        ,dataValueField:"distOfficeCd"
        ,optionLabel:" "   // 전체
    });
    $("#sOffCdR").data("kendoExtDropDownList").enable(false);

    //그리드 설정
    $("#leftGrid").kendoExtGrid({
        gridId:"G-SAL-1110-145501"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectOneShotCtrlMngLeft.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrTpL"]= $('input:radio[id=sDlrTypeLeft]:checked').val();         // 딜러유형
                        params["sCtrlYnLeft"]= $('input:radio[id=sCtrlYnLeft]:checked').val();      // OneKey공제상태

                        params["sDiviCdL"] = $("#sDiviCdL").data("kendoExtDropDownList").value();   // 좌측사업부
                        params["sOffCdL"] = $("#sOffCdL").data("kendoExtDropDownList").value();     // 좌측사무소

                        params["sDlrCdLeft"]= $("#sDlrCdLeft").val();                               // 딜러코드

                        console.log('grid params:',kendo.stringify(params) );

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ctrlYn"
                    ,fields:{
                        ctrlYn       :{type:"string"}
                       ,sdptNm       :{type:"string"}
                       ,distOfficeNm :{type:"string"}
                       ,dlrCd        :{type:"string"}
                       ,dlrNm        :{type:"string"}
                       ,ctrlSeq      :{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editable:false
        ,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                  {field:"ctrlSeq",      hidden:true}
                 ,{field:"ctrlYn",       title:"<spring:message code = 'sal.lbl.onKeyStat'/>",   width:80 ,attributes:{"class":"ac"} ,template:"#=dms.string.strNvl(onShotStatObj[ctrlYn])#"} //상태
                 ,{field:"sdptNm",       title:"<spring:message code = 'global.lbl.division'/>", width:80 ,attributes:{"class":"ac"}}        //사업부
                 ,{field:"distOfficeNm", title:"<spring:message code = 'sal.lbl.officeNm'/>",    width:80 ,attributes:{"class":"ac"}}        //사무소
                 ,{field:"dlrCd",        title:"<spring:message code = 'global.lbl.dlrCd'/>",    width:60 ,attributes:{"class":"ac"}}        //딜러코드
                 ,{field:"dlrNm",        title:"<spring:message code = 'global.lbl.dlrNm'/>",    width:120 ,attributes:{"class":"al"}}        //딜러이름
                 ]
    });

    //그리드 설정
    $("#rightGrid").kendoExtGrid({
        gridId:"G-SAL-1110-154001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectOneShotCtrlMngRight.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrTpR"]= $('input:radio[id=sDlrTypeRight]:checked').val();          // 딜러유형
                        params["sCtrlYnRight"]= $('input:radio[id=sCtrlYnRight]:checked').val();      // OneKey공제상태

                        params["sDiviCdR"] = $("#sDiviCdR").data("kendoExtDropDownList").value();   // 우측사업부
                        params["sOffCdR"] = $("#sOffCdR").data("kendoExtDropDownList").value();     // 우측사무소

                        params["sDlrCdRight"]= $("#sDlrCdRight").val();                               // 딜러코드

                        console.log('grid params:',kendo.stringify(params) );

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ctrlYn"
                    ,fields:{
                        ctrlYn       :{type:"string"}
                       ,sdptNm       :{type:"string"}
                       ,distOfficeNm :{type:"string"}
                       ,dlrCd        :{type:"string"}
                       ,dlrNm        :{type:"string"}
                       ,ctrlSeq      :{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,autoBind:false
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                  {field:"ctrlSeq",      hidden:true}
                 ,{field:"ctrlYn",       title:"<spring:message code = 'sal.lbl.onKeyStat'/>",   width:80 ,attributes:{"class":"ac"} ,template:"#=dms.string.strNvl(onShotStatObj[ctrlYn])#"} //상태
                 ,{field:"sdptNm",       title:"<spring:message code = 'global.lbl.division'/>", width:80 ,attributes:{"class":"ac"}}        //사업부
                 ,{field:"distOfficeNm", title:"<spring:message code = 'sal.lbl.officeNm'/>",    width:80 ,attributes:{"class":"ac"}}        //사무소
                 ,{field:"dlrCd",        title:"<spring:message code = 'global.lbl.dlrCd'/>",    width:60 ,attributes:{"class":"ac"}}        //딜러코드
                 ,{field:"dlrNm",        title:"<spring:message code = 'global.lbl.dlrNm'/>",    width:120 ,attributes:{"class":"al"}}        //딜러이름
                 ]
    });

    $("#sDlrTypeLeft").prop("checked", true);
    $("#sCtrlYnLeft").prop("checked", true);
    $("#sDlrTypeRight").prop("checked", true);
    $("#sCtrlYnRight").prop("checked", true);
    //changedRadio(true);
});
/* document.ready end */

    //좌측 전략출고통제 엑셀
    $("#btnExcelImportLeft").kendoButton({
        click:function(e) {

            corpStockConditionUploadPopupWin = dms.window.popup({
                title:"<spring:message code='sal.title.corpStockConditionUpload' />"
                ,windowId:"oneShotCtrlMngLeftUploadPopupL"
                ,content:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectOneShotCtrlMngUploadPopupL.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });

    //우측 소매출고,소매출고취소,전략출고취소 엑셀
    $("#btnExcelImportRight").kendoButton({
        click:function(e) {
            alert("우측엑셀");
        }
    });

    //좌측 전략출고통제 조회
    $("#btnSearchLeft").kendoButton({
        click:function(e) {

            $('#leftGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //우측 소매출고,소매출고취소,전략출고취소 조회
    $("#btnSearchRight").kendoButton({
        click:function(e) {

            $('#rightGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });



   //좌측 전략출고통제 저장
    $("#btnSaveLeft").kendoButton({
        click:function(e){
            save("L");
        }
    });

    //좌측 전략출고통제 전체해제저장
    $("#btnAllOpnSaveLeft").kendoButton({
        click:function(e){
            saveAll("AO");
        }
    });

    //좌측 전략출고통제 전체통제저장
    $("#btnAllClsSaveLeft").kendoButton({
        click:function(e){
            saveAll("AC");
        }
    });

    //우측 출고통제 전체해제저장
    $("#btnAllOpnSaveRight").kendoButton({
        click:function(e){
            saveAll("BO");
        }
    });

    //우측 출고통제 전체통제저장
    $("#btnAllClsSaveRight").kendoButton({
        click:function(e){
            saveAll("BC");
        }
    });

    //우측 소매출고,소매출고취소,전략출고취소 저장
    $("#btnSaveRight").kendoButton({
        click:function(e) {
            save("R");
        }
    });
</script>