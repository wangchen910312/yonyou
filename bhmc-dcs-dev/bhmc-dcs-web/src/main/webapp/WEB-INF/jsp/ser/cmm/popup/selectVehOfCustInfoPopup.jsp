<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.custSearch" /></h1><!-- 고객조회 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.custNm' /></th><!-- 고객명 -->
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">


    $(document).ready(function() {


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.vehOfCustInfoSearchPopup.options.content.data;


        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });


        /************************************************************
                조회조건 설정
        *************************************************************/
        if (options.vinNo) {
        $("#sVinNo").val(options.vinNo);
        }
        if (options.carRegNo) {
        $("#sCarNo").val(options.carRegNo);
        }
        if (options.carOwnerNm) {
        $("#sCustNm").val(options.carOwnerNm);
        }

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();


                if(rows !== null)
                {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                    parent.vehOfCustInfoSearchPopup.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.vehOfCustInfoSearchPopup.close();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sVinNo"] = $("#sVinNo").val();
                            params["sCarNo"] = $("#sCarNo").val();
                            params["sCustNm"] = $("#sCustNm").val();

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
                             vinNo:{type:"string"}
                            ,carRegNo:{type:"string"}
                            ,carOwnerNm:{type:"string"}
                            ,carOwnerTelNo:{type:"string"}
                            ,carOwnerHpNo:{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:280
            ,columns:[
                  {field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:200 ,attributes:{"class":"ac"}}//VIN
                 ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100}         //차량번호
                 ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.custNm' />", width:120}      //고객명
                 ,{field:"carOwnerTelNo", title:"<spring:message code='ser.lbl.telNo' />", width:120}    //전화번호
                 ,{field:"carOwnerHpNo", title:"<spring:message code='ser.lbl.hpNo' />", width:120}      //전화번호
                // ,{field:"signOffDt", title:"signOffDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//생산일자
               //  ,{field:"grteStartDt", title:"grteStartDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//생산일자
                ]
        });

         if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 테크니션 구분
    fnTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fnMap[val].cmmCdNm;
        }
        return returnVal;
    }
</script>
