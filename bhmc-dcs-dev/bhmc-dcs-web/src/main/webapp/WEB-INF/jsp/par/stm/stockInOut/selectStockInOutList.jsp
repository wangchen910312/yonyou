<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

   <!-- 재고리스트 조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.stockList" /> --%><!-- 재고리스트 조회 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code='global.btn.save' /><!-- 저장 --></button>
                <button class="btn_m" id="btnDownload"><spring:message code="par.btn.downloadFile" /><!-- 파일다운로드 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>
        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:11%;">
                    <col style="width:24%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.strgeNm" /><!-- 창고 --></span></th>
                        <td class="required_area">
                            <input type="text" id="sStrgeCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></span></th>
                        <td class="required_area">
                             <input type="text" id="sItemDstinCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemGrpCd" /><!-- 품목그룹 --></th>
                        <td>
                            <input type="text" id="sItemGrpCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" />
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.disContinued" /><!-- 단종여부 --></th>
                        <td>
                             <input type="text" id="sEndYn" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input type="text" id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemClass" /><!-- 부품등급(ABC Class) --></th>
                        <td>
                            <input type="text" id="sAbcInd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.nonMovingFlg" /><!-- 방치품(Non-Moving여부) --></th>
                        <td>
                            <input type="text" id="sNonMovingFlg" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.lastStockInDt" /><!-- 최근입고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGrDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGrDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockOutDt" /><!-- 최근출고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGiDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGiDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td>
                            <label class="label_check"><input type="checkbox" id="sAvailQtyFlg" class="form_check">&nbsp;<spring:message code="par.lbl.excludeAvlbStockQtyZero" /><!-- 가용재고수량 0인 부품 제외 --></label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>


        <div class="table_form mt10" id="itemForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:22%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.locationCd" /><!-- Location --></th>
                        <td>
                            <input id="locCd" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcLeadHm" /><!-- 화물도착주기(구매리드타임) --></th>
                        <td>
                            <input id="purcLeadHm" data-type="number" readonly class="form_numeric form_readonly" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.expcGrStrgeCd" /><!-- 예정입고창고 --></th>
                        <td>
                            <input id="expcGrStrgeCd" type="text" data-type="combo" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.minOrdQty" /><!--최소오더수량 --></th>
                        <td>
                            <input id="minOrdQty" data-type="number" class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sftyStockQty" /><!--최소안전재고 --></th>
                        <td>
                            <input id="sftyStockQty" data-type="number" class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockQty" /><!--적정재고 --></th>
                        <td>
                            <input id="stdrdStockQty" readonly class="form_numeric form_readonly" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockParameter" /><!--적정재고계수 --></th>
                        <td>
                            <input id="stdrdStockParameter" data-type="number" class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sftyStockMaxQty" /><!--최대안전재고 --></th>
                        <td>
                            <input id="sftyStockMaxQty" data-type="number" class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemClass" /><!--부품등급(ABC Class) --></th>
                        <td>
                            <input id="itemClass" type="text" value="" readonly class="form_input form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.mm3AvgDmndQty" /><!--3개월평균수요량 --></th>
                        <td>
                            <input id="mm3AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mm6AvgDmndQty" /><!--6개월평균수요량 --></th>
                        <td>
                            <input id="mm6AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mm12AvgDmndQty" /><!--12개월평균수요량 --></th>
                        <td>
                            <input id="mm12AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stdrdStockCalcYn" /><!--적정재고계산 --></th>
                        <td class="readonly_area">
                            <input id="stdrdStockCalcYn"  type="text" data-type="combo" readonly class="form_comboBox form_readonly">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.nonMoving" /><!--방치품(Non-Moving여부) --></th>
                        <td class="readonly_area">
                            <input id="nonMovingFlg"  type="text" data-type="combo" readonly class="form_comboBox form_readonly">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockInDt" /><!--최근입고일 --></th>
                        <td class="readonly_area">
                            <input id="lastGrDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcCqtyCalcYn" /><!--구매수요량계산 --></th>
                        <td class="readonly_area">
                            <input id="purcCqtyCalcYn"  type="text" data-type="combo" readonly class="form_comboBox form_readonly">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.endYn" /><!--중지부품 --></th>
                        <td>
                            <input  id="endYn" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastStockOutDt" /><!--최근출고일 --></th>
                        <td class="readonly_area">
                            <input id="lastGiDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate" >
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row" class="hidden"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td class="hidden">
                            <input id="itemCd" type="text" class="form_input hidden">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //재고리스트 조회 -->

    <!-- script -->
    <script type="text/javascript">
    //전역변수는 왜 밖으로 뺄까?
    var itemDstinCdList     = []
       ,itemDstinCdObj      = {}
       ,abcIndList          = []
       ,abcIndObj           = {}
       ,itemGroupList       = []
       ,itemGroupObj        = {}
       ,itemGroupGridObj    = {}
       ,storageCdList       = [] //array로 받는 것은 list로 뿌려주기 위함
       ,storageObj          = {}
       ,useYnList           = []
       ,useYnObj            = {}
       ,spyrCdObj           = {}
       ,selectItempopupWindow
       ,carlineCdList       = []
       ,rowNumber           = 0 //그리드 목록 번호
       ,chkDateValue
       ,toDt                = "${toDt}"
       ,investigationListPopupWindow
       ,searchItemPopupWindow;

     //창고 선택
    <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
      storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
      storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
      itemDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
      itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //품목그룹 선택
    <c:forEach var="obj" items="${itemGroupList}">
    if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }else{
        itemGroupObj["${obj.itemDstinCd}"] = [];
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"", cmmCdNm:"All"});
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});

        itemGroupGridObj["${obj.itemDstinCd}"] = {};
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }
    </c:forEach>

    //ABC Class선택
    <c:forEach var="obj" items="${abcIndList}" varStatus="status"> //key value
      abcIndList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
      abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //차종선택
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status"> //key value
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
    spyrCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    useYnList.push({cmmCd:"Y", cmmCdNm:"是"});
    useYnObj["Y"] = "是";
    useYnList.push({cmmCd:"N", cmmCdNm:"否"});
    useYnObj["N"] = "否";

    $(document).ready(function() {

        //조회조건-창고선택
        $("#sStrgeCd").kendoExtDropDownList({
           dataSource    :storageCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,index         :0
        });

        //조회조건-품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
           dataSource    :itemDstinCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,index         :0
        });

        //조회조건-품목그룹선택
        $("#sItemGrpCd").kendoExtDropDownList({
           dataSource    :[]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-차종선택
        $("#sCarlineCd").kendoExtDropDownList({
           dataSource    :carlineCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-단종여부선택
        $("#sEndYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,optionLabel:" "
           ,dataSource:useYnList
           ,index:0
       });

        //조회조건-ABC Class선택
        $("#sAbcInd").kendoExtDropDownList({
           dataSource    :abcIndList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-Non-Moving Stock 여부선택
        $("#sNonMovingFlg").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,optionLabel:" "
           ,dataSource:useYnList
           ,index:0
       });

         //조회조건-최근입고일 선택
        $("#sLastGrDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sLastGrDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        //조회조건-최근출고일 선택
        $("#sLastGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sLastGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#lastGrDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#lastGiDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        //화물도착주기(구매리드타임)
        $("#purcLeadHm").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //예정입고창고선택
        $("#expcGrStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageCdList
            ,index:0
        });

        //최소오더수량
        $("#minOrdQty").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //최소안전재고
        $("#sftyStockQty").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //적정재고
        $("#stdrdStockQty").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //적정재고계수
        $("#stdrdStockParameter").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //최대안전재고
        $("#sftyStockMaxQty").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //3개월평균소요량
        $("#mm3AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //6개월평균소요량
        $("#mm6AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //12개월평균소요량
        $("#mm12AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });

        //적정재고계산
        $("#stdrdStockQty").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
        });

        //적정재고산출
        $("#stdrdStockCalcYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //방치품
        $("#nonMovingFlg").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //구매수요량계산
        $("#purcCqtyCalcYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //중지부품
        $("#endYn").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });


       $("#searchItemCd").on('click', selectPartsMasterPopupWindow);


       //다운로드 btn
       $("#btnDownload").kendoButton({
           click:function(e){
               // ready message
               dms.notification.success("<spring:message code='global.info.ready'/>");

           }
       });

        //저장 btn
       $("#btnSave").kendoButton({
           click:function(e){

               if(dms.string.isEmpty($("#itemCd").val())){
                   // 저장할 목록이 없습니다.
                   dms.notification.warning("<spring:message code='global.info.unselected' />");

                   //부품번호는 필수 입력 사항입니다.
                   //dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.required.field' arguments='${itemCd}'/>");
                   return false;
               }

               var params = {};


               params["itemCd"]                = $("#itemCd").val();
               params["locCd"]                 = $("#locCd").val();
               params["minPurcQty"]            = $("#minOrdQty").data("kendoExtNumericTextBox").value();
               params["sftyStockQty"]          = $("#sftyStockQty").data("kendoExtNumericTextBox").value();
               params["stdrdStockApplyRate"]   = $("#stdrdStockParameter").data("kendoExtNumericTextBox").value();
               params["maxSftyStockQty"]       = $("#sftyStockMaxQty").data("kendoExtNumericTextBox").value();
               params["grStrgeCd"]             = $("#expcGrStrgeCd").data("kendoExtDropDownList").value();
               params["endYn"]                 = $("#endYn").data("kendoExtDropDownList").value();

               console.log('params:',JSON.stringify(params));

               $.ajax({
                   url:"<c:url value='/par/stm/stockInOut/updateItemMasterByKey.do' />"
                 , type:"POST"
                 , data:JSON.stringify(params)
                 , dataType:"json"
                 , contentType:'application/json'
                 , async:false
                 , success:function(result) {
                     console.log('result:', result);
                     if (result == 1) {
                       //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#grid").data("kendoExtGrid").dataSource.read();

                     } else {
                         // 에러 메시지 확인.
                         console.log('errorResult:',result);
                         if(result === 0){
                             dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                         }
                     }
                 }
                 , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             });

           }
       });

       // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sStrgeCd").val())){
                    //창고번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.strgeNm' var='sStrgeCd' /><spring:message code='global.info.emptyParamInfo' arguments='${sStrgeCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#sItemDstinCd").val())){
                    //품목번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.itemDstinCd' var='sItemDstinCd' /><spring:message code='global.info.emptyParamInfo' arguments='${sItemDstinCd}'/>");
                    return false;
                }


                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //sItemDstinCd->sItemGrpCd 변경
        $("#sItemDstinCd").on("change", function (){
            $("#sItemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
            });


        // 현재고리스트 그리드
            $("#grid").kendoExtGrid({
                dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/par/stm/stockInOut/selectStockInOutList.do' />"

                        }
                      , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var checkvalue = $("#sAvailQtyFlg").prop("checked");
                            var sAvailQtyFlg;

                            if( checkvalue === true){
                                sAvailQtyFlg = 'Y';
                            }else{
                                sAvailQtyFlg = 'N';
                            }
                            params["sort"]               = options.sort;

                            // 현재고조회 검색조건 코드.
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sItemGrpCd"]         = $("#sItemGrpCd").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sEndYn"]             = $("#sEndYn").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sNonMovingFlg"]      = $("#sNonMovingFlg").data("kendoExtDropDownList").value();
                            params["sLastGrDtFr"]        = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGrDtTo"]        = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtFr"]        = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sLastGiDtTo"]        = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sAvailQtyFlg"]       = sAvailQtyFlg;

                            return kendo.stringify(params);
                        }
                    }
                    }
                    ,schema:{
                        data:function (result){
                            if(result.total === 0){
                                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                            }
                            return result.data;
                        }
                        ,model:{
                           id:"stockInOutList"
                               ,fields:{
                                     dlrCd                 :{ type:"string" }
                                   , pltCd                 :{ type:"string" }
                                   , rnum                  :{ type:"number" }
                                   , strgeCd               :{ type:"string" }
                                   , itemCd                :{ type:"string" }
                                   , itemNm                :{ type:"string" }
                                   , stockLockYn           :{ type:"string" }
                                   , stockUnitCd           :{ type:"string" }
                                   , itemDstinCd           :{ type:"string" }
                                   , itemGrpCd             :{ type:"string" }
                                   , abcInd                :{ type:"string" }
                                   , carlineCd             :{ type:"string" }
                                   , nonMovingFlg          :{ type:"string" }
                                   , endYn                 :{ type:"string" }
                                   , lastGrDt              :{ type:"date" }
                                   , lastGiDt              :{ type:"date" }
                                   , avlbStockQty          :{ type:"number" }
                                   , resvStockQty          :{ type:"number" }
                                   , clamStockQty          :{ type:"number" }
                                   , borrowQty             :{ type:"number" }
                                   , rentQty               :{ type:"number" }
                                   , grScheQty             :{ type:"number" }
                                   , spyrCd                :{ type:"string" }
                                   , regUsrId              :{ type:"string" }
                                   , regDt                 :{ type:"date" }
                                   , updtUsrId             :{ type:"string" }
                                   , updtDt                :{ type:"date" }
                                   , resvStockQty          :{ type:"number" }
                                   , mvtDocYyMm            :{ type:"date" }
                                   , mm3AvgDmndQty         :{ type:"number" }
                                   , mm6AvgDmndQty         :{ type:"number" }
                                   , mm12AvgDmndQty        :{ type:"number" }
                                   , grStrgeCd             :{ type:"string" }
                                   , purcLeadHm            :{ type:"string" }
                                   , purcCqtyCalcYn        :{ type:"string" }
                                   , maxSftyStockQty       :{ type:"number" }
                                   , sftyStockQty          :{ type:"number" }
                                   , minPurcQty            :{ type:"number" }
                                   , stdrdStockApplyRate   :{ type:"number" }
                                   , stdrdStockCalcYn      :{ type:"string" }
                                   , stdrdStockQty         :{ type:"number" }
                                   , movingAvgPrc          :{ type:"number" }
                                   , purcPrc               :{ type:"number" }
                                   , retlPrc               :{ type:"number" }
                                   , whslPrc               :{ type:"number" }
                                   , incPrc                :{ type:"number" }
                                   , grtePrc               :{ type:"number" }
                                   , taxDdctRetlPrc        :{ type:"number" }
                                   , taxDdctWhslPrc        :{ type:"number" }
                                   , taxDdctIncPrc         :{ type:"number" }
                                   , taxDdctGrtePrc        :{ type:"number" }
                            }
                        }
                    }
                }
                , height     :300
                , selectable:"row"
                , scrollable :true
                , autoBind   :false
                , pageable   :false
                , editable   :false
                , dataBinding :function(e){
                      rowNumber = 0;
                }
                ,change:function(e) {

                        var selectedVal = this.dataItem(this.select());

                        $("#itemCd").val(selectedVal.itemCd);                                                //부품번호
                        $("#purcLeadHm").val(selectedVal.purcLeadHm);                                        //화물도착주기
                        $("#itemClass").val(selectedVal.abcInd);                                             //부품등급
                        $("#endYn").data("kendoExtDropDownList").value(selectedVal.endYn);                      //중지부품
                        $("#expcGrStrgeCd").data("kendoExtDropDownList").value(selectedVal.grStrgeCd);          //예상입고창고
                        $("#stdrdStockCalcYn").data("kendoExtDropDownList").value(selectedVal.stdrdStockCalcYn);//적정재고계산
                        $("#nonMovingFlg").data("kendoExtDropDownList").value(selectedVal.nonMovingFlg);        //방치품
                        $("#purcCqtyCalcYn").data("kendoExtDropDownList").value(selectedVal.purcCqtyCalcYn);    //구매수요량계산
                        $("#mm3AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm3AvgDmndQty);    //3개월평균수요량
                        $("#mm6AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm6AvgDmndQty);    //6개월평균수요량
                        $("#mm12AvgDmndQty").data("kendoExtNumericTextBox").value(selectedVal.mm12AvgDmndQty);  //12개월평균수요량
                        $("#minOrdQty").data("kendoExtNumericTextBox").value(selectedVal.minPurcQty);           //최소오더수량
                        $("#sftyStockQty").data("kendoExtNumericTextBox").value(selectedVal.sftyStockQty);      //최소안전재고수량
                        $("#sftyStockMaxQty").data("kendoExtNumericTextBox").value(selectedVal.maxSftyStockQty);//최대안전재고수량
                        $("#stdrdStockParameter").data("kendoExtNumericTextBox").value(selectedVal.stdrdStockApplyRate);    //적정재고계수
                        $("#lastGiDt").data("kendoExtMaskedDatePicker").value(selectedVal.lastGiDt);         //최근출고일
                        $("#lastGrDt").data("kendoExtMaskedDatePicker").value(selectedVal.lastGrDt);         //최근입고일
                        $("#stdrdStockQty").data("kendoExtNumericTextBox").value(selectedVal.stdrdStockQty);    //적정재고
                }
                , columns:[
                      {   //No
                          field     :"rnum"
                         ,title     :"<spring:message code='par.lbl.line'  />"
                         ,attributes:{"class":"ac"}
                         ,sortable  :false
                         ,template  :"#= ++rowNumber #"
                         ,width     :40}
                     ,{   //딜러코드
                          field     :"dlrCd"
                         ,title     :"<spring:message code='par.lbl.dlrCd' />"
                         ,hidden    :true
                         ,width     :100}
                     ,{   //센터코드
                          field     :"pltCd"
                         ,title     :"<spring:message code='par.lbl.pltCd' />"
                         ,attributes:{"style":"text-align:right"}
                         ,hidden    :true
                         ,width     :100}
                     ,{   //창고
                          field     :"strgeCd"
                         ,title     :"<spring:message code='par.lbl.strgeNm' />"
                         ,attributes:{"class":"ac"}
                         ,template  :'#= changeStrgeCd(strgeCd)#'
                         ,width     :100}
                     ,{   //부품번호
                           field    :"itemCd"
                          ,title    :"<spring:message code='par.lbl.itemCd' />"
                         ,attributes:{"class":"ac"}
                          ,width    :120 }
                     ,{   //부품명
                           field    :"itemNm"
                          ,title    :"<spring:message code='par.lbl.itemNm' />"
                         ,attributes:{"class":"ac"}
                          ,width    :160 }
                     ,{   //단위
                           field    :"stockUnitCd"
                          ,title    :"<spring:message code='par.lbl.unit' />"
                          ,attributes:{"class":"ac"}
                          ,width    :50 }
                     ,{   //제어여부
                           field    :"stockLockYn"
                          ,title    :"<spring:message code='par.lbl.stockLockYn' />"
                          ,attributes:{"class":"ac"}
                          ,width    :100 }
                     ,{   //가용재고
                          field    :"avlbStockQty"
                         ,title    :"<spring:message code='global.lbl.avlbStockQty' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //예약재고
                          field    :"resvStockQty"
                         ,title    :"<spring:message code='global.lbl.resvStockQty' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //보류재고
                          field    :"clamStockQty"
                         ,title    :"<spring:message code='global.lbl.clamStockQty' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //예정입고
                          field    :"grScheQty"
                         ,title    :"<spring:message code='par.lbl.grSche' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //예정출고
                          field    :"giScheQty"
                         ,title    :"<spring:message code='par.lbl.giSche' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //대출(차출)수량
                          field    :"rentQty"
                         ,title    :"<spring:message code='par.lbl.transferQty' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //차입수량
                          field    :"borrowQty"
                         ,title    :"<spring:message code='par.lbl.loanQty' />"
                         ,attributes:{"class":"ar"}
                         ,format   :"{0:n2}"
                         ,width    :80 }
                     ,{   //위치
                          field    :"locationCd"
                         ,title    :"<spring:message code='par.lbl.locationCd' />"
                         ,width    :140 }
                     ,{   //공급상
                          field    :"spyrCd"
                         ,title    :"<spring:message code='par.lbl.spyrCd' />"
                         ,attributes:{"class":"ac"}
                         ,template :'#= changeSpyrCd(spyrCd)#'
                         ,width    :100 }
                     ,{   //품목구분
                          field    :"itemDstinCd"
                         ,title    :"<spring:message code='par.lbl.itemDstinCd' />"
                         ,template :'#= changeItemDstinCd(itemDstinCd)#'
                         ,width    :80 }
                     ,{   //ABC Class
                          field    :"abcInd"
                         ,title    :"<spring:message code='par.lbl.abcInd' />"
                         ,attributes:{"class":"ac"}
                         ,template :'#= changeAbcInd(abcInd)#'
                         ,width    :80}
                     ,{   //차종
                          field    :"carlineCd"
                         ,title    :"<spring:message code='global.lbl.carLine' />"
                         ,attributes:{"class":"ac"}
                         ,width    :80 }
                     ,{   //재고단가
                          field    :"movingAvgPrc"
                         ,title    :"<spring:message code='par.lbl.stockCost' />"
                         ,format   :"{0:n2}"
                         ,attributes:{"class":"ar"}
                         ,width    :80 }
                     ,{   //구매가
                          field    :"purcPrc"
                         ,title    :"<spring:message code='par.lbl.purcPrice' />"
                         ,format   :"{0:n2}"
                         ,attributes:{"class":"ar"}
                         ,width    :80 }
                     , {  //판매가
                          title    :"<spring:message code='par.lbl.salePriceCost01' />"
                         ,attributes:{"class":"ac"}
                         ,width    :80
                         ,headerAttributes:{"class":"hasBob"}
                         ,columns  :[
                                    {field     :"retlPrc"
                                    ,title     :"<spring:message code='par.lbl.taxInclude'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                                    ,{field     :"taxDdctRetlPrc"
                                    ,title     :"<spring:message code='par.lbl.taxSprt'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                         ]
                     }
                    ,{  //도매가
                          title    :"<spring:message code='par.lbl.salePriceCost02' />"
                         ,headerAttributes:{"class":"hasBob"}
                         ,columns   :[
                                    {field     :"whslPrc"
                                    ,title     :"<spring:message code='par.lbl.taxInclude'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                                    ,{field     :"taxDdctWhslPrc"
                                    ,title     :"<spring:message code='par.lbl.taxSprt'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                         ]
                     }
                    ,{  //보험가
                          title    :"<spring:message code='par.lbl.salePriceCost03' />"
                         ,headerAttributes:{"class":"hasBob"}
                         ,columns   :[
                                    {field     :"incPrc"
                                    ,title     :"<spring:message code='par.lbl.taxInclude'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                                    ,{field     :"taxDdctIncPrc"
                                    ,title     :"<spring:message code='par.lbl.taxSprt'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :70}
                         ]
                     }
                    ,{  //보증가
                          title    :"<spring:message code='global.lbl.salePriceCost04' />"
                         ,headerAttributes:{"class":"hasBob"}
                         ,columns   :[
                                    {field     :"grtePrc"
                                    ,title     :"<spring:message code='par.lbl.taxInclude'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :60}
                                    ,{field     :"taxDdctGrtePrc"
                                    ,title     :"<spring:message code='par.lbl.taxSprt'  />"
                                    ,attributes:{"class":"ar"}
                                    ,width     :60}
                         ]
                     }
                   , { field:"" }
                ]
            });


            // 공급상유형
            changeSpyrCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = spyrCdObj[val];
                }
                return returnVal;
            };

            // 창고 그리드 콤보
            changeStrgeCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = storageObj[val];
                }
                return returnVal;
            };

            // 품목구분 그리드 콤보
            changeItemDstinCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = itemDstinCdObj[val];
                }
                return returnVal;
            };

            // 품목그룹 그리드 콤보
            changeItemGrp = function(dstinVal, grpVal){
                var returnVal = "";
                if(!dms.string.isEmpty(dstinVal) && !dms.string.isEmpty(grpVal)){
                    returnVal = itemGroupGridObj[dstinVal][grpVal];
                }
                return returnVal;
            };

            //  ABC CLASS
            changeAbcInd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = abcIndObj[val];
                }
                return returnVal;
            };

            // 재고 통제 여부 체크박스
            chkStockLockYn = function(val){

                var returnVal = "";
                if(val === 'Y'){
                    returnVal = "<input type='checkbox' name='stockLockYn' disabled=true checked />";
                }else{
                    returnVal = "<input type='checkbox' name='stockLockYn' disabled=true/>";
                }

                return returnVal;
            };
            // 날짜 검증
            function fnChkDateValue(e){

                var  elmt  = e.sender.element[0],
                     id    = elmt.id,
                     toYY,
                     toMM,
                     toDD,
                     frYY,
                     frMM,
                     frDD;

                //최근입고일
                  if(id === 'sLastGrDtFr'){
                      frYY = this.value().getFullYear();
                      frMM = this.value().getMonth();
                      frDD = this.value().getDate();
                      $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                  }else if(id === 'sLastGrDtTo'){
                      toYY = this.value().getFullYear();
                      toMM = this.value().getMonth();
                      toDD = this.value().getDate();
                      $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                //최근출고일
                  }else if(id === 'sLastGiDtFr'){
                      frYY = this.value().getFullYear();
                      frMM = this.value().getMonth();
                      frDD = this.value().getDate();
                      $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                  }else if(id === 'sLastGiDtTo'){
                      toYY = this.value().getFullYear();
                      toMM = this.value().getMonth();
                      toDD = this.value().getDate();
                      $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                  }
             }

          initPage();

        });

        //초기화 버튼
        function initPage(){
               //그리드 reset
              $("#grid").data("kendoExtGrid").dataSource.data([]);
              //조회조건reset
              $("#sStrgeCd").data("kendoExtDropDownList").value("A07AA-01");
              $("#sItemDstinCd").data("kendoExtDropDownList").value("02");
              $("#sItemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj["02"]);
              $("#sItemCd").val("");
              $("#sItemNm").val("");
              $("#sEndYn").data("kendoExtDropDownList").value('');
              $("#sCarlineCd").data("kendoExtDropDownList").value('');
              $("#sAbcInd").data("kendoExtDropDownList").value('');
              $("#sNonMovingFlg").data("kendoExtDropDownList").value('');
              $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value("");
              $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value("");
              $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value("");
              $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value("");
              $("#sAvailQtyFlg").prop('checked',false); //removeAttr("checked");


              //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                    return false;
                }

                // 품목 정보 Reset
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                partsJs.validate.groupObjAllDataInit();

          }

        //부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind":false
                         , "callbackFunc":function(data){
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);

                            searchItemPopupWindow.close();
                        }
                   }
                }
            });
        }

        </script>
    <!-- /script -->
