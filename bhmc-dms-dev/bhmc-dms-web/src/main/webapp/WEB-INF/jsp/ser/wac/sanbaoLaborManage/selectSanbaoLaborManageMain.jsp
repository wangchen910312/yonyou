<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 삼보공임등록 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.sanbaoLbrReg" /></h1> <!-- 삼보공임등록 -->
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_save " id="btnInit"><spring:message code="global.btn.init" /></button>
        </div>
    </div>
    <div class="table_form form_width_70per">
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
                    <th scope="row"><spring:message code="ser.lbl.carChkTp" /></th> <!-- 분류 -->
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.useYn" /></th> <!-- 사용여부 -->
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th> <!-- 공임코드 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_add btn_s_min5" id="btnAdd"><spring:message code="global.btn.add" /></button>
            <button type="button" class="btn_s btn_save btn_s_min5" id="btnSave"><spring:message code="global.btn.save" /></button>
            <button type="button" class="btn_s btn_delete btn_s_min5" id="btnDelete"><spring:message code="global.btn.del" /></button>
        </div>
    </div>
    <div class="table_grid ">
        <div id="gridLbr" class="grid"></div>
    </div>
</section>
<!-- //삼보공임등록 -->

<!-- script -->
<script>
    $(document).ready(function() {


        /**공임 그리드 **/
        $("#gridLbr").kendoExtGrid({
            gridId:"G-SER-1011-000178"
            /*
            dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />"
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

                             params["sPwaDocNo"] = $("#pwaDocNo").val();
                             //params["sDlrCd"] = $("#sDlrCd").val();



                             return kendo.stringify(params);
                         }else if(operation != "read" && options.models){
                             return kendo.stringify(options.models);
                         }
                     }//parameterMap
                }//transport
               ,schema:{
                     model:{
                         id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                           ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                           ,lbrNm:{type:"string" , editable:false}
                           ,lbrHm:{type:"number" , editable:false}
                           ,lbrQty:{type:"number", validation:{required:true}}
                           ,lbrPrc:{type:"number" , editable:true}
                           ,lbrWart:{type:"number" , editable:false}
                           ,lbrPaint:{type:"number" , editable:false}
                           ,lbrAmt:{type:"number" }
                           ,cauLbrYn:{type:"string", editable:true}
                        }

                     }//model
               }//schema
            }//dataSource   */
            ,autoBind:false
            ,resizable:false
            ,height:450
            ,multiSelectWithCheckbox:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                        {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                       ,{field:"구분",title:"<spring:message code='ser.lbl.gubun' />", width:50, attributes:{"class":"al"}}
                       ,{field:"분류",title:"<spring:message code='ser.lbl.carChkTp' />", width:50, attributes:{"class":"al"}}
                       ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"}}
                       ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:200, attributes:{"class":"al"}}
                       ,{field:"regDt",title:"<spring:message code='ser.lbl.carRegDt' />", width:80, attributes:{"class":"ar"} }
                       ,{field:"사용여부",title:"<spring:message code='ser.lbl.useYn' />", width:40, attributes:{"class":"ar"}   }
                     ]

        });


    });
</script>
<!-- //script -->


