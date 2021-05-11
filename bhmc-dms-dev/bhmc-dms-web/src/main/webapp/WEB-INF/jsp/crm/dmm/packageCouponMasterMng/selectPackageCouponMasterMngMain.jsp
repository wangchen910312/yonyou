<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


        <div id="resizableContainer">

            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.memu.packageCouponMasgerMng'/></h1><!-- 패키지쿠폰Master관리 -->
                    <div class="btn_right">
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.pkgNm"/></th><!-- 패키지명 -->
                                <td>
                                    <input type="text" id="sPkgNm" name="sPkgNm" maxlength="100" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt"/></th><!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.package'/></h2><!-- 패키지 -->
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnPackageSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnPackageAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                        <button class="btn_s btn_cancel" id="btnPackageCan"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="packageGrid"></div>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.coupon'/></h2><!-- 쿠폰 -->
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnCouponSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnCouponAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                        <button class="btn_s btn_cancel" id="btnCouponCan"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="couponGrid" class="resizable_grid"></div>
                </div>

            </section>
        </div>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
/*************************************************************
데이터 셋업
*************************************************************/

    //쿠폰타입
    var cupnTpDSList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var cupnTpDSArr = [];
    <c:forEach var="obj" items="${cupnTpDS}">
        cupnTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        cupnTpDSArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    cupnTpDSArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = cupnTpDSArr[val];
        }
        return returnVal;
    };

    $(document).ready(function() {

        //조회조건-소멸일 선택
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        /*************************************************************
         *   버튼 셋팅
        *************************************************************/
        //버튼 - 패키지 쿠폰 Master 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').dataSource.page(1);
                $('#couponGrid').data('kendoExtGrid').dataSource.data([]);
            }
        });

        //버튼 - 패키지 저장
        $("#btnPackageSave").kendoButton({
            click:function(e) {

                var grid = $("#packageGrid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList",["regDtFormat", "startDtFormat", "endDtFormat"]);
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var dataValidate = false;

                if (grid.gridValidation()) {

                    var insertRows = saveData.insertList;
                    if ( insertRows.length > 0 ) {
                        $.each(insertRows, function(idx, obj){
                            if ( obj.startDt >= obj.endDt ) {
                                // {시작일}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.startDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };
                        });
                        if(dataValidate){ return false; }
                    };

                    var updateRows = saveData.updateList;
                    if ( updateRows.length > 0 ) {
                        $.each(updateRows, function(idx, obj){
                            if ( obj.startDt >= obj.endDt ) {
                                // {시작일}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.startDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };
                        });
                        if(dataValidate){ return false; }
                    };

//                     console.log("쿠폰 param :: ",JSON.stringify(saveData));
//                     return;

                    $.ajax({
                        url:"<c:url value='/crm/dmm/packageCouponMasterMng/multiPackageCouponMasterMngs.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }


            }
        });

        //버튼 - 패키지 행추가
        $("#btnPackageAdd").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').dataSource.insert(0,{
                    "regDtFormat":null
                    ,"regDt":null
                    ,"startDtFormat":null
                    ,"endDtFormat":null
                    ,"startDt":null
                    ,"endDt":null
                    ,"useYn":"Y"
                    });
            }
        });

        //버튼 - 패키지 취소
        $("#btnPackageCan").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        //버튼 - 쿠폰 저장
        $("#btnCouponSave").kendoButton({
            click:function(e) {
                var grid = $("#couponGrid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList",["prenGoodsNm", "regDtFormat"]);
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var insertRows = saveData.insertList;
                var updateRows = saveData.updateList;
                var gridList = [];
                var dataValidate = false;

                if ( insertRows.length > 0 ) {
                    gridList = gridList.concat(insertRows);
                };
                if ( updateRows.length > 0 ) {
                    gridList = gridList.concat(updateRows);
                };
                if ( gridList.length > 0 ) {
                    $.each(gridList, function(idx, obj){

                        var cupnTp = obj.cupnTp;
                        var dcRate = obj.dcRate;
                        var dcAmt = obj.dcAmt;
                        var prenGoods = obj.prenGoods;
                        var prenCnt = obj.prenCnt;
                        var useYn = obj.useYn;

                        /**
                        *   1. 쿠폰 유형에 따른 컬럼 필수값 확인
                        *   cupnTp = "01" : dcRate
                        *   cupnTp = "02" : dcAmt
                        *   cupnTp = "03" : prenGoods, prenCnt
                        **/

                        if ( cupnTp === "01" ) {

                            if ( dcRate <= 0 ){
                                // {할인율}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.dcRate' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };

                        } else if ( cupnTp === "02" ) {

                            if ( dcAmt <= 0  ){
                                // {상품권 할인 금액}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.dcAmt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };

                        } else if ( cupnTp === "03" ) {

                            if ( dms.string.isEmpty(prenGoods) ){
                                // {사은품 용품}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.prenGoods' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };

                            if ( prenCnt <= 0 ){
                                // {사은품 수량}을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.prenCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                dataValidate = true;
                                return false;
                            };

                        } else {

                            // {쿠폰유형}을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.cupnTp' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            dataValidate = true;
                            return false;

                        };

                        if ( dms.string.isEmpty(useYn) ) {
                            // {사용여부}을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='global.lbl.useYn' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            dataValidate = true;
                            return false;
                        };




                    });

                    if(dataValidate){ return false; }
                };

                //console.log("쿠폰 param :: ",JSON.stringify(saveData));
                //return;
                if (grid.gridValidation()) {

                    $.ajax({
                        url:"<c:url value='/crm/dmm/packageCouponMasterMng/multiCoupons.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        //버튼 - 쿠폰 행추가
        $("#btnCouponAdd").kendoButton({
            click:function(e) {
                var grid = $('#packageGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if(selectedItem == null){
                    //패키지쿠폰을(를) 선택해 주세요.
                    dms.notification.warning("<spring:message code='crm.title.packageCoupon' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return;
                }else{
                    $('#couponGrid').data('kendoExtGrid').dataSource.insert(0,{

                        "dlrCd":selectedItem.dlrCd
                        , "pkgSeq":selectedItem.pkgSeq
                        , "useYn":"Y"
                        , "cupnTp":""
                        , "dcAmt":0
                        , "dcRate":0
                        , "prenCnt":0
                        , "cupnDestDt":null
                        , "regDtFormat":null
                        , "regDt":null
                    });
                }

            }
        });

        //버튼 - 쿠폰 취소
        $("#btnCouponCan").kendoButton({
            click:function(e) {
                $('#couponGrid').data('kendoExtGrid').cancelChanges();
            }
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#packageGrid").kendoExtGrid({
            gridId:"G-CRM-0726-103349"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/packageCouponMasterMng/selectPackageCouponMasterMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};
                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sPkgNm"] = $("#sPkgNm").val();

                            //console.log("패키지 조회 : ",kendo.stringify(params))

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"pkgSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,pkgSeq:{type:"number", validation:{required:true}} //패키지 일련번호
                                ,pkgNm:{type:"string", validation:{required:true}} //패키지명
                                ,pkgAmt:{type:"number",  validation:{required:true}}    //패키지 금액
                                ,pkgNm:{type:"string", validation:{required:true}}      //패키지 명
                                ,pkgCont:{type:"string", validation:{required:true}}    //패키지 내용
                                ,useYn:{type:"string", validation:{required:true}}      //사용유무
                                ,startDt:{type:"date", validation:{required:true}}     //시작일
                                ,endDt:{type:"date", validation:{required:false}}       //종료일
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}   //수정일
                                ,startDtFormat:{type:"date"}
                                ,endDtFormat:{type:"date"}
                                ,regDtFormat:{type:"date", editable:false}
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                    elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                                    elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
                if(!dms.string.isEmpty(dataItem.pkgSeq)){
                    $("#couponGrid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,navigatable:true
            ,sortable:true
//             ,pageable:true
            ,pageable:{
                refresh:true
                ,buttonCount:5
            }
            ,edit:function(e){
                e.container.find("input[name=pkgNm]").attr("maxlength",33);
                e.container.find("input[name=pkgCont]").attr("maxlength",333);
            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"pkgSeq", title:"", hidden:true}// 패키지 일련번호
               ,{field:"pkgNm", title:"<spring:message code='crm.lbl.pkgNm'/>",attributes:{"class":"ac"}}// 패키지명
               ,{field:"pkgAmt", title:"<spring:message code='crm.lbl.pkgAmt'/>", attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,editor:function(container, options){
                       var input = $("<input/>");
                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0,
                           spinners:false
                       });
                   }
               }// 패키지 금액
               ,{field:"pkgCont", title:"<spring:message code='crm.lbl.pkgCont'/>", attributes:{"class":"ac"}}// 패키 내용
               ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['Y','N']
                           ,index:0
                       });
                       $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                   }
               }
               ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt' />"               // 시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (startDt !== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"endDt", title:"<spring:message code='crm.lbl.endDt' />"               // 종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (endDt !== null ){# #= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />"               // 등록일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#couponGrid").kendoExtGrid({
            gridId:"G-CRM-0726-103550"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/packageCouponMasterMng/selectCoupons.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var grid = $('#packageGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["sDlrCd"] = selectedItem.dlrCd;
                            params["sPkgSeq"] = selectedItem.pkgSeq;
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"cupnSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}          //딜러코드
                                ,pkgSeq:{type:"string"}         //패키지일련번호
                                ,cupnSeq:{type:"string"}        //쿠폰일련번호
                                ,cupnNm:{type:"string"}         //쿠폰명
                                ,cupnValidPrid:{type:"number"}  //쿠폰유효기간(일수)
                                ,cupnCont:{type:"string"}       //쿠폰내용
                                ,cupnDestDt:{type:"date"}
                                ,cupnTp:{type:"string", validation:{required:true}}         //쿠폰유형
                                ,dcRate:{type:"number"}         //할인율
                                ,dcAmt:{type:"number"}          //상품권 할인 금액
                                ,prenGoods:{type:"string"}      //사은품 용품 코드
                                ,prenGoodsNm:{type:"string"}    //사은품 용품 명
                                ,prenCnt:{type:"number"}        //사은품 수량
                                ,useYn:{type:"string", validation:{required:true}}      //사용유무
                                ,regDtFormat:{type:"date", editable:false}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            //,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
//             ,pageable:true
            ,pageable:{
                refresh:true
                ,buttonCount:5
            }
            ,edit:function(e){

                e.container.find("input[name=cupnNm]").attr("maxlength",33);
                e.container.find("input[name=cupnCont]").attr("maxlength",333);

                var grid = this
                , fieldName = grid.columns[e.container.index()].field
                , cupnTp = e.model.cupnTp;

                //console.log("fieldName : "+fieldName+ " | cupnTp : "+cupnTp);

                if ( fieldName === "dcRate" ) {
                    if ( cupnTp !== "01" ) {
                        this.closeCell();
                    };
                };

                if ( fieldName === "dcAmt" ) {
                    if ( cupnTp !== "02" ) {
                        this.closeCell();
                    };
                };

                if ( fieldName === "prenGoodsNm" || fieldName === "prenCnt" ) {
                    if ( cupnTp !== "03" ) {
                        this.closeCell();
                    };
                };

            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"", hidden:true}// 딜러코드
               ,{field:"pkgSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"ac"}}//쿠폰명
               ,{field:"cupnTp", title:"<spring:message code='crm.lbl.cupnTp' />", width:100        // 쿠폰유형
                    ,editor:function(container, options) {
                        $('<input name="cupnTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             autoBind:false
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:cupnTpDSList
                            ,select:function(e){
                                var dataItem = this.dataItem(e.item);
                                var cmmCd = dataItem.cmmCd;
                                var grid = $("#couponGrid").data("kendoExtGrid");
                                var selectRow = grid.dataItem(grid.select());

                                    if ( cmmCd === "01" ) {
                                        selectRow.set("dcAmt", '0');
                                        selectRow.set("prenGoods", '');
                                        selectRow.set("prenGoodsNm", '');
                                        selectRow.set("prenCnt", '0');
                                    };

                                    if ( cmmCd === "02" ) {
                                        selectRow.set("dcRate", '0');
                                        selectRow.set("prenGoods", '');
                                        selectRow.set("prenGoodsNm", '');
                                        selectRow.set("prenCnt", '0');

                                    };

                                    if ( cmmCd === "03" ) {
                                        selectRow.set("dcAmt", '0');
                                        selectRow.set("dcRate", '0');
                                    };

                            }
                        })
                        $('<span class="k-invalid-msg" data-for="cupnTp"></span>').appendTo(container);
                    }
                    ,template:'#= cupnTpDSArrVal(cupnTp)#'
                }
               ,{field:"dcRate", title:"<spring:message code='crm.lbl.dcRate'/>", attributes:{"class":"ar"}     //할인율
                   ,format:"{0:n0}"
                   ,template:function(dataItem){
                       var spanObj = "";
                           spanObj = dataItem.dcRate + "%";
                       return spanObj;
                   }
                   ,editor:function(container, options){
                       var input = $("<input/>");
                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0,
                           max:99,
                           spinners:false,
                           decimals:0
                       });
                   }

               }
               ,{field:"dcAmt", title:"<spring:message code='crm.lbl.dcAmt'/>", attributes:{"class":"ar"}       //상품권 할인 금액
                   ,format:"{0:n0}"
                   ,editor:function(container, options){
                       var input = $("<input/>");
                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0,
                           spinners:false,
                           decimals:0
                       });
                   }
               }
               ,{field:"prenGoods", hidden : true}//사은품 용품 코드
               ,{field:"prenGoodsNm", title :"<spring:message code='crm.lbl.prenGoods' />", width :150       //사은품 용품 명
                   ,attributes :{"class" :"ac"}
                   ,editor :function(container, options) {
                       $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectGoodsSearchPopup(\''+dms.string.strNvl(options.model.dlrCd)+'\');"></a></div>')
                       .appendTo(container);
                   }
               }
               ,{field:"prenCnt", title:"<spring:message code='crm.lbl.prenCnt'/>", attributes:{"class":"ar"}       //사은품 수량
                   ,format:"{0:n0}"
                   ,editor:function(container, options){
                       var input = $("<input/>");
                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0,
                           spinners:false,
                           decimals:0
                       });
                   }
               }
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.cupnValidPrid'/>", attributes:{"class":"ar"}  //쿠폰유효기간(일수)
                   ,format:"{0:n0}"
                   ,editor:function(container, options){
                       var input = $("<input/>");
                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0,
                           spinners:false,
                           decimals:0
                       });
                   }
               }
               ,{field:"cupnCont", title:"<spring:message code='crm.lbl.cupnCont'/>", attributes:{"class":"ac"}}//쿠폰설명
               ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75                    //사용여부
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['Y','N']
                           ,index:0
                       });
                       $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                   }
               }
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width :150               // 등록일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });


    }); //end ready

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }



  //용품조회
  selectGoodsSearchPopup = function(dlrCd){
      var obj = {};
      obj["dlrCd"] = dlrCd;
      obj["carlineCd"] = "";
      obj["goodsCd"] = "";
      obj["pkgItemCd"] = "";

      //console.log("용품 obj : ",obj)

      popupWindow = dms.window.popup({
        windowId:"goodsItemSearchPopup"
        ,width:700
        ,height:420
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":obj["dlrCd"]
                , "sCarlineCd" :obj["carlineCd"]
                , "sGoodsCd"   :obj["goodsCd"]
                , "sPkgItemCd" :obj["pkgItemCd"]
                , "onlyItemTab" :"Y"
                ,"callbackFunc":function(data, type){

                    var tData = {};
                    var grid = $("#couponGrid").data("kendoExtGrid");
                    var selectItem = grid.dataItem(grid.select());

                    //console.log("data :: ",data)
                    //console.log("type :: ",type)

                    if(type === "02"){       // 패키지가 아닐경우

                        for(var i=0; i<data.length; i++){
                            tData = data[i];

                            if(i == 0){
                                var rowNum = 0;
                                var rows = grid.tbody.find("tr");
                                $.each(rows, function(index, row) {
                                    var rowItem = grid.dataItem(row);
                                    if(selectItem.uid == rowItem.uid ){
                                        rowNum = index;
                                    };
                                });
                                selectItem.set("dlrCd", dlrCd);
                                selectItem.set("prenGoods", tData.itemCd);
                                selectItem.set("prenGoodsNm", tData.itemNm);
                                selectItem.set("prenCnt", 1);
                                selectItem.set("dirty", true);
                            };
                        };
                    };

                    popupWindow.close();
                }
            }
        }
    });

  }
</script>