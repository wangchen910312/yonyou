<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 시승 차량 조회 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveCar" /><!-- 시승 차량 조회 --></h1>
                </div>

                <div class="table_grid mt10">
                    <div id="tdrvCarMgmtGrid"></div>
                </div>

            </section>
            <!-- //시승 차량 조회 -->

            <script type="text/javascript">

                $(document).ready(function() {

                    // 시승차량조회 그리드 시작
                    $("#tdrvCarMgmtGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/testDrive/selectTestDriveCars.do' />"
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
                        //,height:305
                        ,navigatable:false
                        ,pageable:false
                        ,selectable:"multiple"
                        ,editable:false
                        ,columns:[
                                    {field:"tdrvVinNo", title:"<spring:message code='crm.lbl.tdrvVinNo' />", width:150 }     /* 시승차대번호 */
                                    ,{field:"carRegNo", title:"<spring:message code='crm.lbl.carRegNo' />", width:100 }       /* 차번호 */
                                    ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:150 }  /* 차종명 */
                                    ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:150 }      /* 모델명 */
                                    ,{field:"extColorCd", title:"<spring:message code='crm.lbl.extColorCd' />", width:80 }    /* 외장색 */
                                    ,{field:"runDistVal", title:"<spring:message code='crm.lbl.runDistVal' />", width:80}     /* 주행거리 */
                                    ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
                                        ,attributes:{"class":"ac"}
                                    }
                                    ,{field:"tdrvCont", title:"<spring:message code='crm.lbl.tdrvCont' />", width:100}        /* 사용중지상세 */
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100            /* 등록일 */
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                        ]
                    });
                    // 시승차량조회 그리드 종료





                });

            </script>
