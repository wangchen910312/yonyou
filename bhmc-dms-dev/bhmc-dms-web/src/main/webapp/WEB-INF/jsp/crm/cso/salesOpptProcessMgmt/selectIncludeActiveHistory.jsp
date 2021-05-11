<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

               <section class="group">
                  <div class="table_grid">
                      <div id="activeHistoryTabGrid" class="grid"></div>
                  </div>
                </section>
        <!--  ************************** 녹취파일 팝업 **************************** -->
        <section id="vocRecFilePopup" class="pop_wrap">
            <div class="header_area">
                <audio id="audioPlayer" controls style="width:100%;" ></audio>
            </div>
        </section>
        <!--  ************************** 녹취파일 팝업 **************************** -->
 <script type="text/javascript">

    $(document).ready(function() {

        // ************************** 녹취파일 팝업 ****************************
        $("#vocRecFilePopup").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.lbl.recFileId' />"      //녹취파일
            ,width:"500px"
            ,height:"50px"
        }).data("kendoWindow");
        // ************************** 녹취파일 팝업 ****************************

        $("#btnCtlSearchTrace").kendoButton({
            click:function(e){
                console.log("btnCtlSearchTrace Button !!!");
                $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        // 추적이력 그리드
        $("#activeHistoryTabGrid").kendoExtGrid({
            gridId:"G-CRM-0803-194343"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var seq = $("#seq").val();

                            // 고객번호
                            if ( dms.string.isEmpty(seq) ) {
                                dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                return false;
                            };

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sSaleOpptSeq"]           = seq;

                            console.log("activeHistoryTabGrid Params!!!");
                            console.log(params);
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
                        id:"seq"
                        ,fields:{
                            seq:{type:"string", editable:false}
                            ,rnum  :{type:"number" , editable:false}
                            ,mngScNm:{type:"string", editable:true}
                            ,traceMthNm:{type:"string", editable:false}
                            ,traceGradeNm:{type:"string", editable:false}
                            ,traceCont:{type:"string", editable:false}
                            ,nextTraceMthNm:{type:"string", editable:false}
                            ,traceDt:{type:"date", editable:false}
                            ,nextTraceDt:{type:"date", editable:false}
                            ,traceDtFormat:{type:"date", editable:false}
                            ,nextTraceDtFormat:{type:"date", editable:false}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                                elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,filterable:false
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,navigatable:false
            ,autoBind:false
            ,sortable:false
            ,resizable:true
            ,height:330
            ,columns:[
               {field:"mngScNm", title:"<spring:message code='crm.lbl.tracer' />", width:70, attributes:{"class":"ac"}}
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
               ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:140, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (traceDtFormat !== null ){# #= kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"traceMthNm", title:"<spring:message code='crm.lbl.traceMth' />", width:100, attributes:{"class":"ac"}}
               ,{field:"traceGradeNm", title:"<spring:message code='crm.lbl.activeGrade' />", width:100, attributes:{"class":"ac"}}
               ,{field:"traceCont", title:"<spring:message code='crm.lbl.traceCont' />", width:200, attributes:{"class":"al"}}
               ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:140, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (nextTraceDtFormat !== null ){# #= kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"nextTraceMthNm", title:"<spring:message code='crm.lbl.nextTraceMthCd' />", width:100, attributes:{"class":"ac"}}
               ,{field:"callDialNum", title:"<spring:message code='global.lbl.sendTelNo' />", width:100, attributes:{"class":"ac"}}
               ,{field:"callStartDt", title:"<spring:message code='crm.lbl.callStartDt' />", width:140, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (callStartDt !== null ){# #= kendo.toString(data.callStartDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"callEndDt", title:"<spring:message code='crm.lbl.callEndDt' />", width:140, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (callEndDt !== null ){# #= kendo.toString(data.callEndDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               ,{field:"recFileId", title:"<spring:message code='crm.lbl.recFileId' />", width:100, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac"}
                   ,template:function(dataItem){
                       var spanObj;
                       if ( dms.string.isNotEmpty(dataItem.recFileId) ) {
                           //spanObj = "<span class='icon_play'></span><span onClick='recFileDown(\"A\")'>"+dataItem.recFileId+"</span>";
                           spanObj = "<span onClick='recFileDown(\"A\")' style='cursor:pointer;'><spring:message code='crm.lbl.recPlay' /></span>";
                       } else {
                           spanObj = "";
                       };
                       return spanObj;
                   }
               }
               ,{field:"callHisSeq", title:"<spring:message code='crm.lbl.callHisSeq' />", hidden:true}    // 콜센터이력일련번호
            ]
        });

    });

    function recFileDown(type) {

        var type
          , dlrCd
          , recFileId
          , callHisSeq
        ;

        if ( type === "A" ) {

            var grid = $('#activeHistoryTabGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if ( selectedItem !== null ) {
                recFileId = selectedItem.recFileId;
                callHisSeq = selectedItem.callHisSeq;
                dlrCd = selectedItem.dlrCd;
            };

        };

        if ( dms.string.isNotEmpty(recFileId) ) {

            if (  callHisSeq <= 0  ) {
                // {콜센터이력일련번호}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='crm.lbl.callHisSeq' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                return;
            };

            if (  dms.string.isEmpty(dlrCd) ) {
                // {딜러코드}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='global.lbl.dlrCd' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                return;
            };

            //location.href="<c:url value='/crm/cal/callCenter/selectRecordFileDownload.do' />?callHisSeq="+callHisSeq+"&dlrCd="+dlrCd;
            $("#audioPlayer").attr("src", "<c:url value='/crm/cal/callCenter/selectRecordFileDownload.do' />?callHisSeq="+callHisSeq+"&dlrCd="+dlrCd);
            var win = $("#vocRecFilePopup").data("kendoWindow");
            win.center();
            win.open();

            // 오디오 팝업에서 x버튼을 눌렸을때 오디오 재생 종료
            $("#vocRecFilePopup").parent().find(".k-window-actions").on("   click", function(){
                $("#audioPlayer")[0].pause();
                $("#audioPlayer")[0].currentTime = 0;
            });

        } else {
            return;
        };

    };

</script>