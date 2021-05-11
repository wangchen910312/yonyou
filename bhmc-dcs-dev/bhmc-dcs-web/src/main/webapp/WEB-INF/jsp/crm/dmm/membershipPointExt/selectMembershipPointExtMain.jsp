<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='crm.menu.membershipPointExt'/></h1><!-- 포인트 소멸 예정관리-->
                    <div class="btn_right">
                      <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointExtcExpcDt'/></span></th><!-- 소멸예정일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sPointExtcExpcDt" name="sPointExtcExpcDt" class="form_datepicker ac" data-type="maskDate" >
                                        </div>
                                    </div>
                                </td>
                                <%-- <th scope="row"><spring:message code='global.lbl.cardTpCd'/>만기기준</th> <!-- 만기기준 -->
                                <td>
                                    <input id="sCardTpCd" name="sCardTpCd" class="form_comboBox">
                                </td> --%>
                                <th scope="row"> </th>
                                <td>
                                </td>
                                <th scope="row"> </th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->
            </section>

            <section class="group">
                <div class="header_area">
                </div>
                <div class="table_form">
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
                                <th scope="row"><spring:message code='crm.lbl.pointExtUsrCnt'/></th><!-- 대상고객수 -->
                                <td>
                                    <input type="number" id="pointExtUsrCnt" name="pointExtUsrCnt" class="form_numeric ar" data-json-obj="true" readonly="readonly"/>
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.rmnPointVal'/></th><!-- 현시점 포인트 -->
                                <td>
                                    <input type="number" id="totalRmnPointVal" name="totalRmnPointVal" class="form_numeric ar" data-json-obj="true" readonly="readonly"/>
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.extcPointVal' /></th><!-- 소멸예상 포인트 -->
                                <td>
                                    <input type="number" id="totalExtcPointVal" name="totalExtcPointVal" class="form_numeric ar" data-json-obj="true" readonly="readonly"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcCustList' /></h2><!-- 소멸고객목록 -->
                    <div class="btn_right">
                        <button type="button" id="btnSms" class="btn_s"><spring:message code="global.lbl.sms" /></button><!-- SMS -->
                    </div>
                </div>
                <div class="table_grid mt10">
                    <div id="pointExtGrid"></div>
                </div>
            </section>

      <!-- //기본정보 -->


