<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매현황조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <!-- 增加上传 excle JiaMing 2020-11-16 start -->
<%--                 <button class="btn_m btn_m_min" id="btnExcelImport" name="btnExcelImport"><spring:message code="global.btn.excelImport" /></button> --%>
                <!-- 增加上传 excle JiaMing 2020-11-16 end -->
                <button class="btn_m btn_m_min" id="btnExcelExport" name="btnExcelExport"><spring:message code="par.btn.excelDownload" /></button>
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
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input id="sDlrCd" class="form_input">
                            <input type="text" id="sBpNm" class="form_input form_readonly hidden" readonly/>
                            <input type="text" id="sBpCd" class="form_input hidden"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input id="sDlrNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 딜러오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input id="sItemNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매오더일자 --></th>
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
                        <th scope="row"><spring:message code="par.lbl.sendDt" /><!-- 오더전송일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sConfirmFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sConfirmTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
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
<!-- //구매오더 -->

<!-- script -->
<script>
var accessoriesSupplierBatchUploadPopupWin;
var purcOrdTpList   = []
   ,purcOrdTpObj    = {}
   ,purcOrdStatList = []
   ,purcOrdStatObj  = {}
   ,sessionBpCd     = "${bpCd}"
   ,sessionBpNm     = "${bpNm}"
   ,toDt            = "${toDt}"
   ,sevenDtBf       = "${sevenDtBf}"
   ,purcUnitList    = []
   ,purcUnitObj     = {}
   ,grStrgeTpList   = []
   ,grStrgeTpObj    = {}
   ,trsfTpList      = []
   ,trsfTpObj       = {}
   ,searchItemPopupWindow
   ,userSearchPopupWin
   ,purcOrdListPopupWindow;

