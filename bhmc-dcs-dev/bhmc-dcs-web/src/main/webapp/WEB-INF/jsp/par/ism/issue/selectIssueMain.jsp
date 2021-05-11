<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품판매 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.revParts" /> --%><!-- 부품판매 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnList" name="btnList" ><spring:message code="par.btn.List" /><!-- 현황 --></button>
                <button class="btn_m btn_reset" id="btnInit" name="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_save" id="btnRequest" name="btnRequest"><spring:message code="par.btn.create" /><!-- 등록 --></button>
                <button class="btn_m btn_save" id="btnConfirm" name="btnConfirm"><spring:message code="par.btn.fix" /><!-- 확정 --></button>
            </div>
        </div>

        <div class="table_form form_width_60per" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:26%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.docNo" /><!-- 문서번호 --></th>
                        <td>
                            <input id="sGiDocNo" name="sGiDocNo" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sGiDocStatCd" name="sGiDocStatCd" style="width:150px" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <div class="form_search" style="width:150px">
                                <input type="text" id="sCustCd" name="sCustCd" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.title.venderTel" /><!-- 연락처 --></th>
                        <td>
                            <input id="sVenderTel" name="sVenderTel" class="form_input" style="width:150px" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                                <a id="searchSerPrsnId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <input id="sReqDt" name="sReqDt" style="width:150px" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dcRate" /><!-- 할인율 --></th>
                        <td colspan="3">
                            <input id="sDcCd" name="sDcCd" style="width:150px" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add" id="btnPurcOrd" name="btnPurcOrd"><spring:message code="par.btn.copyPurcOrd" /></button>
                <button class="btn_s btn_file" id="btnExcelUpload" name="btnExcelUpload"><spring:message code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_add" id="btnRowAdd" name="btnRowAdd"><spring:message code="par.btn.rowAdd" /></button>
                <button class="btn_s btn_del" id="btnRowDel" name="btnRowDel"><spring:message code="par.btn.rowDel" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid mt10">
            <!-- 판매그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품판매 -->

    <!-- 부품판매정보 -->
    <section class="group">
        <div class="table_form form_width_60per"  id="issueForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:26%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.prsCont" /><!-- 담당의견 --></th>
                        <td>
                            <input id="prsCont" name="prsCont" type="text" class="form_input" style="width:150px" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlTp" /><!-- 배송방법 --></th>
                        <td>
                            <input id="dlTp" name="dlTp" type="text" style="width:150px" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmtBefDc" /><!-- 할인전총액 --></th>
                        <td>
                            <input id="totAmtBefDc" name="totAmtBefDc" class="form_readonly" style="width:150px" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" rowspan="2"><spring:message code="par.lbl.custCont" /><!--고객의견 --></th>
                        <td rowspan="2">
                            <textarea id="custCont" name="custCont" rows="3" style="width:143px"></textarea>
                        </td>
                        <th scope="row" rowspan="2"><spring:message code="par.lbl.dlAddr" /><!--배송주소 --></th>
                        <td rowspan="2">
                            <textarea id="dlAddr" name="dlAddr" rows="3" style="width:143px"></textarea>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dcAmt" /><!--할인금액 --></span></th>
                        <td>
                            <input id="dcAmt" name="dcAmt" class="form_readonly" style="width:150px" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!--총액 --></th>
                        <td class="bor_none">
                            <input id="totAmt" name="totAmt" type="text" class="form_readonly" style="width:150px" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //송장정보 -->

<!-- script -->
<script>
var dlPdcCdList = [], vatCdList = [], statusCdList = [];
var gVatCd = Number("${vatCd}");

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

// PDC
dlPdcCdList.push({cmmCd:" ", cmmCdNm:" "});
<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
</c:forEach>
// VAT
vatCdList.push({cmmCd:" ", cmmCdNm:" "});
<c:forEach var="obj" items="${vatCdList}" varStatus="status">
    vatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
</c:forEach>

