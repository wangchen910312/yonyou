<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


   <!-- 딜러목록 -->
   <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='sal.title.secondGradeDlrInfo' /></h1>         <!-- 2급딜러정보 -->
            <div class="btn_right">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </div>
        </div>
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.lv2DlrCd" /></th>     <!-- 2급딜러코드 -->
                        <td>
                            <input id="sLv2DlrCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.lv2DlrNm" /></th>     <!-- 2급딜러명 -->
                        <td>
                            <input id="sLv2DlrNm" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.lv2DlrGrpCd" /></th>  <!-- 2급딜러그룹코드 -->
                        <td>
                            <input id="sDlrGrpCd" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>
    </section>

    <section id="callSecondDealerWindow" class="pop_wrap">

        <!-- 딜러 기본정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="cmm.title.dealerInfo" /></h2>
            <div class="btn_right">
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            </div>
        </div>
        <form id="dealerForm" name="dealerForm">
        <div class="table_form form_width_70per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.lv2DlrOrg" /></th>  <!-- 2급딜러 -->
                        <td>
                            <input id="lv2DlrCd" name="lv2DlrCd" type="text" class="form_input form_disabled" disabled />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.lv2DlrNm" /></th>    <!-- 2급딜러명 -->
                        <td>
                            <input id="lv2DlrNm" name="lv2DlrNm" type="text" class="form_input form_disabled" disabled />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrGrpCd" /></th>
                        <td>
                            <input id="dlrGrpCd" name="dlrGrpCd" type="text" class="form_input" maxlength="20" data-name="<spring:message code="global.lbl.dlrGrpCd" />" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th>
                        <td>
                            <input id="ownRgstNm" name="ownRgstNm" type="text" class="form_input"  data-name="<spring:message code="global.lbl.ownRgstNm" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.fdationDt" /></th>
                        <td>
                            <input id="fdationDt" name="fdationDt" class="form_datepicker" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.crnNo" /></th>
                        <td>
                            <input id="crnNo" name="crnNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.telNo" /></th>
                        <td>
                            <input id="telNo" name="telNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.faxNo" /></th>
                        <td>
                            <input id="faxNo" name="faxNo" type="text" class="form_input"  />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.homepageUrl" /></th>
                        <td>
                            <input id="homepageUrl" name="homepageUrl" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.callCenTelNo" /></th>
                        <td>
                            <input id="callCenTelNo" name="callCenTelNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.emgcCenTelNo" /></th>
                        <td>
                            <input id="emgcCenTelNo" name="emgcCenTelNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.serDlrTelNo" /></th>   <!-- 서비스센터 전화 -->
                        <td>
                            <input id="serCenTelNo" name="serCenTelNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.salDlrTelNo" /></th>   <!-- 영업센터 전화 -->
                        <td>
                            <input id="salCenTelNo" name="salCenTelNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.distCd" /></th>
                        <td>
                            <input id="distCd" name="distCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrCdSameGrp" /></th>
                        <td>
                            <input id="groupDealers" type="text" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.zipCd" /></th>
                        <td>
                            <input id="zipCd" name="zipCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.addr" /></th>
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:38.8%">
                                    <input id="baseAddr" name="baseAddr" type="text" class="form_input">
                                </div>
                                <div class="form_right" style="width:61.2%">
                                    <input id="detlAddr" name="detlAddr" type="text" class="form_input">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 딜러 부가정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="cmm.title.dealerExtraInfo" /></h2>
        </div>
        <div id="kendoDealerForm" class="table_form form_width_70per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.lttuVal" /></th>
                        <td>
                            <input id="lttuVal" name="lttuVal" type="number" class="form_input" maxlength="15" data-name="<spring:message code="global.lbl.lttuVal" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.lotuVal" /></th>
                        <td>
                            <input id="lotuVal" name="lotuVal" type="number" class="form_input" maxlength="15" data-name="<spring:message code="global.lbl.lotuVal" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dmsIpNm" /></th>
                        <td>
                            <input id="dmsIpNm" name="dmsIpNm" type="number" class="form_input" maxlength="64" data-name="<spring:message code="global.lbl.dmsIpNm" />" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.dmsPortNm" /></th>
                        <td>
                            <input id="dmsPortNm" name="dmsPortNm" type="number" class="form_input" maxlength="6" data-name="<spring:message code="global.lbl.dmsPortNm" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dmsTestUrlNm" /></th>
                        <td>
                            <input id="dmsTestUrlNm" name="dmsTestUrlNm" type="url" class="form_input" data-name="<spring:message code="global.lbl.dmsTestUrlNm" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dmsOperEmailNm" /></th>
                        <td>
                            <input id="dmsOperEmailNm" name="dmsOperEmailNm" type="email" class="form_input" data-name="<spring:message code="global.lbl.dmsOperEmailNm" />" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.dmsOperTelNo" /></th>
                        <td>
                            <input id="dmsOperTelNo" name="dmsOperTelNo" type="tel" class="form_input" data-name="<spring:message code="global.lbl.dmsOperTelNo" />" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dmsUseYn" /></th>
                        <td>
                            <input id="dmsUseYn" name="dmsUseYn" type="text" class="form_comboBox" required data-name="<spring:message code="global.lbl.dmsUseYn" />" />
                        </td>
                        <th scope="row">&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>
    </section>

