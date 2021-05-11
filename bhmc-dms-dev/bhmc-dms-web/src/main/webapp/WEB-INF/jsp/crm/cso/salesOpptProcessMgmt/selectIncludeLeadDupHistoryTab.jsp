<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

                 <section class="group">
                  <div class="table_grid">
                      <div id="leadDupHistoryTabGrid" class="grid"></div>
                  </div>
                </section>

 <script type="text/javascript">

    $(document).ready(function() {

        $("#btnCtlSearchLeadHist").kendoButton({
            click:function(e){

                console.log("activeHistoryTabGrid Button !! ");
                $("#leadDupHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        // 회전기록 그리드 selectSalesOpptDupHist   selectSalesOpptProcessMgmtHist
        $("#leadDupHistoryTabGrid").kendoExtGrid({
            gridId:"G-CRM-1212-191212"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptDupHist.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var seq = $("#seq").val();

                            // 리드번호
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

                            params["sSeq"]           = seq;

                            console.log("leadDupHistoryTabGrid Params!!!");
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
                            ,regDt:{type:"date", editable:false}
                            ,regDtFormat:{type:"date", editable:false}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,filterable:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,navigatable:false
            ,autoBind:false
            ,resizable:true
            ,sortable:false
            ,height:330
            ,columns:[
               {field:"regDtFormat", title:"<spring:message code='global.lbl.dateTime' />", width:80, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
               }
               , {field:"infoTpNm", title:"<spring:message code='crm.lbl.infoType' />", width:90 // 리드유형
                   ,attributes:{"class":"ac"}
               }
               , {field:"holdTpNm", title:"<spring:message code='crm.lbl.approchLocation' />", width:90 // 정보경로
                   ,attributes:{"class":"ac"}
               }
               , {field:"holdDetlTpSeqNm", title:"<spring:message code='global.lbl.sourceSub' />", width:90 // 정보경로상세
                   ,attributes:{"class":"ac"}
               }
               , {field:"intrCarlineNm", title:"<spring:message code='crm.lbl.intentionCarline' />", width:90 // 의향차종
                   ,attributes:{"class":"ac"}
               }
               , {field:"intrModelNm", title:"<spring:message code='crm.lbl.intentionModel' />", width:90 // 의향모델
                   ,attributes:{"class":"ac"}
               }
            ]
        });

    });

 </script>