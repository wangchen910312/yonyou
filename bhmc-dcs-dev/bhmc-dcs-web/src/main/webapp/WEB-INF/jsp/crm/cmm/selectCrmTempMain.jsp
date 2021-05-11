<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group" style="margin:5px 10px;">

    <div class="header_area">
        <h1 class="title_basic">CRM</h1>
        <!-- <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch">Search</button>
        </div> -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="dcsBatTab">배치 실행 TEST</li>
            <li id="dcsDataTab">딜러 데이터 파일 현황</li>
            <li id="dmsIFTab">딜러 I/F 현황</li>
            <li id="dmsListTb" class="k-state-active">딜러 목록</li>
        </ul>
        <!-- //탭메뉴 -->

        <div class="mt0" ><!-- dcsBatTab -->
            <section class="group">
                <div class="header_area"></div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width: 10%;">
                            <col style="width: 30%;">
                            <col style="width: 5%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">캠페인 배포</th>
                                <td>(CRM408, CRM411, CRM412, CRM413,CRM414, CRM415, CRM416)</td>
                                <td><button class="btn_xs" id="btnCampaign" >실행</button></td>
                                <td id="statCampaign"></td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2">DMS DATA IN</th>
                                <td>날짜:<input type="text" id="dataInDay">ex)20171010</td>
                                <td><button class="btn_xs" id="btnDataIn" >실행</button></td>
                                <td id="statDataIn"></td>
                            </tr>
                            <tr>
                                <td>딜러코드:<input type="text" id="dataInDlrCd">ex)D0119</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <div class="mt0" ><!-- dcsDataTab DMS DATA file 검색 -->
            <section class="group"><!-- 검색 -->
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_search" id="btnDmsDataFileSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnDmsDataFileSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">일자</th>
                                <td>
                                    <input type="text" id="sDmsDataFileDay" name="sDmsDataFileDay" class="form_input" placeholder="ex)20171010" />
                                </td>
                                <th scope="row">DCS 입력여부</th>
                                <td>
                                    <input type="text" id="sDmsDataReadFileYn" name="sDmsDataReadFileYn" class="form_input" placeholder="Y/N" />
                                </td>
                                <th scope="row">전체데이터</th>
                                <td>
                                    <input type="text" id="sDmsDataAllYn" name="sDmsDataAllYn" class="form_input" placeholder="Y/N" />
                                </td>
                                <th scope="row"></th>
                                <td></td>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="group mt10">
                <div class="header_area"></div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width: 10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">File없음<span id="noFileDlrCdCnt"></span></th>
                                <td id="noFileDlrCd"></td>
                            </tr>
                            <tr>
                                <th scope="row">File읽지 않음<span id="noReadFileDlrCdCnt"></span></th>
                                <td id="noReadFileDlrCd"></td>
                            </tr>
                            <tr>
                                <th scope="row">전체데이터<span id="allDataFileDlrCdCnt"></span></th>
                                <td id="allDataFileDlrCd"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="group"><!-- 목록 -->
                <div class="table_grid mt10">
                    <div id="dmsDataFileGrid"></div><!--  class="resizable_grid" -->
                </div>
            </section>
        </div>
        <div class="mt0" ><!-- dmsIFTab 딜러 I/F 현황 -->
            <section class="group"><!-- 검색 -->
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_search" id="btnDmsIFSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnDmsIFSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:10%;">
                            <col style="width:9%;">
                            <col style="width:10%;">
                            <col style="width:9%;">
                            <col style="width:20%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">딜러코드</th>
                                <td>
                                    <input type="text" id="sDmsIFDlrCd" name="sDmsIFDlrCd" class="form_input" placeholder="ex)D0101" /></td>
                                <th scope="row">I/F 상태</th>
                                <td>
                                    <input type="text" id="sDmsIFResult" name="sDmsIFResult" class="form_input" placeholder="ex)E/P" />
                                </td>
                                <th scope="row">OPEN 일자</th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sDmsIFOpenStartDt" name="sDmsIFOpenStartDt" class="form_input" value="20170622" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sDmsIFOpenEndDt" name="sDmsIFOpenEndDt" class="form_input" value="${sOpenToDt}" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">I/F 마지막 성공시간</th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sDmsIFSuccessStartDt" name="sDmsIFSuccessStartDt" class="form_input" placeholder="ex)20180401000000" value="" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sDmsIFSuccessEndDt" name="sDmsIFSuccessEndDt" class="form_input" placeholder="ex)20180401000000" value="" />
                                        </div>
                                    </div>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">DMS USE YN</th>
                                <td>
                                    <input type="text" id="sDmsIFDmsUseYn" name="sDmsIFDmsUseYn" class="form_input" placeholder="Y/N" value="Y"/>
                                </td>
                                <th scope="row">ALIVE YN</th>
                                <td>
                                    <input type="text" id="sDmsIFAliveYn" name="sDmsIFAliveYn" class="form_input" placeholder="Y/N" />
                                </td>
                                <th scope="row">BM I/F 포함여부</th>
                                <td>
                                    <input type="text" id="sDmsIFBmYn" name="sDmsIFBmYn" class="form_input" placeholder="Y/N" value="Y"/>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                             </tr>
                              <tr>
                                <th scope="row">NOT IN 딜러코드</th>
                                <td colspan="3">
                                    <input type="text" id="sDmsIFDlrCdNotIn" name="sDmsIFDlrCdNotIn" class="form_input" placeholder="ex)D0101,D0102" /></td>
                                <th scope="row">IN 딜러코드</th>
                                <td colspan="3">
                                    <input type="text" id="sDmsIFDlrCdIn" name="sDmsIFDlrCdIn" class="form_input" placeholder="ex)D0101,D0102" /></td>
                                </td>
                             </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="group"><!-- 목록 -->
                <div class="table_grid mt10">
                    <div id="dmsIFCountGrid"></div>
                </div>
                <div class="table_grid mt10">
                    <div id="dmsIFGrid"></div>
                </div>
            </section>
        </div>
        <div class="mt0" ><!-- dmsListTab 딜러 목록 -->
            <section class="group"><!-- 검색 -->
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_search" id="btnDmsListeSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnDmsListeSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">OPEN 일자</th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sDmsListStartDt" name="sDmsListStartDt" class="form_input" value="20170622" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sDmsListEndDt" name="sDmsListEndDt" class="form_input" value="${sOpenToDt}" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">딜러코드</th>
                                <td>
                                    <input type="text" id="sDmsListDlrCd" name="sDmsListDlrCd" class="form_input"/>
                                </td>
                                <th scope="row">딜러IP</th>
                                <td>
                                    <input type="text" id="sDmsListDmsIpNm" name="sDmsListDmsIpNm" class="form_input"/>
                                </td>
                                <th scope="row">ALIVE YN</th>
                                <td>
                                    <input type="text" id="sDmsListAliveYn" name="sDmsListAliveYn" class="form_input" placeholder="Y/N" />
                                </td>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="group"><!-- 목록 -->
                <div class="table_grid mt10">
                    <div id="dmsListGrid"></div><!--  class="resizable_grid" -->
                </div>
            </section>
        </div>
    </div>