//상태
statusCdList.push({cmmCd:" ", cmmCdNm:" "});
<c:forEach var="obj" items="${statusCdList}" varStatus="status">
    statusCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
</c:forEach>

var issuePartsInfoExcelUploadPopupWin;
var prevPurcOrdPopupWindow;
//구매오더 복사 팝업 열기 함수.
function selectPrevPurcOrdPopupWindow(){

    prevPurcOrdPopupWindow = dms.window.popup({
        windowId:"PrevPurcOrdPopup"
        , title:"<spring:message code='par.title.purcOrdCopy' />"   // 구매오더 복사
        , content:{
            url:"<c:url value='/par/cmm/selectPrevPurcOrdPopup.do'/>"
            , data:{
                "type":""
                , "autoBind":false
                , "bpCd":"${bmpBpCd}"
                , "bpNm":""
                , "selectable":"single"
                , "callbackFunc":function(data){

                    var dataLen = data.length;

                    for(var i = 0; i < dataLen; i = i + 1){

                        // TODO [심인보] 구매오더 데이타 추가.

                        prevPurcOrdPopupWindow.close();
                    }

                }
            }
        }
    });
}

function pageInit(){
    //문서번호
    $("#sGiDocNo").val("");
    //상태
    $("#sGiDocStatCd").data("kendoExtDropDownList").select(0);
    //고객명
    $("#sCustCd").val("");
    //연락처
    $("#sGiDocNo").val("");
    //담당자
    $("#sGiDocNo").val("");
    //등록일
    $("#sReqDt").data("kendoExtMaskedDatePicker").value("${sysDate}");
    //할인율
    $("#sDcCd").val(0.1);
    //담당의견
    $("#prsCont").val("");
    //배송방법
    $("#dlTp").data("kendoExtDropDownList").select(0);
    //할인전총액
    $("#totAmtBefDc").val(0);
    //고객의견
    $("#custCont").val("");
    //배송주소
    $("#dlAddr").val("");
    //할인금액
    $("#dcAmt").val(0);
    //부품판매
    $("#grid").data("kendoExtGrid").dataSource.data([]);
    // 버튼처리
    buttonEnableDisable();
}

