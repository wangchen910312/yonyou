<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 공임선택 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_left">
            <button type="button" id="btnLbrAdd" class="btn_m" ><spring:message code="ser.btn.lbrSave" /></button><!--공임등록  -->
        </div>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
            <button type="button" id="btnSelect" class="btn_m btn_Select" ><spring:message code="global.btn.select" /></button>
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
                    <th scope="row"><spring:message code='ser.lbl.codeGubun' /></th>
                    <td>
                        <input id="sDstinCd" name="sDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.ltsModelCd' /></th>
                    <td>
                        <input type="text" id="sLtsModelCd" name="sLtsModelCd" class="form_comboBox"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th> <!-- 수리유형 -->
                    <td>
                        <input type="text" id="sLbrTp" name="sLbrTp" class="form_comboBox"   />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th>
                    <td>
                        <input type="text" id="sLbrCd" name="sLbrCd" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.rpirNm' /></th>
                    <td>
                        <input type="text" id="sLbrNm" name="sLbrNm" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.lbrCdTp' /></th> <!-- 수리유형 -->
                    <td>
                        <input type="text" id="sLbrCdTp" name="sLbrCdTp" class="form_comboBox"   />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
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

var parentJsonData = parent.laborSearchPopup.options.content.data;

/** 법인구분 **/
var dstinCdList = [];
var dstinNormalCdList = [];
var dstinWrtCdList = [];
var dstinGoodWillCdList = [];
 <c:forEach var="obj" items="${distTpDs}">
     <c:if test="${obj.remark1 eq '02'}" >
         dstinWrtCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:if>
     <c:if test="${obj.remark2 eq '01'}" >
         dstinNormalCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:if>
     <c:if test="${obj.remark3 eq '03'}" >
         dstinGoodWillCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:if>
     dstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 var distCdMap = dms.data.arrayToMap(dstinCdList, function(obj){return obj.cmmCd});


/** 브랜드 코드 **/
var brandCdList = [];
 <c:forEach var="obj" items="${brandCdDs}">
 brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});


//수리유형
var lbrTpCdList =[];
<c:forEach var="obj" items="${lbrTpCdDs}">
    <c:if test='${obj.useYn eq "Y"}' >
        lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var lbrTpCdMap = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});


//공임코드유형
var lbrCdTpList =[];
<c:forEach var="obj" items="${lbrCdTpDs}">
lbrCdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrCdTpMap = dms.data.arrayToMap(lbrCdTpList, function(obj){return obj.cmmCd;});


//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});


// 구분
dstinCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(distCdMap[val] != undefined)
            returnVal = distCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//수리유형
setLbrTpCdMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(lbrTpCdMap[value] != undefined)
            resultVal = lbrTpCdMap[value].cmmCdNm
    }

    return resultVal;
};

//공임코드유형
setLbrCdTpMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(lbrCdTpMap[value] != undefined)
            resultVal = lbrCdTpMap[value].cmmCdNm
    }

    return resultVal;
};

//LTS MODEL NM
setLtsModel = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(ltsMap[value] != undefined)
            resultVal = ltsMap[value].cmmCdNm
    }

    return resultVal;
};