<!-- script -->
<script type="text/javascript">

    //딜러 상세정보 설정
    function setDealerData(dealer, groupDealerList) {
        $("#lv2DlrCd").val(dealer.lv2DlrCd);         // 딜러코드
        $("#lv2DlrNm").val(dealer.lv2DlrNm);         // 딜러명
        $("#ownRgstNm").val(dealer.ownRgstNm);       // 대표자명
        $("#telNo").val(dealer.telNo);               // 전화번호
        $("#faxNo").val(dealer.faxNo);               // 팩스번호
        $("#crnNo").val(dealer.crnNo);               // 사업자번호
        $("#callCenTelNo").val(dealer.callCenTelNo); // 콜센터 전화
        $("#emgcCenTelNo").val(dealer.emgcCenTelNo); // 구급센터 전화
        $("#serCenTelNo").val(dealer.serCenTelNo);   // 서비스지점 전화
        $("#salCenTelNo").val(dealer.salCenTelNo);   // 영업센터 전화
        $("#homepageUrl").val(dealer.homepageUrl);   // 홈페이지
        $("#fdationDt").data("kendoExtMaskedDatePicker").value(dealer.fdationDt);       // 설립일
        $("#cntryCd").val(dealer.cntryCd);           // 국가
        $("#distCd").val(dealer.distCd);             // 지역코드
        $("#zipCd").val(dealer.zipCd);               // 우편번호
        $("#baseAddr").val(dealer.baseAddr);         // 주소
        $("#detlAddr").val(dealer.detlAddr);         // 상세주소
        $("#dlrGrpCd").val(dealer.dlrGrpCd);         // 딜러그룹코드

        $("#lttuVal").val(dealer.lttuVal);                  // 위도
        $("#lotuVal").val(dealer.lotuVal);                  // 경도
        $("#dmsIpNm").val(dealer.dmsIpNm);                  // DMS 서버 IP
        $("#dmsPortNm").val(dealer.dmsPortNm);              // DMS 서버 Port
        $("#dmsTestUrlNm").val(dealer.dmsTestUrlNm);        // DMS 테스트 URL
        $("#dmsOperEmailNm").val(dealer.dmsOperEmailNm);    // DMS 운영자 이메일
        $("#dmsOperTelNo").val(dealer.dmsOperTelNo);        // DMS 운영자 전화번호
        $("#dmsUseYn").data("kendoExtDropDownList").value(dealer.dmsUseYn);                // DMS 사용여부

        $("#groupDealers").data("kendoExtDropDownList").setDataSource(groupDealerList);
    }

    $(document).ready(function() {

        // 본문 팝업 설정
        $("#callSecondDealerWindow").kendoWindow({
            animation:false
            ,draggable:false
            ,modal:true
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='sal.title.secondGradeDlrInfo' />"      // 2급딜러정보
            ,width:"950px"
            ,height:"500px"
        }).data("kendoWindow");

        $("#btnViewDetail").kendoButton({    // 상세조회.
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());

                if ( dms.string.isNotEmpty(selectedItem) ){
                    fn_GridDBclick(selectedItem);
                    viewDetailPopup();
                } else {
                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
            }
        });

        // 설립일
        $("#fdationDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#groupDealers").kendoExtDropDownList({
            dataSource:[{"lv2DlrCd":"", "lv2DlrNm":""}]
            ,template:"[#:data.lv2DlrCd#] #:data.lv2DlrNm#"
            ,dataValueField:"lv2DlrCd"
            ,dataTextField:"lv2DlrNm"
        });

        $("#dmsUseYn").kendoExtDropDownList({
            dataSource:["Y", "N"]
        });

        var validator = $("#kendoDealerForm").kendoExtValidator().data("kendoExtValidator");

        // 검색
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                if (dms.string.isEmpty($("#lv2DlrCd").val())) {
                    dms.notification.info("<spring:message code='global.lbl.dealer' var='dealerMsg' /><spring:message code='global.info.validation.select' arguments='${dealerMsg}' />");
                    return false;
                }

                if (validator.validate()) {

                    var data = $("#dealerForm").serializeObject();
                    data.fdationDt = $("#fdationDt").data("kendoExtMaskedDatePicker").value();       // 설립일
                    data.lv2DlrCd = $("#lv2DlrCd").val();

                    $.ajax({
                        url:"<c:url value='/sal/btc/secondDealer/updateSecondDealer.do' />"
                        ,data:JSON.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                        $("#grid").data("kendoExtGrid").dataSource.read();
                        $("#callSecondDealerWindow").data("kendoWindow").close();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                    });
                }

            }
        });

        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0721-113303"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/sal/btc/secondDealer/selectSecondDealerSearch.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sLv2DlrCd"] = $("#sLv2DlrCd").val();
                            params["sLv2DlrNm"] = $("#sLv2DlrNm").val();
                            params["sDlrGrpCd"] = $("#sDlrGrpCd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"lv2DlrCd"
                       ,fields:{
                           rnum:{type:"number"}
                           ,lv2DlrCd:{ type:"string" }
                           ,lv2DlrNm:{ type:"string" }
                      }
                   }
                }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            //,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,dataBinding:function(e) {
                setDealerData(
                    {
                        "lv2DlrCd":""
                        ,"lv2DlrNm":""
                        ,"ownRgstNm":""
                        ,"telNo":""
                        ,"faxNo":""
                        ,"crnNo":""
                        ,"callCenTelNo":""
                        ,"emgcCenTelNo":""
                        ,"serCenTelNo":""
                        ,"salCenTelNo":""
                        ,"homepageUrl":""
                        ,"fdationDt":""
                        ,"sessYr":""
                        ,"termStartDt":""
                        ,"termEndDt":""
                        ,"cntryCd":""
                        ,"distCd":""
                        ,"zipCd":""
                        ,"baseAddr":""
                        ,"detlAddr":""
                        ,"dlrGrpCd":""

                        ,"lttuVal":""
                        ,"lotuVal":""
                        ,"dmsIpNm":""
                        ,"dmsPortNm":""
                        ,"dmsTestUrlNm":""
                        ,"dmsOperEmailNm":""
                        ,"dmsOperTelNo":""
                        ,"dmsUseYn":""
                    }
                    ,[{"dlrCd":"", "dlrNm":""}]
                )
            }
            /*
            ,change:function(e) {

                if(!e.sender.dataItem(e.sender.select()).isNew()){

                    var selectedVal = this.dataItem(this.select());
                    var lv2DlrCd = selectedVal.lv2DlrCd;

                    $.ajax({
                        url:"<c:url value='/sal/btc/secondDealer/selectSecondDealer.do' />",
                        data:JSON.stringify({sLv2DlrCd:lv2DlrCd}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    }).done(function(result) {

                        var dealer = result["dealer"];
                        var groupDealerList = result["groupDealerList"];

                        setDealerData(dealer, groupDealerList);
                    });
                };
            }
            */
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                }
                ,{field:"lv2DlrCd", title:"<spring:message code='sal.lbl.lv2DlrOrg' />", width:80
                    ,attributes:{"class":"ac"}      //2급딜러
                }
                ,{field:"lv2DlrNm", title:"<spring:message code='global.lbl.lv2DlrNm' />", width:220} //2급딜러명
                ,{field:"dlrGrpCd", title:"<spring:message code='global.lbl.dlrGrpCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"ownRgstNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:120}
                ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100}
                ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:100}
                ,{field:"callCenTelNo", title:"<spring:message code='global.lbl.callCenTelNo' />", width:100}
                ,{field:"emgcCenTelNo", title:"<spring:message code='global.lbl.emgcCenTelNo' />", width:100}
                ,{field:"serCenTelNo", title:"<spring:message code='global.lbl.serDlrTelNo' />", width:100}   // 서비스센터 전화
                ,{field:"salCenTelNo", title:"<spring:message code='global.lbl.salDlrTelNo' />", width:100}   // 영업센터 전화
            ]
        });


        // 그리드 더블클릭.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            fn_GridDBclick(selectedItem);
            viewDetailPopup();
        });

        // 그리드 더블클릭.
        fn_GridDBclick = function(selectedItem){
            if( selectedItem != null && selectedItem != 'undefined'){

                var lv2DlrCd = selectedItem.lv2DlrCd;

                $.ajax({
                    url:"<c:url value='/sal/btc/secondDealer/selectSecondDealer.do' />",
                    data:JSON.stringify({sLv2DlrCd:lv2DlrCd}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {

                    var dealer = result["dealer"];
                    var groupDealerList = result["groupDealerList"];

                    setDealerData(dealer, groupDealerList);
                });
            }
        }

    });


    //상세내용 팝업 호출
    function viewDetailPopup(){
        var win = $("#callSecondDealerWindow").data("kendoWindow").center().open();
    }


</script>