function buttonEnableDisable(bFlag){
    var flag = bFlag;
    $("#btnInit").data("kendoButton").enable(false);
    $("#btnRequest").data("kendoButton").enable(false);
    $("#btnConfirm").data("kendoButton").enable(false);
    $("#btnPurcOrd").data("kendoButton").enable(false);
    $("#btnExcelUpload").data("kendoButton").enable(false);
    $("#btnRowAdd").data("kendoButton").enable(false);
    $("#btnRowDel").data("kendoButton").enable(false);

    switch(flag){
        case "01":// 등록
            $("#btnInit").data("kendoButton").enable(true);
            $("#btnConfirm").data("kendoButton").enable(true);
            $("#btnPurcOrd").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnRowAdd").data("kendoButton").enable(true);
            $("#btnRowDel").data("kendoButton").enable(true);
        break;

        case "02":// 확정
            $("#btnInit").data("kendoButton").enable(true);
            $("#btnRequest").data("kendoButton").enable(true);
            $("#btnPurcOrd").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnRowAdd").data("kendoButton").enable(true);
            $("#btnRowDel").data("kendoButton").enable(true);
            break;
        default :

            $("#btnInit").data("kendoButton").enable(true);
            $("#btnRequest").data("kendoButton").enable(true);
            $("#btnPurcOrd").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnRowAdd").data("kendoButton").enable(true);
            $("#btnRowDel").data("kendoButton").enable(true);

            break;
    }

}

    $(document).ready(function() {

        //상태
        $("#sGiDocStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statusCdList
            ,index:0
        });

        // 연락처
        $("#sVenderTel").kendoMaskedTextBox({
            mask:"000-0000-0000"
            ,promptChar:" "
        });

        //배송방법
        $("#dlTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,index:0
        });

        // 등록일
        $("#sReqDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 할인율
        $("#sDcCd").kendoExtNumericTextBox({
            value:0.1
            ,format:"p"
            ,spinners:false
        });
        // 할인전총액
        $("#totAmtBefDc").kendoExtNumericTextBox({
           format:"n2"
           ,spinners:false
        });
        // 할인금액
        $("#dcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });
        // 총액
        $("#totAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        // 현황
        $("#btnList").kendoButton({
            click:function(e){
                // 현황 페이지 이동.
                //$("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // 초기화
        $("#btnInit").kendoButton({
            click:function(e){
                // 초기화 기능 처리.
                pageInit();
                //$("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // 등록
        $("#btnRequest").kendoButton({
            click:function(e){
                // 부품판매 저장 처리.
                //$("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // 확정
        $("#btnConfirm").kendoButton({
            click:function(e){
                // 부품판매 확정 처리.
                //$("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //구매오더복사
        $("#btnPurcOrd").kendoButton({
            click:function(e){

                //구매오더 복사 팝업 호출.
                selectPrevPurcOrdPopupWindow();

            }
        });

        //액셀업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e){

                console.log("액셀파일업로드 호출");

                // TODO [심인보] 부품판매 액셀 관련 메시지 처리.
                issuePartsInfoExcelUploadPopupWin = dms.window.popup({
                    title:"부품판매액셀업로드"
                    ,windowId:"issuePartsInfoExcelUploadPopupWin"
                    ,content:{
                        url:"<c:url value='/par/issue/cmm/selectIssuePartsInfoExcelUploadPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(data){

                                // 액셀에서 전달된 데이타 처리.

                            }
                        }
                    }
                });

            }
        });

        //행추가
        $("#btnRowAdd").kendoButton({
            click:function(e){

                /* var binLocationMasterVO = {
                        "rnum":$('#grid').data('kendoExtGrid').dataSource.total() + 1
                        ,"dlrCd":""
                        ,"locId":""
                        ,"pltCd":""
                        ,"strgeCd":$("#sStrgeCd").val()
                        ,"lvlId":jqXHR.lvlId
                        ,"locCd":""
                        ,"dbLocCd":""
                        ,"locNm":jqXHR.lvlTxt
                        ,"upperLocId":selectedLocCd
                        ,"lmtMngYn":"N"
                        ,"itemCd":""
                        ,"maxQty":0
                        ,"remark":""
                        ,"mainLocYn":"N"
                        ,"baseLvlId":vLvlId
                        ,"upperLvlId":selectedLocId
                        ,"avlbStockQty":0
                        ,"resvStockQty":0
                        ,"clamStockQty":0
                        ,"dbYn":"N"
                        ,"lgthCnt":jqXHR.lgthCnt
                        ,"cdTp":jqXHR.cdTp
                        ,"regUsrId":null
                        ,"regDt":null
                        ,"updtUsrId":null
                        ,"updtDt":null
                    }

                $('#grid').data('kendoExtGrid').dataSource.insert(0, binLocationMasterVO); */

            }
        });

        //행삭제
        $("#btnRowDel").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();
                var rowCnt = rows.length;

                if(rowCnt > 0){
                    rows.each(function(index, row) {
                        grid.removeRow(row);
                    });
                }
                else{
                    // 삭제항목을 선택해주세요.
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                }
            }
        });

        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                var grid   = $("#grid").data("kendoExtGrid");
                // 라인 추가
            }
        });

        /**
         * grid 배송PDC DropDownList
         */
         dlPdcCdDropDownEditor = function(container, options) {

            console.log('dlPdcCdDropDownEditor:',arguments);

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  dlPdcCdList
             });
         };

        // 판매 그리드
        $("#grid").kendoExtGrid({
              dataSource:{
                  schema:{
                      data :"data"
                     ,total:"total"
                     ,model:{
                        id:"giDocNo"
                       ,fields:{
                               dlrCd          :{ type:"string"   , validation:{required:true} }
                             , purcReqDt      :{ type:"date"     , editable:false}
                             , invcDocNo      :{ type:"string"   , editable:false}
                             , invcDocLineNo  :{ type:"number"   , editable:false}
                             , mobisInvcNo    :{ type:"string"   , editable:false}
                             , mobisInvcLineNo:{ type:"number"   , editable:false}
                             , purcOrdNo      :{ type:"string"   , editable:false}
                             , purcOrdLineNo  :{ type:"number"   , editable:false}
                             , itemCd         :{ type:"string"   , editable:false}
                             , itemNm         :{ type:"string"   , editable:false}
                             , grStrgeCd      :{ type:"string"   , editable:false}
                             , invcTotAmt     :{ type:"number"}
                             , invcPrc        :{ type:"number"}
                             , invcQty        :{ type:"number"   , editable:false}
                             , invcUnitCd     :{ type:"string"   , editable:false}
                             , invcAmt        :{ type:"number"}
                             , vatAmt         :{ type:"number"}
                             , dlPdcCd        :{ type:"string"}
                         }
                     }
                 }
              }
            , selectable :"multiple"
            , scrollable :true
            , autoBind   :false
            , multiSelectWithCheckbox:true
            , pageable   :false
            , sortable   :false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //송장문서번호
                      title:"<spring:message code='par.lbl.invcDocNo' />"
                     ,field:"invcDocNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"invcDocLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //모비스송장번호
                      title:"<spring:message code='par.lbl.mobisInvcNo' />"
                     ,field:"mobisInvcNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"grStrgeCd"
                     ,width:100
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"mobisInvcLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //구매오더번호
                      title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,field:"purcOrdNo"
                     ,width:100
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"purcOrdLineNo"
                     ,width:30
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //총액
                      title:"<spring:message code='par.lbl.totAmt' />"
                     ,field:"invcTotAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                     ,editor:function(container, options){
                         var input = $("<input/>");

                         input.attr("name", options.field);
                         input.appendTo(container);
                         input.kendoExtNumericTextBox({
                             min:0,
                             spinners:false
                         });
                     }
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"invcPrc"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"invcQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"invcUnitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePurcUnit(invcUnitCd)#'
                     ,editable:false
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"invcAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"vatAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                , {   //배송 PDC
                      title:"<spring:message code='par.lbl.dlPdcCd' />"
                     ,field:"dlPdcCd"
                     ,editor:dlPdcCdDropDownEditor
                     ,template:'#= changeDlPdcCd(dlPdcCd)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140
                  }
                , { field:"" }
            ]
        });

        function onEdit(e) {
            var grid = this,
                model = e.model,
                input = e.container.find(".k-input"),
                fieldName = grid.columns[e.container.index()].field;

            if(fieldName === "invcTotAmt"){

                input.blur(function(){
                    // 세율 (비과세인 경우 1로 계싼 )
                    var vatCd = $("#vatCd").data("kendoExtDropDownList").value();
                    // 선택된 값
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    // 입력된 총액으로 계산(단가,세액,금액 계산)
                    var invcTotAmt = selectedItem.invcTotAmt;

                    if(invcTotAmt > 0 && invcTotAmt != null){

                        var invcPrc,vatAmt,invcAmt;
                        // 세액 = (총액 * 부가세율) / 100
                        //vatAmt = Math.ceil((invcTotAmt * vat) / 100);

                        if(vatCd !== '01'){
                           // 금액
                            invcAmt = Number((invcTotAmt * 100) / (100 + (100 * gVatCd))).toFixed(2);
                            vatAmt = Number((invcAmt * (100 * gVatCd)) / 100 ).toFixed(2);
                        }else{
                            // 금액 = 총액
                            invcAmt = invcTotAmt;
                            vatAmt = 0;
                        }
                        // 금액 = 총액 - 세액
                        //invcAmt = invcTotAmt - vatAmt;
                        // 세액
                        // 단가 = 금액 / 수량
                        invcPrc = Number(invcAmt / selectedItem.invcQty).toFixed(2);

                        selectedItem.set("invcPrc", invcPrc);   // 단가
                        selectedItem.set("invcAmt", invcAmt);   // 금액
                        selectedItem.set("vatAmt", vatAmt); // 세액
                        // 전체 계산
                        calTotalAmt();
                    }
                });
            }

            if(fieldName === "invcPrc" ||fieldName === "invcAmt" ||fieldName === "vatAmt" ){
                this.closeCell();
            }
        }

        /**
        * 세액 선택시 note1(금액 계산시 필요)
        */
        function onSelectVatCd(e){
            console.log('onSelectVatCd:',this.dataItem(e.item));
            var vatCd = this.dataItem(e.item).cmmCd;
            calRowAmt(vatCd);
        };

        //Grid 계산
        function calRowAmt(pVatCd){
            var grid = $("#gridInvc").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                // 세율
                invcTotAmt = 0,
                invcPrc,vatAmt,invcAmt = 0;


            console.log('calRowAmt:',pVatCd);
            //  금액 계산
            rows.each(function(index, row) {
                var data = grid.dataSource.at(index);

                invcTotAmt = data.invcTotAmt;

                console.log('invcTotAmt:',invcTotAmt);
                if(invcTotAmt > 0 && invcTotAmt != null){

                    if(pVatCd !== '01'){

                        console.log('부가세 계산');
                         // 금액
                        invcAmt = Number((invcTotAmt * 100) / (100 + (100 * gVatCd))).toFixed(2);
                        vatAmt = Number((invcAmt * (100 * gVatCd)) / 100 ).toFixed(2);
                        console.log('invcAmt:',invcAmt);
                        console.log('vatAmt:',vatAmt);
                    }else{
                        console.log('영세율');
                        invcAmt = invcTotAmt;
                        vatAmt = 0;
                    }

                    // 단가 = 금액 / 수량
                    invcPrc = Number(invcAmt / data.invcQty).toFixed(2);
                    data.set("invcPrc", invcPrc);   // 단가
                    data.set("invcAmt", invcAmt);   // 금액
                    data.set("vatAmt", vatAmt); // 세액
                }

            });
            // Total 계산
            calTotalAmt();
        }

        //Total 계산
        function calTotalAmt(){
             var rows         = $("#gridInvc").data("kendoExtGrid").tbody.find("tr"),
                 invcTotAmt   = 0,
                 vatAmt       = 0;

             //  금액 계산
             rows.each(function(index, row) {

                data = $("#gridInvc").data("kendoExtGrid").dataItem(rows[index]);

                 if(data.invcTotAmt != null && data.vatAmt != null){
                     invcTotAmt += Number(data.invcTotAmt);
                     vatAmt += Number(data.vatAmt);
                 }

                 $("#vatAmt").data("kendoExtNumericTextBox").value(vatAmt);
                 $("#invcTotAmt").data("kendoExtNumericTextBox").value(invcTotAmt);
             });
        }

        function btnView(pType){

            if(pType === "I"){ //초기화인 경우
                $("#btnAddItem").data("kendoButton").enable(true);
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#vatCd").data("kendoExtDropDownList").enable(true);
                $("#mobisInvcNo").attr("disabled", false);
                $("#invcDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#arrvDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#remark").attr("disabled", false);
                //$("#gridInvc").data("kendoExtGrid").setOptions({editable:false});
            }else if(pType === "S"){ //그 외

                $("#btnAddItem").data("kendoButton").enable(false);
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);

                $("#vatCd").data("kendoExtDropDownList").enable(false);
                $("#mobisInvcNo").attr("disabled", true);
                $("#invcDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#arrvDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#remark").attr("disabled", true);
                //$("#gridInvc").data("kendoExtGrid").setOptions({editable:true});
            }
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

           console.log("val:" + this.value());
           console.log('id:',id);
           if(this.value() == null){
               if(id === 'sPurcReqDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcReqDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else{
                   $("#" + id).data("kendoExtMaskedDatePicker").value(toDt);
               }
           }else{
               if(id === 'sPurcReqDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sPurcReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcReqDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sPurcReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }

        }

        // Page Init
        pageInit();
    });
</script>
<!-- //script -->

