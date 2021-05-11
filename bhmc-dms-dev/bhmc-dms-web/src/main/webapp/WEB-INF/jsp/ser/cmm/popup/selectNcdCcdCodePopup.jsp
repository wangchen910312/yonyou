<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="ser.title.cauPhenSearch" /></h1> --%>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button type="button" class="btn_m btn_apply" id="btnApply"><spring:message code="global.btn.apply" /></button><!-- 적용 -->
            <%-- <button type="button" class="btn_m btn_close" id="btnClose"><spring:message code="global.btn.close" /></button><!-- 닫기 --> --%>
        </div>
    </div>

    <!-- 영역1 -->
    <div class="clfix" id="causeDiv" >
        <div class="left_areaStyle" style="width:66%">
            <div class="header_area btn_none pt0">
                <h2 class="title_basic"><spring:message code="ser.lbl.phenomenon" /></h2><!-- 현상 -->
            </div>
            <div class="clfix">
                <div class="left_areaStyle" style="width:49%">
                    <div class="table_grid">
                        <div id="grid1"></div>
                    </div>
                    <div class="table_grid mt10">
                        <div id="grid2"></div>
                    </div>
                </div>
                <div class="right_areaStyle">
                    <div class="table_grid">
                        <div id="grid3"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="right_areaStyle" style="width:33%">
            <div class="header_area btn_none pt0">
                <h2 class="title_basic"><spring:message code="ser.lbl.cause" /></h2><!-- 원인 -->
            </div>
            <div class="table_grid">
                <div id="grid4"></div>
            </div>
        </div>
    </div>
    <!-- //영역1 -->

    <!-- 영역2 -->
    <div class="clfix" id="paintDiv" >
        <div class="left_areaStyle">
            <div class="header_area btn_none pt0">
                <h1 class="title_basic"><spring:message code="ser.lbl.phenomenon" /></h1><!-- 현상 -->
            </div>
            <div class="table_grid">
                <div id="grid5"></div>
            </div>
        </div>
        <div class="right_areaStyle">
            <div class="header_area btn_none pt0">
                <h1 class="title_basic"><spring:message code="ser.lbl.cause" /></h1><!-- 원인 -->
            </div>
            <div class="table_grid ">
                <div id="grid6"></div>
            </div>
        </div>
    </div>
    <!-- //영역2 -->

    <div class="table_form form_width_50per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.phenomenon" /></th><!-- 원인 -->
                    <td class="readonly_area">
                        <input type="text" id="phenCd" name="phenCd" class="form_input" readonly style="width:80px" />
                        <input type="text" id="phenNm" name="phenNm" class="form_input" readonly style="width:50%;" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cause" /></th><!-- 현상 -->
                    <td class="readonly_area">
                        <input type="text" id="cauCd" name="cauCd" class="form_input" readonly style="width:80px" />
                        <input type="text" id="cauNm" name="cauNm" class="form_input" readonly style="width:50%;" />
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
     <input type="hidden" id="itemCd"  />
     <input type="hidden" id="sClsCd"  />
     <input type="hidden" id="sPhenCd"  />

</section>
<!-- //현상원인 팝업 -->

