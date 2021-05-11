<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script>
/**
 * dataSource 가공
 */

   var customTpList = [];
   var custTpList = [];

   var customTpDropDown = [
                          {"userCd":"001" , "userCdNm":"保险公司"}
                         ,{"userCd":"002" , "userCdNm":"供货商"}
                            ];

   $.each(customTpDropDown , function (idx , obj){
       customTpList[obj.userCd] = obj.userCdNm;
   });

   var custTpDropDown = [
                          {"userCd":"001" , "userCdNm":"法人"}
                         ,{"userCd":"002" , "userCdNm":"个人"}
                        ];

   $.each(custTpDropDown , function (idx , obj){
       custTpList[obj.userCd] = obj.userCdNm;
   });

</script>


<!-- content -->
  <section id="window" class="pop_wrap"  >
     <div class="header_area" >
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button> --%>
        </div>
    </div>
      <div class="table_form" role="search" data-btnid="btnSearch">
        <table >
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:22%;">
                <col style="width:10%;">
                <col style="width:22%;">
                <col style="width:10%;">
                <col style="width:26%;">
            </colgroup>
            <tbody >
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.incCmpCd' /></th>
                    <td>
                        <input id="sCustNo" type="text" class="form_input" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.incCmpNm' /></th>
                    <td>
                        <input id="sCustNm" type="text" class="form_input" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code='par.lbl.bpTp' /></th>
                    <td>
                        <input id="sCustomTp" type="text"  style="width:100%">
                        <input id="sDlrCd" type="hidden" class="form_input" style="width:100%">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- 그리드1 -->
         <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
    </div>
  </section>

<script type="text/javascript">
<!--

var parentJsonData = parent.insurancePopup.options.content.data;
var callback = parentJsonData.callbackFunc;


var tempDataSource = [
                      {"custNo":"B900000067" , "custNm":"A保险公司" , "customTp":"001" , "custTp":"001" , "addr":"北京朝阳", "hpNo":"02-1234-5678"}
                     ,{"custNo":"B900000068" , "custNm":"B保险公司" , "customTp":"001" , "custTp":"001" , "addr":"北京顺义", "hpNo":"02-1234-5678"}
                     ,{"custNo":"B900000069" , "custNm":"C保险公司" , "customTp":"001" , "custTp":"001" , "addr":"北京昌平", "hpNo":"02-1234-5678"}
                     ,{"custNo":"B900000070" , "custNm":"D保险公司" , "customTp":"001" , "custTp":"001" , "addr":"北京CBD", "hpNo":"02-1234-5678"}
                     ,{"custNo":"B900000071" , "custNm":"E保险公司" , "customTp":"001" , "custTp":"001" , "addr":"北京海淀", "hpNo":"02-1234-5678"}
                      ];

$(document).ready(function(){

     // 조회조건 - 거래처 유형
    $("#sCustomTp").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:customTpDropDown
        ,index:0
    });

    // 버튼  - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

 // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length != 0){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                parentJsonData.callbackFunc(data);
                parent.insurancePopup.close();
            }else{
                dms.notification.info("선택한 정보가 없습니다.");
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.insurancePopup.close();
        }
    });

    $("#grid").on("dblclick","tr.k-state-selected", function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();

        if(rows.length !=0 ){
            var data =[];
            $.each(rows , function(idx , row){
                data.push(grid.dataItem(row));
            });
            parentJsonData.callbackFunc(data);
            parent.insurancePopup.close();
        }else{
            dms.notification.info("선택한 정보가 없습니다.");
        }




    });

  //그리드 설정
    $("#grid").kendoExtGrid({
           dataSource:tempDataSource
        /* dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/insurance/selectInsuranceManages.do' />"
                }
                ,parameterMap:function(options , operation){
                    if(operation == "read"){

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        params["sCustNo"]          = $("#sCustNo").val();
                        params["sCustNm"]          = $("#sCustNm").val();
                        params["sInsuTp"]          = $("#sInsuTp").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,schema:{
               model:{
                   id:"custNo"
                  ,fields:{
                      custNo :{type:"number" , editable:false}
                     ,custNm :{type:"string" , validation:{required:true}}
                     ,customTp :{type:"string" , validation:{required:true}}
                     ,custTp :{type:"string" , validation:{required:true}}
                     ,addr   :{type:"string" , validation:{required:true}}
                     ,hpNo   :{type:"string" , validation:{required:true}}
                   }
               }
           }
        } */
       ,navigatable:true
       //,multiSelectWithCheckbox:true
       ,editable:false
       //,autoBind:false
       ,height:300
       ,columns:[
                {
                  field:"custNo"
                 ,title:"<spring:message code='ser.lbl.incCmpCd' />"
                 ,width:80
                 ,sortable:false
                 ,attributes:{"class":"ac"}
                }
                ,{
                  field:"custNm"
                 ,title:"<spring:message code='ser.lbl.incCmpNm' />"
                 ,width:100
                 ,sortable:false
                 ,attributes:{"class":"al"}
                }
                ,{
                  field:"customTp"
                 ,title:"<spring:message code='ser.lbl.bpTp' />"
                 ,width:80
                 ,sortable:false
                 ,attributes:{"class":"ac"}
                 ,template:"#=customTpList[customTp]#"
                 ,editor:function(container, options) {
                        $('<input required name="customTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             dataTextField:"userCdNm"
                            ,dataValueField:"userCd"
                            ,dataSource:customTpDropDown
                        });
                        $('<span class="k-invalid-msg" data-for="customTp"></span>').appendTo(container);
                    }
                }
                ,{
                  field:"custTp"
                 ,title:"<spring:message code='ser.lbl.custTp' />"
                 ,width:80
                 ,sortable:false
                 ,attributes:{"class":"ac"}
                 ,template:"#= custTpList[custTp]#"
                 ,editor:function(container, options) {
                        $('<input required name="custTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             dataTextField:"userCdNm"
                            ,dataValueField:"userCd"
                            ,dataSource:custTpDropDown
                        });
                        $('<span class="k-invalid-msg" data-for="custTp"></span>').appendTo(container);
                       }
                }
                ,{
                  field:"addr"
                 ,title:"<spring:message code='ser.lbl.addr' />"
                 ,width:200
                 ,sortable:false
                 ,attributes:{"class":"al"}
                }
                ,{
                  field:"hpNo"
                 ,title:"<spring:message code='ser.lbl.telNo' />"
                 ,width:100
                 ,sortable:false
                 ,attributes:{"class":"ac"}
                }
               ]
    });


});


//-->
</script>
<!-- //content -->