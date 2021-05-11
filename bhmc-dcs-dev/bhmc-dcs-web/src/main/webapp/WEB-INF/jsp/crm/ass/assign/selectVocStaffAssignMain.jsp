<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- VOC 처리 담당자 배정 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.vocAssignMgmt' /><!-- VOC 처리 담당자 배정 --></h1>
                    <div class="btn_right">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.pprocDeptNm' /><!-- 처리부서 --></th>
                                <td>
                                    <input type="text" id="sPprocDeptNm" name="sPprocDeptNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.assignYn' /><!-- 배정여부 --></th>
                                <td>
                                    <input id="sAssignYn" name="sAssignYn" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRegStartDt" name="sRegStartDt" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRegEndDt" name="sRegEndDt" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="vocAssignGrid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.scIdAssign' /><!-- 담당자 재배정 --></h2>
                    <div class="btn_right">
                        <button id="btnAssign" class="btn_s"><spring:message code='global.btn.assign' /><!-- 배정 --></button>
                    </div>
                </div>

                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:90%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.prsNm' /><!-- 담당자 --></th>
                                <td>
                                    <select id="supportLangs" name="supportLangs" multiple="multiple" data-bind="value:values"></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>

            <script type="text/javascript">


                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>

                // 전출상태 DS
                var trsfStatCdDs = [];
                var trsfStatCdArr = [];
                <c:forEach var="obj" items="${trsfStatCdList}">
                    trsfStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    trsfStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                trsfStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = trsfStatCdArr[val];
                    }
                    return returnVal;
                };

                var ynCdList = [];
                ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
                ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

                // 잠재,보유고객
                var custCdMap = [];
                <c:forEach var="obj" items="${custCdList}">
                console.log("obj.cmmCdNm:"+"${obj.cmmCdNm}")
                    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custCdVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custCdMap[val];
                    }
                    return returnVal;
                };

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                     var grid = $("#vocAssignGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });

                $(document).ready(function() {

                    //지원언어
                    $("#supportLangs").kendoMultiSelect({
                        dataSource:usersDS,
                        valuePrimitive:true,
                        placeholder:"",
                        dataTextField:"usrNm",
                        dataValueField:"usrId"
                        //dataBound:defaultLangDatasourceSetting,
                        //change:defaultLangDatasourceSetting
                    });

                    // S배정여부
                    $("#sAssignYn").kendoExtDropDownList({
                        dataSource:ynCdList
                        , dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "
                        , index:0
                    });

                    // 등록 시작일
                    $("#sRegStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 등록 종료일
                    $("#sRegEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 검색
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#vocAssignGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    // 활동
                    $("#btnAssign").kendoButton({
                        click:function(e){


                            /* 저장로직은 확인 완료! 추후 메시지 만 반영하면됨. */
                            var saveList      = [],
                                grid          = $("#vocAssignGrid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr"),
                                userList      = $("#supportLangs").data("kendoMultiSelect").dataItems(),
                                dataValidate  = false,
                                chkRow,
                                saveData;

                            if(userList.length  == 0 ){
                                // 배정담당자 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.assignPrsNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                var gridData = grid.dataSource.at(index);
                                var data={};
                                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                                if(chkRow === true){

                                    if(gridData.vocStatCd != "01"){
                                        // 접수완료 상태에만 배정이 가능합니다.
                                        dms.notification.warning("<spring:message code='global.info.vocAssignChk' />");
                                        saveList = [];
                                        dataValidate = true;
                                        return false;
                                    }

                                    data.vocNo = gridData.vocNo;           // VOC 번호
                                    data.vocStatCd = gridData.vocStatCd;   // VOC 상태 ( BIZ 에서 validation 체크 )
                                    saveList.push(data);

                                }
                            });

                            if(dataValidate){ return false; }

                            if(saveList.length == 0 ){
                                // 배정목록 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                            }

                            if(saveList.length < userList.length ){
                                // 선택된 목록보다 담당자가 많습니다.
                                dms.notification.warning("<spring:message code='global.info.assignChk' />");
                                return false;
                            }

                            saveData ={
                                    "assignList":saveList
                                    ,"userList":userList
                            };

                            console.log(JSON.stringify(saveData));
                            console.log(saveData);
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/ass/assign/updateVocStaffAssign.do' />"
                                ,data:JSON.stringify(saveData)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.page(1);

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                    initForm();


                                }
                            });


                        }
                        //, enable:false
                    });

                    // VOC 처리담당자 배정 그리드 시작 //
                    $("#vocAssignGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/ass/assign/selectVocStaffAssigns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sPprocDeptNm"]          = $("#sPprocDeptNm").val();
                                        params["sAssignYn"]             = $("#sAssignYn").data("kendoExtDropDownList").value();
                                        params["sRegStartDt"]           = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sRegEndDt"]             = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("vocAssignGrid:" + params);
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                errors:"error"
                                    ,data:"data"
                                    ,total:"total"
                                    ,model:{
                                        id:"vocNo"
                                        ,fields:{
                                            vocNo              :{type:"string", editable:false} //VOC번호
                                            , vocStatCd          :{type:"string", editable:false} //VOC상태코드
                                            , vocStatNm          :{type:"string", editable:false} //VOC상태코드명
                                            , vocTpCd            :{type:"string", editable:false} //VOC유형코드
                                            , vocTpNm            :{type:"string", editable:false} //VOC유형코드명
                                            , tendCd             :{type:"string", editable:false} //성향코드
                                            , vocTpSub1Cd        :{type:"string", editable:false} //VOC유형하위1코드
                                            , vocTpSub2Cd        :{type:"string", editable:false} //VOC유형하위2코드
                                            , vocTpSub3Cd        :{type:"string", editable:false} //VOC유형하위3코드
                                            , acptSrcCd          :{type:"string", editable:false} //접수출처코드
                                            , activeGainPathCd   :{type:"string", editable:false} //활동획득경로코드
                                            , cmplCauCd          :{type:"string", editable:false} //불만원인코드
                                            , prorCd             :{type:"string", editable:false} //우선순위코드
                                            , procLmtCd          :{type:"string", editable:false} //처리시한코드
                                            , vocEndDt           :{type:"date",   editable:false} //VOC종료일자
                                            , receiveTelNo       :{type:"string", editable:false} //수신전화번호
                                            , custNm             :{type:"string", editable:false} //고객명
                                            , custNo             :{type:"string", editable:false} //고객번호
                                            , custPrefCommNo     :{type:"string", editable:false} //고객선호연락번호
                                            , hpNo               :{type:"string", editable:false} //휴대폰번호
                                            , homeTelNo          :{type:"string", editable:false} //집전화번호
                                            , officeTelNo        :{type:"string", editable:false} //직장전화번호
                                            , pconCustNm         :{type:"string", editable:false} //연계인고객명
                                            , pconCustNo         :{type:"string", editable:false} //연계인고객번호
                                            , pconCustMjrTelNo   :{type:"string", editable:false} //연계인고객주요전화번호
                                            , pconCustHpNo       :{type:"string", editable:false} //연계인고객휴대폰번호
                                            , pconCustHomeTelNo  :{type:"string", editable:false} //연계인고객집전화번호
                                            , pconCustOfficeTelNo:{type:"string", editable:false} //연계인고객직장전화번호
                                            , resvDt             :{type:"date",   editable:false} //예약일자
                                            , sendTelNo          :{type:"string", editable:false} //발신전화번호
                                            , pconRelCd          :{type:"string", editable:false} //연계인관계코드
                                            , pprocId            :{type:"string", editable:false} //처리인ID
                                            , coopDeptNm         :{type:"string", editable:false} //협조부서명
                                            , bizDeptNm          :{type:"string", editable:false} //사업부서명
                                            , officeNm           :{type:"string", editable:false} //사무소명
                                            , sungCd             :{type:"string", editable:false} //성코드
                                            , sungNm             :{type:"string", editable:false} //성명
                                            , cityCd             :{type:"string", editable:false} //도시코드
                                            , cityNm             :{type:"string", editable:false} //도시명
                                            , vinNo              :{type:"string", editable:false} //차대번호
                                            , carRegNo           :{type:"string", editable:false} //차량등록번호
                                            , carlineCd          :{type:"string", editable:false} //차종코드
                                            , carlineNm          :{type:"string", editable:false} //차종명
                                            , modelCd            :{type:"string", editable:false} //모델코드
                                            , modelNm            :{type:"string", editable:false} //모델명
                                            , ocnCd              :{type:"string", editable:false} //OCN코드
                                            , ocnNm              :{type:"string", editable:false} //OCN명
                                            , runDistVal         :{type:"string", editable:false} //주행거리값
                                            , acptDeptNm         :{type:"string", editable:false} //접수부서
                                            , pacptId            :{type:"string", editable:false} //접수자ID
                                            , acptDt             :{type:"date",   editable:false} //접수일자
                                            , custReqCont        :{type:"string", editable:false} //고객요청내용
                                            , custRescLocCont    :{type:"string", editable:false} //고객구조위치내용
                                            , pevalId            :{type:"string", editable:false} //심사인ID
                                            , evalAllocDt        :{type:"date",   editable:false} //심사배정일자
                                            , callCenOpnCont     :{type:"string", editable:false} //콜센터의견내용
                                            , returnCauCont      :{type:"string", editable:false} //반송원인내용
                                            , pmoCauCd           :{type:"string", editable:false} //승급원인코드
                                            , pmoDt              :{type:"date",   editable:false} //승급일자
                                            , revMthCont         :{type:"string", editable:false} //검토방안내용
                                            , realPprocId        :{type:"string", editable:false} //실처리인ID
                                            , procDt             :{type:"date",   editable:false} //처리일자
                                            , pprocTelNo         :{type:"string", editable:false} //처리인전화번호
                                            , pprocEmailNm       :{type:"string", editable:false} //처리인이메일명
                                            , procRsltCont       :{type:"string", editable:false} //처리결과내용
                                            , stsfIvstEmpId      :{type:"string", editable:false} //만족도조사인ID
                                            , stsfIvstDt         :{type:"date",   editable:false} //만족도조사일자
                                            , stsfIvstRsltCont   :{type:"string", editable:false} //만족도조사결과내용
                                            , mthAchvHm          :{type:"string", editable:false} //방안달성시간
                                            , cmplStsfCd         :{type:"string", editable:false} //불만만족도코드
                                            , cmplReAcptYn       :{type:"string", editable:false} //불만재접수여부
                                            , cmplReAcptCnt      :{type:"string", editable:false} //불만재접수횟수
                                            , serReqNo           :{type:"string", editable:false} //서비스요청번호
                                            , cmplDlDeptNm       :{type:"string", editable:false} //불만전달부서명
                                            , cmplDlEmpId        :{type:"string", editable:false} //불만전달자ID
                                            , saleDt             :{type:"date",   editable:false} //판매일자
                                            , dstbNo             :{type:"string", editable:false} //물류번호
                                            , parOrdYn           :{type:"string", editable:false} //부품오더여부
                                            , parOrdDt           :{type:"date",   editable:false} //부품오더일자
                                            , parArrvDt          :{type:"date",   editable:false} //부품도착일자
                                            , itemCd             :{type:"string", editable:false} //품목코드
                                            , bhmcYn             :{type:"string", editable:false} //BHMC여부
                                            , bhmcVocNo          :{type:"string", editable:false} //BHMCVOC번호
                                            , regUsrId           :{type:"string", editable:false} //등록자ID
                                            , regDt              :{type:"date",   editable:false} //등록일자
                                            , updtUsrId          :{type:"string", editable:false} //수정자ID
                                            , updtDt             :{type:"date",   editable:false} //수정일자
                                            , pprocDeptNm        :{type:"string", editable:false} //처리부서명
                                            , vocCnt             :{type:"string", editable:false} //정보VIEW
                                            , dlrCd              :{type:"string"}
                                            , pltCd              :{type:"string"}
                                        }
                                    }
                            }
                        }
                        ,columns:[
                                     {field:"vocNo"              , title:"<spring:message code='global.lbl.vocNo' />"           //VOC번호
                                         , attributes:{"class":"ac"}, width:150
                                     }
                                    ,{field:"bhmcVocNo"          , title:"<spring:message code='global.lbl.BhmcVocNo' />"       //BHMCVOC번호
                                         , attributes:{"class":"ac"}, width:150
                                     }
                                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}}    // 고객명
                                    /*
                                    // TODO VOC 개발 미정이라서 고객이랑 join 안했음. 따라서 추후 적용
                                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100           // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                     */
                                    ,{field:"custPrefCommNo"     , title:"<spring:message code='global.lbl.telNumer' />"        //고객선호연락번호
                                         , attributes:{"class":"ac"}, width:100
                                     }
                                    ,{field:"vocTpNm"            , title:"<spring:message code='global.lbl.vocTpCd' />"         //VOC유형코드명
                                        , sortable:false, width:100
                                    }
                                    ,{field:"vocStatNm"          , title:"<spring:message code='global.lbl.vocStatCd' />"       //VOC상태코드명
                                        , sortable:false, attributes:{"class":"ac"}, width:100
                                    }
                                    ,{field:"procDt"             , title:"<spring:message code='crm.lbl.procDt' />"             //처리일자
                                        , attributes:{"class":"ac"}, width:100
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{field:"pprocDeptNm"        , title:"<spring:message code='crm.lbl.pprocDeptNm' />"        //처리 담당부서   / 处理部门
                                        , attributes:{"class":"ac"}, width:100
                                    }
                                    ,{field:"pprocNm"            , title:"<spring:message code='crm.lbl.pprocId' />"            //처리 담당자    / 处理人员
                                        , sortable:false, attributes:{"class":"ac"}, width:100
                                    }
                                    ,{field:"regDt"              , title:"<spring:message code='global.lbl.regDt' />"           //등록일자
                                        , attributes:{"class":"ac"}, width:100
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                        ]
                        ,height:417
                        ,navigatable:false
                        ,resizable:false
                        //,sortable:false
                        ,multiSelectWithCheckbox:true
                        //,selectable:"row"
                    });
                    // VOC 처리담당자 배정 그리드 종료 //

                });


            </script>