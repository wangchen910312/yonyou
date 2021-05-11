<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='crm.menu.membershipPointHisMng'/> </h1><!-- 포인트 소멸 이력관리 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button> <!-- excel Export -->
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
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
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointExtcDt'/></span></th> <!-- 소멸일 -->
                                <td>
                                    <div class="date_left">
                                        <input id="sStartDt" name="sStartDt" class="form_datepicker" data-type="maskDate" >
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"> </th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcHistory' /></h2><!-- 소멸 이력 -->
                </div>

                <div class="table_grid mt10">
                    <div id="pointHisGrid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcCustList' /></h2><!-- 소멸 고객 목록 -->
                </div>

                <div class="table_grid mt10">
                    <div id="pointUsrGrid"></div>
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


    $(document).ready(function() {
        //시간 template
        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            /*
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year" */
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
        });

        /*************************************************************
         * 버튼 영역
         *************************************************************/

        //버튼 - 소멸조회
        $("#btnSearch").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sStartDt").val())){
                    //시작일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty($("#sEndDt").val())){
                    //종료일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.endDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                $("#pointHisGrid").data("kendoExtGrid").dataSource.page(1);
                $("#pointUsrGrid").data("kendoExtGrid").dataSource.data([]);
            }
        });


        //버튼 - 엑셀저장
        $("#btnExcelExport").kendoButton({
            click:function(e) {

                if(dms.string.isEmpty($("#sStartDt").val())){
                    //시작일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty($("#sEndDt").val())){
                    //종료일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.endDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                var grid = $('#pointHisGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if(selectedItem == null){
                    //소멸이력을(를) 선택하세요.
                    dms.notification.warning("<spring:message code='crm.title.extcHistory' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                    return;
                }
                dms.ajax.excelExport({
                    "beanName":"membershipPointHisMngService"
                    ,"templateFile":"MembershipPointDel_Tpl.xlsx"
                    ,"fileName":"积分失效记录.xlsx"
                    ,"sPointExtcDt":selectedItem.pointExtcDtStr
                });

            }
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#pointHisGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,pointExtcDtStr:{type:"string"}
                                ,pointExtUsrCnt:{type:"number"}
                                ,extcPointVal:{type:"number"}
                            }
                        }
                }
            }
            ,change:function(e){
                $("#pointUsrGrid").data("kendoExtGrid").dataSource.read();
            }
            ,multiSelectWithCheckbox:false
            ,height:300
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
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"pointExtcDtStr", title:"<spring:message code='crm.lbl.pointExtcDt' />",attributes:{"class":"ac"}}// 소멸일
               ,{field:"pointExtUsrCnt", title:"<spring:message code='crm.lbl.pointExtUsrCnt'/>",attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 대상고객수
               ,{field:"extcPointVal", title:"<spring:message code='crm.lbl.extcPointVal' />",attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 소멸 포인트
            ]
        });


        //그리드 설정
        $("#pointUsrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngUsrs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            var grid = $('#pointHisGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sDlrCd"]       = selectedItem.dlrCd;
                            params["sPointExtcDt"]    = kendo.parseDate(selectedItem.pointExtcDtStr, "<dms:configValue code='dateFormat' />");

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                //,seq:{type:"string"}
                                ,custNm:{type:"string"}
                                ,membershipNo:{type:"string"}
                                ,regDt:{type:"date"}
                                ,extcPointVal:{type:"number"}
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,height:300
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
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               //,{field:"extcSeq", title:"<spring:message code='crm.lbl.extcSeq' />", hidden:true}// 소멸일련번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />",attributes:{"class":"ac"}}// 고객명
               ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />",attributes:{"class":"ac"}}// 멤버십 번호
               ,{field:"regDt", title:"<spring:message code='global.lbl.joinDt' />"
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 가입일자
               ,{field:"extcPointVal", title:"<spring:message code='crm.lbl.extcPointVal' />",attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 소멸 포인트
            ]
        });
    }); /* end ready */

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //소멸일
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }


</script>