<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


        <!-- 캠페인정보 관리 -->
        <section class="group">
            <div class="header_area">
              <h1 class="title_basic"><spring:message code="ser.title.campaign.basicInfo" /></h1>
                <div class="btn_right">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                </div>
            </div>

            <!-- 조회조건 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
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
                            <th scope="row"><spring:message code="ser.lbl.campaignCrDt" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCrStartDt" name="sCrStartDt" class="form_datetimepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCrEndDt" name="sCrEndDt" class="form_datetimepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.crNm" /></th>
                            <td>
                                <input id="sCrNo" type="hidden" />
                                <input id="sCrNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //조회조건 -->

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.campaign.masterInfo" /></h2>
                <div class="btn_right">
                </div>
            </div>

            <!-- //캠페인 정보 목록  -->
            <div class="table_grid">
                <div id="gridMaster" class="grid"></div>
            </div>
        </section>
            <!-- //캠페인 정보 목록 -->

            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.title.campaign.detailInfo" /></h2>
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridDetail" class="grid"></div>
                </div>
            </section>
            <!-- //캠페인 상세정보 -->

        </section>
        <!-- //캠페인정보 관리 -->



<script type="text/javascript">

var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({
        cmmCdNm:"${obj.cmmCdNm}"
       ,cmmCd:"${obj.cmmCd}"
    });
</c:forEach>

var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

var useYnList = [];
<c:forEach var="obj" items="${useYnDs}" >
    useYnList.push({
        cmmCdNm:"${obj.cmmCdNm}"
       ,cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});

