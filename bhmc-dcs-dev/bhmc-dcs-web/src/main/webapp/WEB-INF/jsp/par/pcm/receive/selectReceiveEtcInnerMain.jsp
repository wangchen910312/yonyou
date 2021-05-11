<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타입고정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.receiveEtcInner" /> --%><!-- 내부수령 --></h1>
            <div class="btn_right">
                <button class="btn_m" id="btnLinkEtcReceiveList"><spring:message code="par.btn.etcReceiveList" /><!-- 기타입고현황 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" id="searchForm">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span></th>
                        <td class="required_area">
                            <input id="sMvtTp" name="sMvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGrTp" />" class="form_comboBox">
                        </td>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="sReceiveId" name="receiveId" class="form_input" required data-name="<spring:message code="par.lbl.receiveId" />" />
                                <a id="searchReceiverId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveNm" /><!-- 수령인명 --></th>
                        <td>
                            <input type="text" id="sReceiveNm" class="form_input form_readonly" readonly />
                        </td>

                        <th scope="row"><spring:message code="par.lbl.docNo" /><!-- 문서번호 --></th>
                        <td>
                            <input id="sEtcGrDocNo" class="form_input form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.subClass" /><!-- 소분류 --></th>
                        <td>
                            <input id="sSubClass" type="text" data-type="combo" class="form_comboBox"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일자 --></th>
                        <td colspan="2">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGiDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGiDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="totQty" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="3">
                            <input id="remark" type="text" value="" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add"  id="btnRentAdd"><spring:message       code="par.btn.addRentDoc" /></button>
                <button class="btn_s btn_del"  id="btnRentDel"><spring:message       code="par.btn.delRentDoc" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div>
            <!-- 부품기타입고 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품기타입고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pEtcGrDocNo         = "${pEtcGrDocNo}",
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        giReasonCdObj       = {},
        giReasonCdList      = [],
        popItemObj          = {},
        issueEtcPopupWindow,
        searchItemPopupWindow,
        userSearchPopupWin,
        changeAmtEditor,
        changeUnitCd;


        locationObj[' '] = "";
        mvtTpList.push({cmmCd:"37", cmmCdNm:"內部領用"});

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        strgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
            strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>


    $(document).ready(function() {

        //기타입고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });
        //총수량
        $("#totQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        $("#searchReceiverId").on('click', userSearchPopup);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGrDocNo = ''; //기타입고현황 화면에서 넘어온 기타입고번호 삭제.
                initPage();
            }
        });

        //기타입고현황
        $("#btnLinkEtcReceiveList").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });


        // 대여문서추가 버튼
        $("#btnRentAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#receiveId").val())){
                    // 수령인을 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.receiveId' var='receiveId' /><spring:message code='global.info.confirmMsgParam' arguments='${receiveId}'/>");
                    return false;
                }

                selectReceiveEtcBorrowPopupWindow();
            }
        });


        // 대여문서삭제 버튼
        $("#btnRentDel").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd];
                    delete locationObj[l_rowData.itemCd];

                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                    lCrud         = '',
                    paramUrl      = '',
                    header;

                if(dms.string.isEmpty($("#receiveId").val())){
                    // 수령인을 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.receiveId' var='receiveId' /><spring:message code='global.info.confirmMsgParam' arguments='${receiveId}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , remark          :$("#remark").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){

                        if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.itemCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                            // 수량을 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }


                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "receiveEtcVO":header
                          ,"receiveEtcItemList":saveList
                        };
                    console.log("saveData::"+kendo.stringify(data),paramUrl );

                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/createReceiveEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                console.log('result:',result);
                                pEtcGrDocNo = result.etcGrDocNo;
                                $('#etcGrDocNo').val(result.etcGrDocNo);
                                // 부품기타입고 조회.
                                //selectEtcReceive(pEtcGrDocNo);

                            } else {
                                console.log('errorResult:',result);
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
                                }
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }
             }
        });

        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 pValue;

             input.attr("name", options.field);

             input.keyup(function(){

             });

             input.blur(function(){
                 if(options.field === 'qty'){
                     pValue = Math.floor( $(this).val());
                     options.model.set("amt", options.model.prc * pValue);
                 }else if(options.field === 'prc'){
                     pValue =  Number(Number($(this).val()).toFixed(2));
                     options.model.set("amt", pValue * options.model.qty);
                 }

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 min:0,
                 spinners:false
             });
         };

         /**
          * grid 입고창고 DropDownList
          */
          grStrgeCdDropDownEditor = function(container, options) {


              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  strgeTpList
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };

         grLocCdDropDownEditor = function(container, options) {

             var itemCd = options.model.itemCd;

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  locationListObj[itemCd]
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };


        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectEtcReceiveItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 기타입고현황 검색조건 코드.
                            params["sEtcGrDocNo"] = $("#etcGrDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen = result.data.length,
                             header,
                             itemList = [];

                         if(result.total === 0){
                             dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                         }

                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                             itemList.push(result.data[i].itemCd);
                         }

                         header = {
                                 sItemCdLst       :itemList
                         };

                         $.ajax({
                             url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
                            ,data:kendo.stringify(header)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                locationListObj = {};

                                locationObj[' '] = "";
                                for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                                    if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                                        locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                                    }else{
                                        locationListObj[result.data[i].itemCd] = [];
                                        locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                                    }

                                    if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                                        locationObj[result.data[i].locCd] = result.data[i].locNm;
                                    }
                                }

                            }
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                return false;
                            }

                        });

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                              etcGrDocNo      :{ type:"string", editable:false }
                            , etcGrDocLineNo  :{ type:"number", editable:false }
                            , itemCd          :{ type:"string", editable:false }
                            , itemNm          :{ type:"string", editable:false }
                            , unitCd          :{ type:"string", editable:false }
                            , qty             :{ type:"number" }
                            , strgeCd         :{ type:"string", editable:false }
                            , locCd           :{ type:"string", editable:false }
                            , prc             :{ type:"number", editable:false }
                            , retailPrc       :{ type:"number", editable:false }
                            , amt             :{ type:"number", editable:false }
                            , taxDdctAmt      :{ type:"number", editable:false }
                            , taxAmt          :{ type:"number", editable:false }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , giReasonCd      :{ type:"string" }
                            , giDt            :{ type:"date"  , editable:false }
                            , giTime          :{ type:"string", editable:false }
                            , receiveId       :{ type:"string", editable:false }
                            , returnQty       :{ type:"number", editable:false }
                            , returnDt        :{ type:"date"  , editable:false }
                            , returnTime      :{ type:"string", editable:false }
                            , returnId        :{ type:"string", editable:false }
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , multiSelectWithCheckbox:true
            , pageable:false
            , columns:[
                  {   //기타입고현황번호
                      title:"<spring:message code='par.lbl.etcGrDocNo' />"
                     ,field:"etcGrDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGrDocLineNo"
                     ,width:60
                     ,hidden:true
                  }
                 ,{   //RO번호
                      title:"<spring:message code='par.lbl.roDocNo' />"
                     ,field:"refDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:35
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:180
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"strgeCd"
                     ,width:100
                     ,editor:grStrgeCdDropDownEditor
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"locCd"
                     ,width:140
                     ,editor:grLocCdDropDownEditor
                     ,template:'#= changeGrLocCd(locCd)#'
                     ,sortable:false
                  }
                , {   //소매가
                      title:"<spring:message code='par.lbl.salePriceCost01' />"
                     ,field:"retailPrc"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"prc"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"amt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //할인가
                      title:"<spring:message code='par.lbl.dcAmt' />"
                     ,field:"taxDdctAmt"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"taxAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //출고사유
                      title:"<spring:message code='par.lbl.giReasonCd' />"
                     ,field:"giReasonCd"
                     ,width:100
                     ,editor:giReasonCdDropDownEditor
                     ,template:'#= changeGiReasonCd(giReasonCd)#'
                     ,sortable:false
                  }
                , {   //출고일
                      title:"<spring:message code='global.lbl.giDt' />"
                     ,field:"giDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //출고시간
                      title:"<spring:message code='par.lbl.receiveTime' />"
                     ,field:"giTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                  }
                , {   //수령인
                      title:"<spring:message code='par.lbl.receiveId' />"
                     ,field:"receiveId"
                     ,width:80
                  }
                , {   //반품수량
                      title:"<spring:message code='par.lbl.returnPartsQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //반품일
                      title:"<spring:message code='par.lbl.returnDt' />"
                     ,field:"returnDt"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //반품시간
                      title:"<spring:message code='par.lbl.returnTime' />"
                     ,field:"returnTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.returner' />"
                     ,field:"returnId"
                     ,width:80
                  }
                , { field:"" }
                ]
            });

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         // 출고사유
         changeGiReasonCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = giReasonCdObj[val];
             }
             return returnVal;
         };

         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = strgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGrLocCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = locationObj[val];
             }
             return returnVal;
         };

        // 부품기타입고 정보 조회.
        function selectEtcReceive(pEtcGrDocNo){

            $.ajax({
                url:"<c:url value='/par/pcm/receive/selectEtcReceiveByKey.do' />",
                data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {


                    console.log('selectEtcReceive result:', result);

                    partsJs.validate.groupObjAllDataSet(result);

                    $("#grid").data("kendoExtGrid").dataSource.read();


            });
        }

        //문서추가 함수.
        function selectReceiveEtcBorrowPopupWindow(){

            var popMvtTp;

                popMvtTp = '47'; //대여출고


                issueEtcPopupWindow = dms.window.popup({
                windowId:"IssueEtcRentalPopup"
                , title:"<spring:message code='par.title.issueEtcRental' />"   // 기타출고 렌탈
                , content:{
                    url:"<c:url value='/par/cmm/selectIssueEtcPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "mvtTp"       :popMvtTp
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                itemList.push(data[i].itemCd);
                            }
                            fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){

                                console.log('data['+i+']:',data[i]);
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].unitCd;
                                popItemData.qty            = data[i].borrowQty;
                                popItemData.prc            = data[i].prc;
                                popItemData.amt            = data[i].amt;
                                popItemData.stdStrgeCd     = data[i].strgeCd;
                                popItemData.strgeCd        = data[i].strgeCd;
                                popItemData.locCd          = data[i].locCd;
                                popItemData.etcGrDocNo     = '';
                                popItemData.etcGrDocLineNo = null;
                                popItemData.refDocNo       = data[i].etcGiDocNo;
                                popItemData.refDocLineNo   = data[i].etcGiDocLineNo;


                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popItemData);
                                }
                            }

                            gridData.select(gridData.tbody.find(">tr"));
                            issueEtcPopupWindow.close();

                            fnSetAmtInfo();
                        }
                    }
                }
            });
        }

        function initPage(){
            var grid        = $("#grid").data("kendoExtGrid");

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

            $("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
            $("#totQty").data("kendoExtNumericTextBox").enable(false);
            $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#totAmt").data("kendoExtNumericTextBox").enable(false);

            $("#mvtTp").data("kendoExtDropDownList").value('35');
            $("#mvtTp").data("kendoExtDropDownList").enable(false);

            $("#btnRentAdd").data("kendoButton").enable(true);
            $("#btnRentDel").data("kendoButton").enable(true);

            popItemObj = {};

            //기타입고현황 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pEtcGrDocNo)){
                selectEtcReceive(pEtcGrDocNo);
            }

        }



        initPage();
    });

    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            totalQty    = 0,
            mvtTp,
            gridData;

        mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

        rows.each(function(index, row) {
            gridData = grid.dataSource.at(index);



            totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
            totalQty = totalQty + Math.floor(gridData.qty);

        });
        $("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
    }

    function fnSetLocCdObj(pItemList){

        var header = {
                sItemCdLst       :pItemList
        };

        $.ajax({
            url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                   if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                       locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }else{
                       locationListObj[result.data[i].itemCd] = [];
                       locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }

                   if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                       locationObj[result.data[i].locCd] = result.data[i].locNm;
                   }
               }

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#receiveId").val(data[0].usrId);
                            $("#receiveNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }

 // 부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"itemCd":$("#sItemCd").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);

                        }
                        searchItemPopupWindow.close();
                    }
                }
            }
        });
    }
</script>
<!-- //script -->

