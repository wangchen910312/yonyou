<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- vender search popup -->
<section id="windows" class="pop_wrap">
<div id="resizableContainer">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
            <button id="btnSelect" class="btn_m"><spring:message code="par.btn.select" /><!-- btnSelect --></button>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span id="titleBpCd"><spring:message code="par.lbl.bpCd" /><!-- bpCd --></span></th>
                    <td>
                        <input type="hidden" id="dlrCd" name="dlrCd" />
                        <input id="sBpCd" name="sBpCd" class="form_input" maxlength="15" />
                    </td>
                    <th scope="row"><span id="titleBpNm"><spring:message code="par.lbl.sBpNm" /><!-- bpNm --></span></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><span id="titleBpTp"><spring:message code="par.lbl.bpTpNm" /><!-- bpTp --></span></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><span id="titleBpFullNm"><spring:message code="par.lbl.sBpFullNm" /><!-- sBpFullNm --></span></th>
                    <td>
                        <input id="sBpFullNm" name="sBpFullNm" class="form_input" maxlength="100" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</div>
</section>
<!-- //vender search popup -->
 <script type="text/javascript">
//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({
     "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
    ,"remark2":"${obj.remark2}"
	,"useYn":"${obj.useYn}"
});
</c:forEach>
var bpTpMap = {};
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});

var bpDstnCd;
var multiChk;

    $(document).ready(function() {

        /************************************************************
           popup option setting
        *************************************************************/
        /**
         * options
         */
        //var popupWindow = parent.$("#venderSearchPopupWin").data("kendoWindow");
        //var popupWindow = parent.venderSearchPopupWin;

        var options = parent.venderSearchPopupWin.options.content.data;
        var bpTpRemark2Lst = [];

        /**
          * type   :""
          * bpCd   :""
          * bpNm   :""
          * bpTp   :""
          */
        var fieldOptions = {
            "default":["bpCd", "bpNm", "bpTp"]
            ,"custom1":["bpCd", "bpNm", "bpTp", "addr"]
        };

        if(dms.string.isEmpty(options.remark2)){
            options.remark2 = '01';  //거래처가 구매처
        }

        if(options.selectable === 'multiple'){
            multiChk = true;
        }else{
            multiChk = false;
        }

        if(dms.string.isEmpty(options.bpDstinCd)){
            bpDstnCd = 'Y';  //거래처 구분
        }else{
            bpDstnCd = options.bpDstinCd;
        }

        for(var i = 0; i < bpTpList.length; i = i + 1){
            //if(bpTpList[i].remark2 === options.remark2){
                bpTpRemark2Lst.push({
                    "cmmCd"  :bpTpList[i].cmmCd
                   ,"cmmCdNm":bpTpList[i].cmmCdNm
                });
            //}
        }


        //grid dbclick event
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
           button
        *************************************************************/
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
                    //popupWindow.close();
                }
            }
        });
        //sBpTp
        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind : true
            ,dataSource:bpTpRemark2Lst
            ,index:0
        });

        /************************************************************
           search setting
        *************************************************************/
        $("#dlrCd").val("${dlrCd}");
        $("#sBpCd").val(dms.string.isNotEmpty(options.bpNm)?options.bpCd:"");
        $("#sBpCd").focus();
        $("#sBpNm").val(options.bpNm);
        $("#sBpTp").data("kendoExtDropDownList").value(options.bpTp);

        /************************************************************
           grid setting
        *************************************************************/
        $("#grid").kendoExtGrid({
             gridId:"G-PAR-0804-082501"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/venderMaster/selectAllVenderMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                bpTpLst = [];

                            for(var i = 0; i < bpTpRemark2Lst.length; i = i + 1){
                                bpTpLst[i] = bpTpRemark2Lst[i].cmmCd;
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpCd"] = $("#sBpCd").val();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sBpFullNm"] = $("#sBpFullNm").val();
                            params["sBpTp"] = $("#sBpTp").val();
                            params["sBpTpLst"] = bpTpLst;
                            params["sBpDstinCd"] = bpDstnCd;

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
                            ,taxRate:{ type:"number" }
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
                    //console.log('item',item,fieldOptions[type],type);
                    e.sender.showColumn(item);
                    e.sender.hideColumn('taxRate');
                });
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,multiSelectWithCheckbox: multiChk
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:305
            ,columns:[
                { field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:120 } //bpCd
                ,{ field:"bpNm", title:"<spring:message code='par.lbl.sBpNm' />", width:200 } //bpNm
                ,{ field:"bpFullNm", title:"<spring:message code='par.lbl.bpFullNm' />", width:200 }//bpFullNm
                ,{ field:"bpTp", title:"<spring:message code='par.lbl.bpTpNm' />", width:90
                    ,template:'#if(bpTp != null){# #= bpTpMap[bpTp]# #}#'
                }//bpTp
                ,{ field:"addr", title:"<spring:message code='par.lbl.addr' />", width:250, hidden:true}
                ,{ field:"taxRate", title:"<spring:message code='par.lbl.taxRate' />", width:100, hidden:true}
            ]
        });

        if(!dms.string.isEmpty(options.bpTp)){ //거래처 유형이 지정된 경우.
            $("#sBpTp").data("kendoExtDropDownList").value(options.bpTp);
            $("#sBpTp").data("kendoExtDropDownList").enable(false);

            if(options.bpTp === '05'){
                $("#grid thead [data-field=bpCd]").text("<spring:message code='global.lbl.dlrCd' />");
                $("#grid thead [data-field=bpNm]").text("<spring:message code='global.lbl.dlrNm' />");
                $("#grid thead [data-field=bpFullNm]").text("<spring:message code='par.lbl.dlrFullNm' />");
                $("#grid thead [data-field=bpTp]").text("<spring:message code='par.lbl.dlrTpNm' />");

                $("#titleBpCd").text("<spring:message code='global.lbl.dlrCd' />");
                $("#titleBpNm").text("<spring:message code='global.lbl.dlrNm' />");
                $("#titleBpFullNm").text("<spring:message code='par.lbl.dlrFullNm' />");
                $("#titleBpTp").text("<spring:message code='par.lbl.dlrTpNm' />");
            }
        }

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

 </script>

