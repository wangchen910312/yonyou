<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 메시지 전송 팝업 -->
    <section id="window" class="pop_wrap">
    <div id="smsTrsfFrom" >
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnSmsTargetDelete" class="btn_m"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                <button type="button" id="btnSmsTransmission" class="btn_m"><spring:message code="global.btn.transmission" /><!-- 발송 --></button>
            </div>
        </div>
        <div class="sms_send">
            <div class="sms_left">
                <textarea rows="" cols="" class="form_textarea" id="smsTmplMsg" name="smsTmplMsg" data-json-obj="true" required data-name="<spring:message code="global.lbl.message" />" onFocus="clearMessage();"  onKeyUp="txtLimit(this.value);" ><spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' /></textarea>
                <div class="txt_bottom">
					<div class="t_left"><span id="messageMaxByte"></span></div>
                    <div class="t_right"><strong id="messageLength" >0</strong>/<span id="messageMaxLength"></span><spring:message code="crm.lbl.mgsTextLimitInfo" /><!-- 글자 --></div>
                </div>
            </div>
            <div class="sms_right">
                <div class="table_grid">
                    <div id="smsTargetGrid"></div>
                </div>
                <div class="send_option">
                    <label class="label_check"><input type="radio" name="smsTp" value="N" checked class="form_check" data-json-obj="true" > <spring:message code="crm.lbl.nowSend" /><!-- 즉시전송 --></label>
                    <label class="label_check"><input type="radio" name="smsTp" value="R" class="form_check" data-json-obj="true" > <spring:message code="crm.lbl.resvSend" /><!-- 예약전송 --></label><input id="resvDt" name="resvDt" class="form_datetimepicker" data-json-obj="true" style="width:150px;" />
                </div>
            </div>
        </div>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.tmplList" /><!-- 템플릿 목록 --></h2>
            <div class="form_txt mt5">
                <span class="span_txt"><spring:message code="crm.lbl.tmplGrpList" /><!-- 템플릿 그룹 --></span>
                <input id="smsTmplGrpId" name="smsTmplGrpId" class="form_comboBox" style="width:150px;">
            </div>
        </div>
        <div class="sms_templete" id="mesgTmplList">
        </div>

        <div class="txt_bottom">
            <div class="t_left"><button type="button" id="smsContextInfo" class="btn_xs">?</button></div>
        </div>

        <!-- TODO sms velocity context ui 수정 -->
        <script id="smsContextTooltip" type="text/x-kendo-template">
            <div id="smsContextGrid"></div>
        </script>

        <script>

            // SMS템플릿그룹
            var smsContextListDs = [];
                smsContextListDs.push(
                        {text:"<spring:message code='global.lbl.hpNo' />", value:"$hpNo"}
                        ,{text:"<spring:message code='global.lbl.custNm' />", value:"$custNm"}
                );

            // scheduler resources tooltip
            var tooltip = $("#smsContextInfo").kendoTooltip({
                position:"top",
                width:300,
                height:50,
                content:kendo.template($('#smsContextTooltip').html())
            }).data("kendoTooltip");

            tooltip.bind("show", function() {

                // SMS 컨텍스트 그리드
                $("#smsContextGrid").kendoExtGrid({
                    gridId:"G-CRM-0819-140500"
                    ,dataSource:smsContextListDs
                    //,autoBind:false
                    ,editable:false
                    ,height:141
                    ,navigatable:false
                    ,pageable:false
                    ,selectable:false
                    ,sortable:false
                    ,filterable:false
                    ,reorderable:false
                    ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
                    ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
                    ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                    ,appendEmptyColumn:false           //빈컬럼 적용. default:false
                    ,enableTooltip:false               //Tooltip 적용, default:false
                    ,columns:[
                        {field:"value", title:"<spring:message code='crm.lbl.template' />", width:100}        //템플릿
                       ,{field:"text", title:"<spring:message code='global.lbl.explanation' />", width:100}        //설명
                    ]
                });
                // SMS 대상자 그리드 종료

            });
        </script>

        <input type="hidden" id="smsTmplUserSeq" name="smsTmplUserSeq" data-json-obj="true" /><!-- 임시테이블 SEQ -->
        <input type="hidden" id="mesgTmplNo" name="mesgTmplNo" data-json-obj="true" /><!-- 메시지 템플릿 번호 -->

        <input type="hidden" id="contactBizCd" name="contactBizCd" data-json-obj="true" />
        <input type="hidden" id="refTableNm" name="refTableNm" data-json-obj="true" />
        <input type="hidden" id="refKeyNm" name="refKeyNm" data-json-obj="true" />
        <input type="hidden" id="custNoRequired" name="custNoRequired" data-json-obj="true" value="Y"/>
    </div>
    </section>
    <!-- //메시지 전송 팝업 -->

    <script type="text/javascript">

        var popupWindow;
        var clearChk = true;        // 초기 메시지 클릭어 하기 위한 변수
        var limitByte = 350;        //글자수  최대크기, limitByte 를 초과할 수 없슴
        $("#messageMaxLength").text(limitByte);
        $("#messageMaxByte").text("<spring:message code='crm.lbl.smsCnt' arguments='0' />");        // SMS {0}건

        // textarea에 마우스가 클릭되었을때 초기 메시지를 클리어
        function clearMessage() {

            if ( clearChk ) {
                $("#smsTmplMsg").val("");
                clearChk = false;
            };

        };

        // textarea byte 및 글자수 체크
        var txtLimit = function(obj) {

            var currLen = 0;
            var getSize = 0;
            var getChar = 0;
            var charCode, chr = null;

            for( var i = 0 ; i < obj.length ; i++ ) {

                chr = obj.charAt(i);
                charCode = chr.charCodeAt(0);

                // byte 및 글자수 체크.
                if (charCode <= 0x00007F) {
                    getSize += 1;
                } else if (charCode <= 0x0007FF) {
                    getSize += 1;
                } else if (charCode <= 0x00FFFF) {
                    getSize += 1;
                } else {
                    getSize += 1;
                };

                if(getSize > limitByte ){

                    var rtnVal = "";

                    for( var j = 0 ; j < currLen ; j++ ) {
                        rtnVal += obj.charAt(j);
                    }

                    //obj = rtnVal;
                    $("#smsTmplMsg").val(rtnVal);
                    // 텍스트를 {limitByte} 글자 이상 작성할 수 없습니다.
                    dms.notification.warning("<spring:message code='crm.info.mgsLimitInfo' arguments='"+limitByte+"' />");
                    return false;

                };

                currLen++;
            };

            if ( getSize === 0 ) {
                getChar = 0;
            } else if ( getSize <= 70 ){
                getChar = 1;
            } else {
                getChar = Math.ceil(getSize/67);
            };

            $('#messageMaxByte').html("<spring:message code='crm.lbl.smsCnt' arguments='"+getChar+"' />");    // text byte 확인, 최초 70자 : SMS 1개, 70자 이상이면 67자마다 n개
            $('#messageLength').html(getSize);         // text 글자수 확인

        };

        // 템플릿 목록 선택 이벤트
        function selectTmpl(mesgTmplNo){

            // TODO jsp에서 글자 체크... 입력하는거는 max length 를 체크 할수 있는데... velocity로 받는거는 name / hpNo 등 context 길이가 가변적이기 때문에 validation .어케하나요?
            var mesgTmplNo = mesgTmplNo;
            $("div[name=templeteBox]").removeClass("selected");     // 선택박스 테두리
            $("#templeteBox_"+mesgTmplNo).addClass("selected");     // 입력박스 테두리

            var smsTmplMsg = $("#mesgTmplNo_"+mesgTmplNo).val();    // 텍스트 set

            $("#smsTmplMsg").val(smsTmplMsg);                       // 템플릿 내용
            $("#mesgTmplNo").val(mesgTmplNo);                       // 템플릿 번호
            txtLimit(smsTmplMsg);
            $("#smsTmplMsg").attr("readonly", true).addClass('form_readonly');

            clearChk = false;

        };


        // velocity에 선언되어있는 메시지인지 확인
        function velocityTxtChk() {

            var smsTmplMsg = $("#smsTmplMsg").val()
              , firstIdx = smsTmplMsg.indexOf("$")
              , contextParamCheck = false
              , smsTmplMsgTxt
              , contextTxtArray
              , contextTxt
            ;

            if ( firstIdx > -1 ) {

                smsTmplMsgTxt = smsTmplMsg.slice(firstIdx);
                contextTxtArray = smsTmplMsgTxt.split("$")

                for(var i=1; i < contextTxtArray.length; i++){

                    contextTxt = contextTxtArray[i];
                    contextTxt = contextTxt.replace("{","");
                    contextTxt = contextTxt.replace("}","");
                    contextTxt = contextTxt.replace("\n","");

                    contextParamCheck = contextValidation(contextTxt);

                    if ( !contextParamCheck ) {
                        return false;
                    } else {
                        contextParamCheck = true;
                    }

                };

            } else {
                contextParamCheck = true;
            };

            return contextParamCheck;

        };

        function contextValidation (paramTxt) {

            var smsContextList = smsContextListDs
              , smsContextLength = smsContextListDs.length
              , contextText
              , contextCheck = false
              , subStrTxt
            ;

            if ( smsContextLength > 0 ) {

                for(var j=0; j < smsContextLength; j++){

                    contextText = smsContextList[j].value.replace("$","");
                    subStrTxt = paramTxt.slice(0,contextText.length);

                    if ( contextText === subStrTxt ){
                        return true;
                    } else {
                        contextCheck = false
                    };

                };

            };

            return contextCheck;

        };

        // 즉시전송 / 예약전송 라디오버튼 클릭
        $("input[name=smsTp]").change(function(e){

            var resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker");
            if ( $(this).val() === 'N' ) {
                resvDt.enable(false);
            } else if ( $(this).val() === 'R' ) {
                resvDt.enable(true);
            }

        });

        // SMS템플릿그룹
        var smsTmplGrpDs = [];
        <c:forEach var="obj" items="${smsTemplateGroupList}">
            smsTmplGrpDs.push({text:"${obj.mesgTmplGrpNm}", value:"${obj.mesgTmplGrpId}"});
        </c:forEach>

        $(document).ready(function() {

            // 예약일시
            $("#resvDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,value:"${sysDate}"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
            });
            $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);

            // 템플릿 - SMS
            $("#smsTmplGrpId").kendoExtDropDownList({
                dataSource:smsTmplGrpDs
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                , index:0
                , change:function(e){

                    // 전송 템플릿 초기화
                    $("#smsTmplMsg").val("");
                    $("#mesgTmplNo").val("");
                    $("#smsTmplMsg").attr("readonly", false).removeClass('form_readonly');
                    $("div[name=templeteBox]").removeClass("selected");
                    $("#messageLength").html("0");
                    $("#messageMaxByte").text("<spring:message code='crm.lbl.smsCnt' arguments='0' />");
                    //$("#btnSmsTransmission").data("kendoButton").enable(false);

                    // 선택된 템플릿 메시지를 내용에 입력한다.
                    var dataItem = this.dataItem(e.item);
                    var value = dataItem.value;

                    if ( dms.string.isNotEmpty(value) ) {

                        var param = {
                                "sMesgTmplGrpId":dataItem.value
                        }

                        //console.log("템플릿 param:",JSON.stringify(param))

                        $.ajax({
                            url:"<c:url value='/crm/cmm/customerInfo/selectSmsTemplateList.do' />",
                            data:JSON.stringify(param),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            async:false,
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(result, textStatus) {

                                // 조회된 템플릿 목록
                                var mesgTmpl = result.data;
                                var tmplHtml;

                                $("#mesgTmplList").empty();

                                if ( mesgTmpl.length > 0 ) {

                                    tmplHtml  = "";

                                    $.each(mesgTmpl, function(idx, obj){
                                        tmplHtml += '<div class="templete_box" onclick="selectTmpl('+obj.mesgTmplNo+');" name="templeteBox" id="templeteBox_'+obj.mesgTmplNo+'" >';
                                        tmplHtml += '  <textarea rows="" cols="" readonly class="form_textarea" id="mesgTmplNo_'+obj.mesgTmplNo+'" name="mesgTmplNo_'+obj.mesgTmplNo+'" >'+obj.mesgTmplCont+'</textarea>';
                                        tmplHtml += '  <p class="templete_title">'+obj.mesgTmplNm+'</p>';
                                        tmplHtml += '</div>';
                                    });

                                    $("#mesgTmplList").append(tmplHtml);

                                } else {

                                    // {메세지템플릿}이(가) 없습니다.
                                    tmplHtml  = "";
                                    tmplHtml += "<div><spring:message code='global.lbl.mesgTmpl' var='arguMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${arguMsg}' /></div>";

                                  //tmplHtml += '<div>템플릿 목록이 없습니다.</div>';

                                    $("#mesgTmplList").append(tmplHtml);

                                }

                            }
                        });

                    }

                }
            });

            // 삭제
            $("#btnSmsTargetDelete").kendoButton({
                click:function(e){

                    var grid = $("#smsTargetGrid").data("kendoExtGrid")
                    ,rows
                    ,saveData
                    ,smsTmplUserSeq = $("#smsTmplUserSeq").val();
                    ;

                    if ( grid.dataSource.view().length < 0 ) {
                        // {대상자 리스트}을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.info.targetList' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}' />");
                        return;
                    } else {

                        rows = grid.select();

                        if ( rows.length < 1 ) {
                            //목록을 선택하여 주십시오.
                            dms.notification.info("<spring:message code='global.info.required.select'/>");
                            return;
                        } else {

                            rows.each(function(index, row) {
                                grid.removeRow(row);
                            });

                            if ( dms.string.isNotEmpty(smsTmplUserSeq) ) {      //SMS 대상자가 DB에 저장되어있으면 DB에서 삭제. 아니면 화면에서만 삭제.

                                saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat", "smsSendDtFormat", "callCenSendDtFormat", "callCenRsltDtFormat"]);

                                if (grid.cudDataLength == 0) {
                                    //변경된 정보가 없습니다.
                                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                                    return;
                                } else {

                                    if (grid.gridValidation()) {

                                        //console.log("saveData : ",JSON.stringify(saveData.deleteList));
                                        //return;
                                        $.ajax({
                                            url:"<c:url value='/crm/cmm/customerInfo/deleteSmsTmplUsers.do' />"
                                            ,data:JSON.stringify(saveData.deleteList)
                                            ,type:'POST'
                                            ,dataType:'json'
                                            ,contentType:'application/json'
                                            ,error:function(jqXHR,status,error) {

                                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                            }
                                            ,success:function(jqXHR, textStatus) {

                                                if ( jqXHR < 1 ){
                                                    //변경된 정보가 없습니다.
                                                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                                                    return;
                                                } else {
                                                    //정상적으로 반영 되었습니다.
                                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                                    $("#smsTargetGrid").data("kendoExtGrid").dataSource.page(1);
                                                };
                                            }
                                            ,beforeSend:function(xhr) {
                                                dms.loading.show();
                                            }
                                            ,complete:function(xhr, status) {
                                                dms.loading.hide();
                                            }
                                        });

                                    };

                                };

                            };

                        }

                    };
                }
            });

            // SMS 전송
            $("#btnSmsTransmission").kendoButton({
                click:function(e){

                    var grid = $("#smsTargetGrid").data("kendoExtGrid");

                    if ( grid.dataSource.view().length <= 0 ) {
                        // {대상자수}을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.stsfCustCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}' />");
                        return;
                    };

                    if( clearChk || dms.string.isEmpty($("#smsTmplMsg").val()) ){
                        // {메세지}을(를) 입력해주세요.
                        dms.notification.warning("<spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                        return;
                    };

                    var saveData = $("#smsTrsfFrom").serializeObject(
                            $("#smsTrsfFrom").serializeArrayInSelector("[data-json-obj='true']")
                    );

                    if ( $(":radio[name=smsTp]:checked").val() === "R" ) {

                        if ( dms.string.isEmpty($("#resvDt").data("kendoExtMaskedDateTimePicker").value()) ) {

                            // {예약시간 }을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.resvDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}' />");
                            return;

                        } else {
                            saveData.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
                        };

                    };

                    var velocityChk = velocityTxtChk();
                    var smsConfirmMsg;

                    if (velocityChk ) {
                        // 발송확인하시겠습니까?
                        smsConfirmMsg = "<spring:message code='crm.info.smsConfirm' />";

                    } else {

                        var smsSendMgs = $("#smsTmplMsg").val();
                        smsSendMgs = smsSendMgs.replace("$custNm","张三");
                        smsSendMgs = smsSendMgs.replace("$hpNo","010-00000000");

                        smsConfirmMsg = "<spring:message code='crm.lbl.smsConfirmMsg1' /><br /><br />"; //템플릿으로 변환되지 않는 문자가 있습니다.
                        smsConfirmMsg += "<spring:message code='crm.lbl.smsConfirmMsg2' /> " + smsSendMgs + " <spring:message code='crm.lbl.smsConfirmMsg3' />"; //으로 {0} 보내시겠습니까?

                    };

                    // 메시지 발송 confirm
                    dms.window.confirm({
                        message:smsConfirmMsg
                        ,callback:function(result){
                            if(result){

                                // 그리드 데이터를 array로 받은경우
                                if ( smsTmplUserList.length > 0 ) {
                                    saveData.insertSms = grid.dataSource.view();
                                };

                                //console.log("saveData:" + JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cmm/customerInfo/sendSmsMessage.do' />",      // SmsTmplUserController.java
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        if ( jqXHR && textStatus === "success" ) {
                                            options.callbackFunc(textStatus);
                                        } else {
                                            options.callbackFunc("FAIL");
                                        }

                                    }
                                    ,beforeSend:function(xhr) {
                                        dms.loading.show();
                                    }
                                    ,complete:function(xhr, status) {
                                        dms.loading.hide();
                                    }
                                });

                            }else{
                                //취소버튼 클릭 로직
                                return;
                            }
                        }
                    });
                    // 메시지 발송 confirm

                }
                //, enable:false
            });

            // SMS 대상자 그리드
            $("#smsTargetGrid").kendoExtGrid({
                gridId:"G-CRM-0819-140501"
                ,dataSource:{
                     transport:{
                        read:{
                            url:"<c:url value='/crm/cmm/customerInfo/selectSmsTmplUsers.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"] = options.pageSize;
                                params["pageIndex"] = options.page;
                                params["firstIndex"] = options.skip;
                                params["lastIndex"] = options.skip + options.take;
                                params["sort"] = options.sort;

                                params["sSeq"] = $("#smsTmplUserSeq").val();

                                //console.log("smsTargetGrid param:"+kendo.stringify(params));

                                return kendo.stringify(params);

                            } else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"number"}
                                ,seq:{type:"number"}
                                ,custNo:{type:"string"}
                                ,custNm:{type:"string"}
                                ,hpNo:{type:"string"}
                                ,custCareCont:{type:"string"}
                                ,regUsrId:{type:"string"}
                                ,regDt:{type:"date"}

                            }
                        }
                    }
                }
                ,autoBind:false
                ,editable:false
                ,height:141
                ,navigatable:false
                ,pageable:false
                ,sortable:false
                //,filterable:false
                ,multiSelectWithCheckbox:true
                ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, hidden:true
                        ,attributes:{"class":"ac"}
                    }
                    ,{field:"seq", hidden:true}
                    ,{field:"custNo", hidden:true}
                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}        //고객명
                    ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100}            //휴대전화
                ]
            });
            // SMS 대상자 그리드 종료

        /************************************************************************************************
        *************************************************************************************************
        ****************************************팝업 form 데이터 set 시작************************************
        *************************************************************************************************
        ************************************************************************************************/
            var options = parent.messagePopupWindow.options.content.data
                ,smsTargetGrid = $("#smsTargetGrid").data("kendoExtGrid")
                ,smsTmplUserSeq = options.smsTmplUserSeq
                ,smsTmplUserList = options.smsTmplUserList
            ;

            //console.log("#options:",options);

            // SMS 전송 대상자 그리드 데이터 조회 ( smsTmplUserSeq 번호로 조회 또는 smsTmplUserList 로 set )
            if ( dms.string.isNotEmpty(smsTmplUserSeq) ) {

                $("#smsTmplUserSeq").val(smsTmplUserSeq);
                smsTargetGrid.dataSource.page(1);

            } else if ( smsTmplUserList.length > 0 ) {

                $.each(smsTmplUserList, function(idx, obj){

                    smsTargetGrid.dataSource.insert(0,{
                         custNm    :obj.custNm
                        ,custNo    :obj.custNo
                        ,hpNo      :obj.hpNo
                        ,refKeyNm  :obj.refKeyNm
                    });

                });

            }

            $("#contactBizCd").val(options.contactBizCd);       //업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
            $("#refTableNm").val(options.refTableNm);
            $("#refKeyNm").val(options.refKeyNm);

            if ( dms.string.isNotEmpty(options.custNoRequired) ) {
                $("#custNoRequired").val(options.custNoRequired);
            }

        /************************************************************************************************
         *************************************************************************************************
         ****************************************팝업 form 데이터 set 종료************************************
         *************************************************************************************************
         ************************************************************************************************/


        });

    </script>
