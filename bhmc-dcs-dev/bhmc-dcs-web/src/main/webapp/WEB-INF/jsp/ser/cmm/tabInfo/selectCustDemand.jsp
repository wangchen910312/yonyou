<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div style="min-height:205px;">
    <div class="btn_right_absolute">
        <button type="button" id="custAdd" class="btn_s btn_add" ><spring:message code="global.btn.add" /></button>
        <button type="button" id="custDel" class="btn_s btn_delete" ><spring:message code="global.btn.rowDel" /></button>
        <button type="button" id="custCancel" class="btn_s btn_cancel" ><spring:message code="global.btn.cancel" /></button>
    </div>
    <div class="table_grid">
        <div id="custRemarkGrid" class="grid"></div>
    </div>
    <div class="table_form mt10">
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
    </div>
</div>

<script type="text/javascript">

/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;

$(document).ready(function(){



    /** 원인 현상코드 팝업**/
    function selectPhenCauCodeSearchPopupWindow(idx){

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
             var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;

             grid.insert(0,{
                  "lineNo":""
                 ,"custReqCont" :""
                 ,"preFixId":$("#preFixId").val()
                 ,"jobNo":$("#jobNo").val()
             });

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

     /**요청사항 취소 **/
     $("#custCancel").kendoButton({
         click:function(e) {
             $('#custRemarkGrid').data('kendoExtGrid').cancelChanges();
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

                         params["sPreFixId"] = $("#preFixId").val();
                         params["sJobNo"] = $("#jobNo").val();
                        // params["sDlrCd"] = $("#pwaDocNo").val();

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
                       ,jobNo:{type:"string", editable:false }
                       ,dlrCd:{type:"string", editable:false }
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:108
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,columns:[
             {field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:50}
            ,{field:"custReqCont", title:"<spring:message code='ser.lbl.reqCont' />", width:400}
            ,{field:"preFixId" ,title:"preFixId", hidden:true, width:100}
            ,{field:"jobNo" ,title:"jobNo", hidden:true, width:100}
            ,{field:"dlrCd" ,title:"dlrCd", hidden:true, width:100}
        ]
    });


});

</script>