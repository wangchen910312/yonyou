<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 부품선택 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <%-- <button type="button" id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button> --%>
                <button type="button" id="btnSelect" class="btn_m btn_Select" ><spring:message code="global.btn.select" /></button>
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.crNo" /></th>
                        <td>
                             <input type="text" id="crNo" name="crNo" readonly class="form_input form_readonly"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.crNm" /></th>
                        <td><input type="text" id="crNm" name="crNm" readonly class="form_input form_readonly"/></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 공임 -->
        <div>
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.lbl.lbr" /></h2>
            </div>
            <div class="table_grid">
                <div id="gridLabor" class="grid"></div>
            </div>
        </div>
        <!-- 공임 -->

        <!-- 부품 -->
        <div>
             <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.lbl.item" /></h2>
            </div>
            <div class="table_grid">
                <div id="gridPart" class="grid"></div>
            </div>
        </div>
        <!-- 부품 -->


        <!-- 탭메뉴 전체 영역 -->
      <%--       <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.lbr" /></li>
                    <li><spring:message code="ser.lbl.part" /></li>

                </ul>
                <!-- //탭메뉴 -->

                <div>
                    <div class="table_grid">
                        <div id="gridLabor" class="grid"></div>
                    </div>
                </div>
                <!-- //정비항목 -->

                <!-- 부품 -->
                <div>
                    <div class="table_grid">
                        <div id="gridPart" class="grid"></div>
                    </div>
                </div>
                <!-- 부품 -->
            </div> --%>
            <!-- //탭메뉴 전체 영역 -->
    </section>
    <!-- //부품선택 팝업 -->
<input type="hidden" id="lbrCd" name="lbrCd" />
<!-- script -->
<script type="text/javascript">
/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({
        cmmCdNm:"${obj.cmmCdNm}"
       ,cmmCd:"${obj.cmmCd}"
    });
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

/** 브랜드 코드 **/
var brandCdList = [];
 <c:forEach var="obj" items="${brandCdDs}">
 brandCdList.push({
     cmmCdNm:"${obj.cmmCdNm}"
     , cmmCd:"${obj.cmmCd}"
 });
 </c:forEach>

 var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});


