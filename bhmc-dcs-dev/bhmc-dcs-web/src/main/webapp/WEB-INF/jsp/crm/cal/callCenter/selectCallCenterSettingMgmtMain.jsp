<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 콜센터 설정관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.CallCenterSettingMgmt" /></h1><!-- 콜센터 설정관리 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                    </div>
                </div>

                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:30%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">IB 콜 녹취<!-- 고객케어명 --></th>
                                <td>
                                    <label class="label_check"><input type="radio" name="radio1" class="form_check"> 녹취 안함</label>
                                    <label class="label_check"><input type="radio" name="radio1" class="form_check"> 전체 녹취</label>
                                    <label class="label_check"><input type="radio" name="radio1" class="form_check"> 선택 녹취</label>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">OB 콜 MAX 콜횟수<!-- 고객케어명 --></th>
                                <td>
                                    <input type="text" id="sCustCareNm" name="sCustCareNm" class="form_input" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="custCareMgmtGrid"></div>
                </div>

            </section>
            <!-- //콜센터 설정관리 -->

            <script type="text/javascript">


                var custCareSeq
                ;

                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어미션유형 DS
                var activeTpCdDs = [];
                var activeTpCdArr = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                activeTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = activeTpCdArr[val];
                    }
                    return returnVal;
                };

                // 템플릿 - SMS
                var smsTemplateDs = [];
                var smsTemplateArr = [];
                <c:forEach var="obj" items="${smsTemplateList}">
                    smsTemplateDs.push({text:"${obj.tmplNm}", value:"${obj.tmplId}", tmplCont:"${obj.tmplCont}"});
                    smsTemplateArr["${obj.tmplId}"] = "${obj.tmplNm}";
                </c:forEach>
                smsTemplateArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = smsTemplateArr[val];
                    }
                    return returnVal;
                };

                // 고객추출조건명 DS
                var custExtrTermNoDs = [];
                var custExtrTermNoArr = [];
                <c:forEach var="obj" items="${custExtrTermNoList}">
                    custExtrTermNoDs.push({text:"${obj.custExtrTermNm}", value:"${obj.custExtrTermNo}"});
                    custExtrTermNoArr["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
                </c:forEach>
                custExtrTermNoArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custExtrTermNoArr[val];
                    }
                    return returnVal;
                };


                // TODO 고객추출주기 DS
                var custExtrCycleCdDs = [];
                var custExtrCycleCdArr = [];
                <c:forEach var="obj" items="${custExtrCycleCdList}">
                    //custExtrCycleCdDs.push({text:"${obj.custExtrTermNm}", value:"${obj.custExtrTermNo}"});
                    //custExtrCycleCdArr["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
                    custExtrCycleCdDs.push({text:"1일", value:"01"});
                    custExtrCycleCdArr["01"] = "1일";
                </c:forEach>
                custExtrCycleCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custExtrCycleCdArr[val];
                    }
                    return returnVal;
                };


                $(document).ready(function() {

                    // s실행유형
                    $("#sActiveTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s시작일
                    $("#sStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 조회
                    $("#btnSave").kendoButton({
                        click:function(e){
                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });

                    // 콜센터전송
                    $("#btnCallReg").kendoButton({
                        click:function(e){

                            // TODO 콜센터 전송
                            dms.notification.info("콜센터전송 ");

                            var grid = $("#targetGrid").data("kendoExtGrid");
                            var rows = grid.select();

                            if (rows.length < 1) {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                            var deleteList = [];
                            rows.each(function(index, row) {
                                var dataItem = grid.dataItem(row);
                                deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
                            });

                            /*
                            $.ajax({
                                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                                ,data:JSON.stringify(deleteList)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.read();

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");

                                }
                            });
                             */


                        }
                    });

                    // SMS
                    $("#btnSmsSend").kendoButton({
                        click:function(e){

                            // TODO SMS 팝업 오픈, 보내는 목록을 어떻게 전달할것인가?
                            dms.notification.info("SMS 팝업 오픈");

                            var grid = $("#targetGrid").data("kendoExtGrid");
                            var rows = grid.select();

                            if (rows.length < 1) {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                            var deleteList = [];
                            rows.each(function(index, row) {
                                var dataItem = grid.dataItem(row);
                                deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
                            });

                            /*
                            $.ajax({
                                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                                ,data:JSON.stringify(deleteList)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.read();

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");

                                }
                            });
                             */

                        }
                    });

                    // 고객캐어미션 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCustCareNm"] = $("#sCustCareNm").val();
                                        params["sActiveTpCd"] = $("#sActiveTpCd").data("kendoExtDropDownList").value();

                                        console.log("custCareMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"custCareSeq"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,custCareSeq:{type:"number"}
                                        ,custCareNm:{type:"string"}
                                        ,useYn:{type:"string"}
                                        ,activeTpCd:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermNo:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrCycleCd:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}

                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {

                                $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

                            }

                        }
                        ,autoBind:false
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        //,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custCareNm", title:"유형", width:200}            /* 고객케어명 */
                            ,{field:"custCareCont", title:"처리기준시간", width:200}        /* 고객케어내용 */
                            ,{field:"activeTpCd", title:"처리담당부서", width:200             /* 실행유형 */
                                , attributes:{"class":"ac"}
                                , template:'#= activeTpCdArrVal(activeTpCd)#'
                            }
                            ,{field:"activeTmplId", title:"처리담당자", width:200         /* 실행상세 */
                                , attributes:{"class":"ac"}
                                , template:'#= smsTemplateArrVal(activeTmplId)#'
                            }
                            , {field:""   , title:""}
                        ]
                    });
                    // 고객캐어미션 그리드 종료


                });

            </script>

