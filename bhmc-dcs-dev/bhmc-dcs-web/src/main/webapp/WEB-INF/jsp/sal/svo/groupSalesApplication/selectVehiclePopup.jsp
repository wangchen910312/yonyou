<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<!-- 집단판매신청 - 차량조회팝업. -->
<section id="window" class="pop_wrap">

    <div class="clfix" style="margin-top:15px">
        <!-- 차량조회영역 -->
        <div class="left_areaStyle" style="width:45%">
            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:28%;">
                        <col style="width:10%;">
                        <col style="width:32%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                            <td>
                                <input id="sVinNo" name="sVinNo" class="form_input" maxlength="17"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                            </td>
                            <%-- <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 차종 -->
                            <td>
                                <input id="sModelCd" class="form_comboBox"  />
                            </td> --%>
                            <td style="float:right;">
                            <button id="btnSearch" class="btn_xs btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <!-- 조회 조건 종료 -->
            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
        <!-- 차량조회영역 끝 -->

        <ul class="promotion_btn pt_v1" style="padding-top:150px;">
            <li><button class="btn_s btn_next" id="btnAddR"></button></li>
            <li><button class="btn_s btn_prev" id="btnDelR"></button></li>
        </ul>

        <!-- 조회후 선택 영역 -->
        <div class="right_areaStyle" style="width:45%">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnSelect" class="btn_s btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid" style="margin-top:9px;">
                <div id="grid2"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
        <!-- 조회후 선택 영역 끝 -->
    </div>


</section>
<!-- //차량마스터관리 팝업 -->

<!-- script -->
<script>
//팝업옵션
var options = parent.searchVehiclePopupWin.options.content.data;

var dlrCd = options.dlrCd;
var usrId = options.usrId;
var reqSeq = options.reqSeq;
var arrInfo = options.arrInfo;



//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


$(document).ready(function() {


    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       /* ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       } */
    });

    // 모델
/*     $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false); */




