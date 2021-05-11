<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 포인트교환 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.title.pointChange" /><!-- 포인트교환 --></h1>
            <div class="btn_left">
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13108" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPointChangeGoods" name="btnPointChangeGoods" class="btn_m btn_m_min" ><spring:message code="crm.btn.membershipPointChangeGoods" /><!-- 교환 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_100per">
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
                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 / 客户名 --></th>
                        <td>
                             <div class="form_search">
                                <input type="hidden" id="custNo" name="custNo" />
                                <input type="hidden" id="custTp" name="custTp" />
                                <input type="hidden" id="cardNo" name="cardNo" />

                            <c:if test="${membershipStan eq 'V'}">
                                <input type="hidden" id="carlineCd" name="carlineCd" />
                                <input type="hidden" id="modelCd" name="modelCd" />
                                <input type="hidden" id="ocnCd" name="ocnCd" />
                                <input type="hidden" id="extColorCd" name="extColorCd" />
                                <input type="hidden" id="intColorCd" name="intColorCd" />
                                <input type="hidden" id="vinNo" name="vinNo" />
                                <input type="hidden" id="carRegNo" name="carRegNo" />
                            </c:if>

                                <input type="text" id="custNm" name="custNm" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" />
                                <a href="javascript:;" onclick="javascript:custSearchPopupWindow();" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.membershipNo'/><!-- 멤버십번호 / 会员编号 --></th>
                        <td>
                            <input id="membershipNo" name="membershipNo" class="form_comboBox form_readonly" readonly="readonly" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 이동전화 / 移动电话 --></th>
                        <td>
                            <input id="hpNo" name="hpNo" class="form_input numberic form_readonly" readonly="readonly" maxlength="14" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.gradeCd'/><!-- 등급 / 等级 --></th>
                        <td>
                            <input id="custGradeCd" name="custGradeCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.usePoint'/><!-- 가용포인트 / 可用积分 --></th>
                        <td>
                            <input id="lastPointVal" name="lastPointVal" class="form_numeric ar form_readonly" readonly="readonly" pattern="\d" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.savePointVal'/><!-- 누적사용포인트 / 累计使用积分 --></th>
                        <td>
                            <input id="savePointVal" name="savePointVal" class="form_numeric ar form_readonly" readonly="readonly" pattern="\d" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.pointExtcExpcVal'/><!-- 예상소멸포인트 / 预计失效积分 --></th>
                        <td>
                            <input id="pointExtcExpcVal" name="pointExtcExpcVal" class="form_numeric ar form_readonly" readonly="readonly" pattern="\d" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.pointExtcExpcDt'/><!-- 예상소멸일 / 预计失效日期--></th>
                        <td>
                            <input id="pointExtcExpcDt" name="pointExtcExpcDt" class="form_datepicker form_readonly" readonly="readonly" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13107" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnItemAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /><!-- 추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13106" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnItemDel" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
            </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->
        <div class="table_grid">
            <div id="gridDetail" class="resizable_grid"></div>
        </div>

    </section>
</div>

