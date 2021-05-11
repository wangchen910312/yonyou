<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품목록 -->
    <section class="group">
        <div class="header_area">
                  <h1 class="title_basic"><%-- <spring:message code="par.title.itemCdList" /> --%></h1><!-- 부품목록 -->
            <div class="btn_right">
                <button class="btn_m" id="btnReg"><spring:message code="par.btn.create" /><!-- 등록 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>
        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code="crm.lbl.requestUsrNm" /></th><!-- 신청자 -->
                        <td class="required_area">
                            <div class="form_search">
                                <input id="sCustNo" name="custNo" class="form_input form_readonly hidden" readonly data-json-obj="true" />
                                <input id="sCustNm" name="custNm" class="form_input form_readonly" data-json-obj="true" />
                                <a id="searchCustNo"><!--신청인 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 합격증상태코드 --></th>
                        <td>
                            <input id="sCertStatCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 합격증유형 --></th>
                        <td>
                            <input id="sCertTp" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 신청시간 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input class="form_datepicker" id="sRegDtFr">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input class="form_datepicker" id="sRegDtTo">
                                </div>
                            </div>
                        </td>
                        <td colspan="4"></td>
                   </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
            <!-- 그리드1 -->
        </div>
    </section>
    <!-- //부품목록 -->

    <!-- script -->
    <script>
    var pCertNo
       ,rowNumber            = 0 //그리드 목록 번호
       ,sessionDlrCd         = "${dlrInfo.dlrCd}"
       ,sessionDlrNm         = "${dlrInfo.dlrNm}";

    $(document).ready(function() {

        //조회조건-상태
        $("#sCertStatCd").kendoExtDropDownList({
           dataSource:[
                         {"cmmCd":"01", "cmmCdNm":"登记"} //등록
                        ,{"cmmCd":"02", "cmmCdNm":"审批"} //심사
                        ,{"cmmCd":"03", "cmmCdNm":"处理结束"} //처리완료
                   ]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-유형
        $("#sCertTp").kendoExtDropDownList({
           dataSource:[
                         {"cmmCd":"01", "cmmCdNm":"发动机"} //Engin
                        ,{"cmmCd":"02", "cmmCdNm":"车身"} //Body
                   ]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });


        //조회조건-신청일
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#searchCustNo").on('click', selectCustSearchPopupWindow);

        // 등록 버튼
        $("#btnReg").kendoButton({
            click:function(e) {
                    //window.open("<c:url value='/par/pmm/certification/selectCertReqMain.do' />");  //TEST
                    window.parent._createOrReloadTabMenu("<spring:message code='par.menu.partCertReq' />", "<c:url value='/par/pmm/certification/selectCertReqMain.do' />", "VIEW-I-10508"); //합격증신청

            }
        });

         //초기화버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();

            }
        });

        $("#grid").kendoExtGrid({
            dataSource:{
               transport:{
                    read:{
                        url:"<c:url value='/par/pmm/certification/selectCertListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                      if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sCustNo"]       = $("#sCustNo").val();
                        params["sCertStatCd"]   = $("#sCertStatCd").data("kendoExtDropDownList").value();
                        params["sRegDtFr"]      = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"]      = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sCertTp"]       = $("#sCertTp").data("kendoExtDropDownList").value();

                        console.log('param:', kendo.stringify(params));
                        return kendo.stringify(params);
                    }
                }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }
                        return result.data;
                    }
                    ,model:{
                       id:"certNo"
                      ,fields:{
                           dlrCd        :{ type:"string" }
                          ,rnum         :{ type:"string" }
                          ,certNo       :{ type:"string" }
                          ,certTp       :{ type:"string" }
                          ,certStatCd   :{ type:"string" }
                          ,custNm       :{ type:"string" }
                          ,regDt        :{ type:"date" }
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , pageable   :false
            , editable   :false
            , dataBinding :function(e){
                  rowNumber = 0;
            }
            , columns:[
                  {   //No
                      field     :"rnum"
                     ,title     :"<spring:message code='par.lbl.no'  />"
                     ,attributes:{"class":"ac"}
                     ,sortable  :false
                     ,template  :"#= ++rowNumber #"
                     ,width     :30}
                 ,{   //딜러코드
                      field     :"dlrCd"
                     ,title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,hidden    :true
                     ,width     :100}
                 ,{   //신청번호
                      field    :"certNo"
                     ,title    :"<spring:message code='global.lbl.certNo' />"
                     ,attributes:{"class":"ac"}
                     ,template :"<a href ='<c:url value='/par/pmm/certification/selectCertReqMain.do?pCertNo=#= certNo#'/>'>#= certNo#</a>"
                     ,width    :140 }
                 ,{   //상태 当前环节名称
                      field    :"certStatCd"
                     ,attributes:{"class":"ac"}
                     ,title    :"<spring:message code='global.lbl.statNm' />"
                     ,template :'#= changeCertStatCd(certStatCd)#'
                     ,width    :140 }
                 ,{   //신청인
                      field     :"custNm"
                     ,title     :"<spring:message code='sal.lbl.requestUsr' />"
                     ,attributes:{"class":"ac"}
                     ,width     :210}
                 ,{   //입력시간
                      field     :"regDt"
                     ,title     :"<spring:message code='sal.lbl.reqDt' />"
                     ,attributes:{"class":"ac"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,width     :120}
                 ,{   //유형
                      field    :"certTp"
                     ,attributes:{"class":"ac"}
                     ,title    :"<spring:message code='global.lbl.type' />"
                     ,template :'#= changeCertTp(certTp)#'
                     ,width    :140 }
                , { field:"" }

            ]
        });

        initPage();
        // 날짜 검증

        // 상태 그리드 콤보
        changeCertStatCd = function(val){
            var returnVal = "";
            if(val === '01'){
                returnVal = "登记";
            }else if(val === '02'){
                returnVal = "审批";
            }else{
                returnVal = "处理结束";
            };
            return returnVal;
        };

         // 유형 그리드 콤보
        changeCertTp = function(val){

            var returnVal = "";
            if(val === '01'){
                returnVal = "发动机";
            }else{
                returnVal = "车身";
            };

            return returnVal;
        };

        function fnChkDateValue(e){

            var  elmt  = e.sender.element[0],
                 id    = elmt.id,
                 toYY,
                 toMM,
                 toDD,
                 frYY,
                 frMM,
                 frDD;

            //최근입고일
              if(id === 'sRegDtFr'){
                  frYY = this.value().getFullYear();
                  frMM = this.value().getMonth();
                  frDD = this.value().getDate();
                  $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
              }else if(id === 'sRegDtTo'){
                  toYY = this.value().getFullYear();
                  toMM = this.value().getMonth();
                  toDD = this.value().getDate();
                  $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
              }
         }



    function initPage(){
        //그리드 reset
        $("#grid").data("kendoExtGrid").dataSource.data([]);
        //그리드 reset
        $("#sCustNo").val("");
        $("#sCustNm").val("");
        $("#sCertStatCd").data("kendoExtDropDownList").value('');
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value("");
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value("");
        $("#sCertTp").data("kendoExtDropDownList").value('');

    }
    });


    // 신청자 팝업
    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
           windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sCustNo").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }


</script>
<!-- //script -->

