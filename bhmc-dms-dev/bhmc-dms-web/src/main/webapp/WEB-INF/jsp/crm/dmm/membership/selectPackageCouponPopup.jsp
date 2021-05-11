<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.packageCouponReg" /></h1><!-- 패키지 쿠폰 등록 -->
            <div class="btn_right">
                <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
            </div>
        </div>

        <div class="table_form" id="packageCouponform">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.pkgNm" /></span></th><!-- 패키지 명 -->
                        <td>
                            <input id="pkgSeq" name="pkgSeq" class="form_select" data-json-obj="true">
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 쿠폰 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="couponGrid"></div>
        </div>
        <!-- 쿠폰 그리드 종료 -->
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">
 var dlrCd = "${dlrCd}";
 var membershipNo = "${membershipNo}";
 var packageCouponList = [];
 var packageCouponMap = [];

 <c:forEach var="obj" items="${packageCouponList}">
 packageCouponList.push({"pkgSeq":"${obj.pkgSeq}" , "pkgNm":"${obj.pkgNm}", "useYn":"${obj.useYn}"});
 packageCouponMap["${obj.pkgSeq}"] = "${obj.pkgNm}";
 </c:forEach>


 //쿠폰타입
 var cupnTpDSArr = [];
 <c:forEach var="obj" items="${cupnTpDS}">
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

    /*************************************************************
    *드랍다운 리스트 셋팅
    *************************************************************/

    // 포인트코드 드랍다운 리스트.
    $("#pkgSeq").kendoExtDropDownList({
        dataTextField:"pkgNm"
        , dataValueField:"pkgSeq"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(packageCouponList)
        //, index:4
        , change:function(e){
            if(!dms.string.isEmpty(this.value())){
                //포인트 이력 그리드 데이터 조회
                $("#couponGrid").data('kendoExtGrid').dataSource.read();
            }else{
                $("#couponGrid").data('kendoExtGrid').dataSource.data([]);
            }
        }
    });


    var options = parent.popupWindow.options.content.data;

    if (options.telNo != null && options.telNo != ""){
        $("#telNo").val(options.telNo);
    }

    // 저장 버튼.
    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $('#couponGrid').data('kendoExtGrid');
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.each(saveData.insertList, function(idx, row){
                row.set("cupnUseYn","N");
                row.set("membershipNo",membershipNo);
            });

            var rows = grid.tbody.find("tr");
            var errCnt = 0;
            var errDateCnt = 0;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dms.string.strNvl(dataItem.cupnNo) == ""){
                    errCnt ++;
                }
                if(dms.string.strNvl(dataItem.cupnDestDt) == ""){
                    errDateCnt ++;
                }
            });

            if(errCnt > 0){
                //쿠폰 번호을(를) 입력하여 주십시오.
                dms.notification.info("<spring:message code='crm.lbl.cupnNo' var='init' /><spring:message code='global.info.validation.required' arguments='${init}' />");
                return;
            }

            if(errDateCnt > 0){
                //쿠폰 소멸일을(를) 입력하여 주십시오.
                dms.notification.info("<spring:message code='crm.lbl.cupnDestDt' var='init' /><spring:message code='global.info.validation.required' arguments='${init}' />");
                return;
            }

            saveData.pkgSeq = $("#pkgSeq").data("kendoExtDropDownList").value();

            if (grid.gridValidation()) {

                //console.log("패키지 쿠폰등록 : ",JSON.stringify(saveData))


                $.ajax({
                    url:"<c:url value='/crm/dmm/membership/multiPackageCouponHiss.do' />",
                    //url:"<c:url value='/crm/dmm/membership/multiStanbyPackageCoupons.do' />",
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
                        $('#couponGrid').data('kendoExtGrid').dataSource.read();
                        parent.$('#packageCouponHisGrid').data('kendoExtGrid').dataSource.read();
                        parent.popupWindow.close();
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    /*************************************************************
     *   쿠폰 그리드 셋팅
    *************************************************************/
    //그리드 설정
    $("#couponGrid").kendoExtGrid({
        gridId:"G-CRM-0721-114700"
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

                        params["sDlrCd"] = dlrCd;
                        params["sPkgSeq"] = $("#pkgSeq").data("kendoExtDropDownList").value();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                    model:{
                        id:"cupnNo"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,dlrCd:{type:"string"} //딜러코드
                            ,pkgSeq:{type:"number"} //패키지일련번호
                            ,pkgNm:{type:"string"} //패키지명
                            ,pkgAmt:{type:"number"} //패키지 금액
                            ,pkgCont:{type:"string"} //패키지내용
                            ,cupnSeq:{type:"number"} //쿠폰일련번호
                            ,cupnDestDt:{type:"date"} //쿠폰소멸일
                            ,cupnNm:{type:"string"} //쿠폰명
                            ,cupnValidPrid:{type:"number"} //쿠폰유효기간
                            ,cupnNo:{type:"string"} //쿠폰번호
                            ,cupnCont:{type:"string"} //쿠폰내용
                        }
                    }
            }
        }
        ,autoBind:false
        ,height:280
        ,multiSelectWithCheckbox:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:fa
        /* ,editable:{
             mode:"incell"
            ,confirmation:false
        } */
        ,filterable:false
        ,pageable:false
        //,navigatable:true
        ,sortable:false
        /* ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["cupnNo"] */
        ,edit:function(e){
//            var data = e.model;
                if(e.sender.columns[e.container.index()].field == "cupnNm"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "cupnValidPrid"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "cupnCont"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "cupnTp"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "dcRate"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "dcAmt"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "prenGoodsNm"){
                    this.closeCell();
                }
                if(e.sender.columns[e.container.index()].field == "prenCnt"){
                    this.closeCell();
                }
                /* if(e.sender.columns[e.container.index()].field == "cupnDestDt"){
                    var date1 = kendo.toString(e.model.cupnDestDt, "u").substring(0,10);
                    var arr1 = date1.split('-')
                } */
        }
        ,columns:[
           {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
           ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"al"},width:150}//쿠폰명
           ,{field:"cupnNo", title:"<spring:message code='crm.lbl.cupnNo'/>", attributes:{"class":"ac"},width:120}//쿠폰번호
           ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.cupnValidPrid'/>", attributes:{"class":"ac"} , width:80}//쿠폰유효기간
           ,{field:"cupnDestDt", title:"<spring:message code='crm.lbl.cupnDestDt' />" ,width:80
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
               ,editor:function(container, options) {
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                            format:"<dms:configValue code='dateFormat' />"
                            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                            ,change:function(e){

                                var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
                                var selectDt = kendo.parseDate(kendo.toString(e.sender.value(), '<dms:configValue code='dateFormat' /> 00:00:00'));
                                var oneDay = 1000*60*60*24;

                                var minDate = new Date(sysDate);
                                this.min(new Date(minDate.getFullYear(),minDate.getMonth(),minDate.getDate()+1))

                                // 현재일 보다 이전날짜 선택 불가
                                if ( selectDt/oneDay - sysDate/oneDay < 1 ) {
                                    // 오늘 이후 날짜를 선택해주세요.
                                    //dms.notification.info("<spring:message code='crm.info.todayAfterSelect' />");
                                    return;
                                } else {

                                    var grid = $("#couponGrid").data("kendoExtGrid");
                                    var selectRow = grid.dataItem(grid.select());
                                    selectRow.set("cupnValidPrid", Math.ceil((selectDt - sysDate)/oneDay));

                                };
                            }
                    });
                }
            }
           ,{field:"cupnCont", title:"<spring:message code='crm.lbl.cupnCont'/>", attributes:{"class":"al"}, width:150}//쿠폰설명
           ,{field:"cupnTp", title:"<spring:message code='crm.lbl.cupnTp' />", width:100        // 쿠폰유형
               ,template:'#= cupnTpDSArrVal(cupnTp)#'
           }
           ,{field:"dcRate", title:"<spring:message code='crm.lbl.dcRate'/>", attributes:{"class":"ar"}, width:80     //할인율
               ,format:"{0:n0}"
               ,template:function(dataItem){
                   var spanObj = "";
                       spanObj = dataItem.dcRate + "%";
                   return spanObj;
               }
           }
           ,{field:"dcAmt", title:"<spring:message code='crm.lbl.dcAmt'/>", attributes:{"class":"ar"}, width:80       //상품권 할인 금액
               ,format:"{0:n0}"
           }
           ,{field:"prenGoods", hidden : true}//사은품 용품 코드
           ,{field:"prenGoodsNm", title :"<spring:message code='crm.lbl.prenGoods' />", width :100       //사은품 용품 명
               ,attributes :{"class" :"ac"}
           }
           ,{field:"prenCnt", title:"<spring:message code='crm.lbl.prenCnt'/>", attributes:{"class":"ar"}, width:80       //사은품 수량
               ,format:"{0:n0}"
           }
        ]
    });

}); //end ready

 </script>