$(document).ready(function(e){

    $("#sLbrCd").bind("keyup",function(){
        $(this).val($(this).val().toUpperCase());
    });

    if(!dms.string.isEmpty(parentJsonData.sRoTp)){
        if(parentJsonData.sRoTp == "02"){
            if(parentJsonData.sGoodwillYn == "Y"){
                dstinCdList = dstinGoodWillCdList;
            } else {
                dstinCdList = dstinWrtCdList;
            }
        }else{
            dstinCdList = dstinNormalCdList;
        }
    }

    if(parentJsonData.sButtonEnable == "N"){
        $("#btnLbrAdd").hide();
    }

    $("#sReadOnly").val( (parentJsonData.sReadOnly == undefined || parentJsonData.sReadOnly == "") ? "N":parentJsonData.sReadOnly  );
    $("#sClose").val( (parentJsonData.sClose == undefined || parentJsonData.sClose == "") ? "N":parentJsonData.sClose  );

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    //구분
    $("#sDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dstinCdList
       ,optionLabel:(parentJsonData.sRoTp == "02") ? "" : "<spring:message code='global.lbl.all' />"
       ,value:(parentJsonData.sDstinCd != undefined) ?  parentJsonData.sDstinCd : ""
    });

    //LTS MODEL CODE
    $("#sLtsModelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,template:"[#=cmmCd#] #= setLtsModel(cmmCd) #"
        ,valueTemplate:"[#=cmmCd#] #= setLtsModel(cmmCd) #"
        ,dataSource:ltsModelCdList
        ,value : parentJsonData.sLtsModelCd
        //,enable : false  jia
        ,enable : true
    });

    //수리유형
    $("#sLbrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource: lbrTpCdList
        ,optionLabel : " "
    });

    //수리유형
    $("#sLbrCdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource: lbrCdTpList
        ,optionLabel : " "
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 닫기 버튼.
    $("#btnLbrAdd").kendoButton({
        click:function(e){
            parent.parent._createOrReloadTabMenu("<spring:message code='ser.menu.ltsModelMng' />", "<c:url value='/ser/svi/laborManage/selectLaborCodeManageMain.do'/>", "VIEW-D-10370");
        }
    });

    //선택 버튼
    $("#btnSelect").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            var selectedVal = grid.dataItem(rows);

            if(parentJsonData.sCauLbrYn != undefined ){
                if(selectedVal.relCauLbrYn == "N"){
                    dms.notification.warning("<spring:message code='ser.lbl.notSelectMainLbrCd' />");
                    return;
                }
            }

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
        gridId:"G-SER-1011-000017"
        ,dataSource:{
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
                        params["sLtsModelCd"] = $("#sLtsModelCd").data("kendoExtDropDownList").value();
                        params["sLbrTp"] = $("#sLbrTp").data("kendoExtDropDownList").value();
                        params["sLbrCdTp"] = $("#sLbrCdTp").data("kendoExtDropDownList").value();
                        //params["sBrandCd"] = $("#sBrandCd").val();
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
                       ,allocLbrHm:{ type:"number"}
                       ,validStartDt:{ type:"date"}
                       ,validEndDt:{ type:"date"}
                       ,dstinCd:{ type:"string"}
                    }

                }//model
            }//schema
        }//dataSource
        ,selectable:parentJsonData.selectable === "multiple"? "multiple,row":"row"
        ,height:270
        ,scrollable:true
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,autoBind:(parentJsonData.autoBind == false || parentJsonData.autoBind == undefined) ? false:true
        ,columns:[
               {field:"dstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:80, sortable:true, attributes :{"class":"ac"}
                   ,template:"#=dstinCdGrid(dstinCd)#"
                   ,editor:function(container, options){
                       $('<input required name="dstinCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:dstinCdList
                       });
                   }
               }
              ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100, sortable:true
                  ,attributes :{"class":"ac"}
                  ,template:"#= setLbrTpCdMap(lbrTp) #"
                      ,editor:function(container, options) {
                            $('<input required name="lbrTp" data-name="<spring:message code="ser.lbl.lbrTp" />" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataTextField: "cmmCd"
                               //,template:"[#:cmmCd#] #= cmmCdNm #"
                               ,dataSource:ltsModelCdList
                               ,change:setLtsModelNm
                           });
                            $('<span class="k-invalid-msg" data-for="ltsModelCd"></span>').appendTo(container);
                        }
              }
              ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, sortable:true, attributes :{"class":"al"}}
              ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, sortable:false, attributes :{"class":"al"}}
              ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:80, sortable:false, attributes :{"class":"ac"},hidden:true}
              ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ac"}}
              ,{field:"allocLbrHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ac"}} //배분공임
              ,{field:"payLbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ac"}}//유료공임
              ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ac"}}
              ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:80, sortable:false  , attributes :{"class":"ac"}}
              ,{field:"validStartDt", title:"<spring:message code='ser.lbl.validStartDt' />", width:80, sortable:false
                , attributes:{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' />}"
                }
              ,{field:"validEndDt", title:"<spring:message code='ser.lbl.validEndDt' />", width:80, sortable:false
                , attributes:{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' />}"
              }
             ,{field:"lbrCdTp", title:"<spring:message code='ser.lbl.lbrCdTp' />", width:80, sortable:false  , attributes :{"class":"ac"}
                 ,template:"#=setLbrCdTpMap(lbrCdTp)#"
             }
             ,{field:"relCauLbrYn", width:80, sortable:false , hidden: true  }

         ]

    });

    if(parentJsonData.sRoTp == "01"){
        $("#sLtsModelCd").data("kendoExtDropDownList").enable(true);
    }
    if(parentJsonData.sRoTp == "02"){
       $("#sLtsModelCd").data("kendoExtDropDownList").enable(false);     //2019/07/17田佳兴修改保修索赔维修项目车型类型为不能修改
    }
});
</script>
