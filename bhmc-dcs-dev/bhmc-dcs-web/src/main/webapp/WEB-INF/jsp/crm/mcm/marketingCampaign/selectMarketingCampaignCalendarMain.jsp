<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 기본정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.campaignCalendar" /></h1><!-- 캠페인목록 -->
        </div>

        <div class="table_grid mt10">
            <div id="scheduler"></div>
        </div>

    </section>
    <!-- //기본정보 -->


    <!-- 스케쥴러에 나타나는 내방 예약 정보 -->
    <script id="campaignView" type="text/x-kendo-template">

        # var hostNm ;#

        # if ( hostCd === '01' ) {#
            # hostNm = '(B)' #
        #} else if ( hostCd === '02' ) {#
            # hostNm = '(D)' #
        #}#

        <div class="scheduler_padding">
            <span>
                #= hostNm # #= makNm #
            </span>
        </div>

    </script>

    <!-- script 시작  -->
    <script type="text/javascript" charset="UTF-8">

        // 스케줄러 날짜 검색을 위한 변수선언
        var sStartDt
            , makCd
        ;

        // 마케팅타입 DS
        var makTpListDs = [];
        <c:forEach var="obj" items="${makTpList}">
            makTpListDs.push({"color":"${obj.remark2}","value":"${obj.cmmCd}"});
        </c:forEach>

        function scheduler_change(e) {

            // 스케줄러 클릭시 makCd 값 변경.
            var events = e.events;
            if(events.length){
                makCd = events[events.length - 1].makCd;
            }

        }

        // 스케줄 더블클릭시 마케팅 관리 이동
        function marketingCampaignPopup(e) {

            // 스케쥴러 데이터 set 한다음에 스케줄러에서 제공되는 form 닫기
            $("#scheduler").data("kendoScheduler").cancelEvent();

            if ( dms.string.isNotEmpty(makCd) ) {
                //window.open("<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do' />")
                window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.campaignMng' />", "<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do' />?makCd="+makCd, "VIEW-I-10239"); //캠페인 관리
            }

        }

        $(document).ready(function() {

            var schedulerDs = new kendo.data.SchedulerDataSource({
                batch:true

                ,transport:{
                    read:{
                        url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignCalendars.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            if ( dms.string.isNotEmpty(sStartDt) ) {
                                params["sStartDt"] = sStartDt;
                            } else {
                                params["sStartDt"] = "";
                            }

                            console.log("scheduler param:"+kendo.stringify(params));

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }

                ,schema:{
                    errors:"error"
                        ,data:"data"
                        ,total:"total"
                        ,model:{
                            id:"makCd"
                            ,fields:{
                                rnum:{type:"number", editable:false}
                                , makCd:{type:"string", editable:false}
                                , makNm:{type:"string", editable:false}
                                , makTpCd:{type:"string", editable:false}
                                , hostCd:{type:"string", editable:false}
                                , start:{ type:"date", from:"startDt"}
                                , end:{ type:"date", from:"endDt"}
                            }
                        }
                }

            });

            // dateFormat:yyyy-MM-dd 는 오류남.
            var sysDate = new Date("<c:out value='${sysDate}' />");

            var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
            var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";

            $("#scheduler").kendoScheduler({
                date:sysDate
                //,startTime:new Date(startTime)
                //,endTime:new Date(endTime)
                ,views:[
                    "month"
                ]
                ,showWorkHours:false
                ,dataSource:schedulerDs
                ,resources:[
                             {
                                  field:"makTpCd"      // CRM702, 01/브랜드/#c4b4ce, 02/판매/#d9caee, 03/정비/#ddcbaf
                                 ,dataSource:makTpListDs
                             }
                 ]
                ,selectable:true
                ,height:600
                ,footer:false
                ,eventTemplate:$("#campaignView").html()
                ,navigate:function(e){

                    // 달력 날짜 클릭시 클릭된 날짜 가져오기
                    console.log(JSON.stringify(e.date));
                    sStartDt = JSON.parse(JSON.stringify(e.date));
                    $("#scheduler").data("kendoScheduler").dataSource.read();

                }
                ,dataBound:function(e){
                    // 스케줄러 x 표시 삭제
                    $(".k-event-actions .k-event-delete").remove();
                }
                ,change:scheduler_change
                ,editable:{
                    move:false
                    ,window:{
                        animation:false
                        ,open:marketingCampaignPopup
                    }
                }
            });

            // 우측 상단 Timeline view 삭제
            $(".k-reset.k-header.k-scheduler-views").hide();

        });

    </script>