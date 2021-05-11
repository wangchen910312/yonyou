<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 용품입고 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-10984" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10983" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_m_min" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10982" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_m_min" id="btnCnfm"><spring:message code="par.btn.receiveCnfm" /></button><!-- 입고확정 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10981" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button><!-- 취소 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10980" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_m_min" id="btnPrint"><spring:message code="sal.btn.grPrintDocPrint" /></button><!-- 입고문서출력 -->
                </dms:access>
            </div>
        </div>

        <form id="form">
        <div class="table_form">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.bpNm" /><!-- 업체명 --></span></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="bpNm" class="form_input" required data-name="<spring:message code='sal.lbl.bpNm' />" data-bind="value:bpNm" />
                                <a href="javascript:void(0)" id="btnSearchVenderMaster"></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.bpTp" /><!-- 업체유형 --></span></th>
                        <td>
                            <input type="text" id="bpTp" class="form_comboBox" required data-name="<spring:message code='sal.lbl.bpTp' />" data-bind="value:bpTp" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.invcGrDt" /><!-- 입고일자 --></th>
                        <td>
                            <input type="text" id="invcGrDt" class="form_datepicker" required data-name="<spring:message code='sal.lbl.invcGrDt' />" data-bind="value:invcGrDt" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.wrhsCnfmNm" /><!-- 입고확인자 --></th>
                        <td>
                            <input type="text" id="regUsrNm" class="form_input" disabled required data-name="<spring:message code='sal.lbl.wrhsCnfmNm' />" data-bind="value:regUsrNm" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.grDocNo" /><!-- 입고번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="grDocNo" class="form_input" disabled readonly required data-name="<spring:message code='sal.lbl.grDocNo' />" data-bind="value:grDocNo" />
                                <a href="javascript:void(0)" id="btnSearchGrDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.itemQty" /><!-- 입고수량 --></th>
                        <td>
                            <input type="number" id="grTotQty" class="form_numeric ar" required data-name="<spring:message code='sal.lbl.itemQty' />" data-bind="value:grTotQty"/>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.wrhsAmt" /><!-- 입고금액 --></th>
                        <td>
                            <input type="number" id="grTotAmt" class="form_numeric ar" required data-name="<spring:message code='sal.lbl.wrhsAmt' />" data-bind="value:grTotAmt"/>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.taxRate" /><!-- 세율 --></th>
                        <td>
                            <input type="number" id="dcRate" class="form_numeric ar" required data-name="<spring:message code='sal.lbl.taxRate' />" data-bind="value:dcRate"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10979" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_file btn_s_min5" id="btnExcelUpload"><spring:message code='sal.lbl.excellUpload' /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-10979" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add btn_s_min5" id="btnAddItem"><spring:message code="global.btn.add" /></button><!-- 추가 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10978" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script type="text/javascript">
//세율 (0.16)
var vatCode = "${vatCd}";
var vatCd = dms.string.isEmpty(vatCode)?0.16:Number(vatCode);

var viewModel = new kendo.observable({
    "dlrCd":""          //딜러코드
   ,"bpCd":""           //공급업체코드
   ,"bpNm":""           //공급업체명
   ,"bpTp":"03"         //업체구분(기타)
   ,"invcGrDt":null     //입고일자
   ,"regUsrNm":""       //입고확인자명
   ,"grDocNo":""        //입고문서번호
   ,"grTp":"02"         //입고유형(기타입고)
   ,"grTotQty":""       //입고수량
   ,"grTotAmt":""       //입고금액
   ,"dcRate":vatCd      //세율
   ,"statCd":""         //상태코드
   ,"grDocTp":"SAL_ACC" //입고문서구분(용품판매)
   ,"updtDtStr":""      //수정일시
});

//업체유형 목록
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업체유형 Map
var bpTpMap = dms.data.arrayToMap(bpTpList, function(obj){ return obj.cmmCd; });

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

//재고단위 목록
var stockUnitCdList = [];
<c:forEach var="obj" items="${stockUnitCdList}">
stockUnitCdList.push({"cmmCd":"${obj.unitExtCd}", "cmmCdNm":"${obj.unitExtCd}", "useYn":"${obj.useYn}"});
</c:forEach>
//재고단위 Map
var stockUnitCdMap = dms.data.arrayToMap(stockUnitCdList, function(obj){ return obj.cmmCd; });

