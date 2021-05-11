<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 공임선택 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
            <button type="button" id="btnSelect" class="btn_m btn_Select" ><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnClose" class="btn_m btn_close" ><spring:message code="global.btn.close" /></button> --%>
        </div>
    </div>
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.gubun' /></th>
                    <td>
                        <input id="sDstinCd" name="sDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.brand' /></th>
                    <td>
                        <input id="sBrandCd" name="sBrandCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th>
                    <td>
                        <input id="sLbrCd" name="sLbrCd" type="text" class="form_input"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.lbrNm' /></th>
                    <td colspan="5">
                        <input id="sLbrNm" name="sLbrNm" type="text" class="form_input"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <input type="hidden" id="sLtsModelCd" name="sLtsModelCd" />
    <input type="hidden" id="sDlrCd" name="sDlrCd" />
    <input type="hidden" id="sReadOnly" name="sReadOnly" />
    <input type="hidden" id="sClose" name="sClose" />

    <div class="table_grid mt10">
        <!-- 그리드1 -->
         <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
    </div>

</section>
<!-- 공임선택 팝업 -->

<script type="text/javascript">


/** 법인구분 **/
var dstinCdList = [];
 <c:forEach var="obj" items="${distTpDs}">
 dstinCdList.push({
     cmmCdNm:"${obj.cmmCdNm}"
     , cmmCd:"${obj.cmmCd}"
 });
 </c:forEach>
 var distCdMap = dms.data.arrayToMap(dstinCdList, function(obj){return obj.cmmCd});


/** 브랜드 코드 **/
var brandCdList = [];
 <c:forEach var="obj" items="${brandCdDs}">
 brandCdList.push({
     cmmCdNm:"${obj.cmmCdNm}"
     , cmmCd:"${obj.cmmCd}"
 });
 </c:forEach>

 var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});



$(document).ready(function(e){

    var parentJsonData = parent.laborSearchPopup.options.content.data;

    $("#sLtsModelCd").val(parentJsonData.sLtsModelCd);
    $("#sReadOnly").val( (parentJsonData.sReadOnly == undefined || parentJsonData.sReadOnly == "") ? "N":parentJsonData.sReadOnly  );
    $("#sClose").val( (parentJsonData.sClose == undefined || parentJsonData.sClose == "") ? "N":parentJsonData.sClose  );

    var bFlag = ($("#sReadOnly").val() == "Y") ?  true:false;
    //$("#sDstinCd").prop("readOnly", bFlag).addClass("form_readonly");

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });


    //구분
    $("#sDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dstinCdList
       //,index:(parentJsonData.sSort == undefined  ) ? 1:parentJsonData.sSort

    });
    //브랜드
    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:brandCdList
       ,index:0

    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.laborSearchPopup.close();
        }
    });

    //선택 버튼
    $("#btnSelect").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0 ){
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            if(rows != null){

                var data = [];

                $.each( rows  , function(idx , obj){
                    data.push(grid.dataItem(obj));
                });

                parentJsonData.callbackFunc(data);


                if($("#sClose").val() == "Y")parent.laborSearchPopup.close();

            } // end if
        } // end function

    });// end kendoButton



    $("#grid").kendoExtGrid({

        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/laborManage/selectLaborCodePopups.do' />"

                }//read
                ,parameterMap:function( options, operation ){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDstinCd"] = $("#sDstinCd").val();
                        params["sLtsModelCd"] = $("#sLtsModelCd").val();
                        params["sBrandCd"] = $("#sBrandCd").val();
                        params["sLbrCd"] = $("#sLbrCd").val();
                        params["sLbrNm"] = $("#sLbrNm").val();


                        return kendo.stringify(params);
                    }else if(operation !="read" && options.models){

                        return kendo.stringify(optios.models);

                    }
                }//parameterMap
            }//transport
            ,schema:{
                model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{ type:"number"}
                       ,lbrCd:{ type:"string"}
                       ,lbrNm:{ type:"string"}
                       ,lbrQty:{ type:"number"}
                       ,lbrHm:{ type:"number"}
                       ,lbrRate01:{ type:"number"}
                       ,lbrRate02:{ type:"number"}
                       ,lbrRate03:{ type:"number"}
                       ,lbrRate04:{ type:"number"}
                       ,lbrRate05:{ type:"number"}
                       ,validStartDt:{ type:"date"}
                       ,validEndDt:{ type:"date"}
                    }

                }//model
            }//schema
        }//dataSource
       ,selectable:parentJsonData.selectable === "multiple"? "multiple,row":"row"
       ,height:270
       ,editable:false
       ,autoBind:(parentJsonData.autoBind == false || parentJsonData.autoBind == undefined) ? false:true
       ,multiSelectWithCheckbox:true
       ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, sortable:true, attributes :{"class":"al"}}
                  ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250, sortable:false, attributes :{"class":"al"}}
                  ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:50, sortable:false, attributes :{"class":"ac"}}
                  ,{field:"lbrRate01", title:"<spring:message code='ser.lbl.genInfo' />", width:50, sortable:false, attributes :{"class":"ac"}, hidden:true}
                  ,{field:"lbrRate02", title:"<spring:message code='ser.lbl.wart' />", width:50, sortable:false, attributes :{"class":"ac"}, hidden:true}
                  ,{field:"lbrRate03", title:"<spring:message code='ser.lbl.insurance' />", width:50, sortable:false, attributes :{"class":"ac"}, hidden:true}
                  ,{field:"lbrRate04", title:"<spring:message code='ser.lbl.inside' />", width:50, sortable:false, attributes :{"class":"ac"}, hidden:true}
                  ,{field:"lbrRate05", title:"<spring:message code='ser.lbl.paitPlate' />", width:50, sortable:false, attributes :{"class":"ac"}, hidden:true}
                  ,{field:"validStartDt", title:"<spring:message code='ser.lbl.validStartDt' />", width:80, sortable:false
                    , attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                    }
                 ,{field:"validEndDt", title:"<spring:message code='ser.lbl.validEndDt' />", width:80, sortable:false
                    , attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                 }
             ]

    });

});
</script>
