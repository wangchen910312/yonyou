<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

        <!--재고실사분석-->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
				<dms:access viewId="VIEW-D-11902" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
				</dms:access>
                </div>
                <div class="btn_right">
				<dms:access viewId="VIEW-D-11901" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button>
				</dms:access>
                </div>
            </div>

        <div class="table_form form_width_70per" id="investigationForm"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input" />
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                <input type="text" id="strgeCd" class="form_input hidden" />
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                        <td class="readonly_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sRegDtFr" class="form_datepicker" readonly />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sRegDtTo" class="form_datepicker" readonly />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 실사담당자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sPrsnNm"  class="form_input" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td class="readonly_area">
                            <input id="sDocStatCd" class="form_comboBox" />
                            <input id="stockDdDocNo" type="hidden" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 헤더정보-->
        <div class="table_grid mt10">
            <div id="hgrid" class="grid"></div>
        </div>
        <!-- 실사입고 정보-->
        <div class="table_grid mt10">
            <div id="ingrid" class="grid"></div>
        </div>
        <!-- 실사출고 정보-->
        <div class="table_grid mt10">
            <div id="outgrid" class="grid"></div>
        </div>

        <!-- 실사문서  검색-->
        </section>


        <script>
         var stockStatList    = []
            ,docStatList      = [""]
            ,docStatObj       = {}
            ,stockLockYnList  = []
            ,abcIndList       = []
            ,abcIndObj        = {}
            ,itemStatList     = []
            ,itemStatObj      = {}
            ,storageCdList    = []
            ,storageObj       = {}
            ,rowNumber        = 0
            ,sevenDtBf        = "${sevenDtBf}"
            ,toDt             = "${toDt}";


        //조회옵션 설정--문서상태
        <c:forEach var="obj" items="${docStatList}">
            docStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //조회옵션 설정--ABC CLASS
        <c:forEach var="obj" items="${abcIndList}">
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //조회옵션 설정--품목상태
        <c:forEach var="obj" items="${itemStatList}" varStatus="status">
           itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //창고 선택
       <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
         storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
         storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
       </c:forEach>


       function initPage(){

           $("#hgrid").data("kendoExtGrid").dataSource.data([]);
           $("#ingrid").data("kendoExtGrid").dataSource.data([]);
           $("#outgrid").data("kendoExtGrid").dataSource.data([]);
           $("#sPrsnNm").val("");                                              //담당자
           $("#sStockDdDocNo").val("");                                        //재고실사문서
           $("#sDocStatCd").data("kendoExtDropDownList").value("");
       }

       // 재고실사리스트 팝업 열기 함수.
       function selectInvestigationListPopupWindow(){

           investigationListPopupWindow = dms.window.popup({
               windowId:"investigationListPopup"
               ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
               ,width:860
               ,height:380
               ,content:{
                   url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                   ,data:{
                       "type":"custom1"
                       ,"autoBind":false
                       ,"stockDdDocNo":$("#sStockDdDocNo").val()
                       ,"docStatCd"   :"END"
                       ,"callbackFunc":function(data){
                           initPage();
                           if(data.length > 0){
                               $("#sPrsnNm").val(data[0].prsnNm);
                               $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                               $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                               $("#btnSearch").click();
                           }
                           investigationListPopupWindow.close();
                       }
                   }
               }
           });
       }

       function userSearchPopup() {
           userSearchPopupWin = dms.window.popup({
               windowId:"userSearchPopupWin"
               ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
               ,content:{
                   url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                   , data:{
                       "autoBind":false
                       ,"usrNm":""
                       ,"callbackFunc":function(data){
                           if(data.length > 0){
                               $("#sPrsnNm").val(data[0].usrNm);

                           }
                       }
                   }
               }

           });
       }

        $(document).ready(function() {

        //재고실사상태
        $("#sDocStatCd").kendoExtDropDownList({
            enable:false
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:docStatList
            ,opotionLabel:" "
            ,index:0
        });
        //조회조건-등록일 From
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //조회조건-등록일 To
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
        $("#searchPrsnId").on('click', userSearchPopup);
        //초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        //조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
              $("#hgrid").data("kendoExtGrid").dataSource.read();
            }
        });

        //실사문서 그리드 세팅
        $("#hgrid").kendoExtGrid({
            gridId:"G-PAR-0519-172302"
            ,dataSource:{
                transport:{
                    read :{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sPrsnNm"] = $("#sPrsnNm").val();
                            params["sStockDdDocNo"] = $("#sStockDdDocNo").val();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sDocStatCd"] = "END";

                            return kendo.stringify(params);
                       }
                   }
            }
            ,schema:{
                data:function(result){
                    return result.data;
                }
                ,model:{
                    id:"InvestigationList"
                        ,fields:{
                            rnum:{ type:"string" }
                            ,move:{ type:"string" }
                            ,dlrcd:{ type:"string" }
                            ,docStatCd:{ type:"string" }
                            ,stockDdDocNo:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,approveReqDt:{ type:"date" }
                            ,endDt:{ type:"date" }
                            ,prsnId:{ type:"string" }
                            ,prsnNm:{ type:"string" }
                            ,stockLockYn:{ type:"string" }
                            ,remark:{ type:"string" }
                            ,signOpnCont:{ type:"string" }
                      }
                  }
               }
            }
            ,height:173
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,editable:false
            ,dataBinding:function(e){
                rowNumber = 0;
            }
            ,change:function(e) {
                var selectedVal = this.dataItem(this.select());
                //재고실사문서 정보 SEARCHING DATA SETTING
                $("#stockDdDocNo").val(selectedVal.stockDdDocNo);//재고실사문서
                //재고실사문서 정보 조회
                $("#ingrid").data("kendoExtGrid").dataSource.read();
                $("#outgrid").data("kendoExtGrid").dataSource.read();
            }
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.line'  />" ,sortable:false ,width:50}//No
                ,{field:"stockDdDocNo",title:"<spring:message code='par.lbl.stockDdDoc' />",attributes:{"class":"ac"},width:120 }//재고실사문서
                ,{field:"regDt",title:"<spring:message code='par.lbl.investigationConfDt' />",attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}",width:100 }//등록일
                ,{field:"prsnId",title:"<spring:message code='par.lbl.investigationPrsId' />",attributes:{"class":"ac"},width:100,hidden:true }//담당자
                ,{field:"prsnNm",title:"<spring:message code='par.lbl.investigationPrsId' />",attributes:{"class":"ac"},width:100 }//담당자
                ,{field:"stockLockYn",title:"<spring:message code='par.lbl.stockLockYn' />",attributes:{"class":"ac"},width:100 }//재고통제여부
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.ddTotQty' />",attributes:{"class":"ar"},format:"{0:n2}",decimal:2,width:80}//재고수량(장부수량)
                ,{field:"stockPrice",title:"<spring:message code='par.lbl.ddTotPrice' />",width:100,attributes:{ "class":"ar"},format:"{0:n2}",decimals:2}//금액
                ,{field:"docStatCd",title:"<spring:message code='par.lbl.statNm' />",attributes:{"class":"ac"},width:120
                    //,template  :'#= changeDocStatCd(docStatCd)#'
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.docStatCd){
                            case "RGST"://등록
                                spanObj = "<span class='txt_label bg_yellow'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            case "REQ"://승인요청
                                spanObj = "<span class='txt_label bg_green'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            case "END"://승인완료
                                spanObj = "<span class='txt_label bg_blue'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            case "ENDA"://완성
                                spanObj = "<span class='txt_label bg_purple'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            case "CANC"://취소
                                spanObj = "<span class='txt_label bg_orange'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            case "RJCT"://반환
                                spanObj = "<span class='txt_label bg_red'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//상태
            ]
        });
        // 재고실사관리 그리드
        $("#ingrid").kendoExtGrid({
            gridId:"G-PAR-1010-151301"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectApproveReqInvestigations.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if(operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"] = $("#stockDdDocNo").val();
                            params["sAddDiffYn"] = "Y";//손익손실구분자

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        return result.data;
                    }
                    ,model:{
                        id:"stockDdDocNo"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,strgeCd:{ type:"string", editable:false }
                            ,stockDdDocNo:{ type:"string", editable:false }
                            ,stockDdDocLineNo:{ type:"number", editable:false }
                            ,strgeCd:{ type:"string", editable:false }
                            ,locCd:{type :"string", editable:false }
                            ,itemCd:{ type:"string", editable:false }
                            ,itemNm:{ type:"string", editable:false }
                            ,itemDstinCd:{type :"string", editable:false }
                            ,itemStatCd:{type :"string", editable:false }
                            ,carlineCd:{type :"string", editable:false }
                            ,abcInd:{type :"string", editable:false }
                            ,lastGrDt:{ type:"date"  , editable:false }
                            ,lastGiDt:{ type:"date"  , editable:false }
                            ,unitCd:{ type:"string", editable:false }
                            ,bookQty:{ type:"number", editable:false }
                            ,ddQty:{ type:"number", editable:true }
                            ,diffQty:{ type:"number", editable:true }
                            ,movingAvgPrc:{ type:"number", editable:false }
                            ,reasonCont:{ type:"string", editable:true }
                            ,stockItemPlusQty:{ type:"number", editable:false }
                            ,stockItemPlusPrc:{ type:"number", editable:false }
                            ,stockItemMinusQty:{ type:"number", editable:false }
                            ,stockItemMinusPrc:{ type:"number", editable:false }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,scrollable:true
            ,sortable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,editable:false
            ,height:173
            ,dataBound:function(e){

                rowNumber = 0;

                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd'  />" ,hidden:true ,width:100}
                ,{field:"rnum" ,title:"<spring:message code='par.lbl.line'  />" ,width:50
                    ,template  :"#= ++rowNumber #"
                }
                ,{field:"itemStatCd" ,title:"<spring:message code='par.lbl.itemStatCd'  />" ,hidden:true ,width:90
                    ,template  :'#= changeItemStatCd(itemStatCd)#'
                }
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'  />" ,width:140}
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'  />" ,width:200}
                ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeCd'  />" ,width:100
                    ,template:'#= changeStrgeCd(strgeCd)#'
                }
                ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd'  />" ,width:120}
                ,{field:"unitCd" ,title:"<spring:message code='par.lbl.stockUnitCd'  />" ,attributes:{"class":"ac"} ,width:90}
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"},format:"{0:n2}" ,decimal:2 ,width:90}
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//실제수량
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockNum' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//재고수량(장부수량)
                ,{field:"ddQty" ,title:"<spring:message code='par.lbl.ddQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//실사수량
                ,{field:"stockItemPlusQty" ,title:"<spring:message code='par.lbl.stockItemPlusQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2
                    /* ,template:function(data){
                        //실사수량 - 재고수량
                        if(data.ddQty-data.bookQty>0){
                            return data.ddQty-data.bookQty;
                        }else{
                            return 0;
                        }
                    } */
                 }//손익수량
                 ,{field:"stockItemPlusPrc" ,title:"<spring:message code='par.lbl.stockItemPlusPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2
                     /* ,template:function(data){
                         if(data.ddQty-data.bookQty>0){
                             return kendo.toString(kendo.parseFloat(((data.ddQty-data.bookQty)*data.movingAvgPrc)),"n2");
                         }else{
                             return 0;
                         }
                     } */
                 }//손익금액
            ]
        });

        $("#outgrid").kendoExtGrid({
            gridId:"G-PAR-1010-151302"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectApproveReqInvestigations.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"] = $("#stockDdDocNo").val();
                            params["sAddDiffYn"] = "N";//손익손실구분자

                            return kendo.stringify(params);
                      }
                  }
              }
              ,schema:{
                  data:function (result){
                      return result.data;
                  }
                  ,model:{
                      id:"stockDdDocNo"
                          ,fields:{
                              dlrCd:{ type:"string" , validation:{required:true} }
                              ,strgeCd:{ type:"string", editable:false }
                              ,stockDdDocNo:{ type:"string", editable:false }
                              ,stockDdDocLineNo:{ type:"number", editable:false }
                              ,strgeCd:{ type:"string", editable:false }
                              ,locCd:{type :"string", editable:false }
                              ,itemCd:{ type:"string", editable:false }
                              ,itemNm:{ type:"string", editable:false }
                              ,itemDstinCd:{type :"string", editable:false }
                              ,itemStatCd:{type :"string", editable:false }
                              ,carlineCd:{type :"string", editable:false }
                              ,abcInd:{type :"string", editable:false }
                              ,lastGrDt:{ type:"date"  , editable:false }
                              ,lastGiDt:{ type:"date"  , editable:false }
                              ,unitCd:{ type:"string", editable:false }
                              ,bookQty:{ type:"number", editable:false }
                              ,ddQty:{ type:"number", editable:true }
                              ,diffQty:{ type:"number", editable:true }
                              ,movingAvgPrc:{ type:"number", editable:false }
                              ,reasonCont:{ type:"string", editable:true }
                      }
                  }
              }
          }
          ,selectable:"row"
          ,scrollable:true
          ,sortable:false
          ,autoBind:false
          ,filterable:false
          ,appendEmptyColumn:true//empty column. default:false
          ,editable:false
          ,height:173
          ,dataBound:function(e){

              rowNumber = 0;

              var rows = e.sender.tbody.children();
              $.each(rows, function(idx, row){
                  var row = $(rows[idx]);
                  var dataItem = e.sender.dataItem(row);

                  if( dataItem != null && dataItem != 'undefined'){
                      e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                  }

              });

          }
          ,columns:[
              {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,hidden:true ,width:100}
              ,{field:"rnum" ,title:"<spring:message code='par.lbl.line' />" ,width:50
                  ,template  :"#= ++rowNumber #"
              }
              ,{field:"itemStatCd" ,title:"<spring:message code='par.lbl.itemStatCd'  />" ,hidden:true ,width:90
                  ,template  :'#= changeItemStatCd(itemStatCd)#'
              }
              ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}
              ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'  />" ,width:200}
              ,{field:"strgeCd" ,title:"<spring:message code='par.lbl.strgeCd'  />" ,width:140
                  ,template  :'#= changeStrgeCd(strgeCd)#'
              }
              ,{field:"locCd" ,title:"<spring:message code='par.lbl.locationCd'  />" ,width:180}
              ,{field:"unitCd" ,title :"<spring:message code='par.lbl.stockUnitCd' />" ,width:90}
              ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}
              ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"},format:"{0:n2}" ,decimal:2 ,width:90}
              ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
              ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}
              ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockNum' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
              ,{field:"ddQty" ,title:"<spring:message code='par.lbl.ddQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}
              ,{_field:"minusQty" ,title:"<spring:message code='par.lbl.stockItemMinusQty' />" ,width:80 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2
                  ,template:function(data){
                      if(data.ddQty-data.bookQty<0){
                          return kendo.toString((data.bookQty-data.ddQty), "n2");
                      }else{
                          return 0;
                      }
                  }
              }
              ,{_field:"minusPrc" ,title:"<spring:message code='par.lbl.stockItemMinusPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2
                  ,template:function(data){
                      if(data.ddQty-data.bookQty<0){
                          return kendo.toString(((data.bookQty-data.ddQty)*data.movingAvgPrc), "n2");
                      }else{
                          return 0;
                      }
                  }
              }
          ]
      });

      //문서 상태 그리드 콤보
      changeDocStatCd = function(val){
          var returnVal = "";
          if(val != null && val != ""){
              returnVal = docStatObj[val];
          }
          return returnVal;
      };

      //ABC CLASS 그리드 콤보
      changeAbcInd = function(val){
          var returnVal = "";
          if(val != null && val != ""){
              returnVal = abcIndObj[val];
          }
          return returnVal;
      };

      //품목 상태 그리드 콤보
      changeItemStatCd = function(val){
          var returnVal = "";
          if(val != null && val != ""){
              returnVal = itemStatObj[val];
          }
          return returnVal;
      };

      // 재고통제여부 그리드 콤보
      changeStockLockYn = function(val){
          var returnVal = "";
          if(val != null && val != ""){
              returnVal = stockLockYnObj[val];
          }
          return returnVal;
      };

      // 창고 그리드 콤보
      changeStrgeCd = function(val){
          var returnVal = "";
          if(val != null && val != ""){
              returnVal = storageObj[val];
          }
          return returnVal;
      };

});

    </script>