/*************************** 검색 조건 영역 END **************************************************/




    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
        	sal.info.inputSearchVinCarline
        	//검색조건을 입력해주세요. [VIN NO 혹은 차종중 둘중 하나] / 请输入查询条件【VIN码或者车种可选一】
            if ( dms.string.isEmpty($("#sVinNo").val()) && dms.string.isEmpty($("#sCarlineCd").val())){
                dms.notification.warning("<spring:message code='sal.info.inputSearchVinCarline' />");
                return false;
            }
        	
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid2').data('kendoExtGrid');
            var rows = grid.select();
            if (rows.length >= 1){
                var selectVeh = [];
                $.each(rows, function(idx, row){
                    var gridItem = grid.dataItem(rows[idx]);
                    var data = {
                               "carlineCd":gridItem.carlineCd
                               ,"carlineCdNm":gridItem.carlineCdNm
                               ,"modelCd":gridItem.modelCd
                               ,"modelCdNm":gridItem.modelCdNm
                               ,"ocnCd":gridItem.ocnCd
                               ,"ocnCdNm":gridItem.ocnCdNm
                               ,"extColorCd":gridItem.extColorCd
                               ,"extColorCdNm":gridItem.extColorCdNm
                               ,"intColorCd":gridItem.intColorCd
                               ,"intColorCdNm":gridItem.intColorCdNm
                               ,"vinNo":gridItem.vinNo
                               ,"carId":gridItem.carId
                               ,"whPrc":gridItem.whPrc
                    }
                    selectVeh.push(data);
                })

                options.callbackFunc(selectVeh);
                parent.searchVehiclePopupWin.close();


                /* var data ={"insertGroupSalesApplicationVehList":selectVeh
                          ,"dlrCd":dlrCd
                          ,"usrId":usrId
                          ,"reqSeq":reqSeq
                          }

                $.ajax({
                    url:"<c:url value='/sal/svo/groupSalesApplication/groupSalesApplication.do' />",
                    data:JSON.stringify(data),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){
                        options.callbackFunc();
                        parent.searchVehiclePopupWin.close();
                    }
                }); */


            } else {
                dms.notification.info("<spring:message code='global.lbl.car' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });




    // 추가
    $("#btnAddR").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectRows = grid.select();

            if(selectRows.length > 0){

                $.each(selectRows, function(idx, val){
                    var data = grid.dataItem(val);

                    if(!isTargetModelGrid(data.vinNo)){
                        $('#grid2').data('kendoExtGrid').dataSource.insert(idx, {
                             carlineCd    :data.carlineCd
                            ,carlineCdNm  :data.carlineCdNm
                            ,modelCd      :data.modelCd
                            ,modelCdNm    :data.modelCdNm
                            ,ocnCd	      :data.ocnCd
                            ,ocnCdNm      :data.ocnCdNm
                            ,extColorCd   :data.extColorCd
                            ,extColorCdNm :data.extColorCdNm
                            ,intColorCd   :data.intColorCd
                            ,intColorCdNm :data.intColorCdNm
                            ,vinNo        :data.vinNo
                            ,whPrc        :data.whPrc
                        });
                    }
                });

            }
        }
    });

    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    function isTargetModelGrid(vinNo){
        var flag = false;
        var grid2 = $('#grid2').data('kendoExtGrid');
        var rows = grid2.tbody.find("tr");

        rows.each(function(index, row){
            var data = grid2.dataItem(row);

            if(vinNo == data.vinNo){
                flag = true;
            }
        });
        return flag;
    }


    // 삭제
    $("#btnDelR").kendoButton({
        click:function(e){
            var grid2 = $("#grid2").data("kendoExtGrid");
            var rows = grid2.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                grid2.removeRow(row);
            });

        }
    });


    /*********************************************** 버튼 끝 **********************************************************************/

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectVehicleInfoPopup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]  = dlrCd;                                                           // 딜러
                        params["sUsrId"]  = usrId;
                        params["sReqSeq"] = reqSeq;

                        params["sVinNo"] = $("#sVinNo").val();                                               // 빈넘버
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();           // 차종
                        //params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();           // 모델


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
            		    ,carId		  :{type:"string"}
                        ,ncarDstinCd  :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineCdNm  :{type:"string"}
                        ,modelCdNm    :{type:"string"}
                        ,ocnCdNm	  :{type:"string"}
                        ,extColorCdNm :{type:"string"}
                        ,intColorCdNm :{type:"string"}
                        ,whPrc        :{type:"number"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,height  :320
        ,indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false         //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,columns:[
            {field:"dlrCd", hidden:true}
            ,{field:"carId", hidden:true}
            ,{field:"ocnCdNm", hidden:true}
            ,{field:"extColorCdNm", hidden:true}
            ,{field:"intColorCdNm", hidden:true}
            ,{field:"whPrc", hidden:true}
            ,{field:"carlineCdNm",title:"<spring:message code='global.lbl.carlineNm' />",width:60,   attributes:{"class":"al"}}     //차종명
            ,{field:"modelCdNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:80,  attributes:{"class":"al"}}     //모델명
            ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:130,  attributes:{"class":"ac"}}     //Vin NO
        ]
    });




    //그리드 설정
    $("#grid2").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectVehicleInfoPopup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                                                           // 딜러
                        params["sVinNo"] = $("#sVinNo").val();                                              // 빈넘버
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종
                        //params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();          // 모델


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
                        ,ncarDstinCd  :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineCd    :{type:"string"}
                        ,modelCd      :{type:"string"}
                        ,carlineCdNm  :{type:"string"}
                        ,modelCdNm    :{type:"string"}
                        ,whPrc        :{type:"number"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,pageable:false
        ,height  :320
        ,columns:[
            {field:"dlrCd", hidden:true}
            ,{field:"carlineCd", hidden:true}
            ,{field:"modelCd", hidden:true}
            ,{field:"ocnCd", hidden:true}
            ,{field:"extColorCd", hidden:true}
            ,{field:"intColorCd", hidden:true}
            ,{field:"ocnCdNm", hidden:true}
            ,{field:"extColorCdNm", hidden:true}
            ,{field:"intColorCdNm", hidden:true}
            ,{field:"whPrc", hidden:true}
            ,{field:"carlineCdNm",title:"<spring:message code='global.lbl.carlineNm' />",width:60,   attributes:{"class":"al"}}     //차종명
            ,{field:"modelCdNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:80,  attributes:{"class":"al"}}      //모델명
            ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:130,  attributes:{"class":"ac"}}     //Vin NO
        ]
    });






});
</script>
<!-- //script -->