<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품판매오더현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.custinfo" /> --%><!-- 고객 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <input id="sCustTp" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleType" /><!-- 판매유형 --></th>
                        <td>
                            <input id="sSaleTp" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parSaleOrdNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <input id="sParSaleOrdNo" class="form_input">
                        </td>
                    </tr>
                    <tr>

                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sCustNm" class="form_input" />
                                <input type="text" id="sCustCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sOrdStatCd" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sSaId" class="form_input hidden" />
                                <input type="text" id="sSaNm" class="form_input"/>
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.salPrsnNm" /><!-- 판매담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sSalPrsnId" class="form_input hidden" />
                                <input type="text" id="sSalPrsnNm" class="form_input"/>
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleDt" /><!-- 판매일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 부품판매오더 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //부품판매오더 -->

<!-- script -->
<script>

        var toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            custTpList          = [],
            custTpObj           = {},
            ordStatCdList       = [],
            ordStatCdObj        = {},
            saleTpList          = [],
            saleTpObj           = {},
            unitCdObj           = {},
            popupWindow,
            changeSaleTp,
            changeCustTp,
            userSearchPopupWin;



        custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        custTpObj[' '] = "";
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        ordStatCdList.push({"cmmCd":" ", "cmmCdNm":"选择取消", "useYn":""});
        <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">
            ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        saleTpObj[' '] = "";
        <c:forEach var="obj" items="${saleTpList}" varStatus="status">
            saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

    $(document).ready(function() {

        //고객유형선택
        $("#sCustTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //오더상태선택
        $("#sOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectOrdStatCd)){
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //판매유형
        $("#sSaleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        $("#sOrdDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sOrdDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchSaId").on('click', userSearchPopup);

        $("#searchCustCd").on('click', custSearchPopup);

        $("#sCustTp").on('change', fnChangeCustTp);


        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        // 부품판매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-151901"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItems.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSaNm"]              = $("#sSaNm").val();
                            params["sSalPrsnNm"]         = $("#sSalPrsnNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();

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
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                            dlrCd             :{ type:"string"}
                          , ordStatCd         :{ type:"string"}
                          , ordDt             :{ type:"date"  }
                          , saleTp            :{ type:"string"}
                          , custTp            :{ type:"string"}
                          , custCd            :{ type:"string"}
                          , custNm            :{ type:"string"}
                          , parSaleOrdNo      :{ type:"string"}
                          , parSaleOrdLineNo  :{ type:"number"}
                          , saId              :{ type:"string"}
                          , saNm              :{ type:"string"}
                          , salPrsnId         :{ type:"string"}
                          , salPrsnNm         :{ type:"string"}
                          , itemCd            :{ type:"string"}
                          , itemNm            :{ type:"string"}
                          , unitCd            :{ type:"string"}
                          , ordQty            :{ type:"number"}
                          , prcTp             :{ type:"string"}
                          , prc               :{ type:"number"}
                          , amt               :{ type:"number"}
                          , dcRate            :{ type:"number"}
                          , totAmt            :{ type:"number"}
                          , totAmt            :{ type:"number"}
                          , cancDt            :{ type:"date"  }
                          , returnDt          :{ type:"date"  }
                          , returnId          :{ type:"string"}
                          , returnNm          :{ type:"string"}
                          , remark            :{ type:"string"}
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }
            , editable:false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"ordStatCd"
                      ,title:"<spring:message code='par.lbl.statNm' />"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:60
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.ordStatCd)
                          {
                              case "02":// 완료

                                  spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "03":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              default: // 요청/등록

                                  spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                 }                //상태
                 ,{field:"saleTp"
                      ,title:"<spring:message code='par.lbl.saleType' />"
                      ,template:'#= changeSaleTp(saleTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:80 }                //판매유형
                 ,{field:"ordDt"
                      ,title:"<spring:message code='par.lbl.saleDt' />"
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //판매일
                 ,{field:"parSaleOrdNo"
                      ,title:"<spring:message code='par.lbl.parSaleOrdNo' />"
                      //,template:"<a href ='<c:url value='/par/ism/issue/selectPartsSaleOrdMain.do?pParSalesOrdNo=#= parSaleOrdNo#'/>'>#= parSaleOrdNo#</a>"
                      ,width:130 }                //부품판매오더번호
                 ,{field:"parSaleOrdLineNo"
                      ,title:"<spring:message code='par.lbl.lineNm' />"
                      ,width:30
                      ,hidden:true }
                 ,{field:"custTp"
                      ,title:"<spring:message code='par.lbl.custTp' />"
                      ,template:'#= changeCustTp(custTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:140
                      ,hidden:true}                //고객유형
                 ,{field:"custCd"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:105
                      ,hidden:true}  //고객 코드
                 ,{field:"custNm"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:140 }  //고객명
                 ,{field:"itemCd"
                      ,title:"<spring:message code='par.lbl.itemCd' />"
                      ,width:100 }  //부품번호
                 ,{field:"itemNm"
                      ,title:"<spring:message code='par.lbl.itemNm' />"
                      ,width:200 }  //부품명
                 ,{field:"ordQty"
                      ,title:"<spring:message code='par.lbl.qty' />"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0}  //수량
                 ,{field:"unitCd"
                      ,title:"<spring:message code='par.lbl.unitNm' />"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,format:"{0:n0}"
                      ,template:'#= changeUnitCd(unitCd)#'
                      ,decimal:0}  //단위
                 ,{field:"prc"
                      ,title:"<spring:message code='par.lbl.prc' />"
                      ,width:120
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimal:2}  //단가
                 ,{field:"dcRate"
                      ,title:"<spring:message code='par.lbl.dcRate' />"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0}  //D/C Rate
                 ,{field:"totAmt"
                      ,title:"<spring:message code='par.lbl.amt' />"
                      ,width:120
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimal:2}  // 금액
                 ,{field:"salPrsnId"
                      ,title:"<spring:message code='par.lbl.salPrsnNm' />"
                      ,width:105
                      ,hidden:true}  //판매담당자 코드
                 ,{field:"salPrsnNm"
                      ,title:"<spring:message code='par.lbl.salPrsnNm' />"
                      ,width:140 }  //판먀담당자명
                 ,{field:"saId"
                      ,title:"<spring:message code='par.lbl.prsNm' />"
                      ,width:105
                      ,hidden:true}  //담당자 코드
                 ,{field:"saNm"
                      ,title:"<spring:message code='par.lbl.prsNm' />"
                      ,width:140 }  //담당자명
                 ,{field:"cancDt"
                      ,title:"<spring:message code='par.lbl.cancDt' />"
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //취소일
                 ,{field:"returnDt"
                      ,title:"<spring:message code='par.lbl.returnDt' />"
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //반품일
                 ,{field:"returnId"
                      ,title:"<spring:message code='par.lbl.returner' />"
                      ,width:105
                      ,hidden:true}  //반품자 코드
                 ,{field:"returnNm"
                      ,title:"<spring:message code='par.lbl.returner' />"
                      ,width:140 }  //반품자명
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:220
                  }      //비고
            ]
        });


         //  판매유형
         changeSaleTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = saleTpObj[val];
             }
             return returnVal;
         };

         // 고객유형
         changeCustTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = custTpObj[val];
             }
             return returnVal;
         };

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         function fnChangeCustTp(e){
             $('#sCustCd').val('');
             $('#sCustNm').val('');
         }

        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;
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

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
            $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        }

        function fnChkDateValue(e){

           var  elmt  = e.sender.element[0],
                id    = elmt.id,
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;

           if(this.value() == null){
               if(id === 'sOrdDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value('');
                   $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sOrdDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value('');
                   $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }else{
               if(id === 'sOrdDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sOrdDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }


        }

        initPage();
    });

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
                            $("#sSaId").val(data[0].usrId);
                            $("#sSaNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function custSearchPopup() {
        if(dms.string.isEmpty($("#sCustTp").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#sCustTp").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#sCustTp").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
    }

    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        $("#sCustCd").val(data[0].bpCd);
                        $("#sCustNm").val(data[0].bpNm);
                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#sCustCd").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                        }
                    }
                }
            }
        });
    }
</script>
<!-- //script -->

