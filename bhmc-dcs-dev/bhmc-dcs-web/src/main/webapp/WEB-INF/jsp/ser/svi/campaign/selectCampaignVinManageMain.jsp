<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

        <!-- 차량마스터관리 -->
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.campaignVinInfo" /></h1>
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
                        <col >
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.crNm" /></th>
                            <td>
                                <input id="sCrNm" type="text" class="form_input" style="width:20%" />
                                <input id="sCrNo" type="hidden" class="form_input" style="width:20%" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //조회조건 -->

            <!-- 차량마스터 정보 목록 -->
            <div class="table_grid mt10">
                <div id="gridCampaign" class="grid"></div>
            </div>
            <!-- //차량마스터 정보 목록 -->


            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.title.vinInfo" /></li>
                    <li><spring:message code="ser.title.lbrInfo" /></li>
                    <li><spring:message code="ser.title.itemInfo" /></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- VIN 정보 -->
                <div>
                    <div class="btn_right_absolute">
                    </div>
                    <div class="table_grid">
                        <div id="gridVin" class="grid"></div>
                    </div>
                </div>
                <!-- //VIN 정보 -->

                <!-- 공임정보 -->
                <div>
                    <div class="btn_right_absolute">
                    </div>
                    <div class="table_grid">
                        <div id="gridLabor" class="grid"></div>
                    </div>
                </div>
                <!-- //공임정보 -->

                <!-- 부품정보 -->
                <div>
                    <div class="table_grid">
                        <div id="gridPart" class="grid"></div>
                    </div>
                </div>
                <!-- //부품정보 -->

            </div>
            <!-- //탭메뉴 전체 영역 -->
        </section>
        <!-- //차량마스터관리 -->


<script type="text/javascript">


$(document).ready(function() {



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


    setCrTpMap = function(value){

        var resultVal ="";

        if(dms.string.isNotEmpty(value)){
            if(crTpMap[value] != undefined)
            resultVal = crTpMap[value].cmmCdNm;
        }
        return resultVal;
    }

    setUseYnMap = function(value){

        var resultVal ="";

        if(dms.string.isNotEmpty(value)){
            if(useYnMap[value] != undefined)
            resultVal = useYnMap[value].cmmCdNm;
        }
        return resultVal;
    }

    $("#btnSearch").kendoButton({

        click:function (e){

            $("#sCrNo").val("");
            $("#gridCampaign").data("kendoExtGrid").dataSource.read();
        }
    });





    $("#gridCampaign").kendoExtGrid({

        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/campaign/selectCampaignInfoVin.do' />"
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

                        params["sCrStartDt"] = $("#sCrStartDt").val();
                        params["sCrEndDt"]   = $("#sCrEndDt").val();
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
       ,editable:false
       ,scrollable:true
       ,height:236
       ,change:function (e){

           var selectedVal = this.dataItem(this.select());
           $("#sCrNo").val(selectedVal.crNo);
           var sCrNo = $("#crNo").val();


           $('#gridVin').data('kendoExtGrid').dataSource._destroyed = [];
           $("#gridVin").data("kendoExtGrid").dataSource.read();
           $('#gridLabor').data('kendoExtGrid').dataSource._destroyed = [];
           $("#gridLabor").data("kendoExtGrid").dataSource.read();
           $('#gridPart').data('kendoExtGrid').dataSource._destroyed = [];
           $("#gridPart").data("kendoExtGrid").dataSource.read();
       }
       ,columns:[
                  {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100, sortable:true,attributes:{"class":"ac"}
                     ,template:"#=setCrTpMap(crTp)#"
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
                  ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, sortable:true, attributes:{"class":"ac"}}
                  ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:280, sortable:false, attributes:{"class":"al"}}
                  ,{field:"crStartDt", title:"<spring:message code='ser.lbl.crStartDt' />", width:100, sortabl:false
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
                  ,{field:"crEndTp", title:"<spring:message code='ser.lbl.endYn' />", width:70, sortable:false
                      ,attributes:{"class":"ac"}
                      ,template:"#=setUseYnMap(crEndTp)#"
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

    $("#gridVin").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/campaign/selectCampaignVinInfos.do' />"
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
                          ,vinNo:{type:"string"}
                          ,ltsModelCd:{type:"string"}
                          ,ltsModelNm:{type:"string"}
                       } //fields
                    }//model
                }//schema
            }//dataSource
           ,autoBind:false
           ,scrollable:true
           ,editable:false
           ,height:191
           ,autoBind:false
           ,columns:[
                       {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />",width:150,sortable:false,attributes:{"class":"ac"}}
                      ,{field:"ltsModelCd",title:"<spring:message code='ser.lbl.ltsModelCd' />",width:100,sortable:false,attributes:{"class":"ac"}}
                      ,{field:"ltsModelNm",title:"<spring:message code='ser.lbl.ltsModelNm' />",width:250,sortable:false,attributes:{"class":"ac"}}
                     ]

    });

    $("#gridLabor").kendoExtGrid({

            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/campaign/selectCampaignLbrInfos.do' />"
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
                           rnum  :{type:"number"}
                          ,lbrCd :{type:"string"}
                          ,lbrNm :{type:"string"}
                          ,lbrQty:{type:"number"}
                          ,lbrHm :{type:"number"}
                          ,lbrAmt:{type:"number"}
                       } //fields
                    }//model
                }//schema
            }//dataSource
           ,autoBind:false
           ,editable:false
           ,scrollable:true
           ,height:191
           ,autoBind:false
           ,columns:[
                      {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250, sortable:false, attributes:{"class":"al"}}
                      ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:50, sortable:false, attributes:{"class":"ar"}}
                      ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:80, sortable:false, attributes:{"class":"ar"}}
                      ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.lbrAmt' />", width:80, sortable:false, attributes:{"class":"ar"}}
                     ]

    });

    $("#gridPart").kendoExtGrid({

            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/campaign/selectCampaignItems.do' />"
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
                           rnum  :{type:"number"}
                          ,cauItemCd :{type:"string"}
                          ,cauItemNm :{type:"string"}
                          ,ltsModelCd :{type:"string"}
                          ,ltsModelNm :{type:"string"}
                          ,itemQty:{type:"number"}
                       } //fields
                    }//model
                }//schema
            }//dataSource
           ,autoBind:false
           ,scrollable:true
           ,editable:false
           ,height:191
           ,autoBind:false
           ,columns:[
                      {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, sortable:false, attributes:{"class":"al"}}
                      ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
                      ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:100, sortable:false, attributes:{"class":"al"}}
                      ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:50, sortable:false, attributes:{"class":"ar"}}
                     ]

        });


    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
});
</script>