$(document).ready(function() {

    var parentData = parent.campaignInfoSearchPopup.options.content.data;

    $("#crNo").val(parentData.params.crNo);
    $("#crNm").val(parentData.params.crNm);


 // 그리드 더블 클릭 이벤트.
    $("#gridLabor").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    $("#btnSelect").kendoButton({

        click:function(e){


            var gridLabor = $("#gridLabor").data("kendoExtGrid");
            var gridPart = $("#gridPart").data("kendoExtGrid");
            var lbrRows = gridLabor.select();

            if(lbrRows.length == 0 ){
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }
            if(lbrRows != null){

                var lbrData = [];
                var partData = [];

                $.each( lbrRows  , function(idx , obj){
                    lbrData.push(gridLabor.dataItem(obj));
                });


                $.each(gridPart.dataSource._data , function(i , part){

                    if(part.lbrCd == lbrData[0].lbrCd){
                        partData.push(part);
                   }
                });


                parentData.callbackFunc(lbrData , partData);
                parent.campaignInfoSearchPopup.close();

            } // end if

        } // end function
    });

    /**공임 그리드 **/
    $("#gridLabor").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignLbrInfoPopup.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"] = parentData.params.crNo;
                         params["sLtsModelCd"] = parentData.params.ltsModelCd;
                         params["sCarBrandCd"] = parentData.params.carBrandCd;
                         params["sVinNo"] = parentData.params.vinNo;
                         //params["sDlrCd"] = $("#sDlrCd").val();


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,crNo:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crTp:{type:"string"  }
                       ,lbrCd:{type:"string"  }
                       ,lbrNm:{type:"string"  }
                       ,lbrQty:{type:"number" }
                       ,lbrHm:{type:"number"  }
                       ,lbrRate:{type:"number" }
                       ,lbrPrc:{type:"number" }
                       ,lbrAmt:{type:"number" }
                       ,cauItemCd:{type:"string"  }
                       ,cauItemNm:{type:"string"  }
                       ,cauCd:{type:"string"  }
                       ,cauNm:{type:"string"  }
                       ,phenCd:{type:"string"  }
                       ,phenNm:{type:"string"  }

                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:(parentData.autoBind == false || parentData.autoBind == undefined) ? false:true
        ,height:118
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());
            $("#lbrCd").val(selectedVal.lbrCd);
            $("#gridPart").data("kendoExtGrid").dataSource.read();


           /*  params["sCrNo"] = parentData.params.crNo;
            params["sLtsModelCd"] = parentData.params.ltsModelCd;
            params["sCarBrandCd"] = parentData.params.carBrandCd;
            params["sVinNo"] = parentData.params.vinNo; */

           /*  var sendData = {
                   "sCrNo":parentData.params.crNo
                   ,"sLtsModelCd":parentData.params.ltsModelCd
                   ,"sCarBrandCd":parentData.params.carBrandCd
                   ,"sVinNo":parentData.params.vinNo
            };

            $.ajax({
                url:"<c:url value='/ser/svi/campaign/selectCampaignPartInfoPopup.do' />"
               ,data:JSON.stringify(sendData)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){




                }

            }) ; */


        }
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:40, attributes:{"class":"ac"}}
                   ,{field:"crNo",title:"<spring:message code='ser.lbl.crNo' />", width:80, attributes:{"class":"al"} , hidden:true}
                   ,{field:"crNm",title:"<spring:message code='ser.lbl.crNm' />", width:200, attributes:{"class":"al"}, hidden:true}
                   ,{field:"crTp",title:"<spring:message code='ser.lbl.crTp' />", width:80
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
                   ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"} }
                   ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:200, attributes:{"class":"al"} }
                   ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ar"} }
                   ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrTime' />", width:80, attributes :{"class":"ar"}}
                   ,{field:"lbrRate",title:"<spring:message code='ser.lbl.lbrUntPrc' />", width:80, attributes :{"class":"ar"}}
                   ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.lbrAmt' />", width:80, attributes :{"class":"ar"}}
                 ]

    });



    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({

        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/campaign/selectCampaignPartInfoPopup.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"] = parentData.params.crNo;
                         params["sLtsModelCd"] = parentData.params.ltsModelCd;
                         params["sCarBrandCd"] = parentData.params.carBrandCd;
                         params["sVinNo"] = parentData.params.vinNo;
                         params["sLbrCd"] = $("#lbrCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                       ,crNo:{type:"string" }
                       ,crNm:{type:"string" }
                       ,crTp:{type:"string" }
                       ,lbrCd:{type:"string" }
                       ,itemCd:{type:"string" }
                       ,itemNm:{type:"string" }
                       ,itemQty:{type:"number" }
                       ,stockUnitCd:{type:"string" }
                       ,grStrgeCd:{type:"string" }
                       ,giStrgeCd:{type:"string" }
                       ,salePrcAmt:{type:"number"  }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,editable:false
        ,autoBind:false //(parentData.autoBind == false || parentData.autoBind == undefined) ? false:true
        ,height:118
        ,multiSelectWithCheckbox:false
        ,edit:function(e){

         }
        ,change:function (e){

        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, attributes:{"class":"ac"}}
                   ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:70, attributes :{"class":"al"}, hidden:true}
                   ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:190, attributes :{"class":"al"}, hidden:true}
                   ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:80
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
                   ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes :{"class":"al"}}
                   ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100, attributes :{"class":"al"}}
                   ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes :{"class":"al"}}
                   ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes :{"class":"ar"}}
                   ,{field:"stockUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:70, attributes :{"class":"ac"}}
                   ,{field:"grStrgeCd", title:"<spring:message code='ser.lbl.grStrgeCd' />", width:80, attributes :{"class":"ac"}, hidden:true}
                   ,{field:"giStrgeCd", title:"<spring:message code='ser.lbl.giStrgeCd' />", width:80, attributes :{"class":"ac"}, hidden:true}
                   ,{field:"salePrcAmt", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:70, attributes :{"class":"ar"}}
                 ]

    });


   /*  $("#tabstrip").kendoExtTabStrip({
        animation:false
    }); */
});




</script>
<!-- //script -->