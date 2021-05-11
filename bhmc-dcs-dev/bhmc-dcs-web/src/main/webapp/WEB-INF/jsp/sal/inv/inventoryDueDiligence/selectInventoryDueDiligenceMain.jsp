<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

    <!-- 재고실사 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.lbl.stockRealSearch" /></h1><!-- 재고실사 -->
            <div class="btn_right">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
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
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.stockYM" /></th> <!-- 재고년월 -->
                        <td>
                            <input name="sStockDdYyMm" id="sStockDdYyMm" class="form_datepicker">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ddTp" /></th> <!-- 실사구분 -->
                        <td>
                            <input name="sStockDdDstinCd" id="sStockDdDstinCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.vinNo" /></th> <!-- 차대번호 -->
                        <td>
                            <input name="sVinNo" id="sVinNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.confirmYn" /></th> <!-- 확인여부 -->
                        <td>
                            <input name="sConfirmYn" id="sConfirmYn" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="grid"></div>
        </div>
    </section>

    <section id="callInventoryDueDiligenceWindow" class="pop_wrap">
        <!-- 개별상세정보 -->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="sal.title.fincInfoDetail" /></h2> <!-- 개별정보 -->
                <div class="btn_right">
                    <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                </div>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNo" /></th> <!-- VIN NO -->
                            <td>
                                <input name="stockDdYyMm" id="stockDdYyMm" type="hidden" class="form_datepicker">
                                <input name="stockDdDstinCd" id="stockDdDstinCd" type="hidden">
                                <input name="seq" id="seq" type="hidden">
                                <input name="vinNo" id="vinNo" type="text" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.strge" /></th> <!-- 창고 -->
                            <td>
                                <input name="strgeCd" id="strgeCd" type="text"  class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.location" /></th> <!-- 위치 -->
                            <td>
                                <input name="locCd" id="locCd" type="text" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carLine" /></th> <!-- 차종 -->
                            <td>
                                <input name="carlineNm" id="carlineNm" type="text" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.model" /></th> <!-- 모델 -->
                            <td>
                                <input name="modelNm" id="modelNm" type="text" value="" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ocn" /></th> <!-- OCN -->
                            <td>
                                <input name="ocnNm" id="ocnNm" type="text" class="form_input form_readonly" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.stockStat" /></th> <!-- 재고상태 -->
                            <td>
                                <input name="carStatCd" id="carStatCd" class="form_comboBox" >
                            </td>
                            <th scope="row"><spring:message code="global.lbl.creYm" /></th> <!-- 생산년월 -->
                            <td class="readonly_area">
                                <input name="manufactYyMmDt" id="manufactYyMmDt" class="form_datepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.grDt" /></th> <!-- 입고일자 -->
                            <td class="readonly_area">
                                <input name="grDt" id="grDt" class="form_datepicker form_readonly" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.confirmYn" /></th> <!-- 확인여부 -->
                            <td>
                                <input name="confirmYn" id="confirmYn" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pictureFile" /></th> <!-- 사진파일 -->
                            <td colspan="3">
                                <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/cmm/sci/dbMessageSource/insertDBMessageSourceBatchUploadFile.do"/>">
                                    <input name="docId" id="docId" type="hidden">
                                    <input name="photoFilePathNm" id="photoFilePathNm" type="text" value="" readonly class="form_input form_readonly" style="width:60%">
                                    <span class="btn_file" id="fileSelect"><spring:message code="global.btn.upload" /><input type="file" id="uploadFile" name="uploadFile"></span> <!-- 업로드 -->
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_form mt10" id="imgDiv" style="display:none">
                <img id="image" style="max-width:100%;" />
            </div>
        </section>
        <!-- //개별정보 -->
    </section>

