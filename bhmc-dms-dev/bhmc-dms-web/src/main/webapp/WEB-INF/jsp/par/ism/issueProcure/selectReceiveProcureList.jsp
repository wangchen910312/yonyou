<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 송장등록현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11613" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11612" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_save btn_s_min" id="btnSave"><spring:message code="par.btn.receiveRedy" /></button><!-- 준비입고 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11611" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grStatCd" /><!-- 입고상태 --></th>
                        <td>
                            <input id="sStatCd" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 업체 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly>
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grDt" /><!-- 입고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.obtGrDocNo" /><!-- 조달입고문서번호 --></th>
                        <td>
                            <input id="sEtcGrDocNo" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <!-- 조달입고 등록 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //조달입고 등록정보 -->

    <!-- 조달입고 상세정보 -->
    <section class="group">
        <div class="table_grid mt10">
            <div id="gridDetail" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //송장정보 -->

<!-- script -->
<script>

    var sessionBpCd     = "${bpCd}"
       ,sessionBpNm     = "${bpNm}"
       ,toDt            = "${toDt}"
       ,sevenDtBf       = "${sevenDtBf}"
       ,selectTabId     = "REFH"
       ,statCdList      = []
       ,statCdObj       = {}
       ,etcGrDocNo      = "";

    statCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${statCdList}" varStatus="status">
        if("${obj.useYn}" === "Y"){
            statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {
        //입고상태선택
        $("#sStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statCdList
            ,index:0
        });

        //입고일자
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //입고일자
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchCustCd").on('click', selectCustSearchPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#btnSave").data("kendoButton").enable(false);
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //입고준비 버튼
        $("#btnSave").kendoButton({
           click:function(e){
               var grid = $("#grid").data("kendoExtGrid");
               var row = grid.tbody.find(".k-state-selected").closest("tr");
               var selectedVal = grid.dataItem(row);
               if(selectedVal !=null && selectedVal !='undefined' && selectedVal.etcGrDocNo !=null && selectedVal.etcGrDocNo !='undefined'){
                   parent._createOrReloadTabMenu("<spring:message code='par.menu.obtainGrStatus' />", "<c:url value='/par/pcm/receive/selectReceiveEtcFundsMain.do'/>?sEtcGrDocNo="+selectedVal.etcGrDocNo, "VIEW-D-10522"); // 부품예약 Main
               }else{
                // 선택값이 없습니다.
                   dms.notification.warning("<spring:message code='global.info.unselected' />");
               }
           }
        });

        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0905-092441"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceiveEtcListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|'),
                                sMvtTpList = ['63'];
                            var sMvtTp = '63';

                            if(dms.string.isEmpty(sBpCdList[0])){
                                sBpCdList.splice(0,1);
                            }

                            if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 기타입고 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sEtcGrDocNo"]        = $("#sEtcGrDocNo").val();
                            params["sStatCd"]            = $("#sStatCd").data("kendoExtDropDownList").value();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sMvtTpList"]         = sMvtTpList;
                            params["sMvtTp"]             = sMvtTp;

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
                        id:"etcGrDocNo"
                       ,fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , statCd        :{ type:"string", editable:false }
                            , etcGrDocNo    :{ type:"string", editable:false } //입고번호
                            , grDt          :{ type:"date",   editable:false }
                            , itemQty       :{ type:"number", editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , bpCd          :{ type:"string", editable:false }
                            , bpNm          :{ type:"string", editable:false }
                            , regUsrId      :{ type:"string", editable:false }
                            , regUsrNm      :{ type:"string", editable:false }
                            , dcRate        :{ type:"number", editable:false }
                            , grTaxAmt      :{ type:"number", editable:false }
                            , grTotAmt      :{ type:"number", editable:false }
                            , grTaxDdctAmt  :{ type:"number", editable:false }
                            , remark        :{ type:"string", editable:false }
                         }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                                elem.statCd = changeStatCd(elem.statCd);
                            });
                        }

                        return d;
                    }
                }
            }
            , selectable:"row"
            , change:function(e){
                var selectedItem = this.dataItem(this.select());
                if(selectedItem != null && selectedItem != 'undefined'){
                    etcGrDocNo = selectedItem.etcGrDocNo;
                    $("#gridDetail").data("kendoExtGrid").dataSource.read();
                    $("#btnSave").data("kendoButton").enable(true);
                }
            }
            , scrollable :true
            , autoBind   :false
            , pageable   :false
            , height:250
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                {field:"statCd" ,title:"<spring:message code='par.lbl.grStatCd' />" ,attributes:{ "class":"ac"} ,width:100}//입고상태
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.obtGrDocNo' />" ,width:120}//입고문서번호
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.grDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.invcGrCnt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                }//건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//수량
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120,hidden:true}//등록자
                ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120}//등록자
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.dlrNm' />" ,width:180 }//업체
                ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,template:function(dataItem){
                        return dataItem.dcRate + "%";
                    }
                }//세율
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//입고금액(세금제외)
                ,{field:"grTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//입고금액(세금포함)
                ,{field:"grTaxAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//입고금액(세금포함)
                ,{field:"remark" ,title:"<spring:message code='par.lbl.remark' />" ,width:180 }//비고
           ]
        });

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0905-092452"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceiveEtcDetailListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|'),
                                sMvtTpList = ['63'];

                            if(dms.string.isEmpty(sBpCdList[0])){

                                sBpCdList.splice(0,1);
                            }

                            if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sEtcGrDocNo"]        = etcGrDocNo
                            params["sMvtTpList"]         = sMvtTpList;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                          dlrCd            :{ type:"string", editable:false }
                          , rnum           :{ type:"number", editable:false } //번호
                          , etcGrDocNo     :{ type:"string", editable:false } //입고번호
                          , etcGrDocLineNo :{ type:"string", editable:false } //입고라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , qty            :{ type:"number", editable:false } //입고수량
                          , taxDdctPrc     :{ type:"number", editable:false } //입고단가(세금제외)
                          , prc            :{ type:"number", editable:false } //입고단가
                          , taxDdctAmt     :{ type:"number", editable:false } //입고금액(세금제외)
                          , amt            :{ type:"number", editable:false } //입고금액
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , grDt           :{ type:"date",   editable:false } //입고일자
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                        { field: "qty", aggregate: "sum" }
                        ,{ field: "taxDdctPrc", aggregate: "sum" }
                        ,{ field: "prc", aggregate: "sum" }
                        ,{ field: "taxDdctAmt", aggregate: "sum" }
                        ,{ field: "amt", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                        ,{ field: "returnAmt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , height:250
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.no'/>" ,width:50}//번호
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'/>" ,width:120}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
                ,{field:"qty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:80
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.taxDdctPrc' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(세금제외)
                ,{field:"prc" ,title:"<spring:message code='par.lbl.grPrcTax' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(포함)
                ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금제외)
                ,{field:"amt" ,title:"<spring:message code='par.lbl.grAmtAddTax' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.spyrCd' />" ,width:180}//공급업체
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.etcGrDocNo' />" ,width:120}//입고문서번호
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.grDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
            ]
        });

    initPage();

    });

    //입고상태
    changeStatCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = statCdObj[val];
        }
        return returnVal;
    };




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
            if(id === 'sRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }


     }

    /* 딜러조회 검색 팝업 */
    var dealerSearchPopupWin;
    function selectCustSearchPopupWindow(){
        dealerSearchPopupWin = dms.window.popup({
            windowId :"dealerSearchPopupWin"
            ,title :"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
            ,modal:true
            , content :{
                url :"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                    , data:{
                        "autoBind" :false
                        ,"dlrCd":$("#sBpCd").val()
                        ,"dlrNm":$("#sBpNm").val()
                        ,"closeAfterSelect":true
                        ,"callbackFunc" :function(data){
                            if(data.length >= 1) {
                                var bpNm,
                                bpCd;
                                for(var i = 0,dlen = data.length; i < dlen; i = i + 1){
                                    if(i === 0){
                                        bpNm = data[i].dlrNm;
                                        bpCd = data[i].dlrCd;
                                    }else{
                                        bpNm = bpNm + ',' + data[i].dlrNm;
                                        bpCd = bpCd + '|' + data[i].dlrCd;
                                    }
                                }
                            }
                            $("#sBpNm").val(bpNm);
                            $("#sBpCd").val(bpCd);
                            dealerSearchPopupWin.close();
                        }
                    }
            }
        });
    }

    function initPage(){
        var minDate             = new Date(sevenDtBf),
            maxDate             = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;


         //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();


        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);


        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sStatCd").data("kendoExtDropDownList").value('01');

        $("#btnSave").data("kendoButton").enable(false);
    }


// 품목구분 그리드 콤보
function setSumData(val){
    var returnData  = Math.round(val * 1000)/1000,
        returnCalData = Math.round(returnData * 100)/100,
        returnVal = kendo.toString(returnData,'n2');

    return returnVal;
};

</script>
<!-- //script -->
