<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정책이력현황 -->
<div id="resizableContainer">
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.policyHistory' /></h1> <!-- 정책이력현황 -->
		<div class="btn_right">
            <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button>  <!-- 상세 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>         <!-- 조회 -->
		</div>
	</div>
	<div class="table_form" role="search" data-btnid="btnSearch">
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:10%;">
				<col style="width:23%;">
				<col style="width:10%;">
				<col style="width:23%;">
				<col style="width:10%;">
				<col style="width:24%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><spring:message code='global.lbl.carType' /></th>   <!-- 차량유형 -->
                    <td>
                        <input id="sPolicyTp" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
				</tr>
			</tbody>
		</table>
	</div>

    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>

</section>
</div>
<!-- //정책이력현황 -->



<section id="callPolicyHistoryWindow" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
        <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button> <!-- 닫기 -->
        </div>
    </div>

    <div class="table_form form_width_20per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>   <!-- 차량유형 -->
                    <td>
                        <input id="tpCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.policyCont' /></th>    <!--정책설명 -->
                    <td>
                        <textarea id="policyCont" rows="7" cols="" readonly class="form_textarea form_readonly"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>



<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var sTpCd  = "${sTpCd}";

//차량유형 SAL142
var typeTpDSList = [];
var typeTpObj = {};
<c:forEach var="obj" items="${typeTpDS}">
    typeTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    typeTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


var popupWindow;

/******************************************
 * ready ()
 ****************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callPolicyHistoryWindow").kendoWindow({
        animation :false
        ,draggable:true
        ,pinned:true        // 팝업스크롤링 막음
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.policyHistory' />"      //정책이력현황
        ,width:"600px"
        ,height:"200px"
    }).data("kendoWindow");

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    // 차량유형 : 검색
    $("#sPolicyTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       , optionLabel:" "
    });

    // 차량유형
    $("#tpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       , optionLabel:" "
    });
    $("#tpCd").data("kendoExtDropDownList").value(dms.string.strNvl(sTpCd));

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                refreshAll();
                fn_gridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    // 닫기 버튼
    $("#btnClose").kendoButton({
        click:function(e){
            $("#callPolicyHistoryWindow").data("kendoWindow").close();
        }
    });

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0930-113001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/specialCarPolicy/selectPolicyHistorySearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPolicyTp"] = $("#sPolicyTp").data("kendoExtDropDownList").value();
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"seq",
                    fields:{
                        rnum:{type:"number", editable:false}
                        ,policyTp:{type:"string", editable:false}   // 정책유형
                        ,seq:{type:"number", editable:false}        // 일련번호
                        ,policyCont:{type:"string"}                 // 정책내용
                        ,updtUsrId:{type:"string"}                  // 수정자ID
                        ,updtDt:{type:"date"}                       // 수정일자
                        ,updtDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,appendEmptyColumn:true           //빈컬럼 적용
       ,height:435
       ,editable:false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       ,columns:[
          {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
          }
          ,{field:"policyTp", title:"<spring:message code='global.lbl.carType' />", attributes:{"class":"al"}, width:100
              ,template :"#= dms.string.strNvl(typeTpObj[policyTp]) #"
          }   //차량유형
          ,{field:"seq", hidden:true}
          ,{field:"policyCont", title:"<spring:message code='global.lbl.policyCont' />", attributes:{"class":"al"}, width:500}  // 정책설명
          ,{field:"updtUsrId", title:"<spring:message code='global.lbl.updtUsrId' />", attributes:{"class":"al"}, width:120}   // 수정자
          ,{field:"updtDtFormat", title:"<spring:message code='global.lbl.updtDt' />", width:120
              ,attributes:{"class":"ac tooltip-enabled"}
              ,template:"#= kendo.toString(data.updtDt, '<dms:configValue code='dateTimeFormat' />') #"
          }
       ]
   });

    // 그리드 더블클릭.
    $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#mainGrid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());

        refreshAll();
        fn_gridDBclick(selectedItem);
        viewDetailPopup();
    });


    fn_gridDBclick = function(selectedItem){
        if( selectedItem != null && selectedItem != 'undefined'){
            $("#tpCd").data("kendoExtDropDownList").value(selectedItem.policyTp);
            $("#tpCd").data("kendoExtDropDownList").enable(false);
            $("#policyCont").val(selectedItem.policyCont);
        }
    }

});
/******************************************
 * ready () = End =
 ******************************************/

//초기화
function refreshAll() {
    $("#tpCd").data("kendoExtDropDownList").enable(true);
    $("#tpCd").data("kendoExtDropDownList").value("");
    $("#policyCont").val();
}

//상세내용 팝업 호출
 function viewDetailPopup(){
     var win = $("#callPolicyHistoryWindow").data("kendoWindow").center().open();
 }

//-->
</script>