<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/


    /*************************************************************
    jQuery시작
    *************************************************************/
    //대상고객수
    $("#pointExtUsrCnt").kendoExtNumericTextBox({
        format:"n0"
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //현시점 포인트
    $("#totalRmnPointVal").kendoExtNumericTextBox({
        format:"n0"
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //소멸예상 포인트
    $("#totalExtcPointVal").kendoExtNumericTextBox({
        format:"n0"
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    $(document).ready(function() {


        //시간 template
        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            /*
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year" */
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        /*************************************************************
         * 버튼 영역
         *************************************************************/

        //버튼 - 소멸조회
        $("#btnSearch").kendoButton({
            click:function(e){

                var params = {};
                params["sPointExtcExpcDt"] = $("#sPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();

                var url = "<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExtTotalScore.do' />";

                if(dms.string.isEmpty($("#sPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())){
                    //dms.notification.info("소멸예정일은(는) 필수 입력사항 입니다.");
                    dms.notification.info("<spring:message code='crm.lbl.pointExtcExpcDt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                    return;
                }

                $.ajax({
                    url:url
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result){
                        $("#pointExtUsrCnt").data("kendoExtNumericTextBox").value(result.totalScore.pointExtUsrCnt);

                        //$("#totalExtcPointVal").val(result.totalScore.totalExtcPointVal);
                        $("#totalExtcPointVal").data("kendoExtNumericTextBox").value(result.totalScore.totalExtcPointVal);

                        //$("#totalRmnPointVal").val(result.totalScore.totalRmnPointVal);
                        $("#totalRmnPointVal").data("kendoExtNumericTextBox").value(result.totalScore.totalRmnPointVal);

                    }
                }).done(function(result) {
                    console.log("btnCustSave Done!!!!");
                    search();
                });
            }
        });

        //버튼 - 엑셀저장
        $("#btnExcelExport").kendoButton({
            click:function(e) {
                if(dms.string.isEmpty($("#sPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())){
                    //dms.notification.info("소멸예정일은(는) 필수 입력사항 입니다.");
                    dms.notification.info("<spring:message code='crm.lbl.pointExtcExpcDt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                    return;
                }

                dms.ajax.excelExport({
                    "beanName":"membershipPointExtService"
                    ,"templateFile":"MembershipPointExt_Tpl.xlsx"
                    ,"fileName":"预计积分失效客户目录.xlsx"
                    ,"sPointExtcExpcDt":$("#sPointExtcExpcDt").val()
                    //,"sPointExtcExpcDt":$("#sPointExtcExpcDt").data("kendoExtMaskedDatePicker").value()
                    //var sOccrDt = kendo.parseDate(v+"-01", "<dms:configValue code='dateFormat' />");
                    //,"sPointExtcExpcDt":kendo.parseDate($("#sPointExtcExpcDt").val(), "<dms:configValue code='dateFormat' />")
                });

            }
        });

        //버튼 - 소멸조회
        $("#btnSms").kendoButton({
            click:function(e){
                //개발중입니다.
                /* dms.notification.info("<spring:message code='global.msg.eveloping'/>");
                return; */

                var   grid = $("#pointExtGrid").data("kendoExtGrid")
                , rows = grid.select()
                , dataItem
                , dataValidate  = false
                , smsTmplUserGroup = "Y"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                , smsTmplUserList = []              // sms 전송 대상자 목록
                , pointExtGrid = $("#pointExtGrid").data("kendoExtGrid")
                , selectedItem = pointExtGrid.dataItem(pointExtGrid.select())
                , refKeyNm
                , refTableNm = "CR_0811T"
                , contactBizCd = "06"// TODO [공통코드 확인] 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
            ;

            if (rows.length <= 0) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            refKeyNm = selectedItem.extcSeq   // 단건 일때는 여기서 변수지정, List 일때는 smsTmplUserList 에서 변수지정

            // SMS 대상자가 다건일경우 smsTmplUserList에 리스트로 담아서 보내면되고ㅡ, 단건이면 smsTmplUserList에 1건만 담아서 리스트로 보내면 됩니다.
            rows.each(function(index, row) {

                dataItem = grid.dataItem(row);

                if ( dms.string.isEmpty(dataItem.custNo) || dms.string.isEmpty(dataItem.custNm) || dms.string.isEmpty(dataItem.hpNo) ) {
                    // {고객정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.custInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    smsTmplUserList = [];
                    dataValidate = true;
                    return false;
                }

                smsTmplUserList.push({
                    "custNo" :dataItem.custNo
                  , "custNm" :dataItem.custNm
                  , "hpNo"   :dataItem.hpNo
                  , "refKeyNm":dataItem.extcSeq
                });


            });
            if(dataValidate){ return false; }

            // SMS 전송 대상자를 임시 테이블에 저장
            if ( smsTmplUserGroup === "Y" ) {

                $.ajax({
                    url:"<c:url value='/crm/cmm/customerInfo/insertSmsTmplUsers.do' />"
                    ,data:JSON.stringify(smsTmplUserList)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {

                        if ( jqXHR > 0 && textStatus === "success" ) {
                            smsTmplUserSeq = jqXHR;
                        } else {
                            smsTmplUserSeq = ""
                        }

                    }
                });

                smsTmplUserList = [];

            } else if ( smsTmplUserGroup === "N" ) {

                smsTmplUserSeq = ""
            }

            messagePopupWindow = dms.window.popup({
                windowId:"messagePopupWindow"
                , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                , width:"550px"
                , height:"550px"
                , content:{
                    url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                    , data:{
                        "autoBind":false

                        , "smsTmplUserList":smsTmplUserList
                        , "smsTmplUserSeq" :smsTmplUserSeq

                        , "contactBizCd"   :contactBizCd
                        , "refTableNm"     :refTableNm
                        , "refKeyNm"       :refKeyNm

                        , "callbackFunc":function(data){

                            if(data == "success"){

                                messagePopupWindow.close();
                                // 전송 / 이 완료 되었습니다.
                                dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                search();
                            }

                        }
                    }
                }
            });
            }
        , enable:true
        });

        function search(){
            $("#pointExtGrid").data("kendoExtGrid").dataSource._destroyed = [];
            $("#pointExtGrid").data("kendoExtGrid").dataSource.page(1);
        }

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#pointExtGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExts.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sPointExtcExpcDt"]    = $("#sPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"extcSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,extcSeq:{type:"string"}
                                ,membershipNo:{type:"string"}
                                ,custNm:{type:"string"}
                                ,custNo:{type:"string"}
                                ,hpNo:{type:"string"}
                                ,regDt:{type:"string"}
                                ,smsSendYn:{type:"string"}
                                ,rmnPointVal:{type:"string"}
                                ,extcPointVal:{type:"string"}
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,height:380
            ,editable:false
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"extcSeq", title:"<spring:message code='crm.lbl.extcSeq' />", hidden:true}// 소멸예정 일련번호
               ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />",attributes:{"class":"ac"}}// 멤버십번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />"}// 고객명
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", hidden:true}// 고객번호
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />",attributes:{"class":"ac"}}// 휴대전화
               ,{field:"regDt", title:"<spring:message code='global.lbl.joinDt' />",attributes:{"class":"ac"}}// 가입일자
               ,{field:"smsSendYn", title:"<spring:message code='crm.lbl.smsSendYn' />",attributes:{"class":"ac"}}// SMS발신여부
               ,{field:"rmnPointVal", title:"<spring:message code='crm.lbl.rmnPointVal' />"
                   ,width:150
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   //,format:"{0:n2}"
               }// 현시점 포인트
               ,{field:"extcPointVal", title:"<spring:message code='crm.lbl.extcPointVal' />"
                   ,width:150
                   ,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 소멸예상 포인트
               ,{title:"&nbsp;"}
            ]
        });
    }); /* end ready */



</script>