<!-- script -->
<script>

    //용품창고 목록
    var storageList = [];
    <c:forEach var="obj" items="${storageList}">
        storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
    </c:forEach>
    //용품창고 Map
    var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

    //용품유형 목록
    var etcCd1List = [];
    <c:forEach var="obj" items="${etcCd1List}">
        etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //용품유형 Map
    var etcCd1Map = dms.data.arrayToMap(etcCd1List, function(obj){ return obj.cmmCd; });

    //멤버십 등급
    var gradeCodeSeqList = [{"gradeSeq":"", "gradeNm":""}];
    <c:forEach var="obj" items="${gradeCodeList}">
        gradeCodeSeqList.push({"gradeSeq":"${obj.gradeSeq}", "gradeNm":"${obj.gradeNm}"});
    </c:forEach>

    // 초기화
    function initForm(){

        $("#custNo").val("");
        $("#custTp").val("");
        $("#cardNo").val("");
        $("#custNm").val("");
        $("#membershipNo").data("kendoExtDropDownList").value("");
        $("#hpNo").val("");

        $("#custGradeCd").data("kendoExtDropDownList").value("");
        $("#lastPointVal").data("kendoExtNumericTextBox").value("");
        $("#savePointVal").data("kendoExtNumericTextBox").value("");
        $("#pointExtcExpcVal").data("kendoExtNumericTextBox").value("");
        $("#pointExtcExpcDt").data("kendoExtMaskedDatePicker").value("");
        $("#gridDetail").data("kendoExtGrid").dataSource.data([])

    <c:if test="${membershipStan eq 'V'}">
        $("#carlineCd").val("");
        $("#modelCd").val("");
        $("#ocnCd").val("");
        $("#extColorCd").val("");
        $("#intColorCd").val("");
        $("#vinNo").val("");
        $("#carRegNo").val("");
    </c:if>

    };

    function custSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , width:900
            , height:505
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "custNm":$("#custNm").val()
                    , "custCd":null         // null:all, 01:잠재, 02:보유
                    , "dlrMbrYn":"Y"
                    , "dlrMbrEnableYn":false
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#custNo").val(data[0].custNo);
                            $("#custTp").val(data[0].custTp);
                            $("#custNm").val(data[0].custNm);
                            $("#hpNo").val(data[0].hpNo);

                        <c:if test="${membershipStan eq 'V'}">
                            $("#carlineCd").val(data[0].carlineCd);
                            $("#modelCd").val(data[0].modelCd);
                            $("#ocnCd").val(data[0].ocnCd);
                            $("#extColorCd").val(data[0].extColorCd);
                            $("#intColorCd").val(data[0].intColorCd);
                            $("#vinNo").val(data[0].vinNo);
                            $("#carRegNo").val(data[0].carRegNo);
                        </c:if>

                            $.ajax({
                                url:"<c:url value='/crm/dmm/membership/selectMembershipJoinByKey.do' />"
                                ,data:JSON.stringify({"sCustNo":data[0].custNo})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,beforeSend:function(xhr) {
                                    dms.loading.show();
                                }
                                ,complete:function(xhr, status) {
                                    dms.loading.hide();
                                }
                            }).done(function(result) {

                                var membershipNoDS = [];
                                var membershipNoDDL = $("#membershipNo").data("kendoExtDropDownList");

                                if ( result.membershipInfoListCnt === 1 ) {

                                    membershipNoDS.push({"membershipNo":result.membershipNo})
                                    membershipNoDDL.setDataSource(membershipNoDS);
                                    membershipInfoSet(result);
                                    membershipNoDDL.enable(false);

                                } else if ( result.membershipInfoListCnt > 1 ) {

                                    $.each(result.membershipInfoList, function(idx, data){
                                        membershipNoDS.push({
                                            "membershipNo":data.membershipNo
                                            ,"gradeCd":data.gradeCd
                                            ,"lastPointVal":data.lastPointVal
                                            ,"totMinusPointVal":data.totMinusPointVal
                                            ,"pointExtcExpcVal":data.pointExtcExpcVal
                                            ,"pointExtcExpcDt":data.pointExtcExpcDt
                                        })
                                    });

                                    membershipNoDDL.setDataSource(membershipNoDS);
                                    membershipNoDDL.enable(true);
                                    membershipNoDDL.select(0);
                                    membershipNoDDL.trigger("change");

                                } else {
                                    //{멤버십 정보 }정보가 없습니다.
                                    dms.notification.warning("<spring:message code='global.title.membershipInfo' var='arguMsg' /><spring:message code='crm.info.noinfoData' arguments='${arguMsg}'/>");
                                    return;
                                };

                            });

                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });

    };


    function membershipInfoSet(data){
        $("#membershipNo").data("kendoExtDropDownList").value(data.membershipNo);
        $("#cardNo").val(data.cardNo);
        $("#custGradeCd").data("kendoExtDropDownList").value(data.gradeCd);//고객등급코드
        $("#lastPointVal").data("kendoExtNumericTextBox").value(data.lastPointVal);//가용포인트
        $("#savePointVal").data("kendoExtNumericTextBox").value(data.totMinusPointVal);//누적사용포인트
        $("#pointExtcExpcVal").data("kendoExtNumericTextBox").value(data.pointExtcExpcVal);//예상소멸포인트
        $("#pointExtcExpcDt").data("kendoExtMaskedDatePicker").value(data.pointExtcExpcDt);//포인트소멸예정일
    };

    $(document).ready(function() {

        //멤버십 등급
        $("#membershipNo").kendoExtDropDownList({
             dataValueField:"membershipNo"
            ,dataTextField:"membershipNo"
            ,enable:false
            , change:function(){
                var result = this.dataItem(this.select());
                // 멤버십 정보 set
                membershipInfoSet(result);
            }
        });

        //멤버십 등급
        $("#custGradeCd").kendoExtDropDownList({
            dataSource:gradeCodeSeqList
            ,dataValueField:"gradeSeq"
            ,dataTextField:"gradeNm"
            ,enable:false
        });

        //가용포인트
        $("#lastPointVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false
        });

        //누적사용포인트
        $("#savePointVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false
        });

        //예상소멸포인트
        $("#pointExtcExpcVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false
        });

        //포인트소멸예정일
        $("#pointExtcExpcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //버튼 - 교환
        $("#btnPointChangeGoods").kendoButton({
            click:function(e) {

                if ( dms.string.isEmpty($("#custNm").val()) ) {
                    //{고객명}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                    return;
                };

                if ( dms.string.isEmpty($("#custNo").val()) ) {
                    //{고객번호}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='global.lbl.custNo' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                    return;
                };

                if ( dms.string.isEmpty($("#custTp").val()) ) {
                    //{고객유형}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='global.lbl.custTp' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                    return;
                };

                if ( dms.string.isEmpty($("#membershipNo").val()) ) {
                    //{멤버십 번호}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='global.lbl.membershipNo' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                    return;
                };

                if ( dms.string.isEmpty($("#cardNo").val()) ) {
                    //{카드번호}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.cardNo' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                    return;
                };

                var accessoryItemSalesSaveData = {};

                var grid = $("#gridDetail").data("kendoExtGrid");
                var changedData = grid.getCUDData("insertList", "updateList", "deleteList");
                accessoryItemSalesSaveData["insertList"] = changedData.insertList;
                accessoryItemSalesSaveData["updateList"] = changedData.updateList;
                accessoryItemSalesSaveData["deleteList"] = changedData.deleteList;

                var accessoryItemSalesVO = {};

                // 용품 판매 단가 구하기.
                var grid = $("#gridDetail").data("kendoExtGrid");
                var data = grid._data;
                var goodsRealAmt = 0;
                var pointVal = 0;
                var dataCnt = 0;
                var goodsTotalCnt = 0;

                if ( dms.string.isEmpty(data) ) {
                    //용품을(를) 선택하여 주십시오
                    dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                    return;
                } else {
                    dataCnt = data.length;
                };

                $.each(data, function(idx, item){
                    goodsRealAmt += item.movingAvgPrc;      // goodsRealAmt : 용품 구입(교환) 토탈 금액 / movingAvgPrc : 재고원가
                    goodsTotalCnt += item.goodsCnt;         // goodsTotalCnt : 용품 아이템 전체 수량
                    pointVal += item.avlbPoint;             // pointVal : 필요포인트
                });

                // 가용수량 - 서비스
                // 사용포인트 - 필요포인트 체크

                if ( $("#lastPointVal").data("kendoExtNumericTextBox").value() < pointVal ) {
                    // {가용포인트}가 {필요포인트}보다 작습니다.
                    dms.notification.warning("<spring:message code='crm.lbl.usePoint' var='arg1' /><spring:message code='crm.lbl.reqPoint' var='arg2' /><spring:message code='ser.info.distValNotHigher' arguments='${arg1}, ${arg2}' />");
                    return;
                };

                accessoryItemSalesVO["goodsTp"] = "05";         // 용품업무구분 - 01:정비 / 02:직접 / 03:완성차 / 04:완성차 / 05:포인트교환
                accessoryItemSalesVO["carBrandCd"] = "O";       // 브랜드 - N:현대 / O:기타
                accessoryItemSalesVO["goodsRealAmt"] = 0;       // 토탈금액 ( 포인트를 사용하기 때문에 금액은 0 )
                accessoryItemSalesVO["addPrenAmt"] = 0;         //추가증정금액 ( service에서 필수 )
                accessoryItemSalesVO["pointAmt"] = 0;           // 이번사용금액
                accessoryItemSalesVO["pointVal"] = pointVal;    // 사용포인트
                accessoryItemSalesVO["goodsTotCnt"] = dataCnt;  // 그리드 수량

                // 고객정보
                accessoryItemSalesVO["contractCustNm"] = $("#custNm").val();
                accessoryItemSalesVO["contractCustNo"] = $("#custNo").val();
                accessoryItemSalesVO["contractCustTp"] = $("#custTp").val();
                accessoryItemSalesVO["telNo"] = $("#hpNo").val();
                accessoryItemSalesVO["membershipNo"] = $("#membershipNo").data("kendoExtDropDownList").value();
                accessoryItemSalesVO["cardNo"] = $("#cardNo").val();

            // 멤버십 기준이 차량일때 - 차량정보
            <c:if test="${membershipStan eq 'V'}">
                accessoryItemSalesVO["carlineCd"] = $("#carlineCd").val();
                accessoryItemSalesVO["modelCd"] = $("#modelCd").val();
                accessoryItemSalesVO["ocnCd"] = $("#ocnCd").val();
                accessoryItemSalesVO["extColorCd"] = $("#extColorCd").val();
                accessoryItemSalesVO["intColorCd"] = $("#intColorCd").val();
                accessoryItemSalesVO["vinNo"] = $("#vinNo").val();
                accessoryItemSalesVO["carRegNo"] = $("#carRegNo").val();
            </c:if>

                accessoryItemSalesSaveData["accessoryItemSalesVO"] = accessoryItemSalesVO;

                pointVal = kendo.toString(pointVal,'n0');

                // 교환수량 : {0}개, 필요포인트 : {1}
                // 교환하시겠습니까?
                dms.window.confirm({
                    message:"<spring:message code='crm.info.membershipPointChangeGoods1' arguments='"+goodsTotalCnt+","+pointVal+"' /><br><spring:message code='crm.info.membershipPointChangeGoods2'/>"
                    ,callback:function(result){

                        if(result){

                            //용품판매문서 저장 및 수납데이터 생성/변경
                            $.ajax({
                                url:"<c:url value='/crm/dmm/membershipPointExchange/updateMembershipPointGoodsExchange.do' />"
                                ,data:JSON.stringify(accessoryItemSalesSaveData)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,beforeSend:function(jqXHR, settings){
                                    dms.loading.show();
                                }
                                ,complete:function(jqXHR, textStatus){
                                    dms.loading.hide();
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    initForm();
                                    //저장되었습니다.
                                    dms.notification.success("<spring:message code='global.info.saved' />");

                                }
                            });

                        };

                    }
                });

            }
        });

        //버튼 - 추가
        $("#btnItemAdd").kendoButton({
            click:function(e) {

                //상세정보 팝업 화면에서 용품아이템조회 팝업 출력
                dms.window.popup({
                    windowId:"accessoryItemSearchPopup"
                    ,title:"<spring:message code='sal.title.goodsSearch' />"
                    ,modal:true
                    ,content:{
                        url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>?sBrandYn=N"
                        ,data:{
                            "type":"01"     // 아이템, 패키지, ALL
                            ,"autoBind":true
                            ,"selectable":"multiple"
                            ,"pointUse":"Y"
                            ,"callbackFunc":function(data, type){

                                //용품
                                if(type == "item"){

                                    var grid = $("#gridDetail").data("kendoExtGrid");
                                    $.each(data, function(idx, item){

                                        if(item.avlbStockQty === 0){
                                            // {용품명}은(는) {가용수량}이(가) 없습니다.[번역]
                                            dms.notification.warning("<spring:message code='sal.lbl.avlbStockQty' var='arg2' /><spring:message code='crm.info.goodsEmptyParamInfo' arguments='"+item.itemNm+",${arg2}' />");
                                            return;
                                        };

                                        if(item.etcCd2 !== "Y"){
                                            // 포인트교환 상품만 추가 가능 합니다.
                                            dms.notification.warning("<spring:message code='crm.info.pointGoodsAddValidation' />");
                                            return;
                                        };

                                        var isExist = grid.exists(function(obj){
                                            return obj.goodsCd === item.itemCd && obj.giStrgeCd === item.strgeCd;
                                        });

                                        //중복체크
                                        if(!isExist){
                                            grid.dataSource.add({
                                                 giStrgeCd:item.strgeCd         //창고
                                                ,goodsCd:item.itemCd            //용품번호
                                                ,goodsNm:item.itemNm            //용품명칭
                                                ,goodsCnt:1                     //수량
                                                ,retlPrc:item.retlPrc           //용품판매단가
                                                ,etc4:item.etc4                 //1개포인트
                                                ,avlbPoint:1*item.etc4          //필요포인트
                                                ,avlbStockQty:item.avlbStockQty //가용수량

                                                ,goodsUnitCd:item.stockUnitCd   //단위
                                                ,saleAmt:0                      //실제판매가격
                                                ,totAmt:0                       //용품총가격
                                                ,retlTotAmt:0                   //용품총가격
                                                ,dcAmt:0                        //우대금액
                                                ,statCd:"10"                    //상태
                                            });
                                        }
                                    })
                                }

                                $("#accessoryItemSearchPopup").data("kendoWindow").close();
                            }
                        }
                    }
                });

            }
        });

        // 부품삭제 버튼
        $("#btnItemDel").kendoButton({
            click:function(e){

                var grid = $("#gridDetail").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //용품을(를) 선택하여 주십시오
                    dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                    return;
                }

                //처리상태가 출고(20), 반납(40)인 경우 삭제 할수 없다.
                var flag = true;
                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row);
                    if(dataItem.statCd == "20" || dataItem.statCd == "40"){
                        flag = false;
                        return false;
                    }
                });

                if(!flag){
                    //처리상태가 출고/반납인 목록은 삭제 할 수 없습니다.
                    dms.notification.warning("<spring:message code='sal.info.delete.impossibleState.accessoryItemSales' />");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 포인트 교환 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-CRM-0519-105100"
           ,dataSource:{
                schema:{
                    model:{
                       fields:{
                            rnum:{type:"number", editable:false}
                          , goodsCd:{ type:"string", editable:false }
                          , goodsNm:{ type:"string", editable:false }
                          , goodsCnt:{ type:"number", editable:true }
                          , retlPrc:{ type:"number", editable:false }
                          , etc4:{ type:"number", editable:false }
                          , avlbPoint:{ type:"number", editable:true }
                          , avlbStockQty:{ type:"number", editable:false }
                          , giStrgeCd:{ type:"string", editable:false }
                          , goodsUnitCd:{ type:"string", editable:false }
                        }
                    }
                }
                ,aggregate:[
                            { field: "goodsCnt", aggregate: "sum" }
                           ,{ field: "avlbPoint", aggregate: "sum" }
                       ]
                ,change:function(e){

                    var fieldName = e.field;

                    if(fieldName == "goodsCnt"){
                        $.each(e.sender.data(), function(idx, item){

                            //금액(용품총가격+설치비용)
                            if( item.goodsCnt < 1 ){
                                //{수량}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='global.lbl.qty' var='goodsMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${goodsMsg}' />");
                                return;

                            };

                            if( item.avlbStockQty < item.goodsCnt ){
                                //{가용수량}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='sal.lbl.avlbStockQty' var='goodsMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${goodsMsg}' />");
                                item.set("goodsCnt", 1);
                                item.set("avlbPoint", 1 * item.etc4);
                                return;

                            };

                            item.set("avlbPoint", item.goodsCnt * item.etc4);
                            $("#gridDetail").data("kendoExtGrid").refresh();

                        });
                    }

                }
            }
            ,edit:function(e){

                var fieldName = e.container.find("input[name][data-bind]").attr("name");
                if(fieldName == "avlbPoint"){
                    this.closeCell();
                    return;
                }

                var input = e.container.find(".k-input");

            }

        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:true          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,selectable:"multiple, row"
        ,pageable:true
        ,sortable:false
        ,filterable:false
        ,height:400
        ,autoBind:false
            ,columns:[
                 {field:"goodsCd", title:"<spring:message code='sal.lbl.accItemCd' />", width:120		//용품코드(용품번호)
					,footerTemplate:"<div class='ar'><spring:message code='global.lbl.total' /></div>" 	//합계
                 }
                ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:250}                                                         //용품명(용품명칭)
                ,{field:"avlbStockQty" ,title:"<spring:message code='sal.lbl.avlbStockQty' />", width:80 ,format:"{0:n0}" ,attributes:{"class":"ar"}}   //가용수량
                ,{field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"                   //수량
                    ,editor:function(container, options) {
                        $('<input name="goodsCnt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                           ,min:0
                           ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="goodsCnt"></span>').appendTo(container);
                    }
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>" //수량
                }
                ,{field:"retlPrc", title:"<spring:message code='crm.lbl.goodsSalePrc' />", width:80 ,format:"{0:n2}" ,attributes:{"class":"ar"}}        //판매가(용품판매단가)
                ,{field:"etc4" ,title:"<spring:message code='crm.lbl.eachPoint' />", width:80 ,format:"{0:n0}" ,attributes:{"class":"ar"}}              //1개포인트
                ,{field:"avlbPoint", title:"<spring:message code='crm.lbl.reqPoint' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"           //필요포인트
                    ,editor:function(container, options) {
                        $('<input name="avlbPoint" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                           ,min:0
                           ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="avlbPoint"></span>').appendTo(container);
                    }
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
                }
            ]
        });

    });
    //document.ready function 완료

</script>