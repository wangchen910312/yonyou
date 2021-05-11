<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.memu.packageCouponMasgerMng'/></h1><!-- 패키지쿠폰Master관리 -->
                    <div class="btn_right">
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
                </div>

                <div class="table_form">
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
                        <button class="btn_s btn_delete" id="btnPackageDel"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
                        <button class="btn_s btn_cancel" id="btnPackageCan"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>

                <div class="table_grid mt10">
                    <div id="packageGrid"></div>
                </div>



                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.coupon'/></h2><!-- 쿠폰 -->
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnCouponSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnCouponAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                        <button class="btn_s btn_delete" id="btnCouponDel"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
                        <button class="btn_s btn_cancel" id="btnCouponCan"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="couponGrid"></div>
                </div>

            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
/*************************************************************
데이터 셋업
*************************************************************/

    //1.그리드 만족도조사 유형 콤보  DataSource
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
    stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var stsfIvstMthCdListMap = dms.data.arrayToMap(stsfIvstMthCdList, function(obj){ return obj.cmmCd; });

    //2.그리드 만족도조사 수단 콤보  DataSource
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
    stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var stsfIvstExpdCdListMap = dms.data.arrayToMap(stsfIvstExpdCdList, function(obj){ return obj.cmmCd; });

    //3.그리드 만족도조사 타입 콤보  DataSource
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
    stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var stsfIvstTpCdListMap = dms.data.arrayToMap(stsfIvstTpCdList, function(obj){ return obj.cmmCd; });

    //조회조건 - 불만족 원인여부
    $("#sCmplReasonCont").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });


    $(document).ready(function() {

        //시간 template
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */
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
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var items = grid.dataItems();

                if (grid.gridValidation()) {
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
                $('#packageGrid').data('kendoExtGrid').dataSource.insert(0,{"regDt":null});
            }
        });

        //버튼 - 패키지 행삭제
        $("#btnPackageDel").kendoButton({
            click:function(e) {
                var grid = $("#packageGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
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
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var items = grid.dataItems();

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
                    $('#couponGrid').data('kendoExtGrid').dataSource.insert(0,{"dlrCd":selectedItem.dlrCd, "pkgSeq":selectedItem.pkgSeq});
                }

            }
        });

        //버튼 - 쿠폰 행삭제
        $("#btnCouponDel").kendoButton({
            click:function(e) {
                var grid = $("#couponGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
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
            dataSource:{
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
                                ,pkgNm:{type:"string", validation:{required:true
                                    /* ,maxlength:function(input){
                                        if(input.val().lentgh > 10){
                                            alert("최대 10자까지만 입력 가능합니다.");
                                            //input.attr("data-maxlength-msg","Max length is 10");
                                            return
                                        }else{
                                            return true;
                                        }
                                    } */
                                    }
                                } //패키지명
                                ,pkgAmt:{type:"number",  validation:{required:true}} // 패키지 금액
                                ,pkgCont:{type:"string", validation:{required:true}} //패키지 내용
                                ,regDt:{type:"string", validation:{required:false},editable:false} //등록일
                            }
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
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:false
            ,edit:function(e){
                //alert(e.container.find("input[name=pkgNm]").attr("value"));
                e.container.find("input[name=pkgNm]").attr("maxlength",33);
                e.container.find("input[name=pkgCont]").attr("maxlength",333);
            }
            ,columns:[
               {field:"rnum", title:"no2" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"pkgSeq", title:"", hidden:true}// 패키지 일련번호
               ,{field:"pkgNm", title:"<spring:message code='crm.lbl.pkgNm'/>",attributes:{"class":"ac"}}// 패키지명
               ,{field:"pkgAmt", title:"<spring:message code='crm.lbl.pkgAmt'/>", attributes:{"class":"ac"}
                   ,format:"{0:n0}"
                   //,format:"{0:###,###,###}"
               }// 패키지 금액
               ,{field:"pkgCont", title:"<spring:message code='crm.lbl.pkgCont'/>", attributes:{"class":"ac"}}// 패키 내용
               ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>", attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editable:false
               }// 등록일
            ]
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#couponGrid").kendoExtGrid({
            dataSource:{
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
                                ,dlrCd:{type:"string"} //딜러코드
                                ,pkgSeq:{type:"string"} //패키지일련번호
                                ,cupnSeq:{type:"string"} //쿠폰일련번호
                                ,cupnNm:{type:"string"} //쿠폰명
                                ,cupnValidPrid:{type:"number"}//쿠폰유효기간(일수)
                                ,cupnCont:{type:"string"} //쿠폰내용
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:false
            ,edit:function(e){
                //alert(e.container.find("input[name=pkgNm]").attr("value"));
                e.container.find("input[name=cupnNm]").attr("maxlength",33);
                e.container.find("input[name=cupnCont]").attr("maxlength",333);
            }
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"", hidden:true}// 딜러코드
               ,{field:"pkgSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"ac"}}//쿠폰명
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.cupnValidPrid'/>", attributes:{"class":"ac"}
                   ,format:"{0:n0}"
               }//쿠폰유효기간(일수)
               ,{field:"cupnCont", title:"<spring:message code='crm.lbl.cupnCont'/>", attributes:{"class":"ac"}}//쿠폰설명
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
</script>