<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="" /> --%>패키지 쿠폰 등록</h1><!-- 패키지 쿠폰 등록 -->
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
        <div class="table_grid">
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
 packageCouponList.push({"pkgSeq":"${obj.pkgSeq}" , "pkgNm":"${obj.pkgNm}"});
 packageCouponMap["${obj.pkgSeq}"] = "${obj.pkgNm}";
 </c:forEach>

$(document).ready(function() {

    /*************************************************************
    *드랍다운 리스트 셋팅
    *************************************************************/

    // 포인트코드 드랍다운 리스트.
    $("#pkgSeq").kendoExtDropDownList({
        dataTextField:"pkgNm"
        , dataValueField:"pkgSeq"
        , optionLabel:" "
        , dataSource:packageCouponList
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


    // 숫자
    $(".numberic").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
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

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/crm/dmm/membership/multiPackageCouponHiss.do' />",
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
                            ,cupnNo:{type:"string"} //쿠폰번호
                            ,cupnCont:{type:"string"} //쿠폰내용
                        }
                    }
            }
        }
        ,multiSelectWithCheckbox:false
        ,height:280
        /* ,editable:{
             mode:"incell"
            ,confirmation:false
        } */
        ,autoBind:false
        ,navigatable:true
        ,sortable:true
        ,pageable:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["cupnNo"]
        ,columns:[
           {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
           ,{field:"dlrCd", title:"", hidden:true}// 딜러코드
           ,{field:"pkgSeq", title:"", attributes:{"class":"ac"}, hidden:true}//패키지일련번호
           ,{field:"pkgNm", title:"", attributes:{"class":"ac"}, hidden:true}//패키지명
           ,{field:"pkgAmt", title:"", attributes:{"class":"ac"}, hidden:true}//패키지 금액
           ,{field:"pkgCont", title:"", attributes:{"class":"ac"}, hidden:true}//패키지 내용
           ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//쿠폰일련번호
           ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"ac"}}//쿠폰명
           ,{field:"cupnNo", title:"<spring:message code='crm.lbl.cupnNo'/>", attributes:{"class":"ac"}}//쿠폰번호
           ,{field:"cupnDestDt", title:"<spring:message code='crm.lbl.cupnUseDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//쿠폰소멸일
           ,{field:"cupnCont", title:"<spring:message code='crm.lbl.cupnCont'/>", attributes:{"class":"ac"}}//쿠폰설명
        ]
    });

}); //end ready

 </script>

