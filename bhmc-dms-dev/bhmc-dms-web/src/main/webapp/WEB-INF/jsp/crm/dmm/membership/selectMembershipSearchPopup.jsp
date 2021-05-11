<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <c:set value="${policy}" var="membershipStan" /> <!-- C:고객, V:자동차 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" >
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
                            <input type="text" id="sSeq" name="sSeq" value="" class="form_input">
                        </td>
                <c:choose>
                    <c:when test="${membershipStan eq 'V'}">
                        <th scope="row"><spring:message code='global.lbl.vinNum'/></th> <!-- VIN NO -->
                        <td>
                            <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input">
                        </td>
                    </c:when>
                    <c:when test="${membershipStan eq 'C'}">
                        <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                        <td>
                            <input type="text" id="sCustNm" name="sCustNm" value="" class="form_input">
                        </td>
                    </c:when>
                    <c:otherwise>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </c:otherwise>
                </c:choose>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="membershipPopupGrid"></div>
        </div>
    </section>

 <script type="text/javascript">


    $(document).ready(function() {

        /*************************************************************
                드랍다운 리스트 셋팅
        *************************************************************/
        var options = parent.popupWindow.options.content.data;

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

        // 멤버십 그리드 ( default : 고객기준 )
        var membershipGridColumn = [
                                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                                    ,{field:"membershipNo" , title:"<spring:message code='global.lbl.membershipNo'/>",  attributes:{"class":"ac"}}
                                    ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  attributes:{"class":"al"}}
                                    ,{field:"gradeNm" , title:"<spring:message code='global.lbl.gradeCd' />", sortable:false, attributes:{"class":"ac"}}
                                    ,{field:"hpNo"    , title:"<spring:message code='global.lbl.hpNo' />", attributes:{"class":"ac"}}
        ];

        <!-- 차량기준일때 그리드에 차량 정보를 보여준다. 제일 뒤에 추가 후 그리드 개인화로 순서를 정렬한다.-->
        <c:choose>
             <c:when test="${membershipStan eq 'V'}">
                membershipGridColumn.push(
                        {field:"vinNo" , title:"<spring:message code='global.lbl.vinNo' />",  width:150, attributes:{"class":"al"}}
                );
             </c:when>
        </c:choose>

        //그리드 설정 (그룹 CRUD)
        $("#membershipPopupGrid").kendoExtGrid({
            gridId:"G-CRM-0809-200825"
            ,dataSource:{
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

                            params["sMembershipNo"]         = $("#sSeq").val();
                            params["sCustNm"]               = $("#sCustNm").val();
                            params["sVinNo"]                = $("#sVinNo").val();
                            //console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                     model:{
                         id:"membershipNo"
                        , fields:{
                             rnum         :{type:"string", editable:false} // No
                            ,membershipNo :{type:"string", editable:false} // 멤버십 번호
                            ,custNm       :{type:"string", editable:false} // 고객명
                            ,gradeNm      :{type:"string", editable:false} // 등급명
                            ,hpNo         :{type:"string", editable:false} // 핸드폰 번호
                            ,vinNo        :{type:"string", editable:false} // vin
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
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,selectable:"row"
            ,height:305
            ,columns:membershipGridColumn
        });

        // 그리드 더블 클릭 이벤트.
        $("#membershipPopupGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

    });
</script>