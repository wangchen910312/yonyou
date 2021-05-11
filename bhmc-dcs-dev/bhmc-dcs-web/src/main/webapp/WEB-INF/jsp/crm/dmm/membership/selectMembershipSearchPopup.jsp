<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.membershipNo'/></th> <!-- 멤버십번호 -->
                        <td>
                            <input type="text" id="sSeq" name="sSeq" value="" class="form_input numberic">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                        <td>
                            <input type="text" id="sCustNm" name="sCustNm" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.vinNum'/></th> <!-- VIN NO -->
                        <td>
                            <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="membershipPopupGrid"></div>
        </div>
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">


$(document).ready(function() {

    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/
    var options = parent.popupWindow.options.content.data;

    // 숫자
    $(".numberic").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });


    // 검색 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            $("#membershipPopupGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#membershipPopupGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                })
                options.callbackFunc(data);
                parent.popupWindow.close();
            } else {
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });

    //그리드 설정 (그룹 CRUD)
    $("#membershipPopupGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/dmm/membership/selectMembershipsPopup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCustNm"]               = $("#sCustNm").val();
                        params["sVinNo"]               = $("#sVinNo").val();
                        params["sSeq"]                 = $("#sSeq").val();

                        console.log(params);

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"seq"
                    , fields:{
                        rnum         :{type:"string", editable:false} // No
                        , membershipNo         :{type:"string", editable:false} // 멤버십 번호
                        , custNo       :{type:"string", editable:false} // 고객번호
                        , custNm       :{type:"string", editable:false} // 고객명
                        , carRegNo       :{type:"string", editable:false} // 차량번호
                        , vinNo         :{type:"string", editable:false} //  vin
                        , rechargeYn        :{type:"string", editable:false} // 충전식
                        , pointYn    :{type:"string", editable:false} // 포인트식
                        //, gradeCd     :{type:"string", editable:false} // id카드번호
                        , hpNo    :{type:"string", editable:false} // 운전면허증번호
                        , telNo     :{type:"string", editable:false} // 관증번호
                        , mathDocTp     :{type:"string", editable:false} // 주요인증문서유형
                        , idCardNo     :{type:"string", editable:false} // ID카드번호
                        , drivingNo     :{type:"string", editable:false} // 운전면허증번호
                        , officeNo     :{type:"string", editable:false} // 관증번호
                        , passportNo   :{type:"string", editable:false} // 여권번호
                        , otherNo      :{type:"string", editable:false} // 기타번호
                        , cardNo      :{type:"string", editable:false} // 카드번호
                    }
                }
            }
            ,requestEnd:function(e){
                if (e.type !== "read"){
                    //this.page(1);
                }
            }
            ,serverSorting:false
        }
        ,autoBind:false
        ,multiSelectWithCheckbox:false
        ,selectable:"row"
        ,columns:[
                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                    , {field:"membershipNo" , title:"<spring:message code='global.lbl.membershipNo'/>",  width:40, attributes:{"class":"ac"}} //멤버십번호
                    , {field:"custCd" , hidden:true,title:"<spring:message code='global.lbl.custNo' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"carRegNo" , title:"<spring:message code='global.lbl.carRegNo' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"vinNo" , title:"<spring:message code='global.lbl.vinNo' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"rechargeYn" , hidden:true,title:"<spring:message code='global.lbl.rechargeYn' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"pointYn" , hidden:true,title:"<spring:message code='global.lbl.pointYn' />",  width:30, attributes:{"class":"ac"}}
                    //, {field:"gradeCd" , hidden:true,title:"<spring:message code='global.lbl.gradeCd' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"hpNo"   , hidden:true,title:"<spring:message code='global.lbl.hpNo' />", width:60, attributes:{"class":"ac"}}
                    , {field:"telNo"  , hidden:true, title:"<spring:message code='global.lbl.homeTelNo' />", width:60, attributes:{"class":"ac"}}
                    , {field:"mathDocTp" , hidden:true,title:"<spring:message code='global.lbl.mathDocTp' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"idCardNo" , hidden:true,title:"<spring:message code='global.lbl.idCardNo' />",  width:30, attributes:{"class":"ac"}}
                    , {field:"drivingNo" , hidden:true,title:"운전면허증번호",  width:30, attributes:{"class":"ac"}}
                    , {field:"officeNo" , hidden:true,title:"관증번호",  width:30, attributes:{"class":"ac"}}
                    , {field:"passportNo" , hidden:true,title:"여권번호",  width:30, attributes:{"class":"ac"}}
                    , {field:"otherNo" , hidden:true,title:"기타번호",  width:30, attributes:{"class":"ac"}}
                    , {field:"cardNo" , hidden:true,title:"기타번호",  width:30, attributes:{"class":"ac"}}

                ]
        ,navigatable:false
        ,sortable:false
        ,resizable:false
        ,height:245
    });

    // 그리드 더블 클릭 이벤트.
    $("#membershipPopupGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});

 </script>

