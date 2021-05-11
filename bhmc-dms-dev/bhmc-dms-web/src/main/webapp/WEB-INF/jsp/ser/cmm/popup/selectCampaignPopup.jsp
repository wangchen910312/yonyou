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


        <div id="bhmcCampaign" style="display:none;">
            <!-- 공임 -->
            <div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.lbl.lbr" /></h2>
                </div>
                <div class="table_grid">
                    <div id="lbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- 공임 -->

            <!-- 부품 -->
            <div>
                 <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.lbl.item" /></h2>
                </div>
                <div class="table_grid">
                    <div id="partGrid" class="grid"></div>
                </div>
            </div>
            <!-- 부품 -->
        </div>

        <div id="dlrCampaign" style="display:none;">
            <!-- 공임 -->
            <div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.lbl.lbr" /></h2>
                </div>
                <div class="table_grid">
                    <div id="dlrLbrGrid" class="grid"></div>
                </div>
            </div>
            <!-- 공임 -->

            <!-- 부품 -->
            <div>
                 <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.lbl.item" /></h2>
                </div>
                <div class="table_grid">
                    <div id="dlrPartGrid" class="grid"></div>
                </div>
            </div>
            <!-- 부품 -->
        </div>

    </section>
    <!-- //부품선택 팝업 -->

    <input type="hidden" id="lbrCd" name="lbrCd" />

<!-- script -->
<script type="text/javascript">

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});


/** 브랜드 코드 **/
var brandCdList = [];
 <c:forEach var="obj" items="${brandCdDs}">
 brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});


