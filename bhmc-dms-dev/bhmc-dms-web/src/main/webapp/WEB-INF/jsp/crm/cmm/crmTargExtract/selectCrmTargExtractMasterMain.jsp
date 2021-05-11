<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

    <!-- 고객추출 -->
    <div id="resizableContainer">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="crm.menu.crmTargExTractMaster" /></h1>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11381" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearchTarg"><spring:message code="global.btn.search" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11382" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_add" id="btnAddTarg"><spring:message code='crm.btn.crmTargExtractAdd' /></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearchTarg">
                <table>
                    <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                    <tbody>
                        <tr><!-- 추출 조건 명 -->
                            <th scope="row"><spring:message code='crm.lbl.custExtrTermNm' /></th>
                            <td>
                                <input id="sDlrCd" name="sDlrCd" type="hidden">
                                <input id="sCustExtrTermNo" name="sCustExtrTermNo" type="hidden">
                                <input id="sCustExtrTermNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRegFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRegEndDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 고객추출 마스터 그리드 -->
            <div class="table_grid mt10">
                <div id="targExtactMasterGrid"></div>
            </div>
            <!-- //고객추출 마스터 그리드 -->

            <div class="header_area">
                <h2 class="title_basic"><spring:message code='crm.title.crmTargExtractDetail' /></h2>
            </div>

            <!-- 고객추출 상세 그리드 -->
            <div class="table_grid">
                <div id="targExtactDetailGrid" class="resizable_grid"></div>
            </div>
            <!-- //고객추출 상세 그리드 -->
        </section>
    </div>



<script type="text/javascript">

/**
* hyperlink in grid event
*/
$(document).on("click", ".linkCustExtrTermNo", function(e){

     var grid = $("#targExtactMasterGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     var dataItem = grid.dataItem(row);

     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sDlrCd="+dataItem.dlrCd+"&sCustExtrTermNo="+dataItem.custExtrTermNo); // RO Main
 });

//검색조건 : 등록일 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    //if(dms.string.isEmpty($(this).val())){return;}
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

$(document).ready(function() {

  //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 등록일(FROM)
    $("#sRegFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 등록일(TO)
    $("#sRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //버튼 - 공통코드그룹 조회
    $("#btnSearchTarg").kendoButton({
        click:function(e) {
            if(crmJs.isDateValidPeriod($("#sRegFromDt").data("kendoExtMaskedDatePicker").value()
                    ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                $('#targExtactMasterGrid').data('kendoExtGrid').dataSource.page(1);
            }else{
                $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sRegEndDt").focus();
                return false;
            }
        }
    });


    //버튼 - 공통코드그룹 추가
    $("#btnAddTarg").kendoButton({
        click:function(e){
            var sDlrCd = $("#sDlrCd").val();
            var sCustExtrTermNo = "";
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sDlrCd="+sDlrCd+"&sCustExtrTermNo="+sCustExtrTermNo); //개인 고객 등록
        }
    });


    //고객추출 마스터 그리드
    $("#targExtactMasterGrid").kendoExtGrid({
        gridId:"G-CRM-0725-190301"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCustExtrTermNm"] = $("#sCustExtrTermNm").val();
                        params["sRegFromDt"]      = $("#sRegFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRegEndDt"]       = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"custExtrTermNo"
                    ,fields:{
                         rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,custExtrTermNo:{type:"string", editable:false}
                        ,custExtrTermNm:{type:"string", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,regDtFormat:{type:"date", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,updtDt:{type:"date", editable:false}
                        ,updtDtFormat:{type:"date", editable:false}
                        ,updtUsrId:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,dataBinding:function(e) {
            $("#targExtactDetailGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:288
        ,selectable:"row"
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:true          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}
            ,{field:"custExtrTermNo", title:"<spring:message code='crm.lbl.custExtrTermNm' />", hidden:true}
            ,{field:"custExtrTermNm", title:"<spring:message code='crm.lbl.custExtrTermNm' />", width:300, attributes:{"class":"al"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkCustExtrTermNo'>"+dataItem.custExtrTermNm+"</a>";
                    return spanObj;
                }
            }
//            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
            }
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
            ,{field:"updtDtFormat", title:"<spring:message code='global.lbl.updtDt' />", width:100   // 수정일
                ,attributes:{"class":"ac"}
                ,template:"#if (updtDt !== null ){# #= kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }
            ,{field:"updtUsrId", title:"<spring:message code='global.lbl.updtUsrId' />", width:100, attributes:{"class":"ac"}}
        ]
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            $("#targExtactDetailGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //대상자 고객추출 상세 그리드
    $("#targExtactDetailGrid").kendoExtGrid({
      gridId:"G-CRM-0725-190302"
      ,dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetails.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      var grid = $('#targExtactMasterGrid').data('kendoExtGrid');
                      var selectedItem = grid.dataItem(grid.select());
                      var dlrCd = "";
                      var custExtrTermNo = "";
                      if(selectedItem!=null)  {
                          dlrCd = selectedItem.dlrCd;
                          custExtrTermNo = selectedItem.custExtrTermNo;
                      }

                      params["sDlrCd"] = dlrCd;
                      params["sCustExtrTermNo"] = custExtrTermNo;

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"cmmCd"
                  ,fields:{
                       rnum:{type:"number", editable:false}
                      ,dlrCd:{type:"string", editable:false}
                      ,custExtrTermNo:{type:"string", editable:false}
                      ,detlExtrTermCd:{type:"string", editable:false}
                      ,detlExtrTermNm:{type:"string", editable:false}
                      ,termVal1:{type:"string", editable:false}
                  }
              }
          }
      }
      ,autoBind:false
      , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      , appendEmptyColumn:true          //빈컬럼 적용. default:false
      , enableTooltip:true               //Tooltip 적용, default:false
      ,filterable:false
      ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}
          ,{field:"custExtrTermNo", title:"<spring:message code='crm.lbl.custExtrTermNm' />", hidden:true}
          ,{field:"detlExtrTermCd", title:"<spring:message code='crm.lbl.detlExtrTermCd' />", hidden:true}
          ,{field:"detlExtrTermNm", title:"<spring:message code='crm.lbl.detlExtrTermCd' />", width:200}
          ,{field:"termVal1", title:"<spring:message code='crm.lbl.termVal' />", width:400}
      ]

    });
});
</script>