<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="resizableContainer">
    <!-- 미배정 주문취소 내역 조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.notAssignedOrderCancelInfo" /></h1> <!-- 미배정 오더 취소내역 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10968" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:9%;">
                    <col style="width:18%;">
                    <col style="width:9%;">
                    <col style="width:18%;">
                    <col style="width:9%;">
                    <col style="width:16%;">
                    <col style="width:9%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.cancleStatCd" /></th>
                        <td>
                            <input name="sAdjStatCd" id="sAdjStatCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.orderType" /></th> <!-- 주문유형 -->
                        <td class="required_area">
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt2"><spring:message code="global.lbl.orderWeek" /></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><spring:message code="global.lbl.orderRegDt" /></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>

                        <th scope="row"><spring:message code="global.lbl.askDt" /></th> <!-- 주문 취소 신청일  : global.lbl.askDt    -->
                        <td class="required_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sAskDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sAskDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td>
                            <input id="sFscCd" class="form_comboBox" />
                            <input id="sModelCd" type="hidden" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>   <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" style="width:49%">
                            <input id="sIntColorCd" class="form_comboBox" style="width:49%">
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}"
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
var fifteenDayBf = "${fifteenDayBf}";

// 주문유형 콤보박스
var ordTpList = [];
var ordTpCdObj = {};
<c:forEach var="obj" items="${ordTpInfo}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordTpCdObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

// 차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 주차
var ordYyMmPridList = [];
<c:forEach var="obj" items="${ordYyMmPridInfo}">
    ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
</c:forEach>

//신청상태
var adjStatList = [];
var adjStatObj = {};
<c:forEach var="obj" items="${adjStatDs}">
    <c:if test="${obj.cmmCd ne 'C'}">
        adjStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        adjStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>


