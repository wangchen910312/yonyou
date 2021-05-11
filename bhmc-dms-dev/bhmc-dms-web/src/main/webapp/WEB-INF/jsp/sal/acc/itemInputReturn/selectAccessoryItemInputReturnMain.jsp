<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 입고반품 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"></h1>
            <div class="btn_left">
                 <dms:access viewId="VIEW-D-10991" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                 </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10990" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnSave"><spring:message code="par.btn.returnCnfm" /></button><!-- 반품확정 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10989" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnPrint"><spring:message code="par.btn.exportReturnDoc" /></button><!-- 반품문서출력 -->
                </dms:access>
            </div>
        </div>

        <form id="form">
            <div class="table_form" id="searchForm">
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
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.bpNm" /><!-- 업체명 --></th>
                            <td>
                                <input type="text" id="bpNm" name="bpNm" class="form_input form_readonly" readonly data-name="<spring:message code='sal.lbl.bpNm' />" data-bind="value:bpNm" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.returnNm" /><!-- 반품번호 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="etcGrDocNo" name="etcGrDocNo" class="form_input" readonly data-name="<spring:message code='sal.lbl.returnNm' />" data-bind="value:etcGrDocNo" />
                                    <a id="searchGrDocNo"><!-- 검색 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.returnConfirmer" /><!-- 반품확인자 --></th>
                            <td>
                                <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" readonly data-name="<spring:message code='sal.lbl.returnConfirmer' />" data-bind="value:regUsrNm" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.returnDt" /><!-- 반품일자 --></th>
                            <td>
                                <input type="text" id="regDt" name="regDt" class="form_datepicker" readonly data-name="<spring:message code='sal.lbl.returnDt' />" data-bind="value:regDt" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>

        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10988" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_s_min5" id="btnReceiveEtcItemPop"><spring:message code="sal.btn.receiveRef" /></button><!-- 입고단참조 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10987" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_s_min5" id="btnDelItem"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                </dms:access>
            </div>
        </div>

        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script type="text/javascript">
var viewModel = new kendo.observable({
    "dlrCd":""              //딜러코드
   ,"bpCd":""               //공급업체코드
   ,"bpNm":""               //공급업체명
   ,"bpTp":"03"             //업체구분(기타)
   ,"etcGrDocNo":""         //문서번호
   ,"etcGrDocTp":"SAL_ACC"  //문서업무유형
   ,"regUsrNm":""           //입고확인자명
   ,"regDt":null            //입고일자
});

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

kendo.bind($("#form"), viewModel);