$(document).ready(function() {



  //캠페인 시작일자
    $("#sCrStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       //,value:"${fromDt}"
    });



  //캠페인 종료일자
    $("#sCrEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:"${toDt}"
    });



  //조회버튼
  $("#btnSearch").kendoButton({
      click:function(e){
          var startDt = $("#sCrStartDt").data("kendoExtMaskedDatePicker").value();
          var endDt = $("#sCrEndDt").data("kendoExtMaskedDatePicker").value();


          //sCrNo
          $("#sCrNo").val("");
          $('#gridMaster').data('kendoExtGrid').dataSource.read();
          $('#gridDetail').data('kendoExtGrid').dataSource.data([]);
      }
  });

    $("#gridMaster").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/campaign/selectCampaignInfoManages.do' />"
                }//read
                ,parameterMap:function(options , operation){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCrStartDt"] = $("#sCrStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sCrEndDt"]   = $("#sCrEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sCrNm"]      = $("#sCrNm").val();
                        params["sCrNo"]      = $("#sCrNo").val();



                        return kendo.stringify(params);

                    }else if(operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }
                } //parameterMap
            }//transport
            ,schema:{
                model:{
                    id:"rnum"
                   ,fields:{
                       rnum:{type:"number"}
                      ,crTp:{type:"string"}
                      ,crNo:{type:"string"}
                      ,crNm:{type:"string"}
                      ,crStartDt  :{type:"date"}
                      ,crEndDt    :{type:"date"}
                      ,creStartDt :{type:"date"}
                      ,creEndDt   :{type:"date"}
                      ,saleStartDt:{type:"date"}
                      ,slaeEndDt  :{type:"date"}
                      ,crEndTp    :{type:"string"}
                      ,crIsaNm    :{type:"string"}
                   } //fields
                }//model
            }//schema
        }//dataSource
       ,autoBind:false
       ,editable:false
       ,height:236
       ,scrollable:true
       ,change:function (e){
           var selectedVal = this.dataItem(this.select());
           $("#sCrNo").val(selectedVal.crNo);
           var sCrNo = $("#crNo").val();
           $('#gridDetail').data('kendoExtGrid').dataSource._destroyed = [];
           $("#gridDetail").data("kendoExtGrid").dataSource.read();
       }
       ,columns:[
                  {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false,attributes:{"class":"ac"}}
                 ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:80, sortable:true
                     ,attributes:{"class":"ac"}
                     ,template:"#=crTpMap[crTp].cmmCdNm#"
                      ,editor:function(container, options) {
                          $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                               dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:crTpList

                          });
                          $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                      }
                  }
                  ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:80, sortable:true, attributes:{"class":"ac"}}
                  ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:270, sortable:false, attributes:{"class":"al"}}
                  ,{field:"crStartDt", title:"<spring:message code='ser.lbl.crStartDt' />", width:100, sortable:false
                     ,attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,editor:function (container, options){
                         $('<input required name="crStartDt" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoDatePicker({
                             format:"{0:<dms:configValue code='dateFormat' />}"
                            ,value:""
                         });
                         $('<span class="k-invalid-msg" data-for="crStartDt"></span>').appendTo(container);
                        }
                   }
                  ,{field:"crEndDt", title:"<spring:message code='ser.lbl.crEndDt' />", width:100, sortable:false
                      ,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                          $('<input required name="crEndDt" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoDatePicker({
                              format:"{0:<dms:configValue code='dateFormat' />}"
                              ,value:""
                          });
                          $('<span class="k-invalid-msg" data-for="crEndDt"></span>').appendTo(container);
                      }
                  }
                  ,{field:"creStartDt", title:"<spring:message code='ser.lbl.creStartDt' />", width:100, sortable:false
                     ,attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,editor:function (container, options){
                         $('<input required name="creStartDt" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoDatePicker({
                             format:"{0:<dms:configValue code='dateFormat' />}"
                            ,value:""
                         });
                         $('<span class="k-invalid-msg" data-for="creStartDt"></span>').appendTo(container);
                        }
                   }
                  ,{field:"creEndDt", title:"<spring:message code='ser.lbl.creEndDt' />", width:100, sortable:false
                      ,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                          $('<input required name="creEndDt" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoDatePicker({
                              format:"{0:<dms:configValue code='dateFormat' />}"
                              ,value:""

                          });
                          $('<span class="k-invalid-msg" data-for="creEndDt"></span>').appendTo(container);
                      }
                  }
                  ,{field:"saleStartDt", title:"<spring:message code='ser.lbl.saleStartDt' />", width:100, sortable:false
                     ,attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,editor:function (container, options){
                         $('<input required name="saleStartDt" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoDatePicker({
                             format:"{0:<dms:configValue code='dateFormat' />}"
                            ,value:""

                         });
                         $('<span class="k-invalid-msg" data-for="saleStartDt"></span>').appendTo(container);
                        }
                   }
                  ,{field:"saleEndDt", title:"<spring:message code='ser.lbl.saleEndDt' />", width:100, sortable:false
                      ,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                          $('<input required name="saleEndDt" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoDatePicker({
                              format:"{0:<dms:configValue code='dateFormat' />}"
                              ,value:""
                          });
                          $('<span class="k-invalid-msg" data-for="saleEndDt"></span>').appendTo(container);

                      }
                  }
                  ,{field:"crEndTp", title:"<spring:message code='ser.lbl.endYn' />", width:80, sortable:false
                      ,attributes:{"class":"ac"}
                      ,template:"#=useYnMap[crEndTp].cmmCdNm #"
                      ,editor:function(container, options) {
                          $('<input required name="crEndTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                               dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:useYnList
                          });
                          $('<span class="k-invalid-msg" data-for="crEndTp"></span>').appendTo(container);
                      }
                   }
                  ,{field:"crIsaNm", title:"<spring:message code='ser.lbl.crIsaNm' />", width:100, sortable:false, attributes:{"class":"ac"}}
                 ]

    });

    $("#gridDetail").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/campaign/selectCampaignInfos.do' />"
                }//read
                ,parameterMap:function(options , operation){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCrNo"]      = $("#sCrNo").val();

                        return kendo.stringify(params);

                    }else if(operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }
                } //parameterMap
            }//transport
            ,schema:{
                model:{
                    id:"rnum"
                   ,fields:{
                       rnum:{type:"number"}
                      ,crTp:{type:"string"}
                      ,crNo:{type:"string"}
                      ,crNm:{type:"string"}
                      ,crStartDt:{type:"date"}
                      ,crEndDt:{type:"date"}
                      ,creStartDt:{type:"date"}
                      ,creEndDt:{type:"date"}
                      ,saleStartDt:{type:"date"}
                      ,slaeEndDt:{type:"date"}
                      ,crEndTp:{type:"string"}
                      ,crIsaNm:{type:"string"}
                   } //fields
                }//model
            }//schema
        }//dataSource
       ,autoBind:false
       ,height:191
       ,editable:false
       ,scrollable:true
       ,sortable:false
       ,columns:[
                  {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:60, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"pcDstinCd", title:"<spring:message code='ser.lbl.pcDstinCd' />", width:70, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"lbrCd", title:"<spring:message code='ser.lbl.mainLbrCd' />", width:80, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"lbrNm", title:"<spring:message code='ser.lbl.mainLbrNm' />", width:150, sortable:false, attributes:{"class":"al"}}
                 ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:90, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />", width:150, sortable:false, attributes:{"class":"al"}}
                 ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:70, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:150, sortable:false, attributes:{"class":"al"}}
                 ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:70, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:150, sortable:false, attributes:{"class":"ac"}}
                ]

    });

   /*  $("#sCrStartDt").data("kendoDatePicker").value("${fromDt}");

    $("#sCrEndDt").data("kendoDatePicker").value("${toDt}");

    $("#sCrEndDt").kendoMaskedTextBox({
    mask:"####-##-##"

    });

    $("#sCrStartDt").kendoMaskedTextBox({
    mask:"####-##-##"

    });  */



});
</script>