$(document).ready(function () {
    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sFscCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#sModleCd").val("");

           if(dataItem.carlineCd == ""){
               $("#sFscCd").data("kendoExtDropDownList").enable(false);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/fim/fincInfoMng/selectFsc.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/fim/fincInfoMng/selectOcn.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":""})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sFscCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#sModleCd").val("");

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/fim/fincInfoMng/selectOcn.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sFscCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            if(Number(this.dataItem(e.item).modelCnt) > 1){
                dms.notification.error("<spring:message code='sal.info.modelCntCheck' arguments='"+this.dataItem(e.item).ocnNm+","+this.dataItem(e.item).modelCnt+"' />");
                $("#extColorCd").data("kendoExtDropDownList").enable(false);
                $("#ocnCd").data("kendoExtDropDownList").value("");
                return false;
            }

            $("#modelCd").val(this.dataItem(e.item).modelCd);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/fim/fincInfoMng/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").val() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/fim/fincInfoMng/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").val() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //취소상태
    $("#sAdjStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(adjStatList)
       ,optionLabel:" "
    });
     //주문유형
     $("#sOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ordTpList
        ,select:function(e){
            var ordTpCd = this.dataItem(e.item).cmmCd;

            if(ordTpCd == "N1"){
                $("#sOrdDtS").data("kendoExtMaskedDatePicker").value("");
                $("#sOrdDtE").data("kendoExtMaskedDatePicker").value("");
                $(".group-OrdDt1").hide();
                $(".group-OrdDt2").show();
            }else{
                if( $("#sOrdDtS").data("kendoExtMaskedDatePicker").value() == "" || $("#sOrdDtS").data("kendoExtMaskedDatePicker").value() == null ){
                    $("#sOrdDtS").data("kendoExtMaskedDatePicker").value("");
                    $("#sOrdDtE").data("kendoExtMaskedDatePicker").value("");
                }

                $(".group-OrdDt2").hide();
                $(".group-OrdDt1").show();
            }

            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);

            $("#sFscCd").data("kendoExtDropDownList").enable(false);
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
        }
        ,optionLabel:" "
     });

     /**
      * 주문주차 콤보박스
      */
      $("#sOrdYyMmPrid").kendoExtDropDownList({
          dataTextField:"btoYmwNm"
         ,dataValueField:"btoYmwCd"
         ,dataSource:ordYyMmPridList
         ,optionLabel:" "  // 선택
         ,value:""
      });

      /**
       * 시작일자 (From)
       */
       $("#sOrdDtS").kendoExtMaskedDatePicker({
          format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       });

       /**
       * 종료일자 (From)
       */
       $("#sOrdDtE").kendoExtMaskedDatePicker({
          format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       });


       /**
        * 시작일자 (From)
        */
        $("#sAskDtS").kendoExtMaskedDatePicker({
           format:"{0:<dms:configValue code='dateFormat' />}"
          ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /**
        * 종료일자 (From)
        */
        $("#sAskDtE").kendoExtMaskedDatePicker({
           format:"{0:<dms:configValue code='dateFormat' />}"
          ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });



      $("#sFscCd").data("kendoExtDropDownList").enable(false);
      $("#sOcnCd").data("kendoExtDropDownList").enable(false);
      $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
      $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

      $(".group-OrdDt2").hide();
      $(".group-OrdDt1").show();

      $("#sOrdDtS").data("kendoExtMaskedDatePicker").value(oneDay);
      $("#sOrdDtE").data("kendoExtMaskedDatePicker").value(toDay);

      $("#sAskDtS").data("kendoExtMaskedDatePicker").value(oneDay);
      $("#sAskDtE").data("kendoExtMaskedDatePicker").value(toDay);

      //버튼 - 조회
      $("#btnSearch").kendoButton({
          click:function(e) {

              // 주문 등록일 부분
              var fromDt = $("#sOrdDtS").data("kendoExtMaskedDatePicker").value();
              var toDt = $("#sOrdDtE").data("kendoExtMaskedDatePicker").value();

              if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                  $("#sOrdDtS").focus();
                  return false;
              }
              if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                  $("#sOrdDtE").focus();
                  return false;
              }

              if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                  dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                  $("#sOrdDtE").data("kendoExtMaskedDatePicker").value(new Date(''));
                  $("#sOrdDtE").focus();
                  return false;
              }

              // 주문취소신청일 부분
              var fromCancelDt = $("#sAskDtS").data("kendoExtMaskedDatePicker").value();
              var toCancelDt = $("#sAskDtE").data("kendoExtMaskedDatePicker").value();

              if(salesJs.validate.isFromDateValid(fromCancelDt, toCancelDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                  $("#sAskDtS").focus();
                  return false;
              }
              if(salesJs.validate.isFromDateValid(toCancelDt, fromCancelDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                  $("#sAskDtE").focus();
                  return false;
              }

              if(!salesJs.validate.isDateValidPeriod(fromCancelDt, toCancelDt)){
                  dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                  $("#sAskDtE").data("kendoExtMaskedDatePicker").value(new Date(''));
                  $("#sAskDtE").focus();
                  return false;
              }


              $('#grid').data('kendoExtGrid').dataSource.page(1);
          }
      });

        //그리드 1번
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0911-131006"
            ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrderCancelInfo.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                         params["sFscCd"] = $("#sFscCd").data("kendoExtDropDownList").value();
                         params["sModelCd"] = $("#sModelCd").val();
                         params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                         params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                         params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                         params["sOrdTp"] = $("#sOrdTp").val();
                         params["sAdjStatCd"] = $("#sAdjStatCd").data("kendoExtDropDownList").value();

                         if($("#sOrdTp").val() == "N1"){
                             params["sOrdPrid"] = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                         }else{
                             // 주문 등록일
                             params["sOrdDtS"] = $("#sOrdDtS").data("kendoExtMaskedDatePicker").value();
                             params["sOrdDtE"] = $("#sOrdDtE").data("kendoExtMaskedDatePicker").value();
                         }
                         // 주문취소 신청일
                         params["sAskDtS"] = $("#sAskDtS").data("kendoExtMaskedDatePicker").value();
                         params["sAskDtE"] = $("#sAskDtE").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){
             }
           ,schema:{
               data:"data"
              ,model:{
                   id:"rnum"
                  ,fields:{
                       adjStatCd:{type:"string"}
                      ,askDt:{type:"date"} //주문 취소 신청일
                      ,dlrCd:{type:"string"}
                      ,ordDt:{type:"date"}
                      ,salesNo:{type:"string"} //ERP오더번호
                      ,ordType:{type:"string"}
                      ,carlineCd:{type:"string"} //차종코드
                      ,modelCd:{type:"string"} //모델코드
                      ,ocnCd:{type:"string"} //OCN코드
                      ,extColorCd:{type:"string"} //외색코드
                      ,intColorCd:{type:"string"} //내색코드
                      ,carlineNm:{type:"string"} //차종명
                      ,modelNm:{type:"string"} //모델명
                      ,ocnNm:{type:"string"} //OCN명
                      ,extColorNm:{type:"string"} //외색명
                      ,intColorNm:{type:"string"} //내색명
                      ,ordpExno:{type:"date"}     //납기예시일
                      ,ordRgstId:{type:"string"}  //주문자
                      ,saleRgstId:{type:"string"} //판매고문
                      ,saleRgstNm:{type:"string"} //판매고문
                      ,orty:{type:"number"}       //오더수량
                      ,askDtFormat:{type:"date", editable:false}
                      ,ordDtFormat:{type:"date", editable:false}
                   }
               }
               ,parse:function(d) {
                   if(d.data){
                       $.each(d.data, function(idx, elem) {
                           elem.rnum = d.total - elem.rnum + 1;
                           elem.askDtFormat = kendo.parseDate(elem.askDt, "<dms:configValue code='dateFormat' />");
                           elem.ordDtFormat = kendo.parseDate(elem.ordDt, "<dms:configValue code='dateFormat' />");
                       });
                   }
                   return d;
               }
           }
         }
         ,indvColumnVisible:true      //컬럼 보이기/감추기 개인화 적용. default:true
         ,indvColumnReorderable:true  //컬럼순서 변경 개인화 적용. default:true
         ,appendEmptyColumn:false     //빈컬럼 적용. default:false
         ,multiSelectWithCheckbox:false
         ,enableTooltip:true          //Tooltip 적용, default:false
         ,autoBind:false
         ,scrollable:true
         //,selectable:"row"
         ,editable:false
         ,columns:[
               {field:"adjStatCd"
                   ,title:"<spring:message code='global.lbl.issueStatCd' />"
                   ,width:100
                   ,attributes:{"class":"ac"}
                   ,template:"#=dms.string.strNvl(adjStatObj[adjStatCd])#"
                } //처리상태
               ,{field:"askDtFormat", title:"<spring:message code='global.lbl.askDt' />"
                    , width:100
                    ,attributes:{"class":"ac"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.askDt, '<dms:configValue code='dateFormat' />')) #"
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 주문 취소 신청일
              ,{field:"ordDtFormat", title:"<spring:message code='global.lbl.orderDt' />"
                  , width:100
                  ,attributes:{"class":"ac"}
                  ,template:"#= dms.string.strNvl(kendo.toString(data.ordDt, '<dms:configValue code='dateFormat' />')) #"
                  ,footerAttributes:{style:"visibility:hidden;"}
              }  // 주문일자
              ,{field:"salesNo", title:"<spring:message code='global.lbl.ordNo' />"
                  , width:100
                  ,attributes:{"class":"ac"}
                  ,footerAttributes:{style:"visibility:hidden;"}
              }  // 주문번호
              ,{field:"ordType", title:"<spring:message code='global.lbl.orderType' />"
                  , width:180
                  ,headerAttributes:{style:"text-align:center;"}
                  ,footerAttributes:{style:"visibility:hidden;"}
                  ,template:"#= ordTpCdObj[ordType] #"
              }  // 주문유형
              ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
              ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"}}//차종description
              ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:120, attributes:{"class":"al"}} //모델description
              ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
              ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
              ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
              ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
              ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
              ,{field:"ordpExno",   title:"<spring:message code='sal.lbl.pfpExamDt' />"
                 ,width:110, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}      // 납기예시일
              ,{field:"ordRgstId", title:"<spring:message code='global.lbl.chrgCd' />"
                  ,width:100
                  ,headerAttributes:{style:"text-align:center;"}
              }  // 주문자
              ,{field:"saleRgstId", title:"<spring:message code='sal.lbl.salesAdvisor' />"
                  ,width:100
                  ,headerAttributes:{style:"text-align:center;"}
              }  // 판매고문
              ,{field:"orty"
                  ,title:"<spring:message code='global.lbl.ordpCount' />"
                  ,width:80
                  ,attributes:{"class":"ar"}
              }//오더수량
          ]
    });


});

-->
</script>