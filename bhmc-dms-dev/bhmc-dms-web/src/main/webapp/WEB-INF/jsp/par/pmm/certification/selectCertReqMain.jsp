<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 합격증신청 -->
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11974" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11973" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInterface" class="btn_m btn_link"><spring:message code="par.btn.bmpInterface" /><!-- BMP플랫폼 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11972" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 저장 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11971" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSend" class="btn_m"><spring:message code="par.btn.send" /></button>
			</dms:access>
            </div>
        </div>

        <div class="table_form">
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
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th><!-- 딜러코드 -->
                        <td class="required_area">
                            <input id="dlrCd" name="dlrCd" class="form_input form_readonly" readonly data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrNm" /></th><!-- 딜러명칭 -->
                        <td>
                            <input id="dlrNm" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span></th><!-- 합격증유형 -->
                        <td class="required_area">
                            <input id="certTp" name="certTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row">
                        <!-- update by lyy 合格证申请订单编号改为BMP订单编号 2018-09-04 start -->
                        <!-- <spring:message code="par.lbl.ordNo" /> -->
                        <spring:message code="par.lbl.bmpOrdNo" /><!-- BMP订单编号 -->
                        <!-- update by lyy 合格证申请订单编号改为BMP订单编号 2018-09-04 end -->
                        </th><!-- 오더번호 -->
                        <td>
                            <input id="ordNo" name="ordNo" class="form_input" data-json-obj="true" />
                            <input type="hidden" id="certNo" data-json-obj="true" />
                            <input type="hidden" id="certReqNo" name="certReqNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.requestUsr" /></th><!-- 신청인 -->
                        <td>
                            <input id="custNo" name="custNo" class="form_input form_readonly hidden" readonly data-json-obj="true" />
                            <input id="custNm" name="custNm" class="form_input form_readonly" readonly data-json-obj="true" />
                            <a id="searchCustNo" class="form_readonly" readonly><!--신청인 검색 --></a>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th><!-- 전화 -->
                        <td>
                            <input id="telNo" name="telNo" class="form_input numberic form_readonly" readonly type="text" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 핸드폰 -->
                        <td>
                        	<!-- 去掉移动电话只读属性 update by lyy 2018-09-04 start -->
                            <input id="hpNo" name="hpNo" class="form_input numberic" type="text" data-json-obj="true" />
                            <!-- 去掉移动电话只读属性 update by lyy 2018-09-04 end -->
                        </td>
                        <th scope="row"><spring:message code="par.lbl.requestTm" /></th><!-- 신청시간 -->
                        <td>
                            <input id="regDt" name="regDt" type="text" class="form_datepicker"  />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.baseVinNo" /></span><!-- 차량VIN --></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="baseVinNo" name="baseVinNo" class="form_input form_readonly" data-json-obj="true" data-name="<spring:message code="par.lbl.baseVinNo" />" required readonly />
                                <a id="searchVinNo"><!--VIN & 고객 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd"  /></th><!-- 부품번호 -->
                        <td>
                            <div class="form_search">
                                <input id="itemCd" name="itemCd" class="form_input form_readonly" readonly data-json-obj="true" />
                                <input id="itemNm" name="itemNm" class="form_input form_readonly hidden" data-json-obj="true" />
                                <a id="searchItemCd"><!--부품번호 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.detlCont" /></th><!-- 상세설명 -->
                        <td>
                            <input id="detlCont" name="detlCont" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.certStatCd" /></th><!-- 합격증상태 -->
                        <td>
                            <input id="certStatCd" name="certStatCd" class="form_comboBox" data-json-obj="true" />
                            <input type="hidden" id="certStatCdDb" name="certStatCdDb" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.engine" /></h2><!-- 엔진 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.oldEnginCylPhotoNm" /></th><!-- 구 엔진실린더사진 -->
                        <td>
                            <input id="oldEnginCylPhotoNm" name="oldEnginCylPhotoNm" class="form_input" data-json-obj="true" maxlength="30" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.oldEnginCylNo" /></th><!-- 구 엔진실린더번호 -->
                        <td>
                            <input id="oldEnginCylNo" name="oldEnginCylNo" class="form_input" data-json-obj="true" maxlength="15" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.newEnginCylPhotoNm" /></th><!-- 신 엔진실린더사진 -->
                        <td>
                            <input id="newEnginCylPhotoNm" name="newEnginCylPhotoNm" class="form_input" data-json-obj="true" maxlength="30" readonly="readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.newEnginCylNo" /></th><!-- 신 엔진실린더번호 -->
                        <td>
                            <input id="newEnginCylNo" name="newEnginCylNo" class="form_input" data-json-obj="true" maxlength="15" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.fileDocNo" /></th><!-- 기타첨부파일 -->
                        <td>
                            <input id="otherEnginCylPhotoNm" name="otherEnginCylPhotoNm" class="form_input " data-json-obj="true" readonly="readonly" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.selectFile" /></th>
                        <td colspan="3">
                            <input type="file" id="files01" name="files01[]" multiple class="form_file" multiple="" />
                                <input type="hidden" id="fileNo01" />
                                <input type="hidden" id="fileNm01" />
                                <input type="hidden" id="fileSizeVal01" />
                                <input type="hidden" id="fileDataCont01" />
                                <input type="hidden" id="fileMaxSizeYn01" />
                                <input type="hidden" id="fileTypeMatchYn01" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.selectFile" /></th>
                        <td colspan="3">
                            <input type="file" id="files02" name="files02[]" multiple class="form_file" multiple="" />
                                <input type="hidden" id="fileNo02" />
                                <input type="hidden" id="fileNm02" />
                                <input type="hidden" id="fileSizeVal02" />
                                <input type="hidden" id="fileDataCont02" />
                                <input type="hidden" id="fileMaxSizeYn02" />
                                <input type="hidden" id="fileTypeMatchYn02" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.selectFile" /></th>
                        <td colspan="3">
                            <input type="file" id="files03" name="files03[]" multiple class="form_file" multiple="" />
                                <input type="hidden" id="fileNo03" />
                                <input type="hidden" id="fileNm03" />
                                <input type="hidden" id="fileSizeVal03" />
                                <input type="hidden" id="fileDataCont03" />
                                <input type="hidden" id="fileMaxSizeYn03" />
                                <input type="hidden" id="fileTypeMatchYn03" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.fileView" /><!-- 이미지보기 --></th>
                        <td colspan="3" style="height:228px">
                            <img id="fileView01" name="fileView01" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.fileView" /><!-- 이미지보기 --></th>
                        <td colspan="3" style="height:228px">
                            <img id="fileView02" name="fileView02" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.fileView" /><!-- 이미지보기 --></th>
                        <td colspan="3" style="height:228px">
                            <img id="fileView03" name="fileView03" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.carBody" /></h2><!-- 바디 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.newVinNo" /></th><!-- 신차 VIN NO -->
                        <td>
                            <input id="newVinNo" name="newVinNo" class="form_input numberandalpha" data-json-obj="true" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carBodyVinNo" /></th><!-- 차체 VIN NO -->
                        <td>
                            <input id="carBodyVinNo" name="carBodyVinNo" class="form_input numberandalpha" data-json-obj="true" >
                        </td>
                        <td colspan="4"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.evalCond" /></h2><!-- 심사상황 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:41%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.evalRslt" /></th><!-- 심사결과 -->
                        <td>
                            <input id="evalRsltNm" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.evalComment" /></th><!-- 심사의견 -->
                        <td>
                            <input id="evalOpnCont" class="form_input form_readonly" readonly />
                        </td>
                        <th></th>
                        <td></td>
                        <th></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.procRsltCont" /></h2><!-- 처리결과 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:9%;">
                    <col style="width:15%;">
                    <col style="width:11%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.emailNm" /></th><!-- 합격증메일 -->
                        <td>
                            <input id="emailNm" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.trsfCmpCd" /></th><!-- 택배사 -->
                        <td>
                            <input id="trsfCmpCd" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.emailDt" /></th><!-- 합격증메일발송시간 -->
                        <td>
                            <input id="emailDt" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.detlCont" /></th><!-- 상세설명 -->
                        <td>
                            <input id="procRsltDetlCont" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //합격증신청 -->

    <!-- script -->
    <script type="text/javascript">

    var sessionDlrCd         = "${dlrInfo.dlrCd}"
       ,sessionDlrNm         = "${dlrInfo.dlrNm}"
       ,toDt                 = "${toDt}"
       ,pCertNo              = "${pCertNo}"
       ,currentLoginNm       = "${currentLoginName}"
       ,searchPurcOrdPopupWindow
       ,vehOfCustInfoSearchPopup
       ,popupWindow;

    //certTpList
    var certTpList = [];
    <c:forEach var="obj" items="${certTpList}">
        certTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var certTpMap = {};
    $.each(certTpList, function(idx, obj){
        certTpMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //certStatList
    var certStatList = [];
    <c:forEach var="obj" items="${certStatList}">
        if("${obj.useYn}" != 'N' ){
            certStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    var certStatMap = {};
    $.each(certStatList, function(idx, obj){
        certStatMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //yesNoTpList
    var yesNoTpList = [];
    <c:forEach var="obj" items="${yesNoTpList}">
    yesNoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var yesNoTpMap = {};
    $.each(yesNoTpList, function(idx, obj){
        yesNoTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //getSizeMbBypte Func
    function getSizeMbByte(size){
        var sizeMB = (size / (1024*1024)).toFixed(2);
        return sizeMB+" MB";
    }

    //file Handler Func
    function handleFileSelect01(evt){
        //input files
        var files = evt.target.files;
        //file 5MB size
        var fileMaxSiz5Mb = 5 * 1024 * 1024;
        //fileView
        var fileView = document.getElementById("fileView01");
        var output = [];
        for(var i = 0,f; f = files[i]; i++){
            //file only one.
            if(i < 1){
                //file size check
                if(f.size > fileMaxSiz5Mb){
                    $("#fileMaxSizeYn01").val("N");
                }
                else{
                    $("#fileMaxSizeYn01").val("Y");
                }
                //file type check
                if(!f.type.match("image.*")){
                    $("#fileTypeMatchYn01").val("N");
                }
                else{
                    $("#fileTypeMatchYn01").val("Y");
                }
                //fileName.
                $("#fileNm01").val(f.name);
                $("#fileNm01").val(f.name);
                $("#oldEnginCylPhotoNm").val(f.name);
                //fileSize.
                $("#fileSizeVal01").val(f.size);
                var sizeInMB = getSizeMbByte(f.size);
                //$("#fileSizeVal01").val(f.size+" / "+sizeInMB);
                //FileReader
                var reader = new FileReader();
                var file = f;
                reader.onload = (function(theFile) {
                    return function(e) {

                        var image01 = new Image();
                        image01.src = e.target.result;

                        image01.onload = function() {

                            //이미지 최대 width 300 처리.
                            if(this.width > 300){
                                fileView.width = 300;
                            }else{
                                fileView.width = this.width;
                            }
                        };

                        $("#fileDataCont01").val(window.btoa(e.target.result));
                        fileView.src = e.target.result;

                    };
                })(file);
                //readAsDataURL call
                reader.readAsDataURL(file);
            }
        }
    }
    //input files Listener
    document.getElementById("files01").addEventListener('change', handleFileSelect01, false);
    //file Handler Func
    function handleFileSelect02(evt){
        //input files
        var files = evt.target.files;
        //file 5MB size
        var fileMaxSiz5Mb = 5 * 1024 * 1024;
        //fileView
        var fileView = document.getElementById("fileView02");
        var output = [];
        for(var i = 0,f; f = files[i]; i++){
            //file only one.
            if(i < 1){
                //file size check
                if(f.size > fileMaxSiz5Mb){
                    $("#fileMaxSizeYn02").val("N");
                }
                else{
                    $("#fileMaxSizeYn02").val("Y");
                }
                //file type check
                if(!f.type.match("image.*")){
                    $("#fileTypeMatchYn02").val("N");
                }
                else{
                    $("#fileTypeMatchYn02").val("Y");
                }
                //fileName.
                $("#fileNm02").val(f.name);
                $("#fileNm02").val(f.name);
                $("#newEnginCylPhotoNm").val(f.name);
                //fileSize.
                $("#fileSizeVal02").val(f.size);
                var sizeInMB = getSizeMbByte(f.size);
                //$("#fileSizeVal02").val(f.size+" / "+sizeInMB);
                //FileReader
                var reader = new FileReader();
                var file = f;
                reader.onload = (function(theFile) {
                    return function(e) {

                        var image02 = new Image();
                        image02.src = e.target.result;

                        image02.onload = function() {

                            if(this.width > 300){
                                fileView.width = 300;
                            }else{
                                fileView.width = this.width;
                            }
                        };

                        $("#fileDataCont02").val(window.btoa(e.target.result));
                        fileView.src = e.target.result;

                    };
                })(file);
                //readAsDataURL call
                reader.readAsDataURL(file);
            }
        }
    }

    document.getElementById("files02").addEventListener('change', handleFileSelect02, false);

    //file Handler Func
    function handleFileSelect03(evt){
        //input files
        var files = evt.target.files;
        //file 5MB size
        var fileMaxSiz5Mb = 5 * 1024 * 1024;
        //fileView
        var fileView = document.getElementById("fileView03");
        var output = [];
        for(var i = 0,f; f = files[i]; i++){
            //file only one.
            if(i < 1){
                //file size check
                if(f.size > fileMaxSiz5Mb){
                    $("#fileMaxSizeYn03").val("N");
                }
                else{
                    $("#fileMaxSizeYn03").val("Y");
                }
                //file type check
                if(!f.type.match("image.*")){
                    $("#fileTypeMatchYn03").val("N");
                }
                else{
                    $("#fileTypeMatchYn03").val("Y");
                }
                //fileName.
                $("#fileNm03").val(f.name);
                $("#fileNm03").val(f.name);
                $("#otherEnginCylPhotoNm").val(f.name);
                //fileSize.
                $("#fileSizeVal03").val(f.size);
                var sizeInMB = getSizeMbByte(f.size);
                //$("#fileSizeVal03").val(f.size+" / "+sizeInMB);
                //FileReader
                var reader = new FileReader();
                var file = f;
                reader.onload = (function(theFile) {
                    return function(e) {

                        var image03 = new Image();
                        image03.src = e.target.result;

                        image03.onload = function() {

                            if(this.width > 300){
                                fileView.width = 300;
                            }else{
                                fileView.width = this.width;
                            }
                        };

                        $("#fileDataCont03").val(window.btoa(e.target.result));
                        fileView.src = e.target.result;

                    };
                })(file);
                //readAsDataURL call
                reader.readAsDataURL(file);
            }
        }
    }


    document.getElementById("files03").addEventListener('change', handleFileSelect03, false);
    //imageLoader Func
    function imageLoader01(type){
        var fileView = null;
        var bolbBytes = null;
        if(type == "1"){
            fileView = document.getElementById("fileView01");
            bolbBytes = $("#fileDataCont01").val();
        }else if(type == "2"){
            fileView = document.getElementById("fileView02");
            bolbBytes = $("#fileDataCont02").val();
        }else if(type == "3"){
            fileView = document.getElementById("fileView03");
            bolbBytes = $("#fileDataCont03").val();
        }else{
            return false;
        }

        var fileData = window.atob(bolbBytes);
        fileView.src = fileData;

        fileView.onload = function() {
            if(this.width > 300){
                fileView.width = 300;
            }else{
                fileView.width = this.width;
            }
        };
    }

    function saveCerification(ifSendYn, certStatCd){
        if(dms.string.isEmpty($("#certTp").val())){
            //합격증 유형을(를) 확인하여 주세요.
            dms.notification.info("<spring:message code='global.lbl.type' var='arguMsg' /><spring:message code='global.info.check.field' arguments='${arguMsg}'/>");
            return false;
        }

        if(dms.string.isEmpty($("#baseVinNo").val())){
            //원 VINNO을(를) 입력하여 주십시오.
            dms.notification.info("<spring:message code='par.lbl.baseVinNo' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
            $("#baseVinNo").focus();
            return false;
        }
        
        //增加订单编号、移动电话、配件编号不鞥为空校验，订单编号要以字母开头，总长度必须为10位 update by lyy 2018-09-04 start
        if(dms.string.isEmpty($("#ordNo").val())){
            //bmp订单编号不能为空
            dms.notification.info("<spring:message code='par.lbl.bmpOrdNo' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
            $("#bmpOrdNo").focus();
            return false;
        }
        
      	//校验密码：只能输入10个字母开头的字符串 
        var bmpOrdNoPatrn = /^[a-zA-Z]\w{9}$/;
        if(!bmpOrdNoPatrn.test($("#ordNo").val())) 
        { 
        	dms.notification.info("<spring:message code='par.lbl.bmpOrdNo' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
            return false; 
        }
        
        if(dms.string.isEmpty($("#hpNo").val())){
            //移动电话不能为空
            dms.notification.info("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
            $("#hpNo").focus();
            return false;
        }
        
        if(dms.string.isEmpty($("#itemCd").val())){
            //配件编号不能为空
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='arguMsg' /><spring:message code='global.info.validation.required' arguments='${arguMsg}'/>");
            $("#itemCd").focus();
            return false;
        }
      	//增加订单编号、移动电话、配件编号不鞥为空校验，订单编号要以字母开头，总长度必须为10位 update by lyy 2018-09-04 end

        //합격증상태코드
        var certStatCdDb = $("#certStatCdDb").val();
        var certStatCd = $("#certStatCd").val();
        //합격증신청번호
        var certReqNo = $("#certReqNo").val();

        if(certStatCdDb == "01" && certStatCd == "01"  && certReqNo != ""){
            //합격증 전송상태 수정 또는 삭제만 가능합니다.
            dms.notification.info("<spring:message code='par.lbl.certStatsDeleteUpdate' var='arguMsg' /><spring:message code='par.info.certStatMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "04" && certStatCdDb != "05" && certReqNo != ""){
            //합격증 전송상태 삭제만 가능합니다.
            dms.notification.info("<spring:message code='par.lbl.certStatsDelete' var='arguMsg' /><spring:message code='par.info.certStatMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "05"){
            //합격증 전송상태 삭제입니다. 합격증 신청하세요.
            dms.notification.info("<spring:message code='par.lbl.certStatsDelete' var='arguMsg' /><spring:message code='par.info.certStatDeleteMsg' arguments='${arguMsg}' />");
            return false;
        }else if(certStatCdDb == "02" || certStatCd == "02"){
            //합격증 전송상태 심사 입니다.
            dms.notification.info("<spring:message code='par.lbl.certStatInfo02' var='arguMsg' /><spring:message code='par.info.certStatRealMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "03" || certStatCd == "03"){
            //합격증 전송상태 처리완료 입니다.
            dms.notification.info("<spring:message code='par.lbl.certStatInfo03' var='arguMsg' /><spring:message code='par.info.certStatRealMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "01" && certStatCd == "05"  && certReqNo == ""){
            //합격증 전송상태 삭제 입니다.
            dms.notification.info("<spring:message code='par.lbl.certStatsDelete' var='arguMsg' /><spring:message code='par.info.certStatRealMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "01" && certStatCd == "02"  && certReqNo == ""){
            //합격증 전송상태 심사 입니다.
            dms.notification.info("<spring:message code='par.lbl.certStatInfo02' var='arguMsg' /><spring:message code='par.info.certStatRealMsg' arguments='${arguMsg}'/>");
            return false;
        }else if(certStatCdDb == "01" && certStatCd == "03"  && certReqNo == ""){
            //합격증 전송상태 처리완료 입니다.
            dms.notification.info("<spring:message code='par.lbl.certStatInfo03' var='arguMsg' /><spring:message code='par.info.certStatRealMsg' arguments='${arguMsg}'/>");
            return false;
        }
        else{

        }

        var certificationVO = {
            "resultYn" : false
            ,"dlrCd" : null
            ,"certNo" : $("#certNo").val()
            ,"certStatCd" : $("#certStatCd").val()
            ,"certTp" : $("#certTp").val()
            ,"telNo" : $("#telNo").val()
            ,"hpNo" : $("#hpNo").val()
            ,"custNo" : $("#custNo").val() == "" ? "-" : $("#custNo").val()
            ,"custNm" : $("#custNm").val()
            ,"itemCd" : $("#itemCd").val()
            ,"itemNm" : $("#itemNm").val()
            ,"baseVinNo" : $("#baseVinNo").val()
            ,"newVinNo" : $("#newVinNo").val()
            ,"carBodyVinNo" : $("#carBodyVinNo").val()
            ,"detlCont" : $("#detlCont").val()
            ,"evalRsltNm" : null
            ,"evalOpnCont" : null
            ,"emailNm" : null
            ,"emailDt" : null
            ,"procRsltDetlCont" : null
            ,"trsfCmpCd" : null
            ,"ordNo" : $("#ordNo").val()
            ,"platSendNm" : null
            ,"emailNm" : null
            ,"expsCmpNm" : null
            ,"emailDt" : null
            ,"certReqNo" : $("#certReqNo").val()
        };

        var fileList = [];
        //file 1 push
        fileList.push({ dlrCd : "", certNo : certificationVO.certNo , enginCylTp : certificationVO.certTp, enginCylNo : $("#oldEnginCylNo").val(), enginCylPhotoNm : $("#oldEnginCylPhotoNm").val(), fileNo : "", fileNm : $("#fileNm01").val(), fileSeq : 1, fileSizeVal : $("#fileSizeVal01").val(), fileDataCont : $("#fileDataCont01").val(), regUsrId : null, updtUsrId : null });
        //file 2 push
        fileList.push({ dlrCd : "", certNo : certificationVO.certNo , enginCylTp : certificationVO.certTp, enginCylNo : $("#newEnginCylNo").val(), enginCylPhotoNm : $("#newEnginCylPhotoNm").val(), fileNo : "", fileNm : $("#fileNm02").val(), fileSeq : 2, fileSizeVal : $("#fileSizeVal02").val(), fileDataCont : $("#fileDataCont02").val(), regUsrId : null, updtUsrId : null });
        //file 3 push
        fileList.push({ dlrCd : "", certNo : certificationVO.certNo , enginCylTp : certificationVO.certTp, enginCylNo : null, enginCylPhotoNm : $("#otherEnginCylPhotoNm").val(), fileNo : "", fileNm : $("#fileNm03").val(), fileSeq : 3, fileSizeVal : $("#fileSizeVal03").val(), fileDataCont : $("#fileDataCont03").val(), regUsrId : null, updtUsrId : null });

        var saveVO = {
          "certificationVO" : certificationVO
          ,"certificationFileList" : fileList
          ,"ifSendYn" : ifSendYn
        };

        var url = "";

        if(certificationVO.certNo == ""){
            url = "<c:url value='/par/pmm/certification/insertCertReq.do' />";
        }else{
            url = "<c:url value='/par/pmm/certification/updateCertReq.do' />";
        }

        $.ajax({
            url:url
            ,data:JSON.stringify(saveVO)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                dms.loading.hide($("#screenSection"));
            },
            success:function(result){

                if (result.certificationVO.resultYn == true) {

                    var certNo = result.certificationVO.certNo;
                    var certReqNo = result.certificationVO.certReqNo;
                    var certStatCd = result.certificationVO.certStatCd;
                    $("#certNo").val(certNo);
                    $("#certReqNo").val(certReqNo);
                    $("#evalRsltNm").data("kendoExtDropDownList").value(certStatCd);//합격증 상태
                    $("#certStatCdDb").val(result.certStatCd);//합격증 상태(DB저장)

                    dms.notification.success("<spring:message code='global.info.success'/>");

                }

            }
            ,beforeSend:function(){
                dms.loading.show($("#screenSection"));
            }
            ,complete:function(){
                dms.loading.hide($("#screenSection"));
            }
        }).done(function(result) {

        });
    }

    $(document).ready(function() {
        //baseVinNo
        $("#baseVinNo").keypress(function(e){
            if(e.keyCode === 13){
                e.preventDefault();
                custPopupWindow();
            }
        });
        //telNo
        $("#telNo").kendoMaskedTextBox({
            enable:false
            ,mask:"000-0000-0000"
            ,promptChar:" "
        });
        $("#telNo").data("kendoMaskedTextBox").readonly();
        //hpNo
        $("#hpNo").kendoMaskedTextBox({
            enable:false
            ,mask:"000-0000-0000"
            ,promptChar:" "
        });
        $("#hpNo").data("kendoMaskedTextBox").readonly();
        //ordNo
        //修改为10位长度 update by lyy 2018-09-04 start
        /*$("#ordNo").kendoMaskedTextBox({
            mask: "CCCCCCCCCCCCCCCCCC" //max length : 18
            ,promptChar:" "
        });*/
      	//修改为10位长度 update by lyy 2018-09-04 end
        $("#telNo").data("kendoMaskedTextBox").readonly();
        //regDt
        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //certTp
        $("#certTp").kendoExtDropDownList({
            dataSource:certTpList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });
        //certTp change event
        $("#certTp").on("change", btnView);
        //certStatCd
        $("#certStatCd").kendoExtDropDownList({
            dataSource:certStatList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });
        //evalRsltNm
        $("#evalRsltNm").kendoExtDropDownList({
            dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:certStatList
            ,optionLabel:" "
        });
        $("#evalRsltNm").data("kendoExtDropDownList").enable(false);
        //search
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchVinNo").on('click', custPopupWindow);

        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                pCertNo = ''; //CERT_NO init.
                initPage();
            }
        });
        //btnInterface
        $("#btnInterface").kendoButton({
            click:function(e) {
                //window.open("http://svrdev.bmpcn.com", "_blank");
                window.open("http://svr.bmpcn.com", "_blank");
            }
        });
        //저장
        $("#btnSave").kendoButton({
            click:function(e){
                //합격증 저장. 합격증상태 : 등록
                saveCerification("N");
            }
        });
        //전송
        $("#btnSend").kendoButton({
            click:function(e){
                //합격증 전송.
                saveCerification("Y");
            }
        });

        initPage();

    });

    // 초기화
    function initPage(){
        //dealer info setting.
        $("#dlrCd").val(sessionDlrCd);
        $("#dlrNm").val(sessionDlrNm);
        $("#custNm").val(currentLoginNm);
        console.log(currentLoginNm);

        //send cerification list
        if(!dms.string.isEmpty(pCertNo)){

            $.ajax({
                url:"<c:url value='/par/pmm/certification/selectCertReqByKey.do' />"
                ,data:JSON.stringify({ sCertNo:pCertNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {

                    if(!dms.string.isEmpty(result)){
                       //수정해야 할 부분
                       $("#telNo").data("kendoMaskedTextBox").value(result.telNo);
                       $("#hpNo").data("kendoMaskedTextBox").value(result.hpNo);
                       $("#certTp").data("kendoExtDropDownList").value(result.certTp);
                       $("#certStatCd").data("kendoExtDropDownList").value(result.certStatCd);//합격증 상태
                       $("#certStatCdDb").val(result.certStatCd);
                       $("#custNo").val(result.custNo);
                       $("#custNm").val(result.custNm);
                       $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
                       $("#certNo").val(result.certNo);
                       $("#certReqNo").val(result.certReqNo);
                       $("#itemCd").val(result.itemCd);
                       $("#itemNm").val(result.itemNm);
                       $("#ordNo").val(result.ordNo);
                       $("#baseVinNo").val(result.baseVinNo);
                       $("#newVinNo").val(result.newVinNo);
                       $("#carBodyVinNo").val(result.carBodyVinNo);
                       $("#detlCont").val(result.detlCont);
                       $("#evalRsltNm").data("kendoExtDropDownList").value(result.certStatCd);//합격증 상태 심사결과상태는 같은 값 처리.
                       $("#evalOpnCont").val(result.evalOpnCont);
                       $("#emailNm").val(result.emailNm);
                       $("#trsfCmpCd").val(result.trsfCmpCd);
                       $("#procRsltDetlCont").val(result.procRsltDetlCont);
                       $("#evalRsltNm").val(result.evalRsltNm);
                       $("#evalOpnCont").val(result.evalOpnCont);
                       $("#trsfCmpCd").val(result.expsCmpNm);
                       $("#emailDt").val(result.emailDt);
                       $("#procRsltDetlCont").val(result.procRsltDetlCont);

                   } else {

                       if(result === 0){
                           dms.notification.error("<spring:message code='global.lbl.ordNo' var='certNo' /><spring:message code='global.err.modifyFailedParam' arguments='${certNo}'/>");
                       }
                   }
               }
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
           });

            $.ajax({
                url:"<c:url value='/par/pmm/certification/selectCertificationFileByKey.do' />"
                ,data:JSON.stringify({sCertNo:pCertNo, sFileSeq : 1})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,error:function(jqXHR,status,error){
                    // itemCd not use check message
                }
                ,success:function(jqXHR, textStatus){

                    $("#fileDataCont01").val(jqXHR.fileDataCont);
                    $("#fileNm01").val(jqXHR.fileNm);
                    $("#fileSizeVal01").val(jqXHR.fileSizeVal);
                    $("#oldEnginCylPhotoNm").val(jqXHR.enginCylPhotoNm);
                    $("#oldEnginCylNo").val(jqXHR.enginCylNo);

                    imageLoader01("1");
                }
            });

            $.ajax({
                url:"<c:url value='/par/pmm/certification/selectCertificationFileByKey.do' />"
                ,data:JSON.stringify({sCertNo:pCertNo, sFileSeq : 2})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,error:function(jqXHR,status,error){
                    // itemCd not use check message
                }
                ,success:function(jqXHR, textStatus){

                    $("#fileDataCont02").val(jqXHR.fileDataCont);
                    $("#fileNm02").val(jqXHR.fileNm);
                    $("#fileSizeVal02").val(jqXHR.fileSizeVal);
                    $("#newEnginCylPhotoNm").val(jqXHR.enginCylPhotoNm);
                    $("#newEnginCylNo").val(jqXHR.enginCylNo);
                    imageLoader01("2");
                }
            });

            $.ajax({
                url:"<c:url value='/par/pmm/certification/selectCertificationFileByKey.do' />"
                ,data:JSON.stringify({sCertNo:pCertNo, sFileSeq : 3})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,error:function(jqXHR,status,error){
                    // itemCd not use check message
                }
                ,success:function(jqXHR, textStatus){

                    $("#fileDataCont03").val(jqXHR.fileDataCont);
                    $("#fileNm03").val(jqXHR.fileNm);
                    $("#fileSizeVal03").val(jqXHR.fileSizeVal);
                    $("#otherEnginCylPhotoNm").val(jqXHR.enginCylPhotoNm);
                    imageLoader01("3");
                }
            });

        }else{

            $("#certTp").data("kendoExtDropDownList").value("01");
            $("#certStatCd").data("kendoExtDropDownList").value("01");
            $("#certStatCdDb").val("01");
            $("#telNo").val("");
            $("#hpNo").val("");
            $("#custNo").val("");
           // $("#custNm").val("");
            $("#regDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#certNo").val("");
            $("#certReqNo").val("");
            $("#ordNo").val("");
            $("#itemCd").val("");
            $("#itemNm").val("");
            $("#baseVinNo").val("");
            $("#newVinNo").val("");
            $("#carBodyVinNo").val("");
            $("#detlCont").val("");
            $("#evalRsltNm").data("kendoExtDropDownList").value("");
            $("#evalOpnCont").val("");
            $("#emailNm").val("");
            $("#trsfCmpCd").val("");
            $("#emailDt").val("");
            $("#procRsltDetlCont").val("");

            $("#oldEnginCylPhotoNm").val("");
            $("#oldEnginCylNo").val("");
            $("#newEnginCylPhotoNm").val("");
            $("#newEnginCylNo").val("");
            $("#otherEnginCylPhotoNm").val("");

            //file01 info init
            $("#fileNo01").val("");
            $("#fileNm01").val("");
            $("#fileSizeVal01").val("");
            $("#fileDataCont01").val("");
            $("#fileMaxSizeYn01").val("");
            $("#fileTypeMatchYn01").val("");
            $("#fileNm01").val("");
            $("#fileSizeVal01").val("");
            $("#files01").val("");
            $("#fileView01").attr("src","");

            //file02 info init
            $("#fileNo02").val("");
            $("#fileNm02").val("");
            $("#fileSizeVal02").val("");
            $("#fileDataCont02").val("");
            $("#fileMaxSizeYn02").val("");
            $("#fileTypeMatchYn02").val("");
            $("#fileNm02").val("");
            $("#fileSizeVal02").val("");
            $("#files02").val("");
            $("#fileView02").attr("src","");

            //file03 info init
            $("#fileNo03").val("");
            $("#fileNm03").val("");
            $("#fileSizeVal03").val("");
            $("#fileDataCont03").val("");
            $("#fileMaxSizeYn03").val("");
            $("#fileTypeMatchYn03").val("");
            $("#fileNm03").val("");
            $("#fileSizeVal03").val("");
            $("#files03").val("");
            $("#fileView03").attr("src","");
        }

        btnView(); // 버튼 구성

    }

    //imageLoader Func
    function imageLoader(){
        var fileView = document.querySelector("img");
        var bolbBytes = $("#fileDataCont").val();
        var fileData = window.atob(bolbBytes);
        fileView.src = fileData;

        fileView.onload = function() {
            if(this.width > 300){
                fileView.width = 300;
            }else{
                fileView.width = this.width;
            }
        };
    }

    //버튼 구성
    function btnView(){

        var pStat = $("#certTp").data("kendoExtDropDownList").value();

        //합격증 조회에서 넘어온경우 버튼 구성
        if(!dms.string.isEmpty(pCertNo)){
            $("#hpNo").data("kendoMaskedTextBox").enable(false);
            $("#telNo").data("kendoMaskedTextBox").enable(false);

            $("#regDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#searchCustNo").addClass("form_disabled form_readonly");
            $("#searchCustNo").attr("readonly", true);

            $("#newVinNo").addClass("form_disabled form_readonly");
            $("#newVinNo").attr("readonly", true);
            $("#carBodyVinNo").addClass("form_disabled form_readonly");
            $("#carBodyVinNo").attr("readonly", true);

            pCertNo = ''; //초기화

        }else{

            $("#hpNo").data("kendoMaskedTextBox").enable(true);
            $("#telNo").data("kendoMaskedTextBox").enable(true);
            $("#regDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#searchCustNo").removeClass("form_disabled form_readonly");
            $("#searchCustNo").attr("readonly", false);

            //유형
            if(pStat === '01'){ //엔진인 경우
                $("#newVinNo").addClass("form_disabled form_readonly");
                $("#newVinNo").attr("readonly", true);
                $("#carBodyVinNo").addClass("form_disabled form_readonly");
                $("#carBodyVinNo").attr("readonly", true);

                $("#oldEnginCylNo").removeClass("form_disabled form_readonly");
                $("#oldEnginCylNo").attr("readonly", false);
                $("#newEnginCylNo").removeClass("form_disabled form_readonly");
                $("#newEnginCylNo").attr("readonly", false);
                $("#newEnginCylPhotoNm").removeClass("form_disabled form_readonly");
                $("#newEnginCylPhotoNm").attr("readonly", true);
                $("#oldEnginCylPhotoNm").removeClass("form_disabled form_readonly");
                $("#oldEnginCylPhotoNm").attr("readonly", true);
                $("#otherEnginCylPhotoNm").removeClass("form_disabled form_readonly");
                $("#otherEnginCylPhotoNm").attr("readonly", true);

                $("#carBodyVinNo").val("");
                $("#newVinNo").val("");

            }else if(pStat === '02'){//바디인 경우
                $("#newVinNo").removeClass("form_disabled form_readonly");
                $("#newVinNo").attr("readonly", false);
                $("#carBodyVinNo").removeClass("form_disabled form_readonly");
                $("#carBodyVinNo").attr("readonly", false);

                $("#oldEnginCylNo").addClass("form_disabled form_readonly");
                $("#oldEnginCylNo").attr("readonly", true);
                $("#newEnginCylNo").addClass("form_disabled form_readonly");
                $("#newEnginCylNo").attr("readonly", true);
                $("#newEnginCylPhotoNm").addClass("form_disabled form_readonly");
                $("#newEnginCylPhotoNm").attr("readonly", true);
                $("#oldEnginCylPhotoNm").addClass("form_disabled form_readonly");
                $("#oldEnginCylPhotoNm").attr("readonly", true);

                $("#otherEnginCylPhotoNm").addClass("form_disabled form_readonly");
                $("#otherEnginCylPhotoNm").attr("readonly", true);

                $("#oldEnginCylPhotoNm").val("");
                $("#oldEnginCylNo").val("");
                $("#newEnginCylPhotoNm").val("");
                $("#newEnginCylNo").val("");
            }
        }

    }


    // 신청자 팝업
    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
           windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#telNo").data("kendoMaskedTextBox").value(data[0].telNo);
                            $("#hpNo").data("kendoMaskedTextBox").value(data[0].hpNo);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }


    //부품 팝업
    function selectPartsMasterPopupWindow(){

    	searchPurcOrdPopupWindow = dms.window.popup({
            windowId:"PurcOrdPopupWindow"
            ,title:"<spring:message code='par.title.partSearch' />" //부품조회
            ,width:800
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchPurcOrdPopup.do' />"
                ,data:{
                    "type":""
                    ,"autoBind":true
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        $("#itemCd").val(data[0].itemCd);
                        $("#itemNm").val(data[0].itemNm);
                        $("#ordNo").val(data[0].bmpOrdNo);

                        searchPurcOrdPopupWindow.close();
                    }
                }
            }
        });
    };


    //VIN NO 팝업
    function custPopupWindow(){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            ,title:"<spring:message code='ser.title.custSearch' />"//고객조회
            ,content:{
                url :"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"type":null
                    ,"callbackFunc":function(data){
                        $("#baseVinNo").val(data[0].vinNo);
                        $("#hpNo").val(data[0].carOwnerHpNo);
                        $("#telNo").val(data[0].carOwnerTelNo);
                        $("#custNo").val(data[0].carOwnerId);
                       // $("#custNm").val(data[0].carOwnerNm);
                    }
                }
            }
        });
    };

    </script>
    <!-- //script -->