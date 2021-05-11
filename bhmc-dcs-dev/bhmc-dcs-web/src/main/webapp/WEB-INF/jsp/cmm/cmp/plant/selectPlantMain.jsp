<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

   <!--  -->
   <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='cmm.title.centList' /></h1>
            <div class="btn_right">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code='global.btn.search' /></button>
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>
                        <td>
                            <input id="sDlrCd" type="text" class="form_auto" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.pltCd' /></th>
                        <td>
                            <input id="sPltCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.pltNm' /></th>
                        <td>
                            <input id="sPltNm" type="text" class="form_input" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="plantGrid" class="grid"></div>
        </div>
    </section>

<!-- script -->
<script type="text/javascript">

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //달력정보 Map
    var calendarMap = dms.data.arrayToMap(calendarList, function(obj){ return obj.calendarId; });

    $(document).ready(function() {

        $("#sDlrCd").kendoAutoComplete({
            minLength:2
            ,template:"[#:data.dlrCd#]#:data.dlrNm#"
            ,dataTextField:"dlrCd"
            ,dataSource:{
                serverFiltering:true
                ,transport:{
                    read:{
                         url:"<c:url value='/cmm/cmp/plant/selectDealersForSuggest.do' />"
                         ,dataType:"json"
                         ,type:"POST"
                         ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {
                            return kendo.stringify({
                                "sText":$("#sDlrCd").data("kendoAutoComplete").value()
                                ,"recordCountPerPage":10
                            });
                        }
                    }
                }
                ,schema:{
                    data:"data"
                    ,total:"total"
                }
            }
        });

//         $("#sDlrCd").kendoComboBox({
//             template:"[#:data.dlrCd#]#:data.dlrNm#"
//             ,suggest:true
//             ,filter:"startswith"
//             ,autoBind:true
//             ,dataTextField:"dlrNm"
//             ,dataValueField:"dlrCd"
//             ,dataSource:{
//                 serverFiltering:true
//                 ,transport:{
//                     read:{
//                          url:"<c:url value='/cmm/cmp/plant/selectDealers.do' />"
//                          ,dataType:"json"
//                          ,type:"POST"
//                     }
//                 }
//                 ,schema:{
//                     data:"data"
//                     ,total:"total"
//                 }
//             }
//         });



        //센터조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#plantGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        //센터 그리드
        $("#plantGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/cmm/cmp/plant/selectPlants.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#sDlrCd").data("kendoAutoComplete").value();
                            params["sPltCd"] = $("#sPltCd").val();
                            params["sPltNm"] = $("#sPltNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"rnum"
                       ,fields:{
                           rnum:{type:"number"}
                           ,dlrCd:{ type:"string"}
                           ,pltCd:{ type:"string"}
                           ,pltNm:{ type:"string"}
                           ,fstStartDt:{ type:"date"}
                           ,endDdlnDt:{ type:"date"}
                           ,calendarId:{ type:"string"}
                      }
                   }
                }
            }
            ,height:250
            ,autoBind:false
            ,editable:false
            ,pageable:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80
                    ,attributes:{"class":"ac"}
                }
                ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", width:80
                    ,attributes:{"class":"ac"}
                }
                ,{field:"pltNm", title:"<spring:message code='global.lbl.pltNm' />", width:250}
                ,{field:"fstStartDt", title:"<spring:message code='global.lbl.fstStartDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"endDdlnDt", title:"<spring:message code='global.lbl.endDdlnDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"calendarId", title:"<spring:message code='global.lbl.calendar' />", width:100
                    ,template:"# if(calendarMap[calendarId] != null) { # #= calendarMap[calendarId].calendarNm# # }#"
                }
                ,{title:""}
            ]
        });
    });

</script>