<!-- script -->
<script>
$(document).ready(function() {


    var parentJsonData = parent.phenCauCodeWin.options.content.data;
    var paintYn = (parentJsonData.paintYn == undefined) ? "C":parentJsonData.paintYn;

    (paintYn == "C" || paintYn == undefined) ? $("#causeDiv").show():$("#causeDiv").hide();
    (paintYn == "P" ) ? $("#paintDiv").show():$("#paintDiv").hide();


   /**************** 코드 데이터 ****************************/
    //상태 코드
    var levelDstinList = [];
     <c:forEach var="obj" items="${levelDstinDs}">
         levelDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var levelDstinMap = dms.data.arrayToMap(levelDstinList, function(obj){return obj.cmmCd;});

   /**************** 코드 데이터 ****************************/
   /**************** 버튼 이벤트****************************/

    /** 조회 버튼. **/
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid1").data("kendoExtGrid").dataSource.read();
            $("#grid4").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnApply").kendoButton({
        click:function(e){

            if($("#phenCd").val() == ""){
                msgText = "<spring:message code='ser.lbl.phenCd' var='ser_lbl_phenCd' />"+
                          "<spring:message code='global.info.chkSelectItemMsg' arguments='${ser_lbl_phenCd}' />";
                dms.notification.warning(msgText);

                return;
            }
            if($("#cauCd").val() == ""){
                msgText = "<spring:message code='ser.lbl.cauCd' var='ser_lbl_cauCd' />"+
                          "<spring:message code='global.info.chkSelectItemMsg' arguments='${ser_lbl_cauCd}' />";
                dms.notification.warning(msgText);
                return;
            }

            var data = [];
            data.push({phenCd:$("#phenCd").val()
                      ,phenNm:$("#phenNm").val()
                      ,cauCd:$("#cauCd").val()
                      ,cauNm:$("#cauNm").val()});

            parentJsonData.callbackFunc(data);
            parent.phenCauCodeWin.close();


        }
    });

    // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.phenCauCodeWin.close();
        }
    });

   /**************** 버튼 이벤트****************************/

   /**************** GRID 데이터 ****************************/
    $("#grid1").kendoExtGrid({
        gridId:"G-SER-1011-000018"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/ncCode/selectNcdCodeLclsPopups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation == "read"){
                         // 검색 조건을 파라미터로 담는다.
                        var params = {};

                        params["sItemCd"] = parentJsonData.itemCd;
                        params["sClsCd"] = $("#sClsCd").val();
                        params["sPhenCd"] = $("#sPhenCd").val();

                        return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  total:"total"
                 ,model:{
                     id:"lClsCd"
                    ,fields:{
                           lClsCd:{type:"string" , editable:false}
                         , lCdNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,pageable:false
        ,dataBound:false
        ,autoBind:(parentJsonData.paintYn == "C") ? true:false
        ,height:120
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){

          var selectedVal = this.dataItem(this.select());
          var grid2 = $('#grid2').data('kendoExtGrid');
          var grid3 = $('#grid3').data('kendoExtGrid');

          var sPhenCd = selectedVal.lClsCd;
          var sClsCd = "M";

            $("#sClsCd").val(sClsCd);
            $("#sPhenCd").val(sPhenCd);

            grid2.dataSource.data([]);
            grid3.dataSource.data([]);
            grid2.dataSource.read();

        }
        ,columns:[
               {field:"lClsCd", title:"<spring:message code='ser.lbl.phenLclsCd' />", width:60,sortable:false,attributes:{"class":"ac"}}
              ,{field:"lCdNm", title:"<spring:message code='ser.lbl.phenLclsNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });

    $("#grid2").kendoExtGrid({
        gridId:"G-SER-1011-000019"
        ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ncCode/selectNcdCodeMclsPopups.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};

                         params["sItemCd"] = parentJsonData.itemCd;
                         params["sClsCd"] = $("#sClsCd").val();
                         params["sPhenCd"] = $("#sPhenCd").val();

                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"mClsCd"
                    ,fields:{
                           mClsCd:{type:"string" , editable:false}
                         , mCdNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,pageable:false
        ,navigatable:true
        ,autoBind:(parentJsonData.paintYn == "C") ? true:false
        ,height:130
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var grid3 = $('#grid3').data('kendoExtGrid');
            var selectedVal = this.dataItem(this.select());
            var sPhenCd = selectedVal.mClsCd;
            var sClsCd = "S";

            $("#sClsCd").val(sClsCd);
            $("#sPhenCd").val(sPhenCd);

            grid3.dataSource.data([]);
            grid3.dataSource.read();
        }
        ,columns:[
               {field:"mClsCd",title:"<spring:message code='ser.lbl.phenMclsCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
              ,{field:"mCdNm", title:"<spring:message code='ser.lbl.phenMclsNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });

    $("#grid3").kendoExtGrid({
        gridId:"G-SER-1011-000020"
        ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ncCode/selectNcdCodeSclsPopups.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};

                         params["sItemCd"] = parentJsonData.itemCd;
                         params["sClsCd"] = $("#sClsCd").val();
                         params["sPhenCd"] = $("#sPhenCd").val();

                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"phenCd"
                    ,fields:{
                           phenCd:{type:"string" , editable:false}
                         , phenNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,autoBind:(parentJsonData.paintYn == "C") ? true:false
        ,pageable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            $("#phenCd").val(selectedVal.phenCd);
            $("#phenNm").val(selectedVal.phenNm);
        }
        ,height:260
        ,columns:[
                {field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:30, sortable:false, attributes:{"class":"ac"}}
               ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });

    $("#grid4").kendoExtGrid({
        gridId:"G-SER-1011-000021"
        //  dataSource:""
        ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ncCode/selectCcdCodePopups.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {}; //sCauDstinCd
                         params["sCauDstinCd"] = parentJsonData.paintYn;

                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"cauCd"
                    ,fields:{
                        cauCd:{type:"string" , editable:false}
                      , cauNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,autoBind:(parentJsonData.paintYn == "C") ? true:false
        ,pageable:false
        ,dataBound:false
        ,height:260
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            $("#cauCd").val(selectedVal.cauCd);
            $("#cauNm").val(selectedVal.cauNm);
        }
        ,columns:[
                 {field:"cauCd", title:"<spring:message code='ser.lbl.cause' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });

    $("#grid5").kendoExtGrid({
        gridId:"G-SER-1011-000022"
        ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ccCode/selectCcdCodePopups.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};

                         params["sCauDstinCd"] = parentJsonData.paintYn;
                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"cauCd"
                    ,fields:{
                        cauCd:{type:"string" , editable:false}
                      , cauNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,pageable:false
        ,autoBind:(parentJsonData.paintYn == "P") ? true:false
        ,dataBound:false
        ,height:270
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            $("#phenCd").val(selectedVal.cauCd);
            $("#phenNm").val(selectedVal.cauNm);
        }
        ,columns:[
                 {field:"cauCd", title:"<spring:message code='ser.lbl.phenCd' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"cauNm", title:"<spring:message code='ser.lbl.phenNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });

    $("#grid6").kendoExtGrid({
        gridId:"G-SER-1011-000023"
        ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ccCode/selectCcdCodePopups.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["sCauDstinCd"] = parentJsonData.paintYn;

                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"cauCd"
                    ,fields:{
                        cauCd:{type:"string" , editable:false}
                      , cauNm:{type:"string" , editable:false}
                     }
                 }
             }
         }
        ,pageable:false
        ,autoBind:(parentJsonData.paintYn == "P") ? true:false
        ,dataBound:false
        ,height:270
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            $("#cauCd").val(selectedVal.cauCd);
            $("#cauNm").val(selectedVal.cauNm);
        }
        ,columns:[
                 {field:"cauCd", title:"<spring:message code='ser.lbl.cause' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:100, sortable:false, attributes:{"class":"al"}}
        ]
    });
   /**************** GRID 데이터 ****************************/



});
</script>
<!-- //script -->
