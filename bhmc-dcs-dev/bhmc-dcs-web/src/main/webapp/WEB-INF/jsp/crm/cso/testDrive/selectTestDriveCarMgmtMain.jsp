<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 시승 차량 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveCarMgmt" /><!-- 시승 차량 관리--></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="tdrvCarMgmtGrid"></div>
                </div>

            </section>
            <!-- //시승 차량 관리 -->

            <script type="text/javascript">

                $(document).ready(function() {

                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){

                            var grid = $("#tdrvCarMgmtGrid").data("kendoExtGrid");

                            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                            if (grid.cudDataLength == 0) {
                                //변경된 정보가 없습니다.
                                dms.notification.info("<spring:message code='global.info.required.change'/>");
                                return;
                            }

                            if (grid.gridValidation()) {

                                console.log("saveDate:",JSON.stringify(saveData));

                                $.ajax({
                                    url:"<c:url value='/crm/cso/testDrive/updateTestDriveCarMgmt.do' />"
                                    ,data:JSON.stringify(saveData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR,status,error) {

                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(jqXHR, textStatus) {

                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);

                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                    }
                                });
                            }else{
                                //입력값을 확인하여 주십시오.
                                dms.notification.warning("<spring:message code='global.info.check.input'/>");

                            }

                        }
                    });

                    // 판매기회단계 상태
                    var saleOpptStepCdArr = [];
                    <c:forEach var="obj" items="${saleOpptStepCdList}">
                        saleOpptStepCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    saleOpptStepCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = saleOpptStepCdArr[val];
                        }
                        return returnVal;
                    };

                    // 시승차량관리 그리드 시작
                    $("#tdrvCarMgmtGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/testDrive/selectTestDriveCarsMgmt.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        console.log("tdrvCarMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"tdrvVinNo"
                                    ,fields:{
                                         tdrvVinNo:{type:"string", editable:false }
                                        ,carRegNo:{type:"string", editable:false }
                                        ,carlineNm:{type:"string", editable:false }
                                        ,modelNm:{type:"string", editable:false }
                                        //,carlineCd:{type:"string"}
                                        //,modelCd:{type:"string"}
                                        ,extColorCd:{type:"string", editable:false }
                                        ,runDistVal:{type:"number", editable:false }      // 차량 마스터 주행거리
                                        ,useYn:{type:"string", editable:true }
                                        ,tdrvCont:{type:"string", editable:true }
                                        ,regDt:{type:"date", editable:false }
                                        ,updtDt:{type:"date", editable:false }
                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());

                            if ( dms.string.isNotEmpty(selectedItem) ) {

                                $("#btnSave").data("kendoButton").enable(true);         // 저장
                            }


                        }
                        ,dataBound:function(e) {

                            $("#btnSave").data("kendoButton").enable(false);         // 저장

                        }
                        //,height:305
                        ,navigatable:false
                        ,pageable:false
                        ,selectable:"row"
                        //,editableOnlyNew:true
                        //,editableOnlyNewExcludeColumns:["useYn","remark"]
                        , edit:function(e){

                            if ( !e.model.isNew() ) {

                                var fieldName = e.container.find("input").attr("name");

                                // 사용여부가 N 인경우만 tdrvCont 수정가능.
                                if ( fieldName == "tdrvCont" && e.model.useYn === "Y" ) {
                                    this.closeCell();
                                }
                            }


                        }
                        ,columns:[
                             {field:"tdrvVinNo", title:"<spring:message code='crm.lbl.tdrvVinNo' />", width:150 }     /* 시승차대번호 */
                            ,{field:"carRegNo", title:"<spring:message code='crm.lbl.carRegNo' />", width:100 }       /* 차번호 */
                            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:150 }  /* 차종명 */
                            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:150 }      /* 모델명 */
                            ,{field:"extColorCd", title:"<spring:message code='crm.lbl.extColorCd' />", width:80 }    /* 외장색 */
                            ,{field:"runDistVal", title:"<spring:message code='crm.lbl.runDistVal' />", width:80}     /* 주행거리 */
                            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
                                ,attributes:{"class":"ac"}
                                ,editor:function(container, options) {
                                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                                    .appendTo(container)
                                    .kendoExtDropDownList({
                                        autoBind:true
                                        ,dataSource:['Y','N']
                                        ,index:0
                                    });
                                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                                }
                            }
                            ,{field:"tdrvCont", title:"<spring:message code='crm.lbl.tdrvCont' />", width:100}        /* 사용중지상세 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100            /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 시승차량관리 그리드 종료

                });

            </script>