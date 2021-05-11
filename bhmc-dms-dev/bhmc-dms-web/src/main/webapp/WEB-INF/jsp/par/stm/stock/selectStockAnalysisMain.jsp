<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11848" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11847" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.supplyTp" /><!-- 공급업체유형 --></th>
                        <td>
                            <input id="sBpTp" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 부품유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" data-type="combo" type="text" class="form_comboBox" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 업체명칭 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input" />
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.carlineNm' /></th><!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" data-type="combo" />
                            <input id="sModelCd" class="form_comboBox hidden" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.startHm" /><!-- 시작일자 --></th>
                        <td>
                           <input class="form_datepicker" id="sYyMm">
                        </td>
                        <th scope="row"><%-- <spring:message code="sal.lbl.deadlineTime" /> --%></th>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
</div>
<script>
    var popupWindow,
        sessionBpCd         = "${bpCd}",
        sessionBpNm         = "${bpNm}",
        toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        rowNumber           = 0, //그리드 목록 번호
        carlineCdList       = [],
        carlineCdObj        = {},
        bpTpList            = [],
        bpTpObj             = {},
        itemDstinCdList     = [],
        itemDstinCdObj      = {},
        modelCdList         = [],
        modelCdObj          = {},
        popItemObj          = {},
        venderSearchPopupWin,
        searchItemPopupWindow;

    //차종조회
    <c:forEach var="obj" items="${carLineCdInfo}">
        carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
        //if("${obj.useYn}" !== 'N'){
            itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        //}
    </c:forEach>

    bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${bpTpList}" varStatus="status">
        if("01" === "${obj.remark2}"){
            bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {

         //거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
        });

        /**
         * 차종 콤보박스
         */
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#sModelCd").kendoExtDropDownList({
             dataTextField:"modelNm"
            ,dataValueField:"modelCd"
            ,filter:"contains"
            ,optionLabel:" "
         });
         //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
         $("#sModelCd").data("kendoExtDropDownList").enable(false);

        //년월
        $("#sYyMm").kendoDatePicker({
            //define the start view
            start:"year"
            //defines when the calendar shoule retrun date
            ,depth:"year"
            //display month and year in the input
            ,format:"yyyyMM"
        });

        //품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#sYyMm").val())){
                    dms.notification.warning("<spring:message code='par.lbl.grGiYm' var='grGiYm' /><spring:message code='global.info.required.field' arguments='${grGiYm}'/>");
                    return false;
                }

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        //재고분석 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0913-093201"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stock/selectStockAnalysisByCondition.do' />"
                    }
                    ,parameterMap:function(options, operation){

                        if(operation ==="read"){

                            var params = {};

                            //검색조건
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sYyMm"] = $("#sYyMm").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function(result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }
                        return result.data;
                    }
                    ,model:{
                        id:"selectReceiveCnfmList"
                        ,fields:{
                            dlrCd:{ type:"string"}
                            ,bpTp:{ type:"string"}
                            ,bpCd:{ type:"string"}                       <!-- 거래처코드 -->
                            ,bpNm:{ type:"string"}                       <!-- 거래처명 -->
                            ,itemCd:{ type:"string"}                     <!-- 부품코드 -->
                            ,itemNm:{ type:"string"}                     <!-- 부품명 -->
                            ,stockUnitCd:{ type:"string"}                <!-- 단위 -->
                            ,itemDstinCd:{ type:"string"}                <!-- 품목유형 -->
                            ,carlineCd:{ type:"string"}                  <!-- 차종명칭 -->
                            ,modelCd:{ type:"string"}                    <!-- 차형명칭 -->
                            ,stocQty:{ type:"number"}                    <!-- 재고수량 -->
                            ,avlbStockQty:{ type:"number"}               <!-- 가용수량 -->
                            ,exptStockQty:{ type:"number"}               <!-- 예약수량 -->
                            ,resvStockQty:{ type:"number"}               <!-- 예류수량-->
                            ,borrowQty:{ type:"number"}                  <!-- 차입수량 -->
                            ,rentQty:{ type:"number"}                    <!-- 차출수량 -->
                            ,stockAmt:{ type:"number"}                   <!-- 재고금액 -->
                            ,inventoryTurnOverRatio:{ type:"number"}     <!-- 재고회전율 -->
                            ,mos:{ type:"number"}                        <!-- MOS : (부품재고금액 / 조달출고금액(3M)) / 90 -->
                       }
                   }
               }
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,editable:false
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.line'  />" ,attributes:{"class":"ac"} ,sortable:false ,width:40}
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.supplyTp' />" ,attributes:{ "class":"ac"} ,width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.sBpNm' />" ,width:180}//공급업체명칭
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품코드
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"stockUnitCd" ,title:"<spring:message code='par.lbl.unitNm' />" ,attributes:{"class":"ac"} ,width:80}//재고단위코드
                ,{field:"itemDstinCd" ,title:"<spring:message code='par.lbl.itemDstinCd' />" ,width:80
                    ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }//품목유형
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />" ,width:100
                    ,template:'#= changeCarlineCd(carlineCd)#'
                }//차종명칭
                ,{field:"modelCd" ,title:"<spring:message code='par.lbl.modelNm' />" ,width:100}//차형명칭
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:80}//재고수량
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:80}//가용수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,width:80}//예류수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//차입수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.rentItemQty' />" ,width:80 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//대여수량
                ,{field:"stockAmt" ,title:"<spring:message code='par.lbl.stockPrice' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//재고금액
                ,{field:"inventoryTurnOverRatio" ,title:"<spring:message code='par.lbl.inventoryTurnOverRatio' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//재고회전율
                ,{field:"mos" ,title:"<spring:message code='par.lbl.saleMos' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}", hidden:true}//MOS
            ]
        });

        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
            }
            return returnVal;
        };

        //changeCarlineCd Func
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(carlineCdObj[val] != undefined){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };

        //공급처유형
        changeBpTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = bpTpObj[val];
            }
            return returnVal;
        };

        initPage();

    });

    function initPage(){
        var nowDt = new Date(),
            nowYy = nowDt.getFullYear(),
            nowMM = nowDt.getMonth();

        nowMM = dms.string.lpad(nowMM + 1,'0',2);

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#sBpTp").data("kendoExtDropDownList").value('01');  //고객유형 기본셋팅
        $("#sYyMm").data("kendoDatePicker").value(nowYy + '' + nowMM);  //고객유형 기본셋팅
    }

    /** [조회조건 영역] ComboBox Select() **/
     // 차종에 따른 모델검색
     function onSelectSearchCarlineCd(e){
         var dataItem = this.dataItem(e.item),
             responseJson;

         $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
        // $("#sModelCd").data("kendoExtDropDownList").wrapper.show();
         $("#sModelCd").data("kendoExtDropDownList").enable(true);

         if(dataItem.carlineCd == ""){
             $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sModelCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         responseJson = dms.ajax.getJson({
             url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
             ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
             ,async:false
         });

         $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

     function selectVenderMasterPopupWindow(){

         venderSearchPopupWin = dms.window.popup({
             windowId:"venderSearchPopupWin"
             ,title:"<spring:message code = 'par.title.venderSelect'/>"//거래처 조회
             ,content:{
                 url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                 ,data:{
                     "type":"custom1"
                     ,"autoBind":false
                     ,"bpTp":$("#sBpTp").data("kendoExtDropDownList").value()
                     ,"bpCd":""
                     ,"bpNm":$("#sBpNm").val()
                     ,"selectable":"row"
                     ,"callbackFunc":function(data){
                         if(data.length > 0){
                             var bpNm,
                                 bpCd;
                             for(var i = 0,dlen = data.length; i < dlen; i = i + 1){
                                 if(i === 0){
                                     bpNm = data[i].bpNm;
                                     bpCd = data[i].bpCd;
                                 }else{
                                     bpNm = bpNm + ',' + data[i].bpNm;
                                     bpCd = bpCd + '|' + data[i].bpCd;
                                 }

                             }
                         }
                         $("#sBpNm").val(bpNm);
                         $("#sBpCd").val(bpCd);

                         venderSearchPopupWin.close();
                     }
                 }
             }
         });
     }

     //부품 팝업 열기 함수
     function selectPartsMasterPopupWindow(){

         searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
            ,content:{
                url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
               ,data:{
                   "type"        :""
                  ,"autoBind"    :false
                  ,"itemCd"      :$("#sItemCd").val()
                  ,"itemNm"      :$("#sItemNm").val()
                  ,"callbackFunc":function(data){
                         $("#sItemCd").val(data[0].itemCd);
                         $("#sItemNm").val(data[0].itemNm);

                         searchItemPopupWindow.close();
                  }

               }
            }
         });
     }

</script>