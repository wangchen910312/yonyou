<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.pwaList" /></h1><!-- 고객조회 -->
        <div class="btn_right">
            <%-- <button type="button" id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --%>
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
  <!--   <input type="hidden" id="sVinNo" name="sVinNo" class="form_input"/>
    <input type="hidden" id="sDlrCd" name="sDlrCd" class="form_input"/>
    <input type="hidden" id="sRoDocNo" name="sRoDocNo" class="form_input"/> -->
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>
<script type="text/javascript">

//PWA 유형코드 pwaTpDs
var pwaTpList = [];
<c:forEach var ="obj" items="${pwaTpDs}">
pwaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaTpMap = dms.data.arrayToMap(pwaTpList , function(obj){return obj.cmmCd;});


$(document).ready( function(){


    setPwaMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaTpMap[value] != undefined)
            resultVal =  pwaTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /************************************************************
        팝업옵션 설정
    *************************************************************/

    var parentData = parent.pwaApprovePopupWindow.options.content.data;

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         $("#btnSelect").click();
    });


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

                parentData.callbackFunc(data);
                parent.pwaApprovePopupWindow.close();

            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.pwaApprovePopupWindow.close();
        }
    });


/************************************************************
    그리드 설정
*************************************************************/
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000025"
        ,dataSource:{
         transport:{
            read:{
                url:"<c:url value='/ser/wac/pwaAppr/selectPwaApproveSearchPopups.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    $("#sVinNo").val(parentData.vinNo);
                    $("#sDlrCd").val(parentData.dlrCd);
                    $("#sRoDocNo").val(parentData.roDocNo);

                    params["sVinNo"] = parentData.vinNo;
                    params["sDlrCd"] = parentData.dlrCd;
                    params["sRoDocNo"] = parentData.roDocNo;

                    if(parentData.pwaStatCd != undefined)
                        params["sPwaStatCd"] = parentData.pwaStatCd;

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
                     rnum:{type:"number", editable:false}
                    ,pwaApproveNo:{type:"string"}
                    ,hqApproveDt:{type:"date"}
                    ,cauOperAtcCd:{type:"string"}
                    ,cauItemCd:{type:"string"}
                    ,cauCd:{type:"string"}
                    ,phenCd:{type:"string"}
                    ,pwaTpCd1:{type:"string"}
                    ,pwaTpCd2:{type:"string"}
                    ,lbrApproveAmt:{type:"number"}
                    ,itemApproveAmt:{type:"number"}
                    ,subLbrApproveAmt:{type:"number"}
                    ,totApproveAmt:{type:"number"}
                }
            }
         }
        }
        ,autoBind:false
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,height:280
        ,columns:[
              {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
             ,{field:"pwaApproveNo", title:"<spring:message code='ser.lbl.pwaApprovalNo' />", width:110 ,attributes:{"class":"al"}}
             ,{field:"returnApproveNo", title:"<spring:message code='ser.lbl.returnApprNo' />", width:110 ,attributes:{"class":"al"}}
             ,{field:"hqApproveDt", title:"<spring:message code='ser.lbl.approveDt' />", width:100
                 , attributes :{"class":"ac"}
                 , format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"cauOperAtcCd", title:"<spring:message code='ser.lbl.mainLbrCd' />", width:100}
             ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:100}
             ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:60}
             ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:120}
             ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:60}
             ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:120}
             ,{field:"pwaTpCd1", title:"<spring:message code='ser.lbl.pwaTpCd1' />", width:120
                 ,template:"#= setPwaMap(pwaTpCd1)#"
                 ,editor:function(container, options){
                     $('<input required name="pwaTpCd1" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:pwaTpList
                         ,optionLabel:" "
                         ,valuePrimitive:true
                     });
                     $('<span class="k-invalid-msg" data-for="pwaTpCd1"></span>').appendTo(container);
                    }
             }
             ,{field:"pwaTpCd2", title:"<spring:message code='ser.lbl.pwaTpCd2' />", width:120
                 ,template:"#= setPwaMap(pwaTpCd2)#"
                 ,editor:function(container, options){
                     $('<input required name="pwaTpCd2" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:pwaTpList
                         ,optionLabel:" "
                         ,valuePrimitive:true
                     });
                     $('<span class="k-invalid-msg" data-for="pwaTpCd2"></span>').appendTo(container);
                    }

             }
             ,{field:"lbrApproveAmt", title:"<spring:message code='ser.lbl.lbrAmt' />", width:80
                 , attributes :{"class":"ar"}
                 , editor:function(container, options){
                     $('<input required name="lbrApproveAmt" id="lbrApproveAmt" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,min:1
                        ,value:0.00
                        ,spinners:false
                     });
                     $('<span class="k-invalid-msg" data-for="lbrApproveAmt"></span>').appendTo(container);
                  }
             }
             ,{field:"itemApproveAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:80
                 , attributes :{"class":"ar"}
                 , editor:function(container, options){
                     $('<input required name="lbrApproveAmt" id="lbrApproveAmt" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,min:1
                        ,value:0.00
                        ,spinners:false
                     });
                     $('<span class="k-invalid-msg" data-for="lbrApproveAmt"></span>').appendTo(container);
                  }
             }
             ,{field:"subLbrApproveAmt", title:"<spring:message code='ser.lbl.subLbrAmt' />", width:80
                 , attributes :{"class":"ar"}
                 , editor:function(container, options){
                     $('<input required name="subLbrApproveAmt" id="subLbrApproveAmt" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,min:1
                        ,value:0.00
                        ,spinners:false
                     });
                     $('<span class="k-invalid-msg" data-for="subLbrApproveAmt"></span>').appendTo(container);
                  }
             }
             ,{field:"totApproveAmt", title:"<spring:message code='ser.lbl.totRepairAmt' />", width:80
                 , attributes :{"class":"ar"}
                 , editor:function(container, options){
                     $('<input required name="totApproveAmt" id="totApproveAmt" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n2"                // n0:###,###, n2:###,###.##
                        ,decimals:2                // 소숫점
                        ,min:1
                        ,value:0.00
                        ,spinners:false
                     });
                     $('<span class="k-invalid-msg" data-for="totApproveAmt"></span>').appendTo(container);
                  }
             }
        ]
    });

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>