//구매오더상태 선택
purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if(Number("${obj.cmmCd}") <= 3 ){
        if("${obj.useYn}" !=='N' ){
            purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    }
</c:forEach>
var  sDlrCd          = "${sDlrCd}";


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

    //아모스확정일자 = 전송일자
    $("#sConfirmFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sConfirmTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
        	sDlrCd = '';
            initPage();
        }
    });

    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){

            //excel export all
            dms.ajax.excelExport({
                "beanName":"purcOrdService"
                ,"templateFile":"PurcBackOrders_Tpl.xls"
                ,"fileName":"PurcBackOrders_Tpl.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sDlrNm":$("#sDlrNm").val()
                ,"sBmpOrdNo":$("#sBmpOrdNo").val()
                ,"sPurcOrdNo":$("#sPurcOrdNo").val()
                ,"sItemCd":$("#sItemCd").val()
                ,"sItemNm":$("#sItemNm").val()
                ,"sConfirmFr":$("#sConfirmFr").val()
                ,"sConfirmTo":$("#sConfirmTo").val()
                ,"sPurcRegDtFr":$("#sPurcRegDtFr").val()
                ,"sPurcRegDtTo":$("#sPurcRegDtTo").val()
            });

        }
    });
    
    //上传Excel 文件数据 jiaMing 2020-11-16 start
    
     $("#btnExcelImport").kendoButton({
        click:function(e) {
            accessoriesSupplierBatchUploadPopupWin = dms.window.popup({
                title:"<spring:message code='global.info.correspondingSupplierDataAccessories' />"
                ,windowId:"accessoriesSupplierBatchUploadPopupWin"
                ,content:{
                    url:"<c:url value='/par/pcm/purcBackOrd/selectPartsAccSupInfoExcelUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });
  //上传Excel 文件数据 jiaMing 2020-11-16 end
    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
            //summaryFormSet();
            //dms.notification.warning("<spring:message code='global.info.ready'/>");
        }
    });

    // 구매 헤더 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0728-131999"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />"
                }
                ,parameterMap:function(options, operation){
                    if(operation === "read"){
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 구매오더 검색조건 코드.
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sPurcOrdNo"] = $("#sPurcOrdNo").val();
                        params["sBmpOrdNo"] = $("#sBmpOrdNo").val();
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sPurcRegDtFr"] = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sPurcRegDtTo"] = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmFr"] = $("#sConfirmFr").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmTo"] = $("#sConfirmTo").data("kendoExtMaskedDatePicker").value();

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
                    id:"dlrCd"
                    ,fields:{
                        dlrCd:{ type:"string", editable:false }
                        ,purcOrdNo:{ type:"string", editable:false } //오더번호
                        ,mobisInvcNo:{ type:"string", editable:false } //mobis 송장 번호
                        ,boxNo:{ type:"string", editable:false } //boxNo 번호
                        ,purcOrdLineNo:{ type:"string", editable:false } //구매오더라인번호
                        ,bmpOrdNo:{ type:"string", editable:false } //오더번호
                        ,itemCd:{ type:"string", editable:false } //부번
                        ,itemNm:{ type:"string", editable:false } //품명
                        ,confirmParNo:{ type:"string", editable:false } //부번
                        ,confirmParNm:{ type:"string", editable:false } //품명
                        ,purcRegDt:{ type:"string", editable:false } //오더일자(구매일자)
                        ,invcDt:{ type:"date", editable:false } //송장날짜
                        ,bpCd:{ type:"string", editable:false } //업체
                        ,bpNm:{ type:"string", editable:false } //업체
                        ,purcItemStatCd:{ type:"string", editable:false } //상태
                        ,purcQty:{ type:"number", editable:false } //오더수량(구매수량)
                        ,boQty:{ type:"number", editable:false } //B/O수량
                        ,giExpcDt:{ type:"string", editable:false } //B/O일자
                        ,odrAlcQt:{ type:"number", editable:false } //할당수량
                        ,odrOpicQt:{ type:"number", editable:false } //픽킹중수량
                        ,odrOpacQt:{ type:"number", editable:false } //팩킹중수량
                        ,odrPakdQt:{ type:"number", editable:false } //팩킹완료수량
                        ,odrInvQt:{ type:"number", editable:false } //인보이스수량
                        ,purcPrc:{ type:"number", editable:false } //단가
                        ,confirmDt:{ type:"string", editable:false } //전송일자 (= 0421T의 arrvDt)
                        ,bmpPurcPrc:{ type:"number", editable:false } //bmp구매단가
                        ,confirmQty:{ type:"number", editable:false } //bmp구매단가
                        ,arrvDt:{ type:"string", editable:false } //도착예정일자
                    }
                }
            }
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,pageable:{
            refresh:false
            ,pageSize:100
            ,buttonCount:3
            ,input:false
        }
        ,filterable:false
        ,appendEmptyColumn:true //빈컬럼 적용. default:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no' />", attributes:{"class":"ac"}, width:40}//Rownum
            ,{field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80}//딜러코드
            ,{field:"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:80}//딜러명
            ,{field:"bmpOrdNo", title:"<spring:message code='par.lbl.bmpOrdNo' />", width:120}//bmp오더번호
            ,{field:"purcOrdNo", title:"<spring:message code='par.lbl.purcOrdNo' />", width:90}//구매오더번호
            ,{field:"confirmParNo", title:"<spring:message code='par.lbl.itemCd'/>", width:100}//부품코드
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:140}//부품명
            ,{field:"confirmParNm", title:"<spring:message code='par.lbl.confirm'/>", width:140, hidden:true}//확정
            ,{field:"itemCd", title:"<spring:message code='par.lbl.request'/>", width:100, hidden:true}//요청
            ,{field:"boQty", title:"<spring:message code='par.lbl.boQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//BO수량
            ,{field:"purcRegDt", title:"<spring:message code='par.lbl.ordReqDt' />", attributes:{"class":"ar"}, template:'#= chgDate(purcRegDt)#', width:90}//구매등록일
            ,{field:"bmpPurcPrc", title:"<spring:message code='par.lbl.purcIncTaxPrc' />", attributes:{"class":"ar"}, format:"{0:n2}", decimal:0, width:80}//bmp구매단가
            ,{field:"confirmDt", title:"<spring:message code='par.lbl.sendDt' />", template:'#= chgDate(confirmDt)#', attributes:{"class":"ac"}, width:90}//전송일자
            ,{field:"arrvDt", title:"<spring:message code='par.lbl.arrvExpcDt' />", attributes:{"class":"ar"}, template:'#= chgDate(arrvDt)#', width:90}//도착예정일자
            ,{field:"giExpcDt", title:"<spring:message code='par.lbl.arrvExpcDt' />", attributes:{"class":"ac"}, template:'#= chgDate(giExpcDt)#', width:90, hidden:true}//BO일자
            ,{field:"purcItemStatCd", title:"<spring:message code='par.lbl.purcItemStatCd' />", attributes:{"class":"ar"}, template:'#= changePurcOrdStat(purcItemStatCd)#', width:70}//오더상태
            ,{field:"purcOrdLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60}//구매오더라인번호
            ,{field:"odrAlcQt", title:"<spring:message code='par.lbl.alloc' />"  , attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//할당수량
            ,{field:"odrOpicQt", title:"<spring:message code='par.lbl.picking' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//피킹중수량
            ,{field:"odrOpacQt", title:"<spring:message code='par.lbl.packing' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//포장중수량
            ,{field:"odrPakdQt", title:"<spring:message code='par.lbl.packEnd' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//포장완료수량
            ,{field:"odrInvQt", title:"<spring:message code='par.lbl.invcQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}//인보이스수량
        ]
    });

    initPage();
});

// 구매상태
changePurcOrdStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdStatObj[val];
    }
    return returnVal;
};

function fnChkDateValue(e){
    var elmt = e.sender.element[0],
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
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
            //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
        }else if(id === 'sPurcRegDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
            //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
        }else if(id === 'sConfirmFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            $("#sConfirmFr").data("kendoExtMaskedDatePicker").value('');
            //$("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
        }else if(id === 'sConfirmTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sConfirmTo").data("kendoExtMaskedDatePicker").value('');
            //$("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
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
        }else if(id === 'sConfirmFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sConfirmTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }
}

//부품 팝업 열기 함수.
function selectPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"ItemMasterPopup"
        ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":""
                ,"autoBind":false
                ,"callbackFunc":function(data){
                    $("#sItemCd").val(data[0].itemCd);
                    $("#sItemNm").val(data[0].itemNm);

                    searchItemPopupWindow.close();
                }
            }
        }
    });
}

//날짜 변환 함수 (String -> Date) : giExpcDt가 DB에서 varchar로 되어있음.
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
    }else{
        return " ";
    }
}

function initPage(){
    var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        pPurcOrdNo = "${pPurcOrdNo}",
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


    $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
    $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();
    
    //----liuxueying add start----------
    if(!dms.string.isEmpty(sDlrCd)){
        $("#sDlrCd").val(sDlrCd);
	    $("#grid").data("kendoExtGrid").dataSource.read();
    }else{
    	$("#grid").data("kendoExtGrid").dataSource.data([]);
    }

   //----liuxueying add end----------

}
</script>
<!-- //script -->