<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnPreCheck" class="btn_m btn_Search"><spring:message code="ser.title.preCheck" /></button>
            <button type="button" id="btnConfirm" class="btn_m btn_Select"><spring:message code="ser.btn.confirm" /></button>
        </div>
    </div>

    <div>
        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>
    </div>
    <input type="hidden" id="sLinkType" name="sLinkType">
</section>


<script type="text/javascript">

$(document).ready(function() {


    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
    var childData = parent.preChkInfoPopup.options.content.data;

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnConfirm").click();
    });

    /************************************************************
            조회조건 설정
    *************************************************************/


    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 선택 버튼.
    $("#btnConfirm").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);

            if(selectedVal !== null)
            {
                childData.callbackFunc(selectedVal);
                parent.preChkInfoPopup.close();
            }else{
                dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                return;
            }
        }
    });
    // 사전점검 이동 버튼.
    $("#btnPreCheck").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);

            if(selectedVal !== null)
            {
               /*  var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                childData.callbackFunc(data);
                parent.preChkInfoPopup.close(); */

                parent.parent._createOrReloadTabMenu("<spring:message code='ser.menu.preCheckCreate' />", "<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>?diagDocNo="+selectedVal.diagDocNo, "VIEW-D-10333");

            }else {
                dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                return;
            }
        }
    });


    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0127-000001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/preCheck/selectPreChkMappingInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = childData.vinNo;
                        params["sPopupYn"] = "Y";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         vinNo:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,carOwnerNm:{type:"string"}
                        ,preChkDt:{type:"date"}
                    }
                }
            }
        }
        ,autoBind:true
        ,selectable: "row"
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,pageable:true
        ,height:310
        ,columns:[
              {field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:140 ,attributes:{"class":"al"}}         //VIN
             ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100, attributes:{"class":"al"} }  //차량번호
             ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:120, attributes:{"class":"al"}} //고객명
             ,{field:"driverNm", title:"<spring:message code='ser.lbl.driverCust' />", width:120, attributes:{"class":"al"}} //운전자
             ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:100, attributes:{"class":"al"}}  //사전점검번호
             ,{field:"preChkDt", title:"<spring:message code='ser.lbl.preChkDt' />", width:100, attributes:{"class":"ac"}
                 , format:"{0:<dms:configValue code='dateFormat' />}"
             }      //사전점검일자
             ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.preChkNm' />", width:100, attributes:{"class":"al"}}   //사전점검자
            ]
    });

});

</script>
