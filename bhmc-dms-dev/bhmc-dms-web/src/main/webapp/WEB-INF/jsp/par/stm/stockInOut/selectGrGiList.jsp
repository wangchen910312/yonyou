<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

   <!-- 입출고현황 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.grGiStatus" /> --%></h1><!-- 입출고현황 -->
            <div class="btn_left">
               <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
               <button class="btn_m btn_search"  id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.regYm" /><!-- 생성년월 --></th>
                        <td>
                            <input type="text" id="sRegYm" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                           <div class="form_search">
                               <input type="text" id="sItemCd" class="form_input">
                               <a id="searchItemCd"></a>
                           </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemKind" /><!-- 부품구분 --></th>
                        <td>
                            <input type="text" id="sItemDstinCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.mClass" /><!-- 중분류 --></th>
                        <td>
                            <input type="text" id="sItemGrpCd" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input type="text" id="sCarlineCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemClass" /><!-- 부품등급 --></th>
                        <td>
                            <input type="text" id="sAbcInd" value="" class="form_comboBox">
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //입출고현황 -->

    <!-- script -->
    <script type="text/javascript">
    //전역변수는 왜 밖으로 뺄까?
    var itemDstinCdList     = [],
        itemDstinCdObj      = {},
        abcIndList          = [],
        itemGroupList       = [],
        itemGroupObj        = {},
        itemGroupGridObj    = {},
        carlineCdList       = [],
        unitCdObj           = {},
        chkDateValue,
        toDt                = "${toDt}",
        searchItemPopupWindow;

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
        if("${obj.useYn}" !== 'N'){
            itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //품목그룹 선택
    <c:forEach var="obj" items="${itemGroupList}">
    if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }else{
        itemGroupObj["${obj.itemDstinCd}"] = [];
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"", cmmCdNm:"All"});
        itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});

        itemGroupGridObj["${obj.itemDstinCd}"] = {};
        itemGroupGridObj["${obj.itemDstinCd}"]["${obj.itemGrpCd}"] = "${obj.itemGrpNm}";
    }
    </c:forEach>
    //ABC Class선택
    <c:forEach var="obj" items="${abcIndList}" varStatus="status"> //key value
        abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //차종선택
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status"> //key value
        carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    </c:forEach>

    unitCdObj[' '] = "";
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    $(document).ready(function() {


        //조회조건-품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
           dataSource    :itemDstinCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,index         :0
        });

        //조회조건-품목그룹선택
        $("#sItemGrpCd").kendoExtDropDownList({
           dataSource    :[]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-차종선택
        $("#sCarlineCd").kendoExtDropDownList({
           dataSource    :carlineCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-ABC Class선택
        $("#sAbcInd").kendoExtDropDownList({
           dataSource    :abcIndList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });



        //생성년월
        $("#sRegYm").kendoDatePicker({
            //define the start view
            start:"year"
            //defines when the calendar shoule retrun date
            ,depth:"year"
            //display month and year in the input
            ,format:"yyyyMM"
        });

       $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

       // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sItemDstinCd").val())){
                    //품목번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.itemDstinCd' var='sItemDstinCd' /><spring:message code='global.info.emptyParamInfo' arguments='${sItemDstinCd}'/>");
                    return false;
                }

                //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                //return false;
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //sItemDstinCd->sItemGrpCd 변경
        $("#sItemDstinCd").on("change", function (){
            $("#sItemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
          });


        // 입출고리스트 그리드
            $("#grid").kendoExtGrid({
                gridId:"G-PAR-0808-161901"
               ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/par/stm/stockInOut/selectStockInOutList.do' />"

                        }
                      , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 입출고조회 검색조건 코드.
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sItemGrpCd"]         = $("#sItemGrpCd").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                    }
                    ,schema:{
                        data:function (result){
                            if(result.total === 0){
                                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                            }
                            return result.data;
                        }
                        ,model:{
                           id:"itemCd"
                          ,fields:{
                                dlrCd          :{ type:"string" }
                              , pltCd          :{ type:"string" }
                              , itemCd         :{ type:"string" }
                              , itemNm         :{ type:"string" }
                              , prc            :{ type:"number" }
                              , unitCd         :{ type:"string" }
                              , startQty       :{ type:"number" }
                              , startAmt       :{ type:"number" }
                              , grQty          :{ type:"number" }
                              , grAmt          :{ type:"number" }
                              , giQty          :{ type:"number" }
                              , giAmt          :{ type:"number" }
                              , endQty         :{ type:"number" }
                              , endAmt         :{ type:"number" }
                            }
                        }
                    }
                }
                , selectable:"row"
                , scrollable :true
                , autoBind   :false
                , filterable:false
                , appendEmptyColumn:true           //빈컬럼 적용. default:false
                , pageable   :false
                , editable   :false
                , columns:[{
                         title:"<spring:message code='par.lbl.itemInfo'  />"    //부품정보
                        ,headerAttributes:{ "class":"hasBob" }
                        ,columns:[{
                            field:"itemCd"
                           ,title:"<spring:message code='par.lbl.itemCd' />"
                           ,width:80
                        },{
                            field    :"itemNm"
                           ,title    :"<spring:message code='par.lbl.itemNm' />"
                           ,width    :160
                        },{
                            field:"prc"
                           ,title:"<spring:message code='par.lbl.prc' />"
                           ,width:90
                           ,attributes:{ "style":"text-align:right"}
                           ,format:"{0:n2}"
                        },{ //단위
                            field:"unitCd"
                           ,title:"<spring:message code='par.lbl.unitNm' />"
                           ,width:80
                           ,template:'#= changeUnitCd(unitCd)#'
                           ,attributes:{ "style":"text-align:center"}
                           ,sortable:false
                           }]
                        },{
                            title:"<spring:message code='par.lbl.startStock'  />"    //기초
                           ,headerAttributes:{ "class":"hasBob" }
                           ,columns:[{
                               field:"startQty"
                              ,title:"<spring:message code='par.lbl.qty' />"
                              ,width:80
                           },{
                               field:"startAmt"
                              ,title:"<spring:message code='par.lbl.amt' />"
                              ,width:80
                           }]
                        },{
                            title:"<spring:message code='par.lbl.receive'  />"    //입고
                           ,headerAttributes:{ "class":"hasBob" }
                           ,columns:[{
                               field:"grQty"
                              ,title:"<spring:message code='par.lbl.qty' />"
                              ,width:80
                            },{
                                field:"grAmt"
                               ,title:"<spring:message code='par.lbl.amt' />"
                               ,width:80
                            }]
                        },{
                            title:"<spring:message code='par.lbl.issue'  />"    //출고
                           ,headerAttributes:{ "class":"hasBob" }
                           ,columns:[{
                               field:"giQty"
                              ,title:"<spring:message code='par.lbl.qty' />"
                              ,width:80
                            },{
                                field:"giAmt"
                               ,title:"<spring:message code='par.lbl.amt' />"
                               ,width:80
                            }]
                        },{
                            title:"<spring:message code='par.lbl.stockEnd'  />"    //기말
                           ,headerAttributes:{ "class":"hasBob" }
                           ,columns:[{
                               field:"endQty"
                              ,title:"<spring:message code='par.lbl.qty' />"
                              ,width:80
                            },{
                                field:"endAmt"
                               ,title:"<spring:message code='par.lbl.amt' />"
                               ,width:80
                            }]
                        }
                ]
            });

           // 단위
            changeUnitCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = unitCdObj[val];
                }
                return returnVal;
            };

          initPage();

        });

        //초기화 버튼
        function initPage(){
              //그리드 reset
              $("#grid").data("kendoExtGrid").dataSource.data([]);
              //조회조건reset
              $("#sItemDstinCd").data("kendoExtDropDownList").value("02");
              $("#sItemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj["02"]);
              $("#sItemCd").val("");
              $("#sCarlineCd").data("kendoExtDropDownList").value('');
              $("#sAbcInd").data("kendoExtDropDownList").value('');


          }

        //부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "itemCd":$("#sItemCd").val()
                        , "autoBind":false
                         , "callbackFunc":function(data){
                            $("#sItemCd").val(data[0].itemCd);

                            searchItemPopupWindow.close();
                        }
                   }
                }
            });
        }

        </script>
    <!-- /script -->
