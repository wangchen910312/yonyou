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
			<dms:access viewId="VIEW-D-11566" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">

			<dms:access viewId="VIEW-D-11565" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                            <div class="form_search">
                                <input id="sPurcOrdNo" class="form_input form_readonly" readonly />
                                <input type="text" id="sBpNm" class="form_input form_readonly hidden" readonly>
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <a id="searchPurcOrdNo"><!-- 검색 --></a>
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

        <div class="table_form form_width_100per mt10" id="summaryForm">
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
                        <th scope="row"><spring:message code="par.lbl.backOrderCnt" /><!-- B/O건수 --></th>
                        <td>
                            <input id="boParCnt" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.backOrderQty" /><!-- B/O수량 --></th>
                        <td>
                            <input id="boParQty" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.backOrderAmt" /><!-- B/O금액 --></th>
                        <td>
                            <input id="boParAmt" data-type="number" class="form_numeric"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 오더상태 --></th>
                        <td>
                            <input id="purcOrdStatCd" type="text" data-type="combo" class="form_comboBox" />
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

 var  pPurcOrdNo          = "${pPurcOrdNo}";
 

//오더유형 선택
purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

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

trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {
	
    //오더유형선택
    $("#sPurcOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdTpList
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

    $("#boParCnt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boParQty").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#boParAmt").kendoExtNumericTextBox({
        format:"n2"
       ,spinners:false
    });

    $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
    $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
    $("#searchRegUserId").on('click', userSearchPopup);
    $("#searchPurcOrdNo").on('click', selectPurcOrdListPopupWindow);

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
        	pPurcOrdNo = '';
            initPage();
        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
            summaryFormSet();
        }
    });

    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){

            var beanName;
            var templateFile;
            var fileName;

            beanName = "purcOrdService";
            templateFile = "PartBackOrdStatusTarget_Tpl.xlsx";
            fileName = "PartBackOrdStatusTarget.xlsx";

            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                sPurcOrdStatCdLst.splice(0,1);
            }

            if(sPurcOrdStatCdLst.length === 0){
                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                }
            }

            dms.ajax.excelExport({
                "beanName":beanName
                ,"templateFile":templateFile
                ,"fileName":fileName
                ,"sBpCd":$("#sBpCd").val()
                ,"sPurcOrdNo":$("#sPurcOrdNo").val()
                ,"sPurcOrdTp":$("#sPurcOrdTp").data("kendoExtDropDownList").value()
                ,"sItemCd":$("#sItemCd").val()
                ,"sItemNm":$("#sItemNm").val()
                ,"sRegUsrId":$("#sRegUsrId").val()
                ,"sPurcRegDtFr":$("#sPurcRegDtFr").val()
                ,"sPurcRegDtTo":$("#sPurcRegDtTo").val()
                ,"sConfirmFr":$("#sConfirmFr").val()
                ,"sConfirmTo":$("#sConfirmTo").val()
                ,"sArrvDtFr":""
                ,"sArrvDtTo":""
                ,"sPurcOrdStatLst":sPurcOrdStatCdLst
                ,"sListType":"D"
                ,"sBoYn":'Y'
                ,"sDelYn":'Y'
            });
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
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
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
                        params["sBpCd"]              = $("#sBpCd").val();
                        params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                        params["sItemCd"]            = $("#sItemCd").val();
                        params["sItemNm"]            = $("#sItemNm").val();
                        params["sRegUsrId"]          = $("#sRegUsrId").val();
                        params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                        params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmFr"]         = $("#sConfirmFr").data("kendoExtMaskedDatePicker").value();
                        params["sConfirmTo"]         = $("#sConfirmTo").data("kendoExtMaskedDatePicker").value();
                        params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
                        params["sBoYn"]              = 'Y';
                        params["sDelYn"]             = 'Y'; //삭제된 구매오더 제외.


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
                        dlrCd          :{ type:"string", editable:false }
                      , purcOrdNo      :{ type:"string", editable:false } //오더번호
                      , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                      , bmpOrdNo       :{ type:"string", editable:false } //오더번호
                      , itemCd         :{ type:"string", editable:false } //부번
                      , confirmParNo   :{ type:"string", editable:false } //부번
                      , itemNm         :{ type:"string", editable:false } //품명
                      , confirmParNm   :{ type:"string", editable:false } //품명
                      , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                      , arrvDate       :{ type:"date",   editable:false } //아모스 전송일자
                      , arrvDt         :{ type:"date",   editable:false } //도착예정일자
                      , purcOrdTp      :{ type:"string", editable:false } //오더유형
                      , bpCd           :{ type:"string", editable:false } //업체
                      , bpNm           :{ type:"string", editable:false } //업체
                      , purcItemStatCd :{ type:"string", editable:false } //상태
                      , purcUnitCd     :{ type:"string", editable:false } //단위
                      , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                      , bmpChkQty      :{ type:"number", editable:false } //확정수량
                      , boQty          :{ type:"number", editable:false } //B/O수량
                      , giExpcDt       :{ type:"string", editable:false } //B/O일자
                      , odrAlcQt       :{ type:"number", editable:false } //할당수량
                      , odrOpicQt      :{ type:"number", editable:false } //픽킹중수량
                      , odrOpacQt      :{ type:"number", editable:false } //팩킹중수량
                      , odrPakdQt      :{ type:"number", editable:false } //팩킹완료수량
                      , odrInvQt       :{ type:"number", editable:false } //인보이스수량
                      , grQty          :{ type:"number", editable:false } //기입고수량(입고수량)
                      , cancQty        :{ type:"number", editable:false } //취소수량
                      , grStrgeCd      :{ type:"string", editable:false } //창고
                      , purcPrc        :{ type:"number", editable:false } //단가
                      , purcAmt        :{ type:"number", editable:false } //금액
                      , regUsrId       :{ type:"string", editable:false } //등록인
                      , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                      , confirmDt      :{ type:"string",   editable:false } //전송일자 (= 0421T의 arrvDt)
                      , purcPrc        :{ type:"number",   editable:false } //구매단가
                      , bmpPurcPrc     :{ type:"number",   editable:false } //bmp구매단가
                    }
                }
            }
        }
        , selectable:"row"
        , scrollable :true
        , autoBind   :false
		//禁止对列表进行操作，避免操作后导致列头错乱问题 update by lyy 2018-09-14 start
        , enableTooltip:false  
        , navigatable:false
        , reorderable:false
        //列头宽度可以调整 update by lyy 2018-09-28 start
        , resizable:true
        //列头宽度可以调整 update by lyy 2018-09-28 end
        , sortable:false
       	, indvColumnReorderable:false         //컬럼순서 변경 개인화 적용
        , indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용 [중요 : columns.field 속성을 주지 않은 컬럼은 columns._field 속성을 반드시 부여해야 한다]
        , enableDragToSelectRows:false       //드래그 컬럼 선택 - 드래그 컬럼 선택이 false 인 경우 멀티선택 그리드는 ctrl+drag로 선택가능 하다.
      	//禁止对列表进行操作，避免操作后导致列头错乱问题 update by lyy 2018-09-14 end
        , pageable:{
            refresh:false
           ,pageSize:100
           ,buttonCount:3
           ,input:false
         }
        , filterable:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , columns:[
              {//딜러코드
                  title     :"<spring:message code='par.lbl.dlrCd' />"
                 ,field     :"dlrCd"
                 ,width     :80
                 ,hidden    :true
              }
             ,{//오더유형
                  field     :"purcOrdTp"
                 ,title     :"<spring:message code='par.lbl.purcOrdTp' />"
                 ,template  :'#= changePurcOrdTp(purcOrdTp)#'
                 ,attributes:{"class":"ac"}
                 ,width     :140
                 ,hidden    :true
              }
             ,{//구매오더번호
                  field     :"purcOrdNo"
                 ,title     :"<spring:message code='par.lbl.purcOrdNo' />"
                 ,width     :100
               }
             ,{//구매오더번호
                  field     :"bmpOrdNo"
                 ,title     :"<spring:message code='par.lbl.bmpOrdNo' />"
                 ,width     :100
               }
             ,{//거래처 코드
                  field     :"bpCd"
                 ,title     :"<spring:message code='par.lbl.spyrCd' />"
                 ,width     :105
                 ,hidden    :true
              }
             ,{//공급업체
                 field      :"bpNm"
                ,title      :"<spring:message code='par.lbl.spyrCd' />"
                ,width      :140
                ,hidden     :true
              }
             ,{
                _field:"itemNmHd"
                ,title:"<spring:message code='par.lbl.itemNm'/>"//부품명
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:
                     [
                        {field:"itemNm", title:"<spring:message code='par.lbl.request'/>", width:140 }//요청
                       ,{field:"confirmParNm", title:"<spring:message code='par.lbl.confirm'/>", width:140 }//확정
                     ]
              }
             ,{
                _field:"itemCdHd"
                ,title:"<spring:message code='par.lbl.itemCd'/>"//부품번호
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:
                     [
                        {field:"itemCd", title:"<spring:message code='par.lbl.request'/>", width:140 }//요청
                       ,{field:"confirmParNo", title:"<spring:message code='par.lbl.confirm'/>", width:140 }//확정
                     ]
              }
             ,{//BO수량
                 field      :"boQty"
                ,title      :"<spring:message code='par.lbl.boQty' />"
                ,attributes :{"class":"ar"}
                ,format     :"{0:n0}"
                ,decimal    :0
                ,width      :80
              }
             ,{//구매등록일
                  field     :"purcRegDt"
                 ,title     :"<spring:message code='par.lbl.ordReqDt' />"
                 ,attributes:{"class":"ar"}
                 ,format    :"{0:<dms:configValue code='dateFormat' />}"
                 ,width     :90
              }
             ,{//구매단가
                 field      :"purcPrc"
                ,title      :"<spring:message code='par.lbl.purcPriceAddTax' />"
                ,attributes :{"class":"ar"}
                ,format     :"{0:n2}"
                ,decimal    :0
                ,width      :80
              }
             ,{//bmp구매단가
                 field      :"bmpPurcPrc"
                ,title      :"<spring:message code='par.lbl.purcIncTaxPrc' />"
                ,attributes :{"class":"ar"}
                ,format     :"{0:n2}"
                ,decimal    :0
                ,width      :80
                ,hidden     :true
              }
             ,{//전송일자
                 field      :"confirmDt"
                 ,title     :"<spring:message code='par.lbl.sendDt' />"
                 ,template   :'#= chgDate(confirmDt)#'
                 ,attributes:{ "class":"ac"}
                 ,width:90
             }
             ,{//BO일자
                 field     :"giExpcDt"
                ,title     :"<spring:message code='par.lbl.arrvExpcDt' />"
                ,attributes:{"class":"ac"}
                ,template   :'#= chgDate(giExpcDt)#'
                ,width     :90
              }
             ,{//구매오더라인번호
                 field     :"purcOrdLineNo"
                ,title     :"<spring:message code='par.lbl.lineNm' />"
                ,width     :60
               }
             , {//상태
                 field      :"purcItemStatCd"
                ,title      :"<spring:message code='par.lbl.purcItemStatCd' />"
                ,attributes:{"class":"ar"}
                ,template   :'#= changePurcOrdStat(purcItemStatCd)#'
                ,width      :70
             }
             ,{
                _field:"purcQtyHd"
                ,title:"<spring:message code='par.lbl.purcQty'/>"//구매수량
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:
                     [
                        {field:"purcQty"
                            ,title      :"<spring:message code='par.lbl.request' />"
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                        }
                       ,{field:"confirmQty"
                            ,title      :"<spring:message code='par.lbl.confirm' />"
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                         }
                     ]
                ,hidden    :true
              }
             ,{
                _field:"purcProcStatHd"
                ,title:"<spring:message code='par.lbl.purcProcStat'/>"//오더처리상태
                ,headerAttributes:{ "class":"hasBob" }
                ,columns:
                     [
                        {field:"odrAlcQt"
                            ,title      :"<spring:message code='par.lbl.alloc' />"  //할당수량
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                        }
                       ,{field:"odrOpicQt"
                            ,title      :"<spring:message code='par.lbl.picking' />"  //피킹중수량
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                         }
                       ,{field:"odrOpacQt"
                            ,title      :"<spring:message code='par.lbl.packing' />"  //포장중수량
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                         }
                       ,{field:"odrPakdQt"
                            ,title      :"<spring:message code='par.lbl.packEnd' />"  //포장완료수량
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                         }
                       ,{field:"odrInvQt"
                            ,title      :"<spring:message code='par.lbl.invcQty' />"  //인보이스수량
                            ,attributes :{"class":"ar"}
                            ,format     :"{0:n0}"
                            ,decimal    :0
                            ,width      :80
                         }
                     ]
              }
             ,{//송장번호
                 field     :"mobisInvcNo"
                ,title     :"<spring:message code='par.lbl.invcDocNo' />"
                ,width     :100
                ,hidden    :true
              }
             ,{//BOX번호
                 field     :"boxNo"
                ,title     :"<spring:message code='par.lbl.boxNo' />"
                ,width     :100
                ,hidden    :true
              }
            , {   //운송유형
                 title     :"<spring:message code='par.lbl.trsfType' />"
                ,field     :"trsfTp"
                ,template  :'#= changeTrsfTp(trsfTp)#'
                ,attributes:{ "style":"text-align:center"}
                ,width     :140
                ,hidden    :true
              }
            , {   //운송인
                 title     :"<spring:message code='par.lbl.trsfPrsn' />"
                ,field     :"trsfUsrId"
                ,width     :100
                ,hidden    :true
              }
             ,{//발송일자
                 field     :"invcDt"
                ,title     :"<spring:message code='par.lbl.sendOrdDt' />"
                ,attributes:{"class":"ar"}
                ,format    :"{0:<dms:configValue code='dateFormat' />}"
                ,width     :90
                ,hidden    :true
              }
        ]
    });


