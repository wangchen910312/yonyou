<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="global.title.plan" /></h2>
        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="formarea" id="formarea3">
            <table  class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 활동명칭 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="activeNm" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.detail" /><!-- 요약설명 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="makCont" disabled="disabled"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.talkPlan" /><!-- 화술방안 --></th>
                        <td>
                            <div class="f_text f_disabled"><input type="text" id="talkPlan" disabled="disabled"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="subListarea">
            <div class="listhead dlistitem">
                <span style="width:70%"><spring:message code="global.lbl.fileNm" /><!-- 파일명 --></span>
                <span style="width:30%"><spring:message code="global.lbl.fileSize" /><!-- 파일크기 --></span>
            </div>
            <div>
                <!-- //첨부파일 -->
                <div id="subListView3" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>




<script type="text/x-kendo-template" id="subTemplate3">
<div class="deleteitem" onclick="javascript:fileListViewClick(subListData3._view[#:rnum-1 #]);">
    <span style="width:70%">#:fileNm #파일명</span>
    <span style="width:30%">#:fileSize #크기</span>
</div>
</script>

<script type="text/javascript">
    var subListData3 = new kendo.data.DataSource({
        transport:{
            read:{
                url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation){
                var params = {};
                params["sFileDocNo"] = $("#sActiveFileDocNo").val();
                return kendo.stringify(params);
            }
        }
        ,batch:true
        ,schema:{
            data:"data"
            ,total:"total"
            ,model:{
                id:"seq"
                ,field:{
                    rnum:{type:"number"}
                }
            }
        }
        ,change:function(e){
            console.log(e);
        }
    });

    fileListViewClick = function(dataItem) {
        fnFileDetail(dataItem.fileDocNo, dataItem.fileNo);
    }

    $(document).ready(function(){
        $("#subListView3").kendoListView({
            dataSource:subListData3
            ,template:kendo.template($("#subTemplate3").html())
            ,autoBind:false
            ,dataBinding: function(e) {
                if(e.items.length == 0){
                    $("#subListView3").css(
                            {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                                ,"background-repeat":"no-repeat"
                                ,"background-position":"center"});
                }else{
                    $("#subListView3").css({"background-image":"none"});
                }
            }
        });
    });
</script>