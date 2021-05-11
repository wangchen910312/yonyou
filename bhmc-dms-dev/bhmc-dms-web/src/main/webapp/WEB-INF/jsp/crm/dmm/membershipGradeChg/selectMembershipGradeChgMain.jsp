<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"><spring:message code='crm.menu.membershipGradeChg'/><!-- 멤버십 등급조건 설정 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11341" hasPermission="${dms:getPermissionMask('READ')}">
                      <button class="btn_m btn_search" id="btnGradeChgSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
					</dms:access>
                    </div>
                </div>
                <div class="table_form mt5" role="search" data-btnid="btnGradeChgSearch" >
                    <form id="gradeForm" >
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:9%;">
                                <col style="width:20%;">
                                <col style="width:9%;">
                                <col style="width:15%;">
                                <col style="width:9%;">
                                <col style="width:15%;">
                                <col style="width:9%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.membershipNo'/><!-- 멤버십번호 --></th>
                                    <td>
                                        <input type="text" id="sMembershipNo" name="sMembershipNo" class="form_input" />
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.custNm'/><!-- 고객명 --></th>
                                    <td>
                                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.befGradeHisCd'/><!-- 기존등급 --></th>
                                    <td>
                                        <input id="sBefGradeCd" name="sBefGradeCd" class="form_comboBox">
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.aftGradeHisCd'/><!-- 현등급 --></th>
                                    <td>
                                        <input id="sAftGradeCd" name="sAftGradeCd" class="form_comboBox">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.gradeChgHisDt" /><!-- 조정발생시간 --></th>
                                    <td>
                                        <div class="form_float">
                                            <div class="date_left">
                                                <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                                <span class="txt_from">~</span>
                                            </div>
                                            <div class="date_right">
                                                <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"> <spring:message code='crm.lbl.gradeChgHisTp'/><!-- 조정유형 --></th>
                                    <td>
                                        <input id="sGradeChgTp" name="sGradeChgTp" class="form_comboBox" data-json-obj='true'>
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div> <!-- end table -->

                <div class="table_grid mt10">
                    <div id="gradeChgGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
      <!-- //기본정보 -->

    <!-- script 시작  -->
    <script type="text/javascript" charset="UTF-8">


        var gradeCodeSeqList = [{"gradeSeq":"", "gradeNm":""}];
        <c:forEach var="obj" items="${gradeCodeList}">
            gradeCodeSeqList.push({"gradeSeq":"${obj.gradeSeq}", "gradeNm":"${obj.gradeNm}"});
        </c:forEach>
        var gradeCodeListMap = dms.data.arrayToMap(gradeCodeSeqList, function(obj){ return obj.gradeSeq; });

        $(document).ready(function() {

            // 조정발생시간
            $("#sStartDt").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,value:"<c:out value='${sStartDt}' />"
            });
            $("#sEndDt").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,value:"<c:out value='${sEndDt}' />"
            });

            // 조정유형
            $("#sGradeChgTp").kendoExtDropDownList({
                dataSource:[{"text":"<spring:message code='crm.lbl.custExtrAutoYes'/>", "value":"A"},{"text":"<spring:message code='crm.lbl.custExtrAutoNo'/>", "value":"M"}]
                ,dataTextField:"text"
                ,dataValueField:"value"
                ,optionLabel:" "
            });

            // 기존등급
            $("#sBefGradeCd").kendoExtDropDownList({
                dataSource:gradeCodeSeqList
                ,dataValueField:"gradeSeq"
                ,dataTextField:"gradeNm"
            });

            // 현등급
            $("#sAftGradeCd").kendoExtDropDownList({
                dataSource:gradeCodeSeqList
                ,dataValueField:"gradeSeq"
                ,dataTextField:"gradeNm"
            });

            ////버튼 - 조회
            $("#btnGradeChgSearch").kendoButton({
                click:function(e){
                    if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                        $('#gradeChgGrid').data('kendoExtGrid').dataSource.read(1);
                    }else{
                        $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#sEndDt").focus();
                        return false;
                    }
                }
            });

            //그리드 설정
            $("#gradeChgGrid").kendoExtGrid({
                gridId:"G-CRM-0316-213100"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/dmm/membershipGradeChg/selectMembershipGradeChgHis.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"]    = options.pageSize;
                                params["pageIndex"]             = options.page;
                                params["firstIndex"]            = options.skip;
                                params["lastIndex"]             = options.skip + options.take;
                                params["sort"]                  = options.sort;

                                params["sMembershipNo"] = $("#sMembershipNo").val();
                                params["sCustNm"] = $("#sCustNm").val();
                                params["sBefGradeCd"] = $("#sBefGradeCd").data("kendoExtDropDownList").value();
                                params["sAftGradeCd"] = $("#sAftGradeCd").data("kendoExtDropDownList").value();
                                params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                                params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                                params["sGradeChgTp"] = $("#sGradeChgTp").data("kendoExtDropDownList").value();

                                //console.log(params);
                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                            model:{
                                id:"gradeChgHisSeq"
                                ,fields:{
                                    dlrCd:{type:"string"}
                                    ,gradeChgDt:{type:"date", editable:false}
                                    ,gradeChgDtFormat:{type:"date", editable:false}
                                    ,regDt:{type:"date",editable:false}
                                }
                            }
                            ,parse:function(d) {
                                if(d.data){
                                    $.each(d.data, function(idx, elem) {
                                        elem.gradeChgDtFormat = kendo.parseDate(elem.gradeChgDt, "<dms:configValue code='dateFormat' />");
                                    });
                                }
                                return d;
                            }
                    }
                }
                ,multiSelectWithCheckbox:false
                ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:fa
                ,editable:false
                ,sortable:true
                ,selectable:"row"
                ,columns:[
                     {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
                    ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:150, attributes:{"class":"ac"} }// 멤버십 번호
                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>", width:150, attributes:{"class":"al"} }// 고객명
                    ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:150, attributes:{"class":"ac"} }// 이동전화
                    ,{field:"befGradeCd", title:"<spring:message code='crm.lbl.befGradeHisCd'/>",width:120      // 기존등급
                        ,sortable:false
                        ,attributes:{"class":"ac"}
                        ,template:"# if(gradeCodeListMap[befGradeCd] != null) { # #= gradeCodeListMap[befGradeCd].gradeNm# # }#"
                    }
                    ,{field:"aftGradeCd", title:"<spring:message code='crm.lbl.aftGradeHisCd'/>",width:120      // 현등급
                        ,sortable:false
                        ,attributes:{"class":"ac"}
                        ,template:"# if(gradeCodeListMap[aftGradeCd] != null) { # #= gradeCodeListMap[aftGradeCd].gradeNm# # }#"
                    }
                    ,{field:"gradeChgTp", title:"<spring:message code='crm.lbl.gradeChgHisTp'/>", width:100 ,attributes:{"class":"ac"}      // 조정유형
                        ,sortable:false
                        ,template:"#if (gradeChgTp === 'A'){# #= '<spring:message code='crm.lbl.custExtrAutoYes'/>' # #} else {# #= '<spring:message code='crm.lbl.custExtrAutoNo'/>' # #}#"
                    }
                    ,{field:"gradeChgDtFormat", title:"<spring:message code='crm.lbl.gradeChgHisDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:100 } //조정발생시간
                 ]
            });

        }); /* end ready */

    </script>