</section>
<script type="text/javascript">

//배치수행상태
var batOperRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${batOperRsltCdList}">
batOperRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" ,"useYn":"${obj.useYn}"});
</c:forEach>
var batOperRsltCdMap = dms.data.arrayToMap(batOperRsltCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //탭설정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    //캠페인 I/F
    $("#btnCampaign").kendoButton({
        click:function(e) {
            receiveCampaignDcs();
        }
    });
    //DMS 데이터 파일 입력
    $("#btnDataIn").kendoButton({
        click:function(e) {
            dataIn();
        }
    });

    //Dms Data file 목록조회
    $("#btnDmsDataFileSearch").kendoButton({
        click:function(e){
            $('#dmsDataFileGrid').data('kendoExtGrid').dataSource.page(1);
            selectDmsDataFileDealer();
        }
    });

    // Dms Data file 목록
    $("#dmsDataFileGrid").kendoExtGrid({
        gridId:"G-CRM-1227-111026"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/bat/crm/cmm/selectDmsDataFile.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["day"] = $("#sDmsDataFileDay").val();
                        params["readFileYn"] = $("#sDmsDataReadFileYn").val();
                        params["allYn"] = $("#sDmsDataAllYn").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model: {
                    fields: {
                        dlrCd: { type: "String" }
                    }
               }
            }
        }
        ,autoBind:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:fa
        ,editable:false
        ,navigatable:true
        ,sortable:false
        ,selectable:"row"
        ,height:790
        ,columns:[
           {field:"dlrCd", title:"딜러",attributes:{"class":"al"},width:80}
           ,{field:"regTime", title:"생성시간",attributes:{"class":"al"},width:80}
           ,{field:"fName", title:"File Name",attributes:{"class":"al"},width:300}
           ,{field:"fSize", title:"File Size",attributes:{"class":"al"},width:300}
        ]
    });

    //Dms Data file 목록조회
    $("#btnDmsIFSearch").kendoButton({
        click:function(e){
            $('#dmsIFGrid').data('kendoExtGrid').dataSource.page(1);
            $('#dmsIFCountGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // Dms Data file 목록
    $("#dmsIFCountGrid").kendoExtGrid({
        gridId:"G-CRM-1227-111029"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/bat/crm/cmm/selectDmsIFCount.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sDlrCd"] = $("#sDmsIFDlrCd").val();
                        params["sIfresult"] = $("#sDmsIFResult").val();
                        params["sOpenStartDt"] = $("#sDmsIFOpenStartDt").val();
                        params["sOpenEndDt"] = $("#sDmsIFOpenEndDt").val();
                        params["sIfSuccessStartDt"] = $("#sDmsIFSuccessStartDt").val();
                        params["sIfSuccessEndDt"] = $("#sDmsIFSuccessEndDt").val();
                        params["sDmsUseYn"] = $("#sDmsIFDmsUseYn").val();
                        params["sAliveYn"] = $("#sDmsIFAliveYn").val();
                        params["sBmYn"] = $("#sDmsIFBmYn").val();
                        params["sDlrCdNotIn"] = $("#sDmsIFDlrCdNotIn").val();
                        params["sDlrCdIn"] = $("#sDmsIFDlrCdIn").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model: {
                    fields: {
                        rnum:{type:"number", editable:false}
                    }
               }
            }
        }
        ,autoBind:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:fa
        ,editable:false
        ,navigatable:true
        ,sortable:false
        ,selectable:"row"
        ,height:200
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
              ,filterable:false
              ,attributes:{"class":"ac"}
            }
           ,{field:"dlrCd", title:"딜러",attributes:{"class":"al"},width:80}
           ,{field:"dmsIpNm", title:"DMS IP", width:100,attributes:{"class":"al"}
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var spanObj = "<a href='http://"+dataItem.dmsIpNm+"/cmm/ath/login/selectLoginMain.do' target='_blank'>"+dataItem.dmsIpNm+"</a>";
                   return spanObj;
               }
            }
           ,{field:"cnt", title:"COUNT",attributes:{"class":"al"},width:80}
           ,{field:"openDt", title:"딜러 오픈일",attributes:{"class":"al"},width:80}
           ,{field:"ifSuccessDt", title:"IF 마지막 성공일",attributes:{"class":"al"},width:80}
           ,{field:"minUpdatedate", title:"UPDATE DATE",attributes:{"class":"al"},width:80}
        ]
    });

    $("#dmsIFGrid").kendoExtGrid({
        gridId:"G-CRM-1227-111027"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/bat/crm/cmm/selectDmsIF.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sDlrCd"] = $("#sDmsIFDlrCd").val();
                        params["sIfresult"] = $("#sDmsIFResult").val();
                        params["sOpenStartDt"] = $("#sDmsIFOpenStartDt").val();
                        params["sOpenEndDt"] = $("#sDmsIFOpenEndDt").val();
                        params["sIfSuccessStartDt"] = $("#sDmsIFSuccessStartDt").val();
                        params["sIfSuccessEndDt"] = $("#sDmsIFSuccessEndDt").val();
                        params["sDmsUseYn"] = $("#sDmsIFDmsUseYn").val();
                        params["sAliveYn"] = $("#sDmsIFAliveYn").val();
                        params["sBmYn"] = $("#sDmsIFBmYn").val();
                        params["sDlrCdNotIn"] = $("#sDmsIFDlrCdNotIn").val();
                        params["sDlrCdIn"] = $("#sDmsIFDlrCdIn").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model: {
                    fields: {
                        fName: { type: "String" }
                    }
               }
            }
        }
        ,autoBind:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:fa
        ,editable:false
        ,navigatable:true
        ,sortable:false
        ,selectable:"row"
        ,height:790
        ,columns:[
            {field:"ifTp", title:"I/F 종류",attributes:{"class":"al"},width:80}
           ,{field:"dlrCd", title:"딜러",attributes:{"class":"al"},width:80}
           ,{field:"ifSeq", title:"IF SEQ",attributes:{"class":"al"},width:80}
           ,{field:"updatedate", title:"UPDATE DATE",attributes:{"class":"al"},width:80}
           ,{field:"createdate", title:"CREATE DATE",attributes:{"class":"al"},width:80}
           ,{field:"ifresult", title:"IF RESULT",attributes:{"class":"al"},width:80}
           ,{field:"iffailmsg", title:"IF MESSAGE",attributes:{"class":"al"},width:500}
        ]
    });

    //Dms List 목록조회
    $("#btnDmsListeSearch").kendoButton({
        click:function(e){
            $('#dmsListGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#dmsListGrid").kendoExtGrid({
        gridId:"G-CRM-0410-110400"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/bat/crm/cmm/selectDmsList.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sDlrCd"] = $("#sDmsListDlrCd").val();
                        params["sStartDt"] = $("#sDmsListStartDt").val();
                        params["sEndDt"] = $("#sDmsListEndDt").val();
                        params["sDmsIpNm"] = $("#sDmsListDmsIpNm").val();
                        params["sAliveYn"] = $("#sDmsListAliveYn").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model: {
                    fields: {
                        rnum:{type:"number", editable:false}
                    }
               }
            }
        }
        ,autoBind:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:fa
        ,editable:false
        ,navigatable:true
        ,sortable:false
        ,selectable:"row"
        ,height:790
        ,pageable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
              ,filterable:false
              ,attributes:{"class":"ac"}
            }
           ,{field:"dlrCd", title:"딜러",attributes:{"class":"ac"},width:80}
           ,{field:"dlrNm", title:"딜러명",attributes:{"class":"ac"},width:80}
           ,{field:"openDt", title:"OPEN DT",attributes:{"class":"ac"},width:80}
           ,{field:"dmsIpNm", title:"DMS IP", width:100,attributes:{"class":"ac"}
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var spanObj = "<a href='http://"+dataItem.dmsIpNm+"/cmm/ath/login/selectLoginMain.do' target='_blank'>"+dataItem.dmsIpNm+"</a>";
                   return spanObj;
               }
            }
           ,{field:"dmsUseYn", title:"DMS USE YN",attributes:{"class":"ac"},width:80}
           ,{field:"aliveYn", title:"ALIVE YN",attributes:{"class":"ac"},width:80}
           ,{field:"ifSuccessDt", title:"CRM I/F 마지막 성공일",attributes:{"class":"ac"},width:100}
           ,{field:"dmsIpNm", title:"MIG CHK URL", width:100,attributes:{"class":"ac"},width:500
               ,attributes:{"class":"al"}
               ,template:function(dataItem){
                   var spanObj = "<a href='http://"+dataItem.dmsIpNm+"/cmm/mig/selectMigCheckMain.do' target='_blank'>http://"+dataItem.dmsIpNm+"/cmm/mig/selectMigCheckMain.do</a>";
                   return spanObj;
               }
            }
           ,{field:"dmsIpNm", title:"MIG URL", width:100,attributes:{"class":"ac"},width:500
               ,attributes:{"class":"al"}
               ,template:function(dataItem){
                   var spanObj = "<a href='http://"+dataItem.dmsIpNm+"/cmm/mig/selectMigMain.do' target='_blank'>http://"+dataItem.dmsIpNm+"/cmm/mig/selectMigMain.do</a>";
                   return spanObj;
               }
            }
        ]
    });

});
function receiveCampaignDcs(){
    $.ajax({
            url:"<c:url value='/bat/crm/mcm/markingCampaignDcsIfBatchService.do' />",
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                $("#statCampaign").html(kendo.stringify(jqXHR.responseJSON.errors));
            },
            success:function(jqXHR, textStatus) {
                $("#statCampaign").html("성공");
            }
        });
}
function dataIn(){
    var paramData = {};
    paramData["day"] = $("#dataInDay").val();
    paramData["dlr_cd"] = $("#dataInDlrCd").val();
    $.ajax({
            url:"<c:url value='/bat/crm/cmm/dmsDataIfBatchService.do' />",
            data:JSON.stringify(paramData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                $("#statDataIn").html(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                $("#statDataIn").html("성공");
            }
        });
}
function selectDmsDataFileDealer(){
    var paramData = {};
    paramData["day"] = $("#sDmsDataFileDay").val();
    $.ajax({
        url:"<c:url value='/bat/crm/cmm/selectDmsDataFileDealer.do' />",
        data:JSON.stringify(paramData),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            console.log(jqXHR);

        },
        success:function(jqXHR, textStatus) {
            var dlrList = "";
            for(var key in jqXHR.noFileDlrCd){
                dlrList = dlrList + " , " + jqXHR.noFileDlrCd[key];
            }
            $("#noFileDlrCd").html(dlrList.substring(3));
            $("#noFileDlrCdCnt").html("(<strong>"+jqXHR.noFileDlrCd.length+"</strong>)");

            dlrList = "";
            for(var key in jqXHR.noReadFileDlrCd){
                dlrList = dlrList + " , " + jqXHR.noReadFileDlrCd[key];
            }
            $("#noReadFileDlrCd").html(dlrList.substring(3));
            $("#noReadFileDlrCdCnt").html("(<strong>"+jqXHR.noReadFileDlrCd.length+"</strong>)");

            dlrList = "";
            for(var key in jqXHR.allDataFileDlrCd){
                dlrList = dlrList + " , " + jqXHR.allDataFileDlrCd[key];
            }
            $("#allDataFileDlrCd").html(dlrList.substring(3));
            $("#allDataFileDlrCdCnt").html("(<strong>"+jqXHR.allDataFileDlrCd.length+"</strong>)");

        }
    });
}
</script>