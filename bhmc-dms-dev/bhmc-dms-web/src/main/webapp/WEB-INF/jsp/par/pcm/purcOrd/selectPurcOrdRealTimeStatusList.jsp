<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value="/resources/js/jszip.min.js"/>"></script>
<!-- 구매현황조회 -->
<div id="resizableContainer">
    <section class="group" id="purcOrdRealTimeSection">
        <div class="header_area">
            <!-- 초기화버튼, 조회 버튼 권한 필요 -->
            <div class="btn_left">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button type="button" id="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- BMP오더번호 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input" />
                            <input id="sPurcRegDtFr" class="form_datepicker hidden" data-type="maskDate"/>
                            <input id="sPurcRegDtTo" class="form_datepicker hidden" data-type="maskDate"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sendDt" /><!-- 전송일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sBmpOrdDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sBmpOrdDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input hidden" />
                        </td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더등록인 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden">
                                <a id="searchRegUserId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
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
var purcOrdTpList = []
   ,purcOrdTpObj = {}
   ,purcOrdStatList = []
   ,toDt = "${toDt}"
   ,monthDtBf = "${monthDtBf}"
   ,pPurcOrdNo = ""
   ,purcUnitList = []
   ,purcUnitObj = {}
   ,trsfTpList = []
   ,trsfTpObj = {}
   ,ammendCodeList = []
   ,ammendCodeObj = {}
   ,purcPgssCdObj = {}
   ,grStrgeTpList = []
   ,grStrgeTpObj = {}
   ,dlPdcCdList = []
   ,dlPdcCdObj = {}
   ,searchItemPopupWindow
   ,userSearchPopupWin
   ,purcOrdListPopupWindow;

//PDC 창고
dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//오더유형 선택
purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//편수코드 선택
ammendCodeList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
ammendCodeObj[""] = "";
<c:forEach var="obj" items="${ammendCodeList}" varStatus="status">
    ammendCodeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ammendCodeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//구매오더상태 선택
purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if(Number("${obj.cmmCd}") > 1 && Number("${obj.cmmCd}") <= 3){
        if("${obj.useYn}" !=='N' ){
            purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    }
</c:forEach>

//구매오더진행상태 선택
purcPgssCdObj[' '] = "";
<c:forEach var="obj" items="${purcPgssCdList}" varStatus="status">
    purcPgssCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//구매단위
<c:forEach var="obj" items="${purcUnit}" varStatus="status">
    purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
    purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
</c:forEach>

//입고창고
grStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//운송유형
trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//부품 팝업 열기 함수.
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"ItemMasterPopup"
        , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
        ,width : 840
        ,height: 400
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

//날짜 변환 함수 (String -> Date) : confirmDt가 DB에서 varchar로 되어있음.
function chgDate(obj){
    if(!dms.string.isEmpty(obj)){
        if(obj != null && obj != ""){
            var year = obj.substring(0,4);
            var month = obj.substring(4,6);
            var day = obj.substring(6,8);
            var date = year+"-"+month+"-"+day;
            return date;
        }else{
            return null;
        }
    } else {
        return " ";
    }
}

function initPage(){
    $("#grid").data("kendoExtGrid").dataSource.data([]);

    $("#sPurcOrdNo").val("");
    $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").min(new Date(0,0,0));
    $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
    $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(0,0,0));
    $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
    $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").value(monthDtBf);
    $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);
    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
    $("#sBmpOrdNo").val("");
    $("#sRegUsrNm").val("");
    $("#sItemCd").val("");
    $("#sItemNm").val("");
}

function fnChkDateValue(e){

    var  elmt = e.sender.element[0],
         id = elmt.id,
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
        }else if(id === 'sPurcRegDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
        }
        if(id === 'sBmpOrdDtFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
        }else if(id === 'sBmpOrdDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
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
        }
        if(id === 'sBmpOrdDtFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").max(new Date(frYY,frMM+1,frDD));
        }else if(id === 'sBmpOrdDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM-1,toDD));
        }
    }
}