$(document).ready(function() {
    //버튼 - 초기화
//     <dms:access viewId="VIEW-D-10991" hasPermission="${dms:getPermissionMask('READ')}">
    $("#btnInit").kendoButton({
        click:function(e){
            viewModel.set("dlrCd","");              //딜러코드
            viewModel.set("bpCd","");               //공급업체코드
            viewModel.set("bpNm","");               //공급업체명
            viewModel.set("bpTp","03");             //업체구분(기타)
            viewModel.set("etcGrDocNo","");         //반품문서번호
            viewModel.set("etcGrDocTp","SAL_ACC");  //문서업무유형
            viewModel.set("regUsrNm","");           //입고확인자명
            viewModel.set("regDt",null);            //입고일자

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnReceiveEtcItemPop").data("kendoButton").enable(true);

            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });
//     </dms:access>

    //버튼 - 반품확정
//     <dms:access viewId="VIEW-D-10990" hasPermission="${dms:getPermissionMask('READ')}">
    $("#btnSave").kendoButton({
        click:function(e){
            grid = $("#grid").data("kendoExtGrid");

            //거래처 체크
            if(dms.string.isEmpty(viewModel.bpCd)){
                //거래처를 입력해주세요
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                return;
            }

            //반품목록 체크
            if(grid.items().length  == 0){
                //선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return;
            }

            //입력값 체크
            var validCheckFlag = true;

            $.each(grid.dataSource.data(), function(idx, dataItem){
                //반품수량 확인
                if(dms.string.isEmpty(dataItem.returnQty) || dataItem.returnQty == 0){
                    //수량을 입력하십시오
                    dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                    validCheckFlag = false;
                    return false;

                //반품수량, 입고수량 비교
                }else if(dataItem.returnQty + dataItem.preReturnQty > dataItem.qty){
                    //반품수량이 입고수량보다 큽니다.
                    dms.notification.info("<spring:message code='par.lbl.returnQtyOverMsg' />");
                    validCheckFlag = false;
                    return false;
                }
            });
            if(validCheckFlag){
                $.ajax({
                    url:"<c:url value='/par/pcm/receive/returnInvcReceiveEtc.do' />"
                    ,data:kendo.stringify({
                        receiveEtcVO:{
                            bpCd:viewModel.bpCd
                            ,bpNm:viewModel.bpNm
                            ,etcGrDocTp:viewModel.etcGrDocTp
                        }
                        ,receiveEtcItemList:grid.dataSource.data()
                    })
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        dms.notification.success("<spring:message code='par.lbl.returnCnfm' var='invReturn' /><spring:message code='global.info.regSuccessParam' arguments='${invReturn}'/>");

                        //반품문서 정보 조회조건 적용
                        viewModel.set("dlrCd", result.dlrCd);
                        viewModel.set("bpCd", result.bpCd);
                        viewModel.set("bpNm", result.bpNm);
                        viewModel.set("etcGrDocNo", result.etcGrDocNo);

                        $("#grid").data("kendoExtGrid").dataSource.read();

                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnPrint").data("kendoButton").enable(true);
                        $("#btnDelItem").data("kendoButton").enable(false);
                        $("#btnReceiveEtcItemPop").data("kendoButton").enable(false);
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
            }
        }
    });
//     </dms:access>

    //버튼 - 반품문서출력
//     <dms:access viewId="VIEW-D-10989" hasPermission="${dms:getPermissionMask('READ')}">
    $("#btnPrint").kendoButton({
        enable:false
        ,click:function(e) {
            parent._createOrReloadTabMenu("<spring:message code='par.btn.exportReturnDoc'/>", "<c:url value='/ReportServer?reportlet=sale/selectSalesInvcReturnPrintMain.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+$("#etcGrDocNo").val());
            //parent._createOrReloadTabMenu("<spring:message code='par.btn.exportReturnDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvcReturnPrintMain.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+viewModel.etcGrDocNo);
        }
    });
//     </dms:access>

    //버튼 - 입고문서참조
//     <dms:access viewId="VIEW-D-10988" hasPermission="${dms:getPermissionMask('READ')}">
    $("#btnReceiveEtcItemPop").kendoButton({
        click:function(e){
            dms.window.popup({
                windowId:"accessoryItemInputReturnSearchPopup"
                ,title:"<spring:message code='sal.lbl.receiveEtcItemPop'/>" //입고문서조회
                ,content:{
                    url:"<c:url value='/sal/acc/itemInputReturn/selectAccessoryItemInputReturnSearchPopup.do'/>"
                    ,data:{
                         "autoBind":true
                        ,"bpCd":viewModel.bpCd
                        ,"bpNm":viewModel.bpNm
                        ,"etcGrDocTp":viewModel.etcGrDocTp
                        ,"mvtTp":"01"
                        ,"selectable":"multiple"
                        ,"callbackFunc":function(data){
                            var grid = $("#grid").data("kendoExtGrid");
                            var isExistEtcGrDocNo = false;
                            $.each(grid.dataSource._data, function(idx, item){
                              console.log(item.refDocNo);
                              console.log(data[0].invcDocNo);
                              
                              isExistEtcGrDocNo = grid.exists(
                                  function(dataItem){
                                      if(item.refDocNo == data[0].invcDocNo ){
                                          return true;
                                      }
                                      return false;
                              });
                            });

                            console.log("isExistEtcGrDocNo="+isExistEtcGrDocNo);
                            if(isExistEtcGrDocNo){
                                dms.notification.warning("<spring:message code='sal.lbl.etcGrDocNo' var ='etcGrDocNo'/> <spring:message code='global.info.alreadyCont' arguments='${etcGrDocNo}'/>");   
                                return false;
                            }else{
                                
                                $.ajax({
                                     url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
                                    ,data:JSON.stringify({sEtcGrDocNo:data[0].invcDocNo})
                                    ,type:"POST"
                                    ,dataType:"json"
                                    ,contentType:"application/json"
                                    ,success:function(result) {
    
                                        if(!dms.string.isEmpty(viewModel.bpCd) && viewModel.bpCd != data[0].bpCd){
                                            dms.notification.warning("<spring:message code='sal.info.notEqualSupplyBp'/>");   //공급업체가 일치하지 않습니다.
                                            return;
                                        }
    
                                        viewModel.set("bpCd", data[0].bpCd);
                                        viewModel.set("bpNm",data[0].bpNm);
    
                                        //선택된 품목을 그리드에 추가한다.
                                        $.each(result.data, function(idx, item){
    
                                            //품목 중복 체크
                                            isExistItemCd = grid.exists(function(dataItem){
                                                if(dataItem.etcGrDocNo == item.etcGrDocNo ){
                                                    return true;
                                                }
                                                return false;
                                            });
                                            if(isExistItemCd){
                                                dms.notification.warning(item.itemCd + "["+ item.itemNm +"]<spring:message code='sal.info.alreadyRegistedParts'/>");   //은 이미 등록되어 있는 부품입니다.
                                            }else{
                                                grid.dataSource.add({
                                                    dlrCd:item.dlrCd
                                                    ,refDocNo:item.etcGrDocNo
                                                    ,refDocLineNo:item.etcGrDocLineNo
                                                    ,itemCd:item.itemCd
                                                    ,itemNm:item.itemNm
                                                    ,strgeCd:item.strgeCd
                                                    ,qty:item.qty
                                                    ,returnQty:item.qty-item.returnQty
                                                    ,preReturnQty:item.returnQty
                                                    ,prc:item.prc
                                                    ,taxDdctPrc:item.taxDdctPrc
                                                    ,amt:item.prc*(item.qty-item.returnQty)
                                                    ,taxDdctAmt:item.taxDdctPrc*(item.qty-item.returnQty)
                                                    ,updtDtStr:item.updtDtStr
                                                });
                                            }
                                        });
                                    }
                                    ,error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                });
                                grid.select(grid.items());
                                $("#accessoryItemInputReturnSearchPopup").data("kendoWindow").close();
                            }
                        }
                    }
                }
            });
        }
    });
//     </dms:access>

    //버튼 - 삭제
//     <dms:access viewId="VIEW-D-10987" hasPermission="${dms:getPermissionMask('READ')}">
    $("#btnDelItem").kendoButton({
        click:function(e){
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
//     </dms:access>

    //버튼 - 반품번호 조회
    $("#searchGrDocNo").bind("click", function(){
        dms.window.popup({
            windowId:"accessoryItemInputReturnSearchPopup"
            ,title:"<spring:message code='sal.lbl.selectReturnDoc'/>" //반품문서조회
            ,content:{
                 url:"<c:url value='/sal/acc/itemInputReturn/selectAccessoryItemInputReturnSearchPopup.do'/>"
                 ,data:{
                     "type":"custom1"
                     ,"autoBind":false
                     ,"bpCd":viewModel.bpCd
                     ,"bpNm":viewModel.bpNm
                     ,"etcGrDocTp":viewModel.etcGrDocTp
                     ,"selectable":"single"
                     ,"mvtTp":"03"
                     ,"callbackFunc":function(data){
                         viewModel.set("etcGrDocNo", data[0].invcDocNo);

                         $("#grid").data("kendoExtGrid").dataSource.read();

                         $("#btnSave").data("kendoButton").enable(false);
                         $("#btnPrint").data("kendoButton").enable(true);
                         $("#btnDelItem").data("kendoButton").enable(false);
                         $("#btnReceiveEtcItemPop").data("kendoButton").enable(false);

                         $("#accessoryItemInputReturnSearchPopup").data("kendoWindow").close();
                     }
                 }
            }
        });
    });

    //조회조건 - 반품일자
    $("#regDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    }).data("kendoExtMaskedDatePicker").enable(false);

    //입고반품 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0206-040001"
        ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sEtcGrDocNo"] = viewModel.etcGrDocNo;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}
                        ,etcGrDocNo:{type:"string", editable:false}
                        ,etcGrDocLineNo:{type:"number", editable:false}
                        ,refDocNo:{type:"string", editable:false}
                        ,refDocLineNo:{type:"number", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false}
                        ,strgeCd:{type:"string", editable:false}
                        ,qty:{type:"number", editable:false}
                        ,returnQty:{type:"number"}
                        ,preReturnQty:{type:"number", editable:false}
                        ,prc:{type:"number", editable:false}
                        ,taxDdctPrc:{type:"number", editable:false}
//                         ,grDt:{type:"date", editable:false}
//                         ,purcReturnDt:{type:"date", editable:false}
                        ,amt:{type:"number"}
                        ,taxDdctAmt:{type:"number"}
                        ,updtDtStr:{type:"string", editable:false}
                    }
                }
            }
        }
        ,selectable:"row"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,appendEmptyColumn:true
        ,pageable:false
        ,filterable:false
        ,edit:function(e){
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            //반품문서 있거나 입고금액(세금), 입고금액(불세금) 필드 인 경우
            if(!dms.string.isEmpty(e.model.etcGrDocNo) || fieldName === "amt"||fieldName === "taxDdctAmt"){
                this.closeCell();
            }
         }
         ,columns:[
             {field:"etcGrDocNo", title:"<spring:message code='sal.lbl.returnDocNo'/>", width:140}    //반품문서번호
            ,{field:"etcGrDocLineNo", title:"<spring:message code='sal.lbl.returnDocLineNo'/>", width:100}  //반품문서라인번호
            ,{field:"refDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo'/>", width:140}  //입고문서번호
            ,{field:"refDocLineNo", title:"<spring:message code='sal.lbl.etcGrDocLineNo'/>", width:100}    //입고문서라인번호
            ,{field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd'/>", width:140}  //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm'/>", width:200}   //용품명
            ,{field:"strgeCd", title:"<spring:message code='sal.lbl.grStrgeCd'/>", width:120
                ,template:"# if(storageMap[strgeCd] != null) { # #= storageMap[strgeCd].strgeNm# # }#"
            }   //입고창고
            ,{field:"qty", title:"<spring:message code='sal.lbl.itemQty'/>", width:80, attributes:{ "class":"ar"}, format:"{0:n0}", decimal:0
                 ,template:function(dataItem){
                     //반품문서 있을 때
                     if(!dms.string.isEmpty(dataItem.etcGrDocNo)){
                         return "";

                     //반품문서 없을 때
                     }else{
                         return dataItem.qty;
                     }
                 }
             }  //입고수량
             ,{field:"returnQty", title:"<spring:message code='sal.lbl.returnQty'/>", width:80, attributes:{ "class":"ar"}, format:"{0:n0}", decimal:0    //반품수량
                 ,editor:function(container, options) {
                     var input = $('<input data-bind="value:'+options.field+'"/>');

                     input.focus(function(){
                        this.select();
                        options.model.set("oldReturnQty", $(this).val());
                     });

                     input.blur(function(){
                         delete options.model.oldReturnQty;
                     });


                     input.appendTo(container);
                     input.kendoExtNumericTextBox({
                         min:0
                         ,spinners:false
                         ,change:function(e){
                             var returnQty = this.value();

                             //반품수량+기반품수량 이 입고수량 보다 큰 경우
                             if(returnQty + options.model.preReturnQty > options.model.qty){
                                 dms.notification.info("<spring:message code='par.lbl.returnQtyOverMsg' />");

                                 options.model.returnQty = options.model.oldReturnQty;
                                 options.model.taxDdctAmt = options.model.oldReturnQty*options.model.taxDdctPrc;
                                 options.model.amt = options.model.oldReturnQty*options.model.prc;
                             }else{
                                 options.model.taxDdctAmt = returnQty*options.model.taxDdctPrc;
                                 options.model.amt = returnQty*options.model.prc;
                             }
                         }
                     });
                 }
                 ,template:function(dataItem){
                     //반품문서 있을 때
                     if(!dms.string.isEmpty(dataItem.etcGrDocNo)){
                         return dataItem.qty;   //반품입고수량 대체

                     //반품문서 없을 때
                     }else{
                         return dataItem.returnQty;
                     }
                 }
             }
             ,{field:"preReturnQty", title:"<spring:message code='sal.lbl.preReturnQty' />", width:80, attributes:{ "class":"ar"}, format:"{0:n0}"   //기반품수량
                ,template:function(dataItem){
                    //반품문서 있을 때
                    if(!dms.string.isEmpty(dataItem.etcGrDocNo)){
                        return "";

                    //반품문서 없을 때
                    }else{
                        return dataItem.preReturnQty;
                    }
                }
             }
             ,{field:"taxDdctPrc", title:"<spring:message code='sal.lbl.invcPrc' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2} //입고단가(세금포함)
             ,{field:"prc", title:"<spring:message code='sal.lbl.taxDdctPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}   //입고단가(세금제외)
             ,{field:"taxDdctAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2} //입고금액(세금포함)
             ,{field:"amt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}   //입고금액(세금제외)
             ,{field:"updtDtStr" ,title:" " ,width:100,hidden:false}//수정일자
        ]
    });
});
</script>