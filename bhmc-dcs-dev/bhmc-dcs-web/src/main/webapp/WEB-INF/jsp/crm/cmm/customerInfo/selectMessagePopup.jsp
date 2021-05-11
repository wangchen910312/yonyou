<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 메시지 전송 팝업 -->
    <section id="window" class="pop_wrap">
    <div id="smsTrsfFrom" >
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnSmsTransmission" class="btn_m"><spring:message code="global.btn.transmission" /><!-- 전송 --></button>
            </div>
        </div>
        <div class="sms_send">
            <div class="sms_left">
                <textarea rows="" cols="" class="form_textarea" id="smsTmplMsg" name="smsTmplMsg" data-json-obj="true" required data-name="<spring:message code="global.lbl.message" />" data-bind="value:smsTmplMsg" onFocus="clearMessage();"  onKeyUp="txtLimit(this);" ><spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' /></textarea>
                <input type="hidden" name="tmpSmsTmplMsg" id="tmpSmsTmplMsg" value="Y"/>
                <p class="txt_byte"><strong id="messageByte" >0</strong>/<span id="messageMaxByte"></span><spring:message code="crm.lbl.mgsTextLimitInfo" /><!-- 글자 --></p>


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

        <input type="hidden" id="smsTmplUserSeq" name="smsTmplUserSeq" data-json-obj="true" />
        <input type="hidden" id="mesgTmplNo" name="mesgTmplNo" />

        <input type="hidden" id="contactBizCd" name="contactBizCd" data-json-obj="true" />
        <input type="hidden" id="refTableNm" name="refTableNm" data-json-obj="true" />
        <input type="hidden" id="refKeyNm" name="refKeyNm" data-json-obj="true" />
    </div>
    </section>
    <!-- //메시지 전송 팝업 -->

    <script type="text/javascript">

        var clearChk = true;
        var limitByte = 100;                    //바이트의 최대크기, limitByte 를 초과할 수 없슴
        $("#messageMaxByte").text(limitByte);

        // textarea에 마우스가 클릭되었을때 초기 메시지를 클리어
        function clearMessage() {

            if ( clearChk ) {

                $("#smsTmplMsg").val("");
                $("#tmpSmsTmplMsg").val("N");

                clearChk = false;

            }

        }

        // textarea byte 체크
        var txtLimit = function(obj) {

            if(obj.value == null || obj.value.length == 0) return 0;

            var currLen = 0;
            var size = 0;
            var charCode, chr = null;
            for( var i = 0 ; i < obj.value.length ; i++ ) {

                chr = obj.value.charAt(i);
                charCode = chr.charCodeAt(0);

                if (charCode <= 0x00007F) size += 1; else       // 1
                if (charCode <= 0x0007FF) size += 1; else       // 2
                if (charCode <= 0x00FFFF) size += 1;            // 3
                else size += 1;                                 // 4
                // 바이트가 아닌 글자수 체크. 무조건 1byte 로 해서 100

                //console.log("charCode:",charCode+" | size:",size)
                if(size >= limitByte ){

                    var rtnVal = "";

                    for( var j = 0 ; j < currLen ; j++ ) {
                        rtnVal += obj.value.charAt(j);
                    }

                    obj.value = rtnVal;
                    // 텍스트를 {1000} 바이트 이상 작성할 수 없습니다.
                    dms.notification.warning("<spring:message code='crm.info.mgsLimitSize' var='arguMsg' /><spring:message code='crm.info.mgsLimitInfo' arguments='${arguMsg}' />");
                    return false;

                };

                currLen++;
            };

            // text 갯수
            //$('#messageByte').html(obj.value.length);
            $('#messageByte').html(size);

        };

        // 템플릿 목록 선택 이벤트
        function selectTmpl(mesgTmplNo){

            var mesgTmplNo = mesgTmplNo;
            $("div[name=templeteBox]").removeClass("selected")
            $("#templeteBox_"+mesgTmplNo).addClass("selected")

            var smsTmplMsg = $("#mesgTmplNo_"+mesgTmplNo).val();
            $("#smsTmplMsg").val(smsTmplMsg);
            $("#mesgTmplNo").val(mesgTmplNo);
            //$("#btnSmsTransmission").data("kendoButton").enable(true);

        }

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
            });
            $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);

            // 템플릿 - SMS
            $("#smsTmplGrpId").kendoExtDropDownList({
                dataSource:smsTmplGrpDs
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                , index:0
                , select:function(e){

                    // 전송 템플릿 초기화
                    $("#smsTmplMsg").val("");
                    $("#mesgTmplNo").val("");
                    //$("#btnSmsTransmission").data("kendoButton").enable(false);

                    // 선택된 템플릿 메시지를 내용에 입력한다.
                    var dataItem = this.dataItem(e.item);
                    var value = dataItem.value;

                    if ( dms.string.isNotEmpty(value) ) {

                        var param = {
                                "sMesgTmplGrpId":dataItem.value
                        }

                        console.log("템플릿 param:",JSON.stringify(param))

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

            // SMS 전송
            $("#btnSmsTransmission").kendoButton({
                click:function(e){

                    var grid = $("#smsTargetGrid").data("kendoExtGrid");

                    if ( grid.dataSource.view().length < 0 ) {
                        // {대상자수}을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.stsfCustCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}' />");
                        return;
                    }

                    if( dms.string.isEmpty($("#smsTmplMsg").val()) ){
                        // {메세지}을(를) 입력해주세요.
                        dms.notification.warning("<spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                        return;
                    }

                    if( $("#tmpSmsTmplMsg").val() === "Y" ){
                        // {메세지}을(를) 입력해주세요.
                        dms.notification.warning("<spring:message code='global.lbl.message' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                        return;
                    }

                    var saveData = $("#smsTrsfFrom").serializeObject(
                            $("#smsTrsfFrom").serializeArrayInSelector("[data-json-obj='true']")
                    )

                    if ( $(":radio[name=smsTp]:checked").val() === "R" ) {

                        if ( dms.string.isEmpty($("#resvDt").data("kendoExtMaskedDateTimePicker").value()) ) {

                            // {예약시간 }을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.resvDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}' />");
                            return;

                        } else {
                            saveData.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
                        }

                    }

                    // 그리드 데이터를 array로 받은경우
                    if ( smsTmplUserList.length > 0 ) {
                        saveData.insertSms = grid.dataSource.view();
                    }

                    console.log("saveData:" + JSON.stringify(saveData));
                    //return;

                    $.ajax({
                        url:"<c:url value='/crm/cmm/customerInfo/sendSmsMessage.do' />",
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
                    });

                }
                //, enable:false
            });

            // SMS 대상자 그리드
            $("#smsTargetGrid").kendoExtGrid({
                dataSource:{
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

                                console.log("smsTargetGrid param:"+kendo.stringify(params));

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
                ,selectable:false
                ,sortable:false
                ,filterable:false
                ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, hidden:true
                        ,attributes:{"class":"ac"}
                    }
                    ,{field:"seq", hidden:true}
                    ,{field:"custNo", hidden:true}
                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}        /* 고객명 */
                    ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100}        /* 휴대전화 */
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

            console.log("#options:",options);

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
        /************************************************************************************************
         *************************************************************************************************
         ****************************************팝업 form 데이터 set 종료************************************
         *************************************************************************************************
         ************************************************************************************************/


        });

    </script>
