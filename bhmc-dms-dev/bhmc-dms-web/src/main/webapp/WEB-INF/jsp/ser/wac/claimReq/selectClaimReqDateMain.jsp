<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 고객추출 -->
    <div id="resizableContainer">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.menu.claimReqDate" /></h1>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12003" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearchClaimMaster"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearchClaimMaster">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.approveDt" /><!-- 승인일자 --></th>
                            <td colspan="2">
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="hidden" id="dlrCd" name="dlrCd">
                                        <input id="sClaimConfirmFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sClaimConfirmToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" colspan="5">
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일자별 클레임요청 마스터 그리드 -->
            <div class="table_grid">
                <div id="claimDateMasterGrid"></div>
            </div>
            <!-- //일자별 클레임요청 마스터 그리드 -->

            <div class="header_area" >
                <div class="btn_right" style="display:none"> <!-- 隐藏 贾明 2018-9-11  -->
                    <dms:access viewId="VIEW-D-12002" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnSearchClaimDetail"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <!--<button type="button" class="btn_s" id="btnPrintClaimDetail" ><spring:message code="global.btn.print" /></button>  인쇄 -->
                </div>
            </div>

            <div class="table_form" role="search" data-btnid="btnSearchClaimDetail" style="display:none" > <!-- 隐藏 贾明 2018-9-11  -->
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimReqDt" /><!-- 청구일자 --></th>
                            <td>
                                <input type="hidden" id="flag" name="flag" value="N">
                                <input id="sClaimReqDt" class="form_datepicker ac" />
                            </td>
                            <th scope="row" colspan="6">
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일자별 클레임요청 상세 그리드 -->
            <div class="table_grid">
                <div id="claimDateDetailGrid" class="resizable_grid"></div>
            </div>
            <!-- //일자별 클레임요청 상세 그리드 -->
        </section>
    </div>