$(document).ready(function() {

    var parentData = parent.campaignInfoSearchPopup.options.content.data;
    var hostCd = parentData.params.hostCd;

    var sVinNo = parentData.params.vinNo;
    var sCrNo = parentData.params.crNo;

    //캠페인유형
    crTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(crTpMap[val] != undefined)
            returnVal = crTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    // 정비유형(수리유형)
    lbrTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(lbrTpCdArr[val] != undefined)
            returnVal = lbrTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };


    // 그리드 더블 클릭 이벤트.
    $("#lbrGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    $("#btnSelect").kendoButton({

        click:function(e){

            var lbrGrid;
            var partGrid;

            var lbrData = [];
            var partData = [];

            var sLbrCd ;

            if(hostCd == "01"){ //법인 캠페인

                lbrGrid = $("#lbrGrid").data("kendoExtGrid");
                partGrid = $("#partGrid").data("kendoExtGrid");

                var lbrRows = lbrGrid.select();
                var lbrAllData = [];
                var zzLbrYn = false;

                if(lbrRows.length == 0 ){
                    dms.notification.warning("<spring:message code='global.info.required.select' />");
                    return;
                }

                $.each( lbrRows  , function(idx , obj){
                    sLbrCd =(lbrGrid.dataItem(obj).lbrCd);
                });

                if(lbrRows != null){
                    $.each(lbrGrid.dataSource._data , function(i , lbr){
                        lbrAllData.push(lbr);
                        if(lbr.lbrCd.substr(-2) == "ZZ"){
                            zzLbrYn = true;
                       }
                    });

                    $.ajax({
                        url:"<c:url value='/ser/cmm/vehOfCampaginInfo/selectDcsVehicleCampaginInfo.do' />"
                       ,data:JSON.stringify({sVinNo:sVinNo,sCrNo:sCrNo,sLbrCd:sLbrCd})
                       ,type:'POST'
                       ,dataType:'json'
                       ,async: false
                       ,contentType:'application/json'
                       ,error:function(jqXHR, status, error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function(result, textStatus){
                           if(result.length <= 0 ){

                               if(zzLbrYn){
                                   lbrData = lbrAllData;
                               }else{
                                   $.each( lbrRows  , function(idx , obj){
                                       lbrData.push(lbrGrid.dataItem(obj));
                                   });
                               }

                            $.each(partGrid.dataSource._data , function(i , part){
                                if(part.lbrCd == lbrData[0].lbrCd){
                                    partData.push(part);
                               }
                            });


                           } else {
                               //DCS 켐페인 사용 이력 조회
                                var callData = "Y"
                               parentData.callbackFunc(lbrData,partData,result,callData);
                           }
                       }
                   });
                } // end if

            }else{ //딜러 캠페인

                lbrGrid = $("#dlrLbrGrid").data("kendoExtGrid");
                partGrid = $("#dlrPartGrid").data("kendoExtGrid");

                $.each( lbrGrid.dataSource._data  , function(idx , lbr){
                    lbrData.push(lbr);
                });

                $.each(partGrid.dataSource._data , function(i , part){
                    partData.push(part);
                });
            }
           // alert(JSON.stringify(lbrData));
           // alert(JSON.stringify(partData));
            parentData.callbackFunc(lbrData , partData);
            parent.campaignInfoSearchPopup.close();

        } // end function
    });

    /**공임 그리드 **/
    $("#lbrGrid").kendoExtGrid({
        gridId:"G-SER-1011-000011"
        ,dataSource:{
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
                         params["sHostCd"] = parentData.params.hostCd;
                         params["sLtsModelCd"] = parentData.params.ltsModelCd;
                         params["sCarBrandCd"] = parentData.params.carBrandCd;
                         params["sVinNo"] = parentData.params.vinNo;

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
        ,selectable:"row"
        ,editable:false
        ,autoBind:(hostCd == "01" ) ? true:false
        ,height:118
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());
            $("#lbrCd").val(selectedVal.lbrCd);
            $("#partGrid").data("kendoExtGrid").dataSource.read();
        }
        ,columns:[
            {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:40, attributes:{"class":"ac"}}
            ,{field:"crNo",title:"<spring:message code='ser.lbl.crNo' />", width:80, attributes:{"class":"al"} , hidden:true}
            ,{field:"crNm",title:"<spring:message code='ser.lbl.crNm' />", width:200, attributes:{"class":"al"}, hidden:true}
            ,{field:"crTp",title:"<spring:message code='ser.lbl.crTp' />", width:80
               ,attributes:{"class":"ac"}
               ,template:"#=crTpCdGrid(crTp)#"
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
            ,{field:"lbrNm",title:"<spring:message code='ser.lbl.rpirNm' />", width:200, attributes:{"class":"al"} }
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.serCnt' />", width:60, attributes:{"class":"ar"} }
            ,{field:"lbrHm",title:"<spring:message code='ser.lbl.custLbr' />", width:70, attributes :{"class":"ar"}}
            ,{field:"lbrRate",title:"<spring:message code='ser.lbl.lbrUntPrc' />", width:70, attributes :{"class":"ar"}}
            ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:80, attributes :{"class":"ar"}}
            ,{field:"lbrTp",hidden: true }
            ,{field:"dstinCd",hidden: true }
            ,{field:"hostCd", hidden:true}
        ]
    });

    /**부품 그리드 **/
    $("#partGrid").kendoExtGrid({
        gridId:"G-SER-1011-000012"
        ,dataSource:{
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
                        params["sHostCd"] = parentData.params.hostCd;
                        params["sVinNo"] = parentData.params.vinNo;
                        params["sLbrCd"] = $("#lbrCd").val();

                        return kendo.stringify(params);

                    } else if(operation != "read" && options.models){
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
                        ,giQty:{type:"number" }
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
        ,selectable:"row"
        ,autoBind:false //(parentData.autoBind == false || parentData.autoBind == undefined) ? false:true
        ,height:118
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, attributes:{"class":"ac"}}
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:70, attributes :{"class":"al"}, hidden:true}
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:190, attributes :{"class":"al"}, hidden:true}
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
            }
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes :{"class":"al"}}
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:100, attributes :{"class":"al"}}
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes :{"class":"al"}}
            ,{field:"giQty", title:"<spring:message code='ser.lbl.itemQty' />", width:60, attributes :{"class":"ar"}}
            ,{field:"stockUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:60, attributes :{"class":"ac"}}
            ,{field:"salePrcAmt", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:60, attributes :{"class":"ar"}}
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:60, attributes :{"class":"ar"}}
            ,{field:"itemPrc"  , hidden:true}
            ,{field:"grStrgeCd", hidden:true}
            ,{field:"giStrgeCd", hidden:true}
            ,{field:"hostCd", hidden:true}
        ]
    });

    //그리드 설정(딜러 작업정보-정비용)
    $("#dlrLbrGrid").kendoExtGrid({
        gridId:"G-SER-1207-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/campaign/selectCampaignDlrLbrInfoPopup.do' />"
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


                        params["sCrNo"] = parentData.params.crNo;
                        params["sHostCd"] = parentData.params.hostCd;


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
                         rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,lbrCd:{type:"string", editable:false}
                        ,lbrNm:{type:"string", editable:false}
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,lbrTp:{type:"string"}
                        ,lbrPrc:{type:"number"}
                        ,lbrHm:{type:"number"}
                        ,lbrQty:{type:"number"}
                        ,lbrAmt:{type:"number"}
                        ,lbrTotAmt:{type:"number"}
                        ,dcAmt:{type:"number"}
                        ,dcRate:{type:"number"}
                    }
                }
            }
        }
        ,height:118
        ,pageable:false
        ,editable:false
        ,selectable:"row"
        ,autoBind:(hostCd == "02" ) ? true:false
        ,sortable:false
        ,resizable:true
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
             {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:90}// 공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:180}// 공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lbrTpCdGrid(lbrTp)#"
            } // 공임유형(정비유형)
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            } // 정비공임
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"            }// 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}       // 공임금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80 , attributes:{"class":"ar"},format:"{0:n2}"} // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:90, attributes:{"class":"ar"},format:"{0:n2}"} // 할인금액
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:100, attributes:{"class":"ar"} , hidden: true,format:"{0:n0}"}// 정비수량
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", width:90, attributes:{"class":"ar"},format:"{0:n2}" }  // 예상공임비
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, hidden:true}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100, hidden:true
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100, hidden:true}    // 캠페인명
            ,{field:"lbrOrgHm", title:"lbrOrgHm", width:100, hidden:true}
            ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
            ,{field:"hostCd", hidden:true}
        ]

    });

    //그리드 설정(딜러 부품정보-정비용)
    $("#dlrPartGrid").kendoExtGrid({
        gridId:"G-SER-1207-000002"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/campaign/selectCampaignDlrPartInfoPopup.do' />"
                }//read
                ,parameterMap:function(options , operation){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sCrNo"] = parentData.params.crNo;
                        params["sHostCd"] = parentData.params.hostCd;

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
                         dlrCd:{type:"string", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false, validation:{required:true}}
                        ,itemPrc:{type:"number", editable:false}
                        ,crNo:{type:"string", editable:false}
                        ,salePrcAmt:{type:"number" }
                        ,itemTotAmt:{type:"number"}
                        ,stockUnitCd:{type:"string", editable:false}
                        ,giQty:{type:"number"}
                        ,dcRate:{type:"number"}
                        ,dcAmt:{type:"number"}
                        ,hostCd:{type:"string"}
                    }
                }
            }
        }
        ,height:118
        ,pageable:false
        ,editable:false
        ,selectable:"row"
        ,autoBind:(hostCd == "02" ) ? true:false
        ,resizable:true
        ,sortable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:"row"
        ,columns:[
             {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:90} // 부품번호
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:180} // 부품명
            ,{field:"stockUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:80}  // 계산단위
            ,{field:"giQty", title:"<spring:message code='ser.lbl.itemQty' />", width:90, attributes:{"class":"ar"},format:"{0:n2}"}// 부품수량
            ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"},format:"{0:n2}"}// 부품단가
            ,{field:"salePrcAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}  // 부품금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:90 , attributes:{"class":"ar"},format:"{0:n2}"}        // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:90, attributes:{"class":"ar"},format:"{0:n2}"} // 할인금액
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100, attributes:{"class":"ar"},format:"{0:n2}"}  // 예정부품대
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100,hidden:true}    // 캠페인번호
            ,{field:"grStrgeCd",hidden:true}
            ,{field:"giStrgeCd",hidden:true}
            ,{field:"hostCd", hidden:true}
        ]

    });


    $("#crNo").val(parentData.params.crNo);
    $("#crNm").val(parentData.params.crNm );

    $("#bhmcCampaign").attr("style",(hostCd == "01") ? "display:inline":"display:none");
    $("#dlrCampaign").attr("style",(hostCd == "02") ? "display:inline":"display:none" );

    if(parentData.params.preFixId == "PC"){    // 사전점검일 경우 선택버튼 비활성화
        $("#btnSelect").data("kendoButton").enable(false);
    }

});

</script>
<!-- //script -->