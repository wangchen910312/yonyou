<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 반품구매오더 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 거래처코드 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sBpCd" class="form_input hidden"/>
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더신청자 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden"/>
                                <a id="searchRegUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
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
                        <th scope="row"><spring:message code="par.lbl.returnDt" /><!-- 반품일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcReturnDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcReturnDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var popupWindow,
            sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            rowNumber           = 0, //그리드 목록 번호
            popItemObj          = {},
            venderSearchPopupWin,
            searchItemPopupWindow;






        function fn_linkPurcOrd(pPurcOrd, pBpCd, pBpNm){
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partInStockReturn" />'
                        ,"<c:url value='/par/pcm/receive/selectReceiveReturnMain.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-I-10181");
        }


    $(document).ready(function() {

        $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcReturnDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcReturnDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchRegUsrId").on('click', userSearchPopup);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sBpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0806-173501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectReturnPurcOrdItems.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {


                            //var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoMultiSelect").value();
                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|');

                            console.log('sBpCdList:',sBpCdList);
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            //params["sBpNm"]              = $("#sBpNm").val();
                            params["sBpCdList"]          = sBpCdList;
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sRegUsrId"]          = $("#sRegUsrId").val();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcReturnDtFr"]    = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcReturnDtTo"]    = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();

                            console.log('params:',params);
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
                       id:"purcOrdNo"
                      ,fields:{
                            dlrCd               :{ type:"string" , validation:{required:true} }
                          , purcOrdNo           :{ type:"string", editable:false }
                          , purcOrdLineNo       :{ type:"string", editable:false }
                          , purcOrdLineDetlNo   :{ type:"string", editable:false }
                          , bpCd                :{ type:"string", editable:false }
                          , bpNm                :{ type:"string", editable:false }
                          , itemCd              :{ type:"string", editable:false }
                          , itemNm              :{ type:"string", editable:false }
                          , purcQty             :{ type:"number", editable:false }
                          , returnQty           :{ type:"number" }
                          , purcRegDt           :{ type:"date" }
                          , purcReturnDt        :{ type:"date" }
                          , remark              :{ type:"string"}
                          , purcPrc             :{ type:"number", editable:false }
                          , purcIncTaxPrc       :{ type:"number", editable:false }
                          , purcAmt             :{ type:"number" }
                          , purcIncTaxAmt       :{ type:"number" }
                          , regUsrId            :{ type:"string" }
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , pageable:false
            , editable:false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"rnum"
                      ,title:"<spring:message code='par.lbl.lineNm' />"
                      ,attributes:{ "style":"text-align:center"}
                      ,template  :"#= ++rowNumber #"
                      ,width:40
                      ,hidden:true}  //라인번호
                 ,{field:"purcRegDt"
                      ,title:"<spring:message code='par.lbl.ordReqDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //구매신청일
                 ,{field:"purcOrdNo"
                      ,title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,template  :function(dataItem){
                           var spanObj = "";

                               spanObj = "<a class='k-link' onclick=\"fn_linkPurcOrd('" + dataItem.purcOrdNo + "','" + dataItem.bpCd + "','" + dataItem.bpNm + "'); \">"+dataItem.purcOrdNo+"</a>";

                           return spanObj;
                       }
                     ,width:90 }   //구매오더번호
                 , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:70
                     ,sortable:false
                   }
                 , {   //라인구분자
                      title:" "
                     ,field:"purcOrdLineDetlNo"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:20
                     ,sortable:false
                     ,hidden:true
                  }
                 ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                 ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.supplyNo' />"
                     ,width:140 }  //공급업체
                 , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:140
                   }
                 , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                     ,sortable:false
                  }
                 ,{field:"purcReturnDt"
                     ,title:"<spring:message code='par.lbl.returnDt' />"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //구매반품일
                 , {   //구매수량
                     title:"<spring:message code='par.lbl.purcQty' />"
                    ,field:"purcQty"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n0}"
                    ,decimal:0
                    ,sortable:false
                 }
               , {   //반품수량
                     title:"<spring:message code='par.lbl.grReturnQty' />"
                    ,field:"returnQty"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n0}"
                    ,decimal:0
                    ,sortable:false
                 }
               , {   //사유
                     title:"<spring:message code='par.lbl.reasonCont' />"
                    ,field:"remark"
                    ,width:140
                 }
               , {   //구매단가(세금미포함)
                     title:"<spring:message code='par.lbl.purcPriceTax' />"
                    ,field:"purcPrc"
                    ,width:100
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimals:2
                 }
               , {   //구매단가(포함)
                     title:"<spring:message code='par.lbl.purcPrice' />"
                    ,field:"purcIncTaxPrc"
                    ,width:100
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimals:2
                 }
               , {   //구매금액(세금제외)
                     title:"<spring:message code='par.lbl.purcAmt' />"
                    ,field:"purcAmt"
                    ,width:100
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimals:2
                 }
               , {   //구매금액
                     title:"<spring:message code='par.lbl.purcIncTaxAmt' />"
                    ,field:"purcIncTaxAmt"
                    ,width:100
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimals:2
                 }
                 , {   //오더신청자
                     title:"<spring:message code='par.lbl.ordRegId' />"
                     ,field:"regUsrId"
                     ,width:120
                   }
            ]
        });


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

            popItemObj = {};

            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
           // $("#sPurcRegDtFr").data("kendoDatePicker").value(new Date(sevenDtBf));
           // $("#sPurcRegDtTo").data("kendoDatePicker").value(new Date(toDt));

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        }

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"bpTp":'03'
                        ,"selectable":'multiple'
                        ,"callbackFunc":function(data){
                            //$("#sBpNm").val(data[0].bpNm);
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
                                $("#sBpNm").val(bpNm);
                                $("#sBpCd").val(bpCd);
                            }
                        }
                    }
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
                                $("#sRegUsrId").val(data[0].usrId);
                                $("#sRegUsrNm").val(data[0].usrNm);
                            }
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
               if(id === 'sPurcRegDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcRegDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sPurcReturnDtFr'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcReturnDtFr").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcReturnDtTo").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM,toDD));
               }else if(id === 'sPurcReturnDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcReturnDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcReturnDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }else{
               if(id === 'sPurcRegDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcRegDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sPurcReturnDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sPurcReturnDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcReturnDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sPurcReturnDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }


        }
        initPage();
    });
</script>
<!-- //script -->

