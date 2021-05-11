<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div style="min-height:205px;">
    <div class="btn_right_absolute">
        <c:if test="${param.gubun ne 'S'}">
        <button type="button" id="custAdd" class="btn_s btn_add btn_s_min5" ><spring:message code="global.btn.add" /></button>
        <button type="button" id="custDel" class="btn_s btn_delete btn_s_min5" ><spring:message code="global.btn.del" /></button>
        <%-- <button type="button" id="custCancel" class="btn_s btn_cancel" ><spring:message code="global.btn.cancel" /></button> --%>
        </c:if>
    </div>
    <div class="table_grid">
        <div id="custRemarkGrid" class="grid"></div>
    </div>
    <%-- <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:40%;">
                <col style="width:10%;">
                <col style="width:40%;">
            </colgroup>
            <tbody>
                <tr>
                  <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                  <td class="readonly_area">
                      <div class="form_float">
                          <div class="form_left" style="width:37.4%;">
                              <input type="text" id="cauCd1" name="cauCd1" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드 -->
                          </div>
                          <div class="form_right" style="width:62.6%;">
                              <div class="form_search">
                                  <input type="text" id="cauNm1" name="cauNm1" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                  <a href="javascript:selectPhenCauCodeSearchPopupWindow('1')"></a>
                              </div>
                          </div>
                      </div>
                  </td>
                  <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                  <td class="readonly_area">
                      <div class="form_float">
                          <div class="form_left" style="width:37.4%;">
                              <input type="text" id="cauCd2" name="cauCd2" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드 -->
                          </div>
                          <div class="form_right" style="width:62.6%;">
                              <div class="form_search">
                                  <input type="text" id="cauNm2" name="cauNm2" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                  <a href="javascript:selectPhenCauCodeSearchPopupWindow('2')"></a>
                              </div>
                          </div>
                      </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><spring:message code="ser.lbl.phenCd" /></th>
                  <td class="readonly_area">
                      <div class="form_float">
                          <div class="form_left" style="width:37.4%;">
                              <input type="text" id="phenCd1" name="phenCd1" readOnly class="form_input" data-json-obj="true" />
                          </div>
                          <div class="form_right" style="width:62.6%;">
                              <input type="text" id="phenNm1" name="phenNm1" readOnly class="form_input" data-json-obj="true"/>
                          </div>
                      </div>
                  </td>
                  <th scope="row"><spring:message code="ser.lbl.phenCd" /></th>
                  <td class="readonly_area">
                      <div class="form_float">
                          <div class="form_left" style="width:37.4%;">
                              <input type="text" id="phenCd2" name="phenCd2" readOnly class="form_input"  data-json-obj="true" />
                          </div>
                          <div class="form_right" style="width:62.6%;">
                              <input type="text" id="phenNm2" name="phenNm2" readOnly class="form_input" data-json-obj="true" />
                          </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div> --%>
</div>

<script type="text/javascript">

/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
var custDemandPopup;
var custDemandPreFixId;
var custDemandJobNo;

var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";

$(document).ready(function(){

    var editYn = true;
    if(preFixTp == "ROSTATUS"){
        editYn = false;
    }

    /** 원인 현상코드 팝업**/
    selectPhenCauCodeSearchPopupWindow = function(idx){

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":true
                    ,"paintYn":"C"  // paint:P , 원인코드:C
                    ,"itemCd":""
                    , "callbackFunc":function(data){
                        $("#cauCd"+idx).val(data[0].cauCd);
                        $("#cauNm"+idx).val(data[0].cauNm);
                        $("#phenCd"+idx).val(data[0].phenCd);
                        $("#phenNm"+idx).val(data[0].phenNm);
                    }
                }
            }
        });
    };

     /**############################ 버튼 설정##################################**/
     /** 요청사항 추가  **/
     $("#custAdd").kendoButton({
         click:function (e){
             var grid = $("#custRemarkGrid").data("kendoExtGrid");
             var length = grid.dataSource.data().length;
             if(length > 0){
                length = length - 1;
             }
             var data = grid.dataItem("tr:eq("+length+")");

             if(dms.string.isNotEmpty(data.custReqCont)){
                custDemandAdd();
             }
         }
     });

    /** 요청사항 삭제  **/
    $("#custDel").kendoButton({
         click:function (e){
             var grid = $("#custRemarkGrid").data("kendoExtGrid");
             var rows = grid.select();

             rows.each(function(index, row) {
                 grid.removeRow(row);
             });
         }
    });

    // 고객요청사항 그리드
    $("#custRemarkGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sPreFixId"] = custDemandPreFixId;
                         params["sJobNo"] = custDemandJobNo;

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false }
                       ,custReqCont:{type:"string", editable:true }
                       ,preFixId:{type:"string", editable:false }
                       ,dlrCd:{type:"string", editable:false }
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:editYn
        ,editable:{
            confirmation:false
        }
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,edit:function(e){
            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }
        }
        ,dataBound:function(){
            var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
            if(grid.data().length <= 0){
                custDemandAdd();
            }
        }
        ,columns:[
            {field:"lineNo", title:"<spring:message code='ser.lbl.custReqCd' />", width:50, attributes:{"class":"ac"}}
            ,{field:"custReqCont", title:"<spring:message code='ser.lbl.reqCont' />", width:400}
            ,{field:"preFixId" ,title:"preFixId", hidden:true, width:100}
            ,{field:"dlrCd" ,title:"dlrCd", hidden:true, width:100}
        ]
    });

    /** 고객요구사항 정보**/
    custDemandParam = function(e){
        //고객요구사항
        var custDemandGrid = $("#custRemarkGrid").data("kendoExtGrid");
        var custSaveData = custDemandGrid.dataSource.data();

        return custSaveData;
    };

    //고객요구사항  결과값 세팅
    custDemandSet = function(jobNo, listType){
        custDemandPreFixId = dms.string.strNvl(listType) == "" ? $("#preFixId").val():listType;
        custDemandJobNo = jobNo;

        $("#custRemarkGrid").data("kendoExtGrid").dataSource.read();
    };

    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;

    if(grid.data().length <= 0){
        custDemandAdd();
    }
});

custDemandAdd = function() {
    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
    grid.add({
        "lineNo":grid.data().length + 1
        ,"custReqCont" :""
   });
};

</script>