kendo.bind($("#form"), viewModel);


var uploadPopupWin;
var venderSearchPopupWin;

$(document).ready(function() {
    //버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e){
            viewModel.set("dlrCd", "");                 //딜러코드
            viewModel.set("bpCd", "");                  //공급업체코드
            viewModel.set("bpNm", "");                  //공급업체명
            viewModel.set("bpTp", "03");                //공급상구분
            viewModel.set("invcGrDt", null);            //입고일자
            viewModel.set("regUsrNm", "");              //입고확인자명
            viewModel.set("grDocNo", "");               //입고문서번호
            viewModel.set("grTp", "02");                //입고유형
            viewModel.set("regUsrNm", "");              //입고확인자명
            viewModel.set("regUsrNm", "");              //입고확인자명
            viewModel.set("grTotQty", "");              //입고수량
            viewModel.set("grTotAmt", "");              //입고금액
            viewModel.set("dcRate", vatCd);             //세율
            viewModel.set("statCd", "");                //상태코드
            viewModel.set("grDocTp", "SAL_ACC");        //입고문서구분(용품판매)
            viewModel.set("updtDtStr", "");             //수정일시

            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:false
        ,click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

            //거래처 체크
            if(dms.string.isEmpty(viewModel.bpCd)){
                //거래처를 입력해주세요
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                return;
            }

            //부품목록 체크
            if(grid.items().length  == 0){
                //선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return;
            }

            //입력값 체크
            var validCheckFlag = true;

            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dms.string.isEmpty(dataItem.itemCd)){
                    // 부품을 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCdMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCdMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }else if(dms.string.isEmpty(dataItem.invcQty) || dataItem.invcQty == 0){
                    // 수량을 입력하십시오.
                    dms.notification.warning("<spring:message code='par.lbl.invcQty' var='invcQtyMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${invcQtyMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }else if(dms.string.isEmpty(dataItem.invcPrc) || dataItem.invcPrc == 0){
                    //단가를 입력하십시오.
                    dms.notification.warning("<spring:message code='par.lbl.prc' var='prcMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${prcMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }
            });

            if(validCheckFlag){

                var saveUrl;
                var saveData;

                //등록
                if(dms.string.isEmpty(viewModel.grDocNo)){
                    saveData = {
                        invcItemList:grid.dataSource.data()
                    };

                    saveUrl = "<c:url value='/sal/acc/itemInput/insertAccessoryItemInput.do' />";
                //수정
                }else{
                    saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                    saveUrl = "<c:url value='/sal/acc/itemInput/updateAccessoryItemInput.do' />";
                }

                saveData["invcVO"] = {
                    bpCd:viewModel.bpCd
                    ,grDocNo:viewModel.grDocNo
                    ,grDocTp:viewModel.grDocTp
                    ,updtDtStr:viewModel.updtDtStr
                };

                $.ajax({
                    url:saveUrl
                   ,data:kendo.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {
                       if(result.resultYn == true){

                           viewModel.set("grDocNo", result.grDocNo);    //입고문서번호
                           viewModel.set("statCd", "01");               //상태코드(등록)

                           //버튼제어 DECODE(B.STAT_CD,'01','00','02','03','03','04','')
                           setButtonEnable("00");
                           //저장된 데이터를 반영한다.
                           $.ajax({
                               url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDoc.do' />"
                               ,data:JSON.stringify({sEtcGrDocNo:viewModel.grDocNo})
                               ,type:"POST"
                               ,dataType:"json"
                               ,contentType:"application/json"
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }
                           }).done(function(result) {

                               //공급업체코드,공급업체명,업체유형,입고일자,입고확인자ID,입고확인자명,세율설정
                               viewModel.set("dlrCd", result.invcDoc.dlrCd);           //딜러코드
                               viewModel.set("bpCd", result.invcDoc.bpCd);             //공급업체코드
                               viewModel.set("bpNm", result.invcDoc.bpNm);             //공급업체명
                               viewModel.set("bpTp", result.invcDoc.bpTp);             //공급상구분
                               viewModel.set("invcGrDt", result.invcDoc.invcGrDt);     //입고일자
                               viewModel.set("regUsrNm", result.invcDoc.regUsrNm);     //입고확인자명
                               viewModel.set("grDocNo", result.invcDoc.grDocNo);       //입고문서번호
                               viewModel.set("grTp", "02");                            //입고유형
                               viewModel.set("grTotQty", result.invcDoc.grTotQty);     //입고수량
                               viewModel.set("grTotAmt", result.invcDoc.grTotAmt);     //입고금액
                               viewModel.set("dcRate", result.invcDoc.dcRate);         //세율
                               viewModel.set("statCd", result.invcDoc.invcStatCd);     //상태코드
                               viewModel.set("updtDtStr", result.invcDoc.updtDtStr);     //수정일시

                               grid.dataSource.data(result.invcDocItems);
                           });

                           dms.notification.success("<spring:message code='sal.info.savedWrhsDoc' />"); //입고문서가 저장 되었습니다.
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
               });
            }
        }
    });

    //버튼 - 입고확정
    $("#btnCnfm").kendoButton({
        enable:false
        ,click:function(e){
            grid = $("#grid").data("kendoExtGrid");

            //변경여부 체크
            if(grid.isModified()){
                //변경사항이 있습니다. 변경사항 저장후 확정하여 주십시오.
                dms.notification.warning("<spring:message code='sal.info.cnfmModifyChkMsg' />");  //변경사항이 있습니다. 변경사항 저장후 확정하여 주십시오.
                return;
            }

            //거래처 체크
            if(dms.string.isEmpty(viewModel.bpCd)){
                //거래처를 입력해주세요
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                return;
            }

            //부품목록 체크
            if(grid.items().length  == 0){
                //선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return;
            }

            //입력값 체크
            var validCheckFlag = true;

            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dms.string.isEmpty(dataItem.itemCd)){
                    // 부품을 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCdMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCdMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }else if(dms.string.isEmpty(dataItem.invcQty) || dataItem.invcQty == 0){
                    // 수량을 입력하십시오.
                    dms.notification.warning("<spring:message code='par.lbl.invcQty' var='invcQtyMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${invcQtyMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }else if(dms.string.isEmpty(dataItem.invcPrc) || dataItem.invcPrc == 0){
                    //단가를 입력하십시오.
                    dms.notification.warning("<spring:message code='par.lbl.prc' var='prcMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${prcMsg}'/>");
                    validCheckFlag = false;
                    return false;
                }else if(dms.string.isEmpty(dataItem.grStrgeCd)){
                    //입고창고를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                    validCheckFlag = false;
                    return false;
                }
            });

            if(validCheckFlag){

                $.ajax({
                    url:"<c:url value='/sal/acc/itemInput/updateAccessoryItemInputToConfirm.do' />"
                    ,data:kendo.stringify({
                        invcVO:{
                            bpCd:viewModel.bpCd
                            ,grDocNo:viewModel.grDocNo
                            ,updtDtStr:viewModel.updtDtStr
                        }
                        ,invcItemList:grid.dataSource.data()
                    })
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                      //저장된 데이터를 반영한다.
                        $.ajax({
                            url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDoc.do' />"
                            ,data:JSON.stringify({sEtcGrDocNo:viewModel.grDocNo})
                            ,type:"POST"
                            ,dataType:"json"
                            ,contentType:"application/json"
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                        }).done(function(result) {

                            //공급업체코드,공급업체명,업체유형,입고일자,입고확인자ID,입고확인자명,세율설정
                            viewModel.set("grDocNo", result.invcDoc.grDocNo);       //입고문서번호
                            //viewModel.set("statCd",  result.invcDoc.invcStatCd);     //상태코드
                            viewModel.set("statCd", "02");               //상태코드(확정)
                            viewModel.set("updtDtStr", result.invcDoc.updtDtStr);     //수정일시

                            //버튼제어 DECODE(B.STAT_CD,'01','00','02','03','03','04','')
                            setButtonEnable("02");

                            grid.dataSource.data(result.invcDocItems);
                            dms.notification.success("<spring:message code='sal.info.cnfmWrhsDoc' />");   //입고문서가 확정 되었습니다.
                        });
                        /*viewModel.set("grDocNo",   result.grDocNo);    //입고문서번호
                        viewModel.set("updtDtStr", result.updtDtStr);    //수정일자
                        viewModel.set("statCd", "02");               //상태코드(확정)
                        */
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
            }
        }
    });

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        enable:false
        ,click:function(e){
            grid = $("#grid").data("kendoExtGrid");

            console.log('viewModel:',viewModel);
            $.ajax({
                url:"<c:url value='/sal/acc/itemInput/updateAccessoryItemInputToCancel.do' />"
                ,data:kendo.stringify({
                    invcVO:{
                        bpCd:viewModel.bpCd
                        ,invcDocNo:viewModel.grDocNo
                        ,grDocNo:viewModel.grDocNo
                        ,updtDtStr:viewModel.updtDtStr
                    }
                    ,invcItemList:grid.dataSource.data()
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {
                    dms.notification.success("<spring:message code='sal.info.cancelWrhsDoc' />"); //입고문서가 취소 되었습니다.

                    //버튼제어 DECODE(B.STAT_CD,'01','00','02','03','03','04','')
                    setButtonEnable("04");

                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            });
        }
    });

    //버튼 - 입고문서출력
    $("#btnPrint").kendoButton({
        enable:false
        ,click:function(e){
            parent._createOrReloadTabMenu("<spring:message code='par.lbl.grPrintDoc'/>", "<c:url value='/ReportServer?reportlet=sale/selectSalesInvcPrintMain.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+$("#grDocNo").val());
        }
    });

    //버튼 - 문건도입
    $("#btnExcelUpload").kendoButton({
        enable:false
        ,click:function(e){
            uploadPopupWin = dms.window.popup({
                title:"<spring:message code='sal.lbl.excellUpload' />"
                ,windowId:"accessoryItemInputUploadPopupWin"
                ,height:380
                ,content:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputUploadPopup.do'/>"
                    ,data:{
                        "bpTp":$("#bpTp").val()
                        ,"callbackFunc":function(data){
                            var grid = $("#grid").data("kendoExtGrid");
                            var isExistItemCd = false;

                            //선택된 품목을 그리드에 추가한다.
                            $.each(data, function(idx, item){

                                //품목 중복 체크
                                isExistItemCd = grid.exists(function(dataItem){
                                    if(dataItem.itemCd == item.itemCd){
                                        return true;
                                    }
                                    return false;
                                });

                                if(isExistItemCd){
                                    dms.notification.warning(item.itemCd + "["+ item.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts' />");   //은 이미 등록되어 있는 부품입니다.
                                    return;
                                }else{
                                    grid.dataSource.add({
                                         dlrCd:data[idx].dlrCd                            //딜러코드
                                        ,itemCd:data[idx].itemCd                          //용품코드
                                        ,itemNm:data[idx].itemNm                          //용품명
                                        ,invcUnitCd:data[idx].invcUnitCd                  //단위
                                        ,invcQty:data[idx].invcQty                        //입고수량
                                        ,grStrgeCd:data[idx].grStrgeCd                    //입고창고
                                        ,invcPrc:data[idx].invcPrc                        //입고단가(세금)
                                        ,taxDdctPrc:data[idx].taxDdctPrc                  //입고단가(불세금)
                                        ,invcTotAmt:data[idx].invcPrc * data[idx].invcQty   //입고금액(세금)
                                        ,invcAmt:data[idx].taxDdctPrc * data[idx].invcQty   //입고금액(불세금)
                                        ,taxAmt:(data[idx].invcPrc -(data[idx].invcPrc/(1 + data[idx].dcRate))) * data[idx].invcQty  //세금액 invcPrc-(invcPrc/(1+viewModel.dcRate))
                                        ,dcRate:data[idx].dcRate                          //세율
//                                         ,grStatCd:""                                    //입고상태코드
                                    });
                                }
                            });

                            if(!isExistItemCd){
                                uploadPopupWin.close();
                                $("#btnSave").click();
                            }

                        }
                    }
                }
            });
        }
     });

    //버튼 - 부품추가
    $("#btnAddItem").kendoButton({
        enable:false
        ,click:function(e){
            if(dms.string.isEmpty(viewModel.bpCd)){
                dms.notification.warning("<spring:message code='sal.info.selectSupplyBp' />");   //공급업체를 선택하여 주십시오.
                return;
            }

            dms.window.popup({
                windowId:"accessoryItemInputSearchPopup"
                ,title:"<spring:message code='sal.title.goodsSearch' />"   //용품조회
                ,content:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputSearchPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"bpCd":viewModel.bpCd
                        ,"bpNm":viewModel.bpNm
                        ,"bpTp":viewModel.bpNm
                        ,"sBmpYn":"N"
                        ,"itemDstinCd":"20" //품목구분(판매용품)
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(data){
                            var grid = $("#grid").data("kendoExtGrid");
                            var isExistItemCd = false;

                            //선택된 품목을 그리드에 추가한다.
                            $.each(data, function(idx, item){

                                //품목 중복 체크
                                isExistItemCd = grid.exists(function(dataItem){
                                    if(dataItem.itemCd == item.itemCd){
                                        return true;
                                    }
                                    return false;
                                });

                                if(isExistItemCd){
                                    dms.notification.warning(item.itemCd + "["+ item.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts' />");   //은 이미 등록되어 있는 부품입니다.
                                }else{
                                    //입고단가 산정
                                    //1. 최근입고가
                                    //2. 매입기준가
                                    var invcPrc = 0;
                                    if(item.lastGrAmt !== 0){
                                        invcPrc = item.lastGrAmt;
                                    }else{
                                        invcPrc = item.salePrcAmt;
                                    }

                                    grid.dataSource.add({
                                         dlrCd:item.dlrCd                               //딜러코드
                                        ,itemCd:item.itemCd                             //용품코드
                                        ,itemNm:item.itemNm                             //용품명
                                        ,invcUnitCd:item.stockUnitCd                    //단위
                                        ,invcQty:1                                      //입고수량
                                        ,grStrgeCd:item.grStrgeCd                       //입고창고
                                        ,invcPrc:invcPrc                                //입고단가(세금)
                                        ,taxDdctPrc:invcPrc/(1+viewModel.dcRate)        //입고단가(불세금)
                                        ,invcTotAmt:invcPrc                             //입고금액(세금)
                                        ,invcAmt:invcPrc/(1+viewModel.dcRate)           //입고금액(불세금)
                                        ,taxAmt:invcPrc-(invcPrc/(1+viewModel.dcRate))  //세금액
                                        ,dcRate:viewModel.dcRate                        //세율
//                                         ,grStatCd:""                                    //입고상태코드
                                    });
                                }
                            });

                            //팝업 닫기
                            $("#accessoryItemInputSearchPopup").data("kendoWindow").close();
                        }
                    }
                }
            });
        }
    });

    //버튼 - 부품삭제
    $("#btnDelItem").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //입력폼 - 공급업체조회

    $("#btnSearchVenderMaster").bind("click", function(){
        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code='sal.title.venderInfo'/>" //업체조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":viewModel.bpCd  //업체코드
                    ,"bpNm":viewModel.bpNm  //업체명
                    ,"bpTp":viewModel.bpTp  //기타
                    ,"callbackFunc":function(data){
                        viewModel.set("bpCd", data[0].bpCd);
                        viewModel.set("bpNm", data[0].bpNm);
                        viewModel.set("bpTp", data[0].bpTp);

                        $("#grid").data("kendoExtGrid").dataSource.data([]);

                        //버튼제어 DECODE(B.STAT_CD,'01','00','02','03','03','04','')
                        setButtonEnable("01");

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    });

    //입력폼 - 입고문서조회
    $("#btnSearchGrDocNo").bind("click", function(){
        dms.window.popup({
            windowId:"inputDocSearchPopupWin"
            ,title:"<spring:message code='par.title.selectGrDoc'/>" //입고문서조회
            ,content:{
                url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDocSearchPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":viewModel.bpCd              //업체코드
                    ,"bpNm":viewModel.bpNm              //업체명
                    ,"bpTp":viewModel.bpTp              //기타
                    ,"etcGrDocTp":viewModel.grDocTp     //입고문서 업무구분
                    ,"selectable":"single"
                    ,"callbackFunc":function(data){
                        viewModel.set("grDocNo", data[0].invcDocNo);

                        $.ajax({
                            url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDoc.do' />"
                            ,data:JSON.stringify({sEtcGrDocNo:viewModel.grDocNo})
                            ,type:"POST"
                            ,dataType:"json"
                            ,contentType:"application/json"
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                        }).done(function(result) {

                            if( result.invcDoc != null ){
                                //공급업체코드,공급업체명,업체유형,입고일자,입고확인자ID,입고확인자명,세율설정
                                viewModel.set("dlrCd", result.invcDoc.dlrCd);           //딜러코드
                                viewModel.set("bpCd", result.invcDoc.bpCd);             //공급업체코드
                                viewModel.set("bpNm", result.invcDoc.bpNm);             //공급업체명
                                viewModel.set("bpTp", result.invcDoc.bpTp);             //공급상구분
                                viewModel.set("invcGrDt", result.invcDoc.invcGrDt);     //입고일자
                                viewModel.set("regUsrNm", result.invcDoc.regUsrNm);     //입고확인자명
                                viewModel.set("grDocNo", result.invcDoc.grDocNo);       //입고문서번호
                                viewModel.set("grTp", "02");                            //입고유형
                                viewModel.set("grTotQty", result.invcDoc.grTotQty);     //입고수량
                                viewModel.set("grTotAmt", result.invcDoc.grTotAmt);     //입고금액
                                viewModel.set("dcRate", result.invcDoc.dcRate);         //세율
                                viewModel.set("statCd", result.invcDoc.invcStatCd);     //상태코드
                                viewModel.set("updtDtStr", result.invcDoc.updtDtStr);     //수정일시

                                //입고문서 상태코드에 따른 버튼 제어 DECODE(B.STAT_CD,'01','00','02','03','03','04','')
                                setButtonEnable(result.invcDoc.invcStatCd);

                                $("#grid").data("kendoExtGrid").dataSource.data(result.invcDocItems);
                            }
                        });

                        $("#inputDocSearchPopupWin").data("kendoWindow").close();
                    }
                }
            }
        });
    });

    //입력폼 - 업체유형
    $("#bpTp").kendoExtDropDownList({
         dataSource:bpTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
        ,enable:false
    });

    //입력폼 - 입고일자
    $("#invcGrDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
    }).data("kendoExtMaskedDatePicker").enable(false);

    //입력폼 - 입고수량
    $("#grTotQty").kendoExtNumericTextBox({
         decimals:0
        ,format:"n0"
        ,min:0
        ,spinners:false
    }).data("kendoExtNumericTextBox").enable(false);

    //입력폼 - 입고금액
    $("#grTotAmt").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    }).data("kendoExtNumericTextBox").enable(false);

    //입력폼 - 세율
    $("#dcRate").kendoExtNumericTextBox({
         format:"n2"
        ,min:0
        ,spinners:false
    }).data("kendoExtNumericTextBox").enable(false);

    refreshGrid = function(e){

        console.log("refreshGrid start");
        var grid = $("#grid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());
        dataItem.set("dirty",false);
        grid.refresh();
    }

    setButtonEnable = function(statCd){

//DECODE(B.STAT_CD,'01','00','02','03','03','04','')
        if(statCd == "01"){ //입고대기(01)

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);

        }else if(statCd == "00" ){ //등록(00)

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);

        }else if(statCd == "02" || statCd == "03" ){ //확정(02) 입고완료(03)

            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

        }else if(statCd == "04"){ //취소
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
        }
    }

    //용품입고 품목그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0202-194301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/invc/selectReceiveItemByCondition.do' />"
                }
                ,parameterMap:function(options, operation){
                    if(operation === "read"){
                        var params = {};
                        params["sBpCd"] = $("#bpCd").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"invcDocNo"
                    ,fields:{
                        dlrCd:{type:"string", validation:{required:true}}   //딜러코드
                        ,itemCd:{type:"string", editable:false}             //용품코드
                        ,itemNm:{type:"string", editable:false}             //용품명
                        ,invcUnitCd:{type:"string", editable:false}         //단위
                        ,grStrgeCd:{type:"string"}                          //입고창고
                        ,invcQty:{type:"number"}                            //입고수량
                        ,invcPrc:{type:"number"}                            //입고단가
                        ,taxDdctPrc:{type:"number"}                         //입고단가(세금미포함)
                        ,invcTotAmt:{type:"number"}                         //입고금액
                        ,invcAmt:{type:"number"}                            //입고금액(세금미포함)
                        ,taxAmt:{type:"number"}                             //세금액
                        ,dcRate:{type:"number"}                             //세율
                        , mvtDocYyMm:{ type:"string"}
                        , mvtDocNo:{ type:"string"}
                        , mvtDocLineNo:{ type:"number"}
//                         ,grStatCd:{type:"string"}                           //입고상태코드
                    }
                }
            }
            ,aggregate:[
                 {field:"invcPrc", aggregate:"sum"}
                ,{field:"taxDdctPrc", aggregate:"sum"}
                ,{field:"invcTotAmt", aggregate:"sum"}
                ,{field:"invcAmt", aggregate:"sum"}
            ]
        }
        ,scrollable:true
        ,sortable:false
        ,pageable:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:true
        ,change:function(e){

        }
        ,edit:function(e){
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            //taxDdctPrc:입고단가(세금미포함)
            //invcTotAmt:입고금액
            //invcAmt:입고금액(세금미포함)
            if(fieldName == "taxDdctPrc" || fieldName == "invcTotAmt" || fieldName == "invcAmt"){
                this.closeCell();
            }
        }
        ,dataBound:function(e) {
            var grTotQty = 0;   //입고문서 입고수량
            var grTotAmt = 0;   //입고문서 입고금액

            $.each(e.sender.dataSource.data(), function(idx, dataItem){
                grTotQty += dataItem.invcQty;
                grTotAmt += dataItem.invcTotAmt;
            });

            viewModel.set("grTotQty", grTotQty);
            viewModel.set("grTotAmt", grTotAmt);
        }
        ,columns:[
            {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd'/>", width:120}   //용품코드
            ,{field:"itemNm", title:"<spring:message code='sal.lbl.goodsName'/>", width:250}  //용품명칭
            ,{field:"invcUnitCd", title:"<spring:message code='sal.lbl.unit'/>", width:60} //단위
            ,{field:"grStrgeCd", title:"<spring:message code='sal.lbl.grStrgeCd'/>", width:120    //입고창고
                ,editor:function(container, options) {
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"strgeNm"
                        ,dataValueField:"strgeCd"
                        ,dataSource:storageList
                        ,valuePrimitive:true
                    });
                }
                ,template:"# if(storageMap[grStrgeCd] != null) { # #= storageMap[grStrgeCd].strgeNm# # }#"
           }
           ,{field:"invcQty", title:"<spring:message code='sal.lbl.itemQty'/>", width:80, format:"{0:n0}", decimal:0
               ,attributes:{"class":"ar"}   //입고수량
               ,editor:function(container, options){
                   $('<input name="invcQty" data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtNumericTextBox({
                        decimals:0
                       ,format:"n0"
                       ,min:0
                       ,spinners:false
                       ,change:function(e){
                           var grid = $("#grid").data("kendoExtGrid");
                           var rowData = grid.dataItem(grid.select());
                           var invcQty = this.value();

                           //입고수량  변경시 적용 절차
                           //1.입고금액(세금) 변경
                           //2.입고금액(불세금) 변경
                           //3.세금액 변경
                           //4.입고문서의 입고수량/입고금액 변경
                           //5.그리드 Aggregate 적용
                           rowData.set("invcTotAmt", invcQty * options.model.invcPrc);            //1.입고금액(세금)
                           rowData.set("invcAmt", options.model.invcTotAmt/(1+viewModel.dcRate)); //2.입고금액(불세금)
                           rowData.set("taxAmt", options.model.invcTotAmt-options.model.invcAmt); //3.세금액

                           grid.refresh();
                       }
                   });
               }
               /* ,editor:function(container, options) {
                   var input = $('<input data-bind="value:' + options.field + '"  />');
                   input.focus(function(){
                       this.select();
                   })

                   //입고수량  변경시 적용 절차
                   //1.입고금액(세금) 변경
                   //2.입고금액(불세금) 변경
                   //3.세금액 변경
                   //4.입고문서의 입고수량/입고금액 변경
                   //5.그리드 Aggregate 적용
                   input.keyup(function(){
                       var invcQty = $(this).val();

                       options.model.set("dirty",true);
                       options.model.set("invcTotAmt", invcQty * options.model.invcPrc);            //1.입고금액(세금)
                       options.model.set("invcAmt", options.model.invcTotAmt/(1+viewModel.dcRate)); //2.입고금액(불세금)
                       options.model.set("taxAmt", options.model.invcTotAmt-options.model.invcAmt); //3.세금액
                       options.model.set("dirty",false);
                   });

                   //4.입고문서의 입고수량/입고금액 변경
                   //5.그리드 Aggregate 적용
                   input.blur(function(e){
                    //    $("#grid").data("kendoExtGrid").refresh();
                     //  options.model.set("dirty",false);
                     //  options.model.set("dirty",true);
                    // options.model.set("dirty",true);
                     console.log("input.blur");
                     refreshGrid();
                   });

                   input.appendTo(container);
                   input.kendoExtNumericTextBox({
                        decimals:0
                       ,format:"n0"
                       ,min:0
                       ,spinners:false
                   });
               } */
           }
           ,{field:"invcPrc", title:"<spring:message code='sal.lbl.invcPrc'/>"  // 입고단가(세금) -> 입고단가(세금포함)
               ,width:120
               ,editor:function(container, options){
                   $('<input name="invcPrc" data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtNumericTextBox({
                        decimals:2
                       ,format:"n2"
                       ,min:0
                       ,spinners:false
                       ,change:function(e){
                           var grid = $("#grid").data("kendoExtGrid");
                           var rowData = grid.dataItem(grid.select());
                           var invcPrc = this.value();

                           //입고단가  변경시 적용 절차
                           //1.입고단가(불세금) 변경
                           //2.입고금액(세금) 변경
                           //3.입고금액(불세금) 변경
                           //4.세금액 변경
                           //5.입고문서의 입고수량/입고금액 변경
                           //6.그리드 Aggregate 적용

                           rowData.set("taxDdctPrc", invcPrc/(1+viewModel.dcRate));               //1.입고단가(불세금)
                           rowData.set("invcTotAmt", options.model.invcQty * invcPrc);            //2.입고금액(세금)
                           rowData.set("invcAmt", options.model.invcTotAmt/(1+viewModel.dcRate)); //3.입고금액(불세금)
                           rowData.set("taxAmt", options.model.invcTotAmt-options.model.invcAmt); //4.세금액

                           grid.refresh();
                       }
                   });
               }
               /* ,editor:function(container, options) {
                   var input = $('<input data-bind="value:' + options.field + '"  />');
                   input.focus(function(){
                       this.select();
                   })
                   //입고단가  변경시 적용 절차
                   //1.입고단가(불세금) 변경
                   //2.입고금액(세금) 변경
                   //3.입고금액(불세금) 변경
                   //4.세금액 변경
                   //5.입고문서의 입고수량/입고금액 변경
                   //6.그리드 Aggregate 적용
                   input.keyup(function(){
                       var invcPrc = $(this).val();

                       options.model.set("taxDdctPrc", invcPrc/(1+viewModel.dcRate));               //1.입고단가(불세금)
                       options.model.set("invcTotAmt", options.model.invcQty * invcPrc);            //2.입고금액(세금)
                       options.model.set("invcAmt", options.model.invcTotAmt/(1+viewModel.dcRate)); //3.입고금액(불세금)
                       options.model.set("taxAmt", options.model.invcTotAmt-options.model.invcAmt); //4.세금액
                   });

                   //5.입고문서의 입고수량/입고금액 변경
                   //6.그리드 Aggregate 적용
                   input.blur(function(e){
                     //  $("#grid").data("kendoExtGrid").refresh();
                      // options.model.set("dirty",false);
                     //  options.model.set("dirty",true);
                       refreshGrid();
                   });

                   input.appendTo(container);
                   input.kendoExtNumericTextBox({
                        format:"n0"
                       ,min:0
                       ,spinners:false
                   });

               } */
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,aggregates:["sum"]
               ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
           }
           ,{field:"taxDdctPrc", title:"<spring:message code='sal.lbl.taxDdctPrc'/>"  //입고단가(불세금) -> 입고단가(세금제외)
               , width:120
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,aggregates:["sum"]
               ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
           }
           ,{field:"invcTotAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt'/>", width:120    //입고금액(세금) -> 입고금액(세금포함)
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,aggregates:["sum"]
               ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
           }
           ,{field:"invcAmt", title:"<spring:message code='sal.lbl.grTotAmt'/>", width:120  //입고금액(불세금) -> 입고금액(세금제외)
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,aggregates:["sum"]
               ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
           }
           ,{field:"mvtDocYyMm" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true}//수불년월
           ,{field:"mvtDocNo" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true}//수불번호
           ,{field:"mvtDocLineNo" ,title:"" ,width:120 ,attributes:{ "class":"ar"} ,hidden:true}//수불라인번호
        ]
    });
});
</script>