<script type="text/javascript">
     var sysDate = "${sysDate}";

     /************* 실사구분 SELECT BOX  *******************/
	 var stockDdDstinCdList = [];
     <c:forEach var="obj" items="${stockDdDstinCdInfo}">
     stockDdDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var stockDdDstinCdArr = dms.data.arrayToMap(stockDdDstinCdList, function(obj){return obj.cmmCd});

     /************* 재고상태(차량상태) SELECT BOX  *******************/
     var carStatCdList = [];
     <c:forEach var="obj" items="${carStatCdInfo}">
     carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});

     /************* 창고 SELECT BOX  *******************/
     var strgeCdList = [];
     <c:forEach var="obj" items="${strgeCdInfo}">
     strgeCdList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
     </c:forEach>
     var strgeCdArr = dms.data.arrayToMap(strgeCdList, function(obj){return obj.cmmCd});

     /************* 위치 SELECT BOX  *******************/
     var locCdList = [];
     <c:forEach var="obj" items="${locCdInfo}">
     locCdList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
     </c:forEach>
     var locCdArr = dms.data.arrayToMap(locCdList, function(obj){return obj.cmmCd});

     setSearch = function(jsonObj) {
        refreshAll();

        $("#stockDdYyMm").val(jsonObj.stockDdYyMm);
        $("#stockDdDstinCd").val(jsonObj.stockDdDstinCd);
        $("#seq").val(jsonObj.seq);

        $("#vinNo").val(jsonObj.vinNo);
        $("#strgeCd").data("kendoExtDropDownList").value(jsonObj.strgeCd);
        $("#locCd").data("kendoExtDropDownList").value(jsonObj.locCd);
        $("#carlineNm").val(jsonObj.carlineNm);
        $("#modleNm").val(jsonObj.modleNm);
        $("#ocnNm").val(jsonObj.ocnNm);
        $("#carStatCd").data("kendoExtDropDownList").value(jsonObj.carStatCd);
        $("#manufactYyMmDt").val(jsonObj.manufactYyMmDt);
        $("#grDt").data('kendoExtMaskedDatePicker').value(jsonObj.grDt);
        $("#confirmYn").data("kendoExtDropDownList").value(jsonObj.confirmYn);
        $("#photoFilePathNm").val(jsonObj.photoFilePathNm);

        $("#btnSave").data("kendoButton").enable(true);
    }

    refreshAll = function() {
        $("#stockDdYyMm").val("");
        $("#stockDdDstinCd").val("");
        $("#seq").val("");

        $("#vinNo").val("");
        $("#strgeCd").data("kendoExtDropDownList").value("");
        $("#locCd").data("kendoExtDropDownList").value("");
        $("#carlineNm").val("");
        $("#modleNm").val("");
        $("#ocnNm").val("");
        $("#carStatCd").data("kendoExtDropDownList").value("");
        $("#manufactYyMmDt").val("");
        $("#grDt").data('kendoExtMaskedDatePicker').value("");
        $("#confirmYn").data("kendoExtDropDownList").value("");
        $("#photoFilePathNm").val("");

        $("#btnSave").data("kendoButton").enable(false);
        $("#imgDiv").attr("style", "display:none");
    }

    validator = function() {

        if($("#confirmYn").val() == "") {
            dms.notification.info("<spring:message code='global.lbl.confirmYn' var='confirmYn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${confirmYn},' />"); // 확인여부
            $("#confirmYn").focus();
            return false;
        }
/*
        if($("#useYn").val() == "") {
            dms.notification.info("<spring:message code='global.lbl.useYn' var='useYn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${useYn},' />"); // 사용여부
            $("#useYn").focus();
            return false;
        }
*/
        return true;
    }

    save = function() {
        var saveData;

        if(validator()) {
            saveData = {
                 seq:$("#seq").val()
                ,stockDdYyMm:$("#stockDdYyMm").val()
                ,stockDdDstinCd:$("#stockDdDstinCd").val()
                ,confirmYn:$("#confirmYn").data("kendoExtDropDownList").value()
                ,photoFilePathNm:$("#photoFilePathNm").val()
            };

            $.ajax({
                url:"<c:url value='/sal/inv/inventoryDueDiligence/updateInventoryDueDiligence.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus){
                    $('#grid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#grid').data('kendoExtGrid').dataSource.page(1);

                    //refreshAll();

                    $("#callInventoryDueDiligenceWindow").data("kendoWindow").close();

                  //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    }

	$(document).ready(function () {

	    // 본문 팝업 설정
	    $("#callInventoryDueDiligenceWindow").kendoWindow({
	        animation:false
	        ,draggable:false
	        ,modal:true
	        ,resizable:false
	        ,visible:false
	        ,title:"<spring:message code='sal.title.fincInfoDetail' />"      // 개별정보
	        ,width:"950px"
	        ,height:"350px"
	    }).data("kendoWindow");

	    $("#btnViewDetail").kendoButton({    // 상세조회.
	        click:function(e){
	            var grid = $("#grid").data("kendoExtGrid");
	            var selectedItem = grid.dataItem(grid.select());

	            if ( dms.string.isNotEmpty(selectedItem) ){
	                setSearch(selectedItem);
	                viewDetailPopup();
	            } else {
	                // {상세정보}을(를) 확인하여 주세요.
	                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
	                return;
	            }
	        }
	    });

	    document.getElementById("uploadFile").onchange = function(){

	        r.files = [];
	        $(".resumable-list").html("");
	        r.appendFilesFromFileList(this.files);

	        var imgPath = $("#uploadFile").val();
	        var fileTp = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();

	        if( fileTp == "gif" || fileTp == "png" || fileTp == "jpg" || fileTp == "jpeg" ){
	            if( typeof(FileReader) != "undefined" ){
	                var reader = new FileReader();

	                $("#imgDiv").attr("style", "display:display");
	                reader.onload = function(e){
	                    $("#photoFilePathNm").val(imgPath);

	                    document.getElementById("image").src = e.target.result;
	                }

	                reader.readAsDataURL(this.files[0]);
	            }else{
	                $("#imgDiv").attr("style", "display:none");

	                document.getElementById("image").src = "";
	                $("#uploadFile").val("");
	                $("#photoFilePathNm").val("");
	                dms.notification.info("<spring:message code='global.info.filePreviewSupportYn'/>"); //해당 Browser에서 파일 미리보기가 지원되지 않습니다.
	            }
	        }else{
	            $("#imgDiv").attr("style", "display:none");

	            document.getElementById("image").src = "";
	            $("#uploadFile").val("");
	            $("#photoFilePathNm").val("");
	            dms.notification.info("<spring:message code='global.info.fileTpImgYn'/>"); //이미지 파일만 업로드 가능합니다.(jpg, jpeg, gif, png)
	        }
	    }

	    $("#sStockDdDstinCd").kendoExtDropDownList({
	          dataTextField:"cmmCdNm"
	         ,dataValueField:"cmmCd"
	         ,dataSource:stockDdDstinCdList
	         ,optionLabel:" "
	     });

	     $("#carStatCd").kendoExtDropDownList({
	         dataTextField:"cmmCdNm"
	        ,dataValueField:"cmmCd"
	        ,dataSource:carStatCdList
	        ,enable:false
	        ,optionLabel:" "
	     });

	     $("#strgeCd").kendoExtDropDownList({
	         dataTextField:"cmmCdNm"
	        ,dataValueField:"cmmCd"
	        ,dataSource:strgeCdList
	        ,enable:false
	        ,optionLabel:" "
	     });

	     $("#locCd").kendoExtDropDownList({
	         dataTextField:"cmmCdNm"
	        ,dataValueField:"cmmCd"
	        ,dataSource:locCdList
	        ,enable:false
	        ,optionLabel:" "
	     });

	     $("#sConfirmYn").kendoExtDropDownList({
	         dataTextField:"cmmCdNm"
	        ,dataValueField:"cmmCd"
	        ,dataSource:[{"cmmCd":"","cmmCdNm":" "},{"cmmCd":"Y","cmmCdNm":"Y"},{"cmmCd":"N","cmmCdNm":"N"}]
	        ,index:0
	     });

	     $("#confirmYn").kendoExtDropDownList({
	         dataTextField:"cmmCdNm"
	        ,dataValueField:"cmmCd"
	        ,dataSource:[{"cmmCd":"Y","cmmCdNm":"Y"},{"cmmCd":"N","cmmCdNm":"N"}]
	        ,index:0
	     });

	    /**
         * 재고년월
         */
         $("#sStockDdYyMm").kendoExtMaskedDatePicker({
             start:"year"
             ,depth:"year"
             ,format:"yyyy-MM"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:sysDate
         });

         /**
          * 생산년월
          */
          $("#manufactYyMmDt").kendoExtMaskedDatePicker({
              format:"yyyy-MM"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          });

         /**
          * 입고일자
          */
          $("#grDt").kendoExtMaskedDatePicker({
              format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          });

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                refreshAll();
	        }
	    });

	    $("#btnSave").kendoButton({
	        enable:false,
	        //icon:"plus",
	        click:function(e){

	            if( $("#photoFilePathNm").val() != "" && $("#photoFilePathNm").val() != null ){
	                $("#progressWindow").kendoWindow({
	                    width:"600px"
	                    ,height:"300px"
	                    ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
	                    ,animation:false
	                    ,draggable:false
	                    ,visible:false
	                    ,resizable:false
	                    ,modal:true
	                }).data("kendoWindow").center().open();

	                $('.resumable-progress, .resumable-list').show();
	                $('.resumable-progress .progress-resume-link').hide();
	                $('.resumable-progress .progress-pause-link').show();

	                r.upload();
	            }else{
	                save();
	            }
	        }
	    });

        //그리드
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-113902"
           	,dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/inv/inventoryDueDiligence/selectInventoryDueDiligence.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sStockDdYyMm"] = kendo.toString($("#sStockDdYyMm").data("kendoExtMaskedDatePicker").value(),"yyyyMM");
                         params["sStockDdDstinCd"] = $("#sStockDdDstinCd").data('kendoExtDropDownList').value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sConfirmYn"] = $("#sConfirmYn").data('kendoExtDropDownList').value();

                         console.log(kendo.stringify(params));

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){

             }
             ,schema:{
                  data:"data"
                 ,total:"total"
                 ,model:{
                      id:"seq"
                     ,fields:{
                          seq:{type:"string", hidden:true} //Seq
                         ,carlineCd:{type:"string", hidden:true} //
                         ,modelCd:{type:"string", hidden:true} //
                         ,ocnCd:{type:"string", hidden:true} //
                         ,extColorCd:{type:"string", hidden:true} //
                         ,intColorCd:{type:"string", hidden:true} //
                         ,stockDdYyMm:{type:"string", editable:false} //
                         ,stockDdDstinCd:{type:"string", editable:false} //
                         ,vinNo:{type:"string", editable:false} //
                         ,carlineNm:{type:"string", editable:false} //
                         ,modelNm:{type:"string", editable:false} //
                         ,ocnNm:{type:"string", editable:false} //
                         ,extColorNm:{type:"string", editable:false} //
                         ,intColorNm:{type:"string", editable:false} //
                         ,carStatCd:{type:"string", editable:false} //
                         ,strgeCd:{type:"string", editable:false} //
                         ,locCd:{type:"string", editable:false} //
                         ,manufactYyMmDt:{type:"string", editable:false} //
                         ,grDt:{type:"Date", editable:false} //
                         ,stockAgingCnt:{type:"string", editable:false} //
                         ,confirmYn:{type:"string", editable:false} //
                         ,photoFilePathNm:{type:"string", editable:false} //
                     }
                 }
             }
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
           ,appendEmptyColumn:false           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
    	   ,height:450
           ,autoBind:false
           ,scrollable:true
           /*
           ,change:function(e){
               var selectedItem = this.dataItem(this.select());
               setSearch(selectedItem);
           }
           */
    	   ,columns:[
                   {   field:"seq", hidden:true }  // seq
                  ,{   field:"carlineCd", hidden:true }  // 차종
                  ,{   field:"modelCd", hidden:true }  // 모델
                  ,{   field:"ocnCd", hidden:true }  // OCN
                  ,{   field:"extColorCd", hidden:true }  // 외장색
                  ,{   field:"intColorCd", hidden:true }  // 내장색
                  ,{
                       title:"<spring:message code='sal.lbl.ordYyMm' />"
                      ,field:"stockDdYyMm"
                      ,width:55
                      ,format:"{0:YYYY-MM}"
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{ "style":"text-align:center"}
                  }  // 재고년월
                  ,{
                       title:"<spring:message code='global.lbl.ddTp' />"
                      ,field:"stockDdDstinCd", width:75
                      ,template:"# if(stockDdDstinCdArr[stockDdDstinCd] != null) { # #= stockDdDstinCdArr[stockDdDstinCd].cmmCdNm# # }#"
                      ,headerAttributes:{style:"text-align:center;"}
                  }  // 실사구분
                  ,{
                       title:"<spring:message code='global.lbl.vinNo' />"
                      ,field:"vinNo", width:55
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{ "style":"text-align:center"}
                  }  // VIN No
                  ,{
                       title:"<spring:message code='global.lbl.carLine' />"
                      ,field:"carlineNm", width:35
                      ,headerAttributes:{style:"text-align:center;"}
                  }  // 차종
                  ,{
                      title:"<spring:message code='global.lbl.model' />"
                     ,field:"modelNm", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // 모델
                  ,{
                      title:"<spring:message code='global.lbl.ocn' />"
                     ,field:"ocnNm", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // OCN
                  ,{
                      title:"<spring:message code='global.lbl.extColor' />"
                     ,field:"extColorNm", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // 외장색
                  ,{
                      title:"<spring:message code='global.lbl.intColor' />"
                     ,field:"intColorNm", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // 내장색
                  ,{field:"carStatCd", title:"<spring:message code='global.lbl.stockStat' />"
                      ,width:55
                      ,template:"# if(carStatCdArr[carStatCd] != null) { # #= carStatCdArr[carStatCd].cmmCdNm# # }#"
                      ,headerAttributes:{style:"text-align:center;"}
                  }  // 차량상태 (재고상태)
                  ,{field:"strgeCd", title:"<spring:message code='global.lbl.strge' />"
                      ,width:55
                      ,template:"# if(strgeCdArr[strgeCd] != null) { # #= strgeCdArr[strgeCd].cmmCdNm# # }#"
                      ,headerAttributes:{style:"text-align:center;"}
                  }  // 창고
                  ,{field:"locCd", title:"<spring:message code='global.lbl.location' />"
                      ,width:55
                      ,template:"# if(locCdArr[locCd] != null) { # #= locCdArr[locCd].cmmCdNm# # }#"
                      ,headerAttributes:{style:"text-align:center;"}
                  }  // 위치
                  ,{field:"manufactYyMmDt", title:"<spring:message code='global.lbl.creYm' />"
                      ,width:55
                      ,format:"{0:YYYY-MM}"
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{ "style":"text-align:center"}
                  }  // 생산년월
                  ,{field:"grDt", title:"<spring:message code='sal.lbl.grDt' />"
                      ,width:60
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{ "style":"text-align:center"}
                  }  // 입고일자
                  ,{
                      title:"<spring:message code='global.lbl.stockAging' />"
                     ,field:"stockAgingCnt", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                     ,attributes:{ "style":"text-align:right"}
                  }  // 재고연령
                  ,{
                      title:"<spring:message code='global.lbl.confirmYn' />"
                     ,field:"confirmYn", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // 확인여부
                  ,{
                      title:"<spring:message code='global.lbl.vehPicture' />"
                     ,field:"photoFilePathNm", width:75
                     ,headerAttributes:{style:"text-align:center;"}
                  }  // 차량사진

              ]
    	});

        // 그리드 더블클릭.
	    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
	        var grid = $("#grid").data("kendoExtGrid");
	        var selectedItem = grid.dataItem(grid.select());
	        setSearch(selectedItem);
	        viewDetailPopup();
	    });



	}); //document.ready End


	// 상세내용 팝업 호출
	function viewDetailPopup(){
	    var win = $("#callInventoryDueDiligenceWindow").data("kendoWindow").center().open();
	}

	//================================
	//TODO [유승봉]파일업로드 플러그인으로 변경필요
    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,method:"octet"
        ,maxFiles:1
    });
//     r.assignBrowse($('#fileSelect')[0]);

    //파일추가 이벤트
    r.on('fileAdded', function(file) {



        //파일목록 출력
        $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);


    });
    r.on('pause', function() {
        $('.resumable-progress .progress-resume-link').show();
        $('.resumable-progress .progress-pause-link').hide();
    });
    r.on('uploadStart', function() {

        var _that = this;

        if (_that.opt["query"] == null) {
             _that.opt["query"] = {};
        }

        if (dms.string.isEmpty($("#docId").val())) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    $("#docId").val(id);
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = $("#docId").val();
        }

        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();
    });
    r.on('complete', function() {

        var _that = this;

        $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();
        $("#progressWindow").data("kendoWindow").close();
        r.files = [];
        $(".resumable-list").html("");

        save();
    });
    r.on('fileError', function(file, message) {
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
    });
    r.on('fileProgress', function(file) {
        var fileProgress = 0;

        if (file instanceof ResumableChunk) {
            fileProgress = file.fileObj.progress();
        } else {
            fileProgress = file.progress();
        }

        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
        $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
    });
    //================================
</script>