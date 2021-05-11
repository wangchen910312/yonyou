<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_pop_list">
            <div class="content_title">
                <h2 id="content_pop_list_title"><spring:message code="par.title.dlBpSelect" /><!-- 배송업체선택 --></h2>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">
                            <span style="width:50%"><spring:message code="par.lbl.bpNo" /><!-- 거래처번호 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.ownRgstNm" /><!-- 대표자명 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="par.lbl.bpNm" /><!-- 거래처명 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.crnNo" /><!-- 사업자등록번호 --></span>
                        </div>

                <iframe id="mainList" border="0" frameborder="0" width="100%" height="230px"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea btncount">
                    <div><span id="btnCancel" class="btnd1"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
                </div>
            </div>
        </section>
    </section>

    <div id="docu_top" style="display:none">TOP</div>

<!-- script -->
<script>
    var toDate, gCrud;
    toDate = new Date();

    $(document).ready(function() {




        function initPage(){
            /*
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            */
            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            //partsJs.validate.groupObjAllDataInit();
            gCrud = 'C';
        }
        initPage();

        // 타이틀
        $("#header_title").html("<spring:message code='mob.title.mobileReceive' />"); //모바일입고

        // 목록 조회
        $("#mainList").attr("src", "<c:url value='/mob/par/pmm/venderMaster/selectVenderMasterList.do' />");


        //버튼 - TOP
        $("#docu_top").bind("click", function()
        {
            $("body,html").animate({scrollTop:0}, 200);
        });

        //상단으로 이동
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0)
            {
                //$("#docu_top").fadeIn();
            }
            else
            {
                $("#docu_top").fadeOut();
            }
        });
    });
    var options = parent.venderSearchPopupWin.options.content.data;
    var fieldOptions = {
         "default":["bpCd", "bpNm", "bpTp"]
         ,"custom1":["bpCd", "bpNm", "bpTp", "addr"]
    };

    //상세페이지 보기
    function contentDetail(key) {
        options.callbackFunc(key);
        parent.venderSearchPopupWin.close();
    }
</script>

<script>

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//취소 버튼.
$("#btnCancel").kendoButton({
    click:function(e){
        parent.venderSearchPopupWin.close();
    }
});

</script>