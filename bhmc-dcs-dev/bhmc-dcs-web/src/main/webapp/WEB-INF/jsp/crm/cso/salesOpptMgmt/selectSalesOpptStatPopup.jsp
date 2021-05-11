<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">

    <div class="notification_btnArea">
        <div class="inbox">
            <div class="top_area">
                <p class="top_txt"><span id="sName"></span> <spring:message code='global.lbl.saleOppt' /><!-- 판매기회 --> <span id="sMonth"></span> <spring:message code='crm.lbl.day' /> <spring:message code='crm.lbl.pass' /><!-- 일  경과 --></p>
            </div>
            <div class="con_area">
                <button id="stat01" class="btn_s btn_s_v1"><spring:message code='global.lbl.saleOpptFU' /><!-- 판매기회 진행 --></button>
                <button id="stat02" class="btn_s btn_s_v1"><spring:message code='global.btn.callTransfer' /><!-- 콜센터 이관 --></button>
                <button id="stat03" class="btn_s btn_s_v1"  style="display:none;" ><spring:message code='crm.btn.close' /><!-- CLOSE --></button>
            </div>
        </div>
    </div>
</section>

<input type="hidden" id="saleOpptSeq" name="saleOpptSeq" />

<script type="text/javascript">

    $(document).ready(function() {

        $(".k-icon .k-i-close").remove();

        // 팝업 form 데이터 set
        var options = parent.salesOpptStatPopup.options.content.data;

        console.log("상태변경 팝업 options :",options);

        $("#saleOpptSeq").val(options.saleOpptSeq);     //  판매기회 번호 set

        var regPrid = options.regPrid;
        var custNm = options.custNm;
        var sDay;

        // 30일 경과 일때는 CLOSE 노출
        if(regPrid == 1){
            $("#stat03").show();
            sDay = 30;
        }else{
            sDay = 60;
        }

        // 상단 title 영역에 이름과 날짜 set
        $("#sName").text(custNm);
        $("#sMonth").text(sDay);

        //console.log("#options:",options);

        // 계속 F/U
        $("#stat01").kendoButton({
            click:function(e){

                // 계속 진행... 그냥 close TODO 다시 안뜨도록 체크
                parent.salesOpptStatPopup.close();

            }
        });

        // 콜센터 이관
        $("#stat02").kendoButton({
            click:function(e){

                // 전출상태 변경 ( CRM219 / 01:전출요청 )
                trsfStatUpdt("01");

            }
        });
        // CLOSE
        $("#stat03").kendoButton({
            click:function(e){

                console.log("판매기회 상태 팝업 종료 후 실패팝업 오픈")
                options.callbackFunc("CLOSE");
                parent.salesOpptStatPopup.close();

            }
        });


        // 전출상태 변경
        function trsfStatUpdt(trsfStatCd){

            var saleOpptSeq = $("#saleOpptSeq").val();

            if( dms.string.isEmpty(saleOpptSeq) ){
                // 판매기회 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                return;
            }

            if( dms.string.isEmpty(trsfStatCd) ){
                // 전출상태 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.trsfStatCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                return;
            }

            var param = {
                    "saleOpptSeq":saleOpptSeq
                    ,"trsfStatCd":trsfStatCd
                    };

            console.log(JSON.stringify(param));
            //return;

            // 전출상태 변경
            $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptMgmt/updateTrsfStat.do' />"
                    ,data:JSON.stringify(param)      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
            }).done(function(body) {

                console.log("전출상태 변경 완료")
                options.callbackFunc("SUCCESS");
                parent.salesOpptStatPopup.close();

            });

        }



        function saleOpptStatUpdt(saleOpptStatCd){

            var saleOpptSeq = $("#saleOpptSeq").val();

            if(saleOpptSeq == ""){
                // 판매기회 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                return;
            }

            if(saleOpptStatCd == ""){
                // 판매기회상태 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.saleOpptStatCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                return;
            }

            var param = {
                    "saleOpptSeq":saleOpptSeq
                    ,"saleOpptStatCd":saleOpptStatCd
                    };

            console.log(JSON.stringify(param));
            //return;

            // 판매기회 상태 변경
            $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptMgmt/updateSalesOpptStat.do' />"
                    ,data:JSON.stringify(param)      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
            }).done(function(body) {

                console.log("판매기회 상태 변경 완료")
                options.callbackFunc("SUCCESS");
                parent.salesOpptStatPopup.close();

            });

        }

    });
</script>