initPage();

});




//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdTpObj[val];
    }
    return returnVal;
};

// 구매상태
changePurcOrdStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdStatObj[val];
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
        }else if(id === 'sConfirmFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sConfirmFr").data("kendoExtMaskedDatePicker").value('');
            $("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sConfirmTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sConfirmTo").data("kendoExtMaskedDatePicker").value('');
            $("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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

// 구매 정보 조회.
function selectPurcOrd(pPurcOrdNo){

    $.ajax({
        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
        data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }

    }).done(function(result) {
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#summaryForm")[0])) {
            return false;
        }

        partsJs.validate.groupObjAllDataSet(result);

    });
}

//setting summaryForm
function summaryFormSet(){
    var params = {};
    var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
    if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

        sPurcOrdStatCdLst.splice(0,1);
    }

    if(sPurcOrdStatCdLst.length === 0){
        for(var i = 0; i < purcOrdStatList.length; i = i + 1){
            sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
        }
    }
    // 구매오더 검색조건 코드.
    params["sBpCd"]              = $("#sBpCd").val();
    params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
    params["sItemCd"]            = $("#sItemCd").val();
    params["sItemNm"]            = $("#sItemNm").val();
    params["sRegUsrId"]          = $("#sRegUsrId").val();
    params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
    params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
    params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
    params["sConfirmFr"]         = $("#sConfirmFr").data("kendoExtMaskedDatePicker").value();
    params["sConfirmTo"]         = $("#sConfirmTo").data("kendoExtMaskedDatePicker").value();
    params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
    params["sBoYn"]              = 'Y';
    params["sDelYn"]             = 'Y'; //삭제된 구매오더 제외.

    $.ajax({
        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListSummary.do' />",
        data:JSON.stringify(params),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(result) {
        if(result.data.length == 1){
            $("#boParCnt").data("kendoExtNumericTextBox").value(result.data[0].boTotalCnt);
            $("#boParQty").data("kendoExtNumericTextBox").value(result.data[0].boTotalQty);
            $("#boParAmt").data("kendoExtNumericTextBox").value(result.data[0].boTotalPrc);
        } else {
            $("#boParCnt").data("kendoExtNumericTextBox").value(0);
            $("#boParQty").data("kendoExtNumericTextBox").value(0);
            $("#boParAmt").data("kendoExtNumericTextBox").value(0);
        }
    });
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
                ,"autoBind":false
                , "callbackFunc":function(data){
                    $("#sItemCd").val(data[0].itemCd);
                    $("#sItemNm").val(data[0].itemNm);

                    searchItemPopupWindow.close();
                }
           }
        }
    });
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
                ,"bpCd":''
                ,"bpNm":''
                ,"callbackFunc":function(data){
                    $("#sBpCd").val(data[0].bpCd);
                    $("#sBpNm").val(data[0].bpNm);

                    venderSearchPopupWin.close();
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

// 구매리스트 팝업 열기 함수.
function selectPurcOrdListPopupWindow(){

    if(dms.string.isEmpty($("#sBpCd").val())){
        // 딜러를 선택하십시오
        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
        saveList = [];
        return false;
    }

    purcOrdListPopupWindow = dms.window.popup({
        windowId:"purcOrdListPopup"
        ,title:"<spring:message code='par.title.purcOrdInfo' />"   // 구매오더정보
        ,content:{
            url:"<c:url value='/par/cmm/selectPurcOrdListPopup.do'/>"
            ,data:{
                  "type":"custom1"
                , "autoBind":false
                , "bpCd":$("#sBpCd").val()
                , "bpNm":$("#sBpNm").val()
                , "selectable":"single"
                , "callbackFunc":function(data){
                    if(data.length === 1)
                    {
                        $("#sPurcOrdNo").val(data[0].purcOrdNo);
                        selectPurcOrd(data[0].purcOrdNo);

                        $("#grid").data("kendoExtGrid").dataSource.read();
                        summaryFormSet();
                    } else {
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }
                    purcOrdListPopupWindow.close();
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
    } else {
        return " ";
    }
}

function initPage(){
    var minDate             = new Date(sevenDtBf),
        maxDate             = new Date(toDt),
        //pPurcOrdNo          = "${pPurcOrdNo}",
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

    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#summaryForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();
    
    //$("#grid").data("kendoExtGrid").dataSource.data([]);
    
    $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
    $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
    
    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#purcOrdStatCd").data("kendoExtDropDownList").enable(false);
    $("#boParCnt").data("kendoExtNumericTextBox").enable(false);
    $("#boParQty").data("kendoExtNumericTextBox").enable(false);
    $("#boParAmt").data("kendoExtNumericTextBox").enable(false);
    $("#boParCnt").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boParQty").closest(".k-numerictextbox").addClass("form_readonly");
    $("#boParAmt").closest(".k-numerictextbox").addClass("form_readonly");
    
    //----liuxueying add start----------
    if(!dms.string.isEmpty(pPurcOrdNo)){
        $("#sPurcOrdNo").val(pPurcOrdNo);
    }
    $("#grid").data("kendoExtGrid").dataSource.read();
    summaryFormSet();
   //----liuxueying add end----------

}
</script>
<!-- //script -->