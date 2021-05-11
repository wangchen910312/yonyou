<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 구매오더목록 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.purcOrdInfo" /></h1> --%>
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11562" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11561" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                            <input type="text" id="sBpNm" class="form_input form_readonly hidden" readonly/>
                            <input type="text" id="sBpCd" class="form_input hidden"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sendDt" /><!-- 오더전송일자 --></th>
                        <td>
                             <div class="form_float">
                                <div class="date_left">
                                    <input id="sArrvDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sArrvDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
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
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더신청자 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden"/>
                                <a id="searchRegUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.trsfType" /><!-- 운송유형 --></th>
                        <td class="required_area">
                            <input id="sTrsfTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordTotAmt" /><!--오더총금액 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sTotPurcAmtFr" class="form_numeric" data-type="number">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sTotPurcAmtTo" class="form_numeric" data-type="number">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid"  class="resizable_grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>

<!-- script -->
<script>

        var popupWindow,
            sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            rowNumber           = 0, //그리드 목록 번호
            purcOrdTpList       = [],
            purcOrdTpObj        = {},
            trsfTpList          = [],
            trsfTpObj           = {},
            purcOrdStatList     = [],
            purcOrdStatObj      = {},
            popItemObj          = {};



        trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

       purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


        //purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            if("${obj.useYn}" !=='N' ){
                purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    function fn_linkPurcOrd(pPurcOrdStatCd, pPurcOrd, pBpCd, pBpNm){
        if(pPurcOrdStatCd === "01" || pPurcOrdStatCd ==="05"){ //구매오더상태 : 신규등록,취소 시 구매신청페이지 이동.
            parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderSave" />'
                    ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-D-10177");
        }else{
            parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderDetail" />'
                    ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusList.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-D-10201");
        }

    }

   //--------------liuxueying add -------------
   function fn_linkBoPurcOrd(pPurcOrd){
	    parent._createOrReloadTabMenu('<spring:message code="par.menu.backOrder" />'
        ,"<c:url value='/par/pcm/purcOrd/selectPurcBackOrdMain.do?pPurcOrdNo="+pPurcOrd+"'/>", "VIEW-D-10181");
   }
    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":$("#sBpCd").val()
                    ,"bpNm":$("#sBpNm").val()
                    ,"bpTp":"01"//BMP
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
                            $("#sBpNm").val(bpNm);
                            $("#sBpCd").val(bpCd);
                        }

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
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
        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        //$("#sArrvDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sArrvDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

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
               $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
               $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'sPurcRegDtTo'){
               var maxDate = new Date(toDt);
               toYY = maxDate.getFullYear();
               toMM = maxDate.getMonth();
               toDD = maxDate.getDate();

               $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
               $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }else if(id === 'sArrvDtFr'){
               var minDate = new Date(sevenDtBf);
               frYY = minDate.getFullYear();
               frMM = minDate.getMonth();
               frDD = minDate.getDate();
               $("#sArrvDtFr").data("kendoExtMaskedDatePicker").value('');
               $("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'sArrvDtTo'){
               var maxDate = new Date(toDt);
               toYY = maxDate.getFullYear();
               toMM = maxDate.getMonth();
               toDD = maxDate.getDate();

               $("#sArrvDtTo").data("kendoExtMaskedDatePicker").value('');
               $("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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
           }else if(id === 'sArrvDtFr'){
               frYY = this.value().getFullYear();
               frMM = this.value().getMonth();
               frDD = this.value().getDate();
               $("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'sArrvDtTo'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               toDD = this.value().getDate();
               $("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }
       }
    }

    // 품목구분 그리드 콤보
    function setSumData(val){
        var returnData  = Math.round(val * 1000)/1000,
            returnCalData = Math.round(returnData * 100)/100,
            returnVal = kendo.toString(returnData,'n2');

        return returnVal;
    };

    $(document).ready(function() {

        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //운송선택
        $("#sTrsfTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:trsfTpList
            ,index:0
        });

        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectPurcOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectPurcOrdStatCd)){
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

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

        $("#sArrvDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sArrvDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sTotPurcAmtFr, #sTotPurcAmtTo").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchRegUsrId").on('click', userSearchPopup);

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

        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0728-111301"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }

                            if(sPurcOrdStatCdLst.length === 0){
                                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                                }
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sTrsfTp"]            = $("#sTrsfTp").data("kendoExtDropDownList").value();
                            params["sTotPurcAmtFr"]      = $("#sTotPurcAmtFr").data("kendoExtNumericTextBox").value();
                            params["sTotPurcAmtTo"]      = $("#sTotPurcAmtTo").data("kendoExtNumericTextBox").value();
                            params["sRegUsrId"]          = $("#sRegUsrId").val();

                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtFr"]          = $("#sArrvDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtTo"]          = $("#sArrvDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;

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
                            dlrCd         :{ type:"string", editable:false }
                          , bpCd          :{ type:"string", editable:false }
                          , bpNm          :{ type:"string", editable:false }
                          , purcOrdNo     :{ type:"string", editable:false }
                          , bmpOrdNo      :{ type:"string", editable:false }
                          , purcOrdTp     :{ type:"string", editable:false }
                          , trsfTp        :{ type:"string", editable:false }
                          , purcOrdStatCd :{ type:"string", editable:false }
                          , regUsrId      :{ type:"string", editable:false }
                          , remark        :{ type:"string", editable:false }
                          , purcRegDt     :{ type:"date",   editable:false }
                          , confirmDt     :{ type:"date",   editable:false }
                          , arrvDate      :{ type:"date",   editable:false }
                          , itemCnt       :{ type:"number", editable:false }
                          , totPurcQty    :{ type:"number", editable:false }
                          , totPurcAmt    :{ type:"number", editable:false }
                          , totTaxDdctAmt :{ type:"number", editable:false }
                          , regUsrNm      :{ type:"string", editable:false }
                          , boCnt         :{ type:"number", editable:false }
                          , boQty         :{ type:"number", editable:false }
                        }
                    }
                }
                ,aggregate:[
                        { field:"itemCnt", aggregate:"sum" }
                       ,{ field:"totPurcQty", aggregate:"sum" }
                       ,{ field:"totPurcAmt", aggregate:"sum" }
                       ,{ field:"totTaxDdctAmt", aggregate:"sum" }
                   ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"rnum"
                      ,title:"<spring:message code='par.lbl.lineNm' />"
                      ,attributes:{ "class":"ac"}
                      ,template  :"#= ++rowNumber #"
                      ,width:40
                      ,hidden:true}  //라인번호
                 ,{field:"purcOrdTp"
                      ,title:"<spring:message code='par.lbl.purcOrdTp' />"
                      ,template:'#= changePurcOrdTp(purcOrdTp)#'
                      ,attributes:{ "class":"ac"}
                      ,width:160}                //오더유형
                 ,{field:"purcRegDt"
                      ,title:"<spring:message code='par.lbl.ordReqDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "class":"ac"}
                      ,width:90 }                //구매신청일
                 ,{field:"arrvDate"
                      ,title:"<spring:message code='par.lbl.sendDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "class":"ac"}
                      ,width:90 }                //구매신청일
                 ,{field:"purcOrdNo"
                      ,title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,template  :function(dataItem){
                           var spanObj = "";

                               spanObj = "<a class='k-link' onclick=\"fn_linkPurcOrd('" + dataItem.purcOrdStatCd + "','" + dataItem.purcOrdNo + "','" + dataItem.bpCd + "','" + dataItem.bpNm + "'); \">"+dataItem.purcOrdNo+"</a>";

                           return spanObj;
                       }
                     ,width:90 }   //구매오더번호
                 ,{field:"bmpOrdNo"
                      ,title:"<spring:message code='par.lbl.bmpOrdNo' />"
                     ,width:120 }   //bmp오더번호
                 ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                 ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.supplyNo' />"
                     ,width:140 }  //공급업체
                 ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.itemCnt' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }      //건수
                 ,{field:"totPurcQty"
                     ,title:"<spring:message code='par.lbl.ordTotQty' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }      //수량
                 ,{field:"totPurcAmt"
                     ,title:"<spring:message code='par.lbl.ordTotAmt' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }      //구매총금액
                 ,{field:"totTaxDdctAmt"
                     ,title:"<spring:message code='par.lbl.taxDdctAmt' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                  }      //구매총금액(세금제외)
                 ,{field:"purcOrdStatCd"
                     ,title:"<spring:message code='par.lbl.purcOrdStatCd' />"
                     ,width:100
                     ,attributes:{ "class":"ac"}
                     ,template:function(dataItem){

                         var spanObj = "";

                         switch(dataItem.purcOrdStatCd)
                         {
                             case "02":// 전송
                                 spanObj = "<span class='txt_label bg_blue'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "03":// 확정
                                 spanObj = "<span class='txt_label bg_orange'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "04":// 완료
                                 spanObj = "<span class='txt_label bg_purple'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "05":// 취소
                                 spanObj = "<span class='txt_label bg_red'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             default: // 등록
                                 spanObj = "<span class='txt_label bg_gray'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                          }
                          return spanObj;
                      }
                  }                //구매오더상태
                 ,{field:"trsfTp"
                     ,title:"<spring:message code='par.lbl.trsfType' />"
                     ,template:'#= changeTrsfTp(trsfTp)#'
                     ,attributes:{ "class":"ac"}
                     ,width:140}                //운송유형
                 ,{field:"confirmDt"
                     ,title:"<spring:message code='par.lbl.ordConfirmDt' />"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,width:90
                     ,hidden:true}                //처리일자
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.ordTag' />"
                     ,width:140
                     ,hidden:true}  //오더태그(비고)
                 , {   //오더신청자
                     title:"<spring:message code='par.lbl.ordRegId' />"
                     ,field:"regUsrId"
                     ,width:120
                     ,hidden:true
                   }
                 , {   //오더신청자
                     title:"<spring:message code='par.lbl.ordRegId' />"
                     ,field:"regUsrNm"
                     ,width:120
                   }
                 ,{field:"boCnt"
                     ,title:"<spring:message code='par.lbl.backOrderCnt' />"
                     ,template  :function(dataItem){
                          var spanObj = dataItem.boCnt;
                          if(dataItem.boCnt > 0){
						    spanObj = "<a class='k-link' onclick=\"fn_linkBoPurcOrd('" + dataItem.purcOrdNo + "'); \">"+dataItem.boCnt+"&nbsp;&nbsp;&nbsp;&nbsp;</a>";
                          }
                          return spanObj;
                      }
                    ,width:90 }   //구매오더번호
                 ,{field :"boQty", title:"<spring:message code='par.lbl.boQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} 
            ]
        });

         // 구매상태
         changePurcOrdStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdStatObj[val];
             }
             return returnVal;
         };

         //  오더유형
         changePurcOrdTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdTpObj[val];
             }
             return returnVal;
         };

         // 운송유형
         changeTrsfTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = trsfTpObj[val];
             }
             return returnVal;
         };

        initPage();
    });
</script>
<!-- //script -->