$(document).ready(function() {

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

    //구매오더상태
    $("#purcOrdStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,optionLabel:" "
    });

    //오더일자(구매등록일)
    $("#purcRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //오더일자(구매등록일)
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

    //전송일자
    $("#sBmpOrdDtFr").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sBmpOrdDtTo").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
    $("#searchRegUserId").on('click', userSearchPopup);

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            if(dms.string.isEmpty($("#sBmpOrdNo").val())){
                //bmp오더번호는 필수 입력 사항입니다.
                dms.notification.warning("<spring:message code='par.lbl.bmpOrdNo' var='bmpOrdNo' /><spring:message code='global.info.required.field' arguments='${bmpOrdNo}'/>");
            }else {
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        }
    });

    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){
            var beanName;
            var templateFile;
            var fileName;

            if(dms.string.isEmpty($("#sBmpOrdNo").val())){
                //bmp오더번호는 필수 입력 사항입니다.
                dms.notification.warning("<spring:message code='par.lbl.bmpOrdNo' var='bmpOrdNo' /><spring:message code='global.info.required.field' arguments='${bmpOrdNo}'/>");
            }else {
                beanName = "purcOrdService";
                templateFile = "AmosRealTimeList_Tpl.xlsx";
                fileName = "AmosRealTimeList.xlsx";

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sListType":"RT"
                    ,"sPurcRegDtFr":""
                    ,"sPurcRegDtTo":""
                    ,"sArrvDtFr":""
                    ,"sArrvDtTo":""
                    ,"sConfirmFr":""
                    ,"sConfirmTo":""
                    ,"sBmpOrdNo":$("#sBmpOrdNo").val()
                    ,"sBmpOrdDtFr":kendo.toString($("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").value(),"yyyyMMdd")
                    ,"sBmpOrdDtTo":kendo.toString($("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").value(),"yyyyMMdd")
                });
            }
        }
    });

    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0728-111195"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusInterfaceRealTimeList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //구매오더 검색조건 코드.
                        params["sBmpOrdNo"] = $("#sBmpOrdNo").val();
                        //params["sMobisInvcNo"] = $("#sMobisInvcNo").val();
                        params["sBmpOrdDtFr"] = kendo.toString($("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").value(),"yyyyMMdd");
                        params["sBmpOrdDtTo"] = kendo.toString($("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").value(),"yyyyMMdd");
                        params["sConfirmFr"] = $("#sBmpOrdDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmTo"] = $("#sBmpOrdDtTo").data("kendoExtMaskedDatePicker").value();

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
                ,total:"total"
                ,model:{
                    id:"purcOrdNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,bmpOrdNo:{type:"string"} //BMP오더번호
                        ,purcOrdNo:{type:"string"} //오더번호
                        ,purcOrdLineNo:{type:"string"} //구매오더라인번호
                        ,itemCd:{type:"string"} //부번
                        ,confirmParNo:{type:"string"} //부번
                        ,itemNm:{type:"string"} //품명
                        ,purcRegDt:{type:"date"} //오더일자(구매일자)
                        ,invcDt:{type:"date"} //발송일
                        ,arrvDt:{type:"date"} //도착예정일자
                        ,purcOrdTp:{type:"string"} //오더유형
                        ,bpCd:{type:"string"} //업체
                        ,bpNm:{type:"string"} //업체
                        ,purcItemStatCd:{type:"string"} //상태
                        ,purcPgssCd:{type:"string"} //진행상태
                        ,purcQty:{type:"number"} //오더수량(구매수량)
                        ,confirmQty:{type:"number"} //오더수량(확정수량)
                        ,boQty:{type:"number"} //B/O수량
                        ,odrAlcQt:{type:"number"} //할당수량
                        ,odrOpicQt:{type:"number"} //픽킹중수량
                        ,odrOpacQt:{type:"number"} //팩킹중수량
                        ,odrPakdQt:{type:"number"} //팩킹완료수량
                        ,odrInvQt:{type:"number"} //인보이스수량
                        ,cancQty:{type:"number"} //취소수량
                        ,purcPrc:{type:"number"} //단가
                        ,purcAmt:{type:"number"} //금액
                        ,mobisInvcNo:{type:"string"} //모비스송장번호
                        ,boxNo:{type:"string"} //BOX번호
                        ,editCd:{type:"string"} //편수코드
                        ,trsfTp:{type:"string"} //운송유형
                        ,trsfUsrId:{type:"string"} //운송인
                        ,dlDistCd:{type:"string"} //삭제여부(아모스)
                        ,cancReqQty:{type:"number"} //삭제여부(아모스)
                        ,calcConfirmQty:{type:"number"} //삭제여부(아모스)
                        ,confirmDt:{type:"string"} //전송일자
                    }
                }
            }
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,editable:false
        ,pageable:{
            refresh:false
            ,pageSize:100
            ,buttonCount:3
            ,input:false
        }
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {field:"purcOrdTp", title:"<spring:message code='par.lbl.purcOrdTp' />", template:'#= changePurcOrdTp(purcOrdTp)#', attributes:{"class":"al"}, width:140}//오더유형
            ,{field:"purcRegDt", title:"<spring:message code='par.lbl.ordReqDt' />", attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90}//구매신청일자
            ,{field:"confirmDt", title:"<spring:message code='par.lbl.sendDt' />", attributes:{"class":"ac"}, width:90, template:'#= chgDate(confirmDt)#'}//전송일자 (B/O와 동일) chgDate
            ,{field:"purcOrdNo", title:"<spring:message code='par.lbl.purcOrdNo' />", width:100}//구매오더번호
            ,{field:"bmpOrdNo", title:"<spring:message code='par.lbl.bmpOrdNo' />", width:120}//bmp오더번호
            ,{field:"bpCd", title:"<spring:message code='par.lbl.spyrCd' />", width:105, hidden:true}//거래처 코드
            ,{field:"bpNm", title:"<spring:message code='par.lbl.spyrCd' />", width:140}//공급업체
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:140}//부품명
            ,{_field:"itemCdHd", title:"<spring:message code='par.lbl.itemCd'/>"
                ,headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"itemCd", title:"<spring:message code='par.lbl.request'/>", width:100}//요청
                    ,{field:"confirmParNo", title:"<spring:message code='par.lbl.confirm'/>", width:100}//확정
                ]
            }//부품번호
            ,{_field:"purcQtyHd", title:"<spring:message code='par.lbl.purcQty'/>"
                ,headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"purcQty", title:"<spring:message code='par.lbl.request' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}
                    ,{field:"confirmQty", title:"<spring:message code='par.lbl.confirm' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}
                ]
            }//구매수량
            ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcPriceAddTax' />", attributes:{ "class":"ar"}, format:"{0:n2}", decimals:2, width:120}
            ,{field:"dlDistCd", title:"<spring:message code='par.lbl.pdcCd' />(<spring:message code='par.lbl.strgeNm' />)", width:140, template:'#= changeDlPdcCd(dlDistCd)#'}//PDC 창고
            ,{field:"calcConfirmQty", title:"<spring:message code='par.lbl.currentQty' />", format:"{0:n0}", decimal:0, width:80}//CONFIRM 수량
            ,{field:"cancReqQty", title:"<spring:message code='par.lbl.cancQty' />", format:"{0:n0}", decimal:0, width:80}//취소수량
            ,{field:"editCd", title:"<spring:message code='par.lbl.amendCode' />", width:140, template:'#= changeEditCd(editCd)#'}//편수코드
            ,{field:"boQty", title:"<spring:message code='par.lbl.boQty' />", attributes :{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//BO수량
            ,{_field:"ordPrcsStatHd", title:"<spring:message code='par.lbl.purcProcStat'/>"
                ,headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"odrAlcQt", title:"<spring:message code='par.lbl.alloc' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//할당수량
                    ,{field:"odrOpicQt", title:"<spring:message code='par.lbl.picking' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//피킹중수량
                    ,{field:"odrOpacQt", title:"<spring:message code='par.lbl.packing' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//포장중수량
                    ,{field:"odrPakdQt", title:"<spring:message code='par.lbl.packEnd' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//포장완료수량
                    ,{field:"odrInvQt", title:"<spring:message code='par.lbl.invcQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//인보이스수량
                ]
            }//오더처리상태
            ,{field:"mobisInvcNo", title:"<spring:message code='par.lbl.invcDocNo' />", width:140}//송장번호
            ,{field:"boxNo", title:"<spring:message code='par.lbl.boxNo' />", width:100}//BOX번호
            ,{field:"trsfTp", title:"<spring:message code='par.lbl.trsfType' />", width:140, template:'#= changeTrsfTp(trsfTp)#'}//운송유형
            ,{field:"trsfUsrId", title:"<spring:message code='par.lbl.trsfPrsn' />", width:100}//운송인
            ,{field:"invcDt", title:"<spring:message code='par.lbl.sendOrdDt' />", attributes:{"class":"ar"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90}//발송일자
            ,{field:"arrvDt", title:"<spring:message code='par.lbl.arrvExpcDt' />", attributes:{"class":"ar"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90}//도착예정일자
            ,{field:"purcOrdLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60}//구매오더라인번호
            ,{field:"purcItemStatCd", title:"<spring:message code='par.lbl.purcItemStatCd' />", attributes:{"class":"ar"}, width:70, hidden:true}//상태
            ,{field:"purcPgssCd", title:"<spring:message code='par.lbl.purcItemStatCd' />", attributes:{"class":"ar"}, width:70, template:'#if(changePurcPgssCd(purcPgssCd) !== undefined){# #= changePurcPgssCd(purcPgssCd)# #}#'}//상태
        ]
    });

    initPage();
});

//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcOrdTpObj[val])){
            returnVal = purcOrdTpObj[val];
        }
    }
    return returnVal;
};

//PDC 창고
changeDlPdcCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(dlPdcCdObj[val])){
            returnVal = dlPdcCdObj[val];
        }
    }
    return returnVal;
};

//편수코드
changeEditCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(ammendCodeObj[val])){
            returnVal = ammendCodeObj[val];
        }
    }
    return returnVal;
};
// 구매상태
changePurcPgssCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcPgssCdObj[val])){
            returnVal = purcPgssCdObj[val];
        }
    }
    return returnVal;
};
//운송유형
changeTrsfTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(trsfTpObj[val])){
            returnVal = trsfTpObj[val];
        }else{
            returnVal = val;
        }
    }
    return returnVal;
};
</script>
<!-- //script -->