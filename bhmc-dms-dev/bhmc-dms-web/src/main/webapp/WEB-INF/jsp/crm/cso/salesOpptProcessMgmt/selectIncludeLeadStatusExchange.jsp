<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

                 <section class="group">
                  <div class="table_grid">
                      <div id="leadStatusExchangeTabGrid" class="grid"></div>
                  </div>
                </section>

 <script type="text/javascript">

    $(document).ready(function() {

        $("#btnCtlSearchLeadHist").kendoButton({
            click:function(e){

                console.log("activeHistoryTabGrid Button !! ");
                $("#leadStatusExchangeTabGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        // 회전기록 그리드
        $("#leadStatusExchangeTabGrid").kendoExtGrid({
            gridId:"G-CRM-0804-194343"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHist.do' />"
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

                            params["sSaleOpptSeq"]           = seq;

                            console.log("leadStatusExchangeTabGrid Params!!!");
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
                            ,mngScNm:{type:"string", editable:false}
                            ,regUsrNm:{type:"string", editable:false}
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
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,selectable:"row"
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
               ,{field:"leadStatCont", title:"<spring:message code='crm.lbl.leadStat' />", width:140, attributes:{"class":"ac"}}
               ,{field:"mngScNm", title:"<spring:message code='crm.lbl.prsNm' />", width:70, attributes:{"class":"ac"}}
               ,{field:"regUsrNm", title:"<spring:message code='global.lbl.handler' />", width:70, attributes:{"class":"ac"}}
               ,{field:"sysMesgCont", title:"<spring:message code='crm.title.detailCont' />", width:200, attributes:{"class":"al"}
                   ,template:function(dataItem) {  //에러메세지
                       var str = "";
                       if(dms.string.isNotEmpty(dataItem.sysMesgCont)){
                           str += "<div>" + dataItem.sysMesgCont + "</div>";
                       };
                       return str;
                   }
               }
            ]
        });

    });

 </script>