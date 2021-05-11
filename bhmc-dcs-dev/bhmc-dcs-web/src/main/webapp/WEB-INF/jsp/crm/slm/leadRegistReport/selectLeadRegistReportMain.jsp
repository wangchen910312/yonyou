<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 조회영역 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.leadSearch" /><!-- 리드조회 --></h1>
                    <div class="btn_right">
                        <button class="btn_m btn_save" id="btnLeadSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnLeadSearch">
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
                                <th scope="row"><spring:message code='global.lbl.leadSrc' /><!-- 리드 출처 --></th>
                                <td>
                                    <input id="sLeadSrcCd" name="sLeadSrcCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.leadTp' /><!-- 리드유형 --></th>
                                <td>
                                    <input id="sLeadTp" name="sLeadTp" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sMngScId" name="sMngScId" class="form_comboBox"  data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.statNm' /></th> <!-- 상태 -->
                                <td>
                                    <input id="sStatCd" name="sStatCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNm" name="sCustNm" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //조회영역 -->

            <!-- 탭메뉴 전체 영역 -->
            <div  id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code='global.lbl.lead' /><!-- 리드 --></li>
                    <li><spring:message code='global.lbl.leadDup' /><!-- 중복 리드 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 탭내용1 -->
                <div>
                    <div class="table_grid">
                        <div id="leadGrid"></div>
                    </div>
                </div>
                <!-- //탭내용1 -->

                <!-- 탭내용2 -->
                <div>
                    <div class="table_grid">
                        <div id="leadDupGrid"></div>
                    </div>
                </div>
                <!-- //탭내용2 -->
            </div>
            <!-- //탭메뉴 전체 영역 -->

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">

var leadSrcList = [];
var leadTpList = [];
var statList = [];
var ynCdList = [];

// 담당SC
//var roleUsersList = [{"cmmCd":"00", "cmmCdNm":"<spring:message code='global.lbl.unAssign' />"}];
var roleUsersList = [];

var leadSrcMap = [];
var statMap = [];
var leadTpMap = [];
var ynCdMap = [];

<c:forEach var="obj" items="${leadSrcList}">
leadSrcList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${statList}">
statList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${leadTpList}">
leadTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
leadTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${roleUsers}">
roleUsersList.push({"cmmCd":"${obj.refId}" , "cmmCdNm":"${obj.usrNm}"});
</c:forEach>

ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
ynCdMap["Y"] = "<spring:message code='global.lbl.yes' />";
ynCdMap["N"] = "<spring:message code='global.lbl.n' />";

/**
 * hyperlink in grid event
 */
 $(document).on("click", ".linkCust", function(e){

      var grid = $("#grid").data("kendoExtGrid"),
      row = $(e.target).closest("tr");
      var dataItem = grid.dataItem(row);

      window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
 });

$(document).ready(function() {
    // 리드출처(검색).   sLeadSrcCd
    $("#sLeadSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:leadSrcList
        , index:0
    });

    // 리드유형
    $("#sLeadTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:leadTpList
        , index:0
    });

    // 상태(검색).   statList
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:statList
        , index:0
    });

    // 판매고문
    $("#sMngScId").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:roleUsersList
        , index:0
    });

    // 등록일
    $("#sRegDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 등록일
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var callUrl;
            console.log(selectTabId);

        }
    });

    // 리드 조회
    $("#btnLeadSearch").kendoButton({
        click:function(e) {
            $("#leadGrid").data("kendoExtGrid").dataSource.read();
            $("#leadDupGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    /******************************************************
     * 리드 그리드 - 시작
     ******************************************************/
     // 리드 그리드
     $("#leadGrid").kendoExtGrid({
       dataSource:{
         transport:{
             read:{
                 url:"<c:url value='/crm/slm/leadInfo/selectLeads.do' />"
             }
             ,parameterMap:function(options, operation) {
                 if (operation === "read") {

                     var params = {};

                     var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                     var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                     if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                             (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                     ){
                        dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                     }

                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sLeadTp"] = $("#sLeadTp").data("kendoExtDropDownList").value();
                     params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                     params["sLeadSrcCd"] = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
                     params["sStatCd"] = $("#sStatCd").data("kendoExtDropDownList").value();
                     params["sRegDtFrom"] = sRegDtFrom;
                     params["sRegDtTo"] = sRegDtTo;
                     params["sCustNm"] = $("#sCustNm").val();

                     console.log(params);

                     return kendo.stringify(params);

                 }else if (operation !== "read" && options.models) {
                     return kendo.stringify(options.models);
                 }
             }
         }
         ,schema:{
             errors:"error"
                 ,data:"data"
                 ,total:"total"
                 ,model:{
                     id:"leadNo"
                     ,fields:{
                         leadTp:{type:"string", editable:false}
                         ,hpNo:{type:"string", editable:false}
                         ,telNo:{type:"string", editable:false}
                         ,leadSrcCd:{type:"string", editable:false}
                         ,bhmcYn:{type:"string", editable:false}
                         ,prsnNm:{type:"string", editable:false}
                         ,ddlnDt:{type:"date", editable:false}
                         ,opptChgDt:{type:"date", editable:false}
                         ,regUsrNm:{type:"string", editable:false}
                         ,regDt:{type:"date", editable:false}
                         ,statCd:{type:"string", editable:false}
                     }
                 }
         }
     }
     ,autoBind:false
     ,columns:[
                  {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                    ,attributes:{"class":"ac"}
                  }
                  ,{field:"leadTp", title:"<spring:message code='crm.lbl.leadTp' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (leadTp !== ""){# #= leadTpMap[leadTp]# #}#'
                   }/* 리드유형 */
                  ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}
                      ,template:function(dataItem){
                          var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                          return spanObj;
                      }
                  }/* 고객명 */
                  ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"leadSrcCd", title:"<spring:message code='global.lbl.leadSrc' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (leadSrcCd !== ""){# #= leadSrcMap[leadSrcCd]# #}#'
                  }
                  ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}
                      , attributes:{"class":"ac"}
                      , template:'#if (bhmcYn !== "" && bhmcYn !== null){# #= ynCdMap[bhmcYn]# #} else {# #= ynCdMap[bhmcYn]# #}#'
                  }
                  ,{field:"mngScNm", title:"<spring:message code='crm.lbl.scId' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"prsnNm", title:"<spring:message code='global.lbl.callPrsNm' />", width:100, attributes:{"class":"ac"}} /*콜업무 담당자*/
                  ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (statCd !== ""){# #= statMap[statCd]# #}#'
                  }
                  ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{title:""}

     ]
     ,sortable:true
     });
    /******************************************************
     * 리드 그리드 - 종료
     ******************************************************/

     /******************************************************
      * 중복리드 그리드 - 시작
      ******************************************************/
      // 중복리드 그리드
      $("#leadDupGrid").kendoExtGrid({
        dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/crm/slm/leadInfo/selectLeads.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};

                      var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                      var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                      if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                              (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                      ){
                         dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                         return false;
                      }

                      var sStatCd = $("#sStatCd").data("kendoExtDropDownList").value();

                      if (sStatCd != '04' && sStatCd != '05') {
                          sStatCd = "COMPLATE";
                      }

                      var orderby = [];
                      orderby.push({"dir":"asc" , "field":"custNm"});

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      //params["sort"] = options.sort;
                      params["sort"] = orderby;

                      params["sLeadTp"] = $("#sLeadTp").data("kendoExtDropDownList").value();
                      params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                      params["sLeadSrcCd"] = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
                      params["sRegDtFrom"] = sRegDtFrom;
                      params["sRegDtTo"] = sRegDtTo;
                      params["sStatCd"] = sStatCd;
                      params["sCustNm"] = $("#sCustNm").val();

                      console.log("leadGrid:::");
                      console.log(params);

                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              errors:"error"
                  ,data:"data"
                  ,total:"total"
                  ,model:{
                      id:"leadNo"
                      ,fields:{
                          leadTp:{type:"string", editable:false}
                          ,hpNo:{type:"string", editable:false}
                          ,telNo:{type:"string", editable:false}
                          ,leadSrcCd:{type:"string", editable:false}
                          ,bhmcYn:{type:"string", editable:false}
                          ,prsnNm:{type:"string", editable:false}
                          ,ddlnDt:{type:"date", editable:false}
                          ,opptChgDt:{type:"date", editable:false}
                          ,regUsrNm:{type:"string", editable:false}
                          ,regDt:{type:"date", editable:false}
                          ,statCd:{type:"string", editable:false}
                      }
                  }
          }
      }
      ,autoBind:false
      ,columns:[
                   {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                    ,attributes:{"class":"ac"}
                  }
                  ,{field:"leadTp", title:"<spring:message code='crm.lbl.leadTp' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (leadTp !== ""){# #= leadTpMap[leadTp]# #}#'
                   }/* 리드유형 */
                  ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}
                      ,template:function(dataItem){
                          var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                          return spanObj;
                      }
                  }/* 고객명 */
                  ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"leadSrcCd", title:"<spring:message code='global.lbl.leadSrc' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (leadSrcCd !== ""){# #= leadSrcMap[leadSrcCd]# #}#'
                  }
                  ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}
                      , attributes:{"class":"ac"}
                      , template:'#if (bhmcYn !== "" && bhmcYn !== null){# #= ynCdMap[bhmcYn]# #} else {# #= ynCdMap[bhmcYn]# #}#'
                  }
                  ,{field:"mngScNm", title:"<spring:message code='crm.lbl.scId' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"prsnNm", title:"<spring:message code='global.lbl.callPrsNm' />", width:100, attributes:{"class":"ac"}} /*콜업무 담당자*/
                  ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (statCd !== ""){# #= statMap[statCd]# #}#'
                  }
                  ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{title:""}

      ]
      ,sortable:true
      });
     /******************************************************
      * 중복리드 그리드 - 종료
      ******************************************************/

});

</script>
<!-- //script end -->