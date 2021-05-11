<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- supply search popup -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
            <button id="btnSelect" class="btn_m "><spring:message code="par.btn.select" /><!-- btnSelect --></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="par.lbl.supplyNo" /><!-- supplyNo --></th>
                    <td>
                        <input id="sBpCd" name="sBpCd" class="form_input" maxlength="15" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- bpNm --></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>
<!-- supply search popup -->
<script type="text/javascript">
//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var bpTpMap = [];
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});

    $(document).ready(function() {

        /************************************************************
           popup option setting
        *************************************************************/
        /**
         * options
         */
        var options = parent.supplierSearchPopupWin.options.content.data;

        /**
         * type   :""
         * bpCd   :""
         * bpNm   :""
         * bpTp   :""
         */
        var fieldOptions = {
            "default":["bpCd", "bpNm", "bpTp"]
            ,"custom1":["bpCd", "bpNm", "bpTp", "ownRgstNm", "prsnNm"]
        };

        //grid dbclick event
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
          button
        ************************************************************/
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnSelect
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows !== null){
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                    parent.supplierSearchPopupWin.close();
                }
            }
        });
        //sBpTp
        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:bpTpList
            ,index:0
        });

        /************************************************************
          search setting
        *************************************************************/
        $("#dlrCd").val("${dlrCd}");
        $("#sBpCd").val(options.bpCd);
        $("#sBpCd").focus();
        $("#sBpNm").val(options.bpNm);
        $("#sBpTp").data("kendoExtDropDownList").value(options.bpTp);

        /************************************************************
          grid setting
        *************************************************************/
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/venderMaster/selectVenderMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpCd"] = $("#sBpCd").val();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sBpTp"] = $("#sBpTp").val();
                            params["sBpDstinCd"] = "Y";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    ,total:"total"
                    ,model:{
                        id:"bpCd"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,bpCd:{ type:"string" , validation:{required:true} }
                            ,bpNm:{ type:"string" , validation:{required:true} }
                            ,bpFullNm:{ type:"string" , validation:{required:true} }
                            ,bpEnNm:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,cntryCd:{ type:"string" }
                            ,distCd:{ type:"string" }
                            ,ownRgstNm:{ type:"string" }
                            ,crnNo:{ type:"string" }
                            ,dealCurrUnitCd:{ type:"string" }
                            ,cofDt:{ type:"string" }
                            ,zipCd:{ type:"string" }
                            ,addr:{ type:"string" }
                            ,homepageUrl:{ type:"string" }
                            ,telNo:{ type:"string" }
                            ,faxNo:{ type:"string" }
                            ,prsnNm:{ type:"string" }
                            ,prsnTelNo:{ type:"string" }
                            ,prsnHpNo:{ type:"string" }
                            ,prsnEmailNm:{ type:"string" }
                            ,payTp:{ type:"string" }
                            ,payTermCd:{ type:"string" }
                            ,bankNm:{ type:"string" }
                            ,bankAcNo:{ type:"string" }
                            ,acOwnerNm:{ type:"string" }
                            ,endYn:{ type:"string" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,dataBinding:function(e){
                var type = "default";
                if(dms.string.isNotEmpty(options.type)){
                    type = options.type;
                }

                $.each(fieldOptions[type], function(idx, item){
                    e.sender.showColumn(item);
                });
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,height:305
            ,columns:[
                { field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:120 }   //bpCd
                ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:90 }   //bpNm
                ,{ field:"bpTp", title:"<spring:message code='par.lbl.bpTp' />", width:90
                    ,template:'#if(bpTp != null){# #= bpTpMap[bpTp]# #}#'
                }//bpTp
                ,{ field:"addr", title:"<spring:message code='par.lbl.addr' />", width:250, hidden:true}
                ,{ title:""}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
 </script>