<script type="text/javascript">

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
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

    // 판정일자(FROM)
    $("#sClaimConfirmFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimConfirmFromDt}"
    });

    // 판정일자(TO)
    $("#sClaimConfirmToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value : "${sClaimConfirmToDt}"
    });

    // 청구일자
    $("#sClaimReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //버튼 - 일자별 클레임요청현황 마스터 조회
    $("#btnSearchClaimMaster").kendoButton({
        click:function(e) {
            $("#flag").val("N");
            $('#claimDateMasterGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 일자별 클레임요청현황 상세 조회
    $("#btnSearchClaimDetail").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#sClaimReqDt").val())){
                dms.notification.warning("<spring:message code='ser.lbl.claimReqDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sClaimReqDt").focus();
                return false;
            }

            $("#flag").val("Y");
            $('#claimDateDetailGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //클레임요청 마스터 그리드
    $("#claimDateMasterGrid").kendoExtGrid({
        gridId:"G-SER-1011-000151"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimReq/selectClaimReqDateMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]          = $("#dlrCd").val();
                        params["sClaimConfirmFromDt"] = $("#sClaimConfirmFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sClaimConfirmToDt"]   = $("#sClaimConfirmToDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"claimConfirmDt"
                    ,fields:{
                         claimConfirmDt:{type:"date", editable:false}
                        ,claimConfirmDtFormat:{type:"date", editable:false}
                        ,claimCnt:{type:"number", editable:false}
                        ,claimTotAmt:{type:"number", editable:false}
                        ,confirmLbrAmt:{type:"number", editable:false}
                        ,confirmItemAmt:{type:"number", editable:false}
                        ,confirmSubLbrAmt:{type:"number", editable:false}
                        ,claimReqDt:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.claimConfirmDtFormat = kendo.parseDate(elem.claimConfirmDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,dataBinding:function(e) {
            $("#sClaimReqDt").data("kendoExtMaskedDatePicker").value("");
            $("#claimDateDetailGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:288
        ,selectable:"row"
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {field:"claimConfirmDtFormat", title:"<spring:message code='ser.lbl.approveDt' />", width:200
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.claimConfirmDt == null ? '':data.claimConfirmDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"claimCnt", title:"<spring:message code='ser.lbl.claimCnt' />", width:200, attributes:{"class":"ar"}}
            ,{field:"claimTotAmt", title:"<spring:message code='global.lbl.total' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"confirmLbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"confirmItemAmt", title:"<spring:message code='ser.lbl.confirmItemAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"confirmSubLbrAmt", title:"<spring:message code='ser.lbl.confirmSubAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
            ,{field:"claimReqDt", hidden:true
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
        ]
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            $("#flag").val("N");

            $("#claimDateDetailGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //클레임요청 상세 그리드
    $("#claimDateDetailGrid").kendoExtGrid({
      gridId:"G-SER-1011-000152"
      ,dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/ser/wac/claimReq/selectClaimReqDateDetails.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      var grid = $('#claimDateMasterGrid').data('kendoExtGrid');
                      var selectedItem = grid.dataItem(grid.select());
                      var claimReqDt = "";
                    /**
                      if(selectedItem!=null)  {
                          if($("#flag").val() == "N"){
                              claimReqDt = selectedItem.claimReqDt;
                              console.log("1",claimReqDt);
                          }else{
                              claimReqDt = $("#sClaimReqDt").data("kendoExtMaskedDatePicker").value();
                              console.log("2",claimReqDt);
                          }
                      }else{
                          if($("#flag").val() == "Y"){
                              claimReqDt = $("#sClaimReqDt").data("kendoExtMaskedDatePicker").value();
                          }
                      }
                    **/
                     
                      //根据选择列 审批日期进行查询 贾明 2018-9-11
                      claimReqDt = kendo.toString(selectedItem.claimConfirmDt == null ? '':selectedItem.claimConfirmDt, '<dms:configValue code='dateTimeFormat' />')

                      $("#sClaimReqDt").data("kendoExtMaskedDatePicker").value(claimReqDt);
                      params["sDlrCd"] = $("#dlrCd").val();
                      params["sClaimReqDt"] = claimReqDt;

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"roDocNo"
                  ,fields:{
                       roDocNo:{type:"string", editable:false}
                      ,claimDocNo:{type:"string", editable:false}
                      ,claimReqDt:{type:"date", editable:false}
                      ,claimReqDtFormat:{type:"date", editable:false}
                      ,claimTotAmt:{type:"number", editable:false}
                      ,confirmLbrAmt:{type:"number", editable:false}
                      ,confirmItemAmt:{type:"number", editable:false}
                      ,confirmSubLbrAmt:{type:"number", editable:false}
                  }
              }
              ,parse:function(d) {
                  if(d.data){
                      $.each(d.data, function(idx, elem) {
                          elem.claimReqDtFormat = kendo.parseDate(elem.claimReqDt, "<dms:configValue code='dateFormat' />");
                      });
                  }
                  return d;
              }
          }
      }
      ,autoBind:false
      , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      , appendEmptyColumn:true           //빈컬럼 적용. default:false
      ,filterable:false
      ,selectable:_selectable
      ,columns:[
           {field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:200, attributes:{"class":"ac"}}
          ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:200, attributes:{"class":"ac"}}
          ,{field:"claimReqDtFormat", title:"<spring:message code='ser.lbl.claimReqDtEx' />", width:200
              ,attributes:{"class":"ac tooltip-disabled"}
              ,template:"#= kendo.toString(data.claimReqDt == null ? '':data.claimReqDt, '<dms:configValue code='dateFormat' />') #"
          }
          ,{field:"claimTotAmt", title:"<spring:message code='global.lbl.total' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
          ,{field:"confirmLbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
          ,{field:"confirmItemAmt", title:"<spring:message code='ser.lbl.confirmItemAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
          ,{field:"confirmSubLbrAmt", title:"<spring:message code='ser.lbl.confirmSubAmt' />", width:200, attributes:{"class":"ar"}, format:"{0:n2}"}
      ]

    });
    if(isTablet == true || isTablet == "true"){
        $(".table_grid").attr("style","width:968px !important; max-width:968px !important");
    }
});
</script>