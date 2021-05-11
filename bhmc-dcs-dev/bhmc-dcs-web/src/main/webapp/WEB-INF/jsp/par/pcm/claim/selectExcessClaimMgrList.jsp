<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 클레임 조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.excessClaimMgr" /> --%><!-- 과부족클레임관리 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row">索赔代码<!-- 클레임번호 --></th>
                        <td>
                            <input id="sClaimDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 클레임 상태 --></th>
                        <td>
                            <input type="text" id="sClaimStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">销售清单编号<!-- 판매명세서번호 --></th>
                        <td>
                            <input id="sNoDetaile" class="form_input" />
                        </td>
                        <th scope="row">申报日期<!-- 보고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s" id="itemPop">新增普通配件</button><!-- 일반부품추가 -->
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid mt10">
            <!-- 클레임대상 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var  sessionBpCd         = "${bpCd}"
            ,sessionBpNm         = "${bpNm}"
            ,toDt                = "${toDt}"
            ,sevenDtBf           = "${sevenDtBf}"
            ,claimStatCdList     = []
            ,claimStatCdObj      = {}
            ,searchClaimItemPopupWindow;


        claimStatCdObj[' '] = "";
        <c:forEach var="obj" items="${claimStatCdList}" varStatus="status">
            claimStatCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            claimStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    $(document).ready(function() {


        $("#sClaimStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:claimStatCdList
           ,index:0
       });

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //부품팝업
        $("#itemPop").kendoButton({
            click:function(e){
            //dms.notification.warning("<spring:message code='global.info.ready' />");
            selectClaimItemPopupWindow();
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
              //  $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


         // 클레임 관리 그리드
         $("#grid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/claim/selectClaimManageItemByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sClaimStatCd"]       = $("#sClaimStatCd").data("kendoExtDropDownList").value();
                             params["sClaimDocNo"]        = $("#sClaimDocNo").val();
                             params["sMobisInvcNo"]       = $("#sMobisInvcNo").val();
                             params["sNoDetaile"]         = $("#sNoDetaile").val();
                             params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                             params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

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
                     ,total:"total"
                     ,model:{
                        id:"claimDocNo"
                       ,fields:{
                               dlrCd          :{ type:"string" , validation:{required:true} }
                             , claimDocNo     :{ type:"string", editable:false }
                             , claimStatCd    :{ type:"string", editable:false }
                         }
                     }
                 }
             }
             , height:250
             , selectable:"row"
             , scrollable :true
             , sortable   :true
             , autoBind   :false
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                          if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                          }else {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                          }
                      });
                 }

              }
             , pageable:false
             , edit:function(e){
              }
             , columns:[
                   {
                       title:"&nbsp;"
                      ,field:"chk"
                      ,width:30
                      ,attributes:{style:"text-align:center;"}
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                   }
                 , {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"索赔代码"
                      ,field:"claimDocNo"
                      ,width:90
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.invcDocNo' />"
                      ,field:"mobisInvcNo"
                      ,width:140
                   }
                 , {   //판매명세서번호
                       title:"销售清单编"
                      ,width:140
                   }
                 , {   //도착일자
                       title:"<spring:message code='par.lbl.arrvDt' />"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //보고일자
                       title:"申报日期"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //클레임총금액
                       title:"索赔总金额"
                      ,field:"amt"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //클레임상태
                       title:"状态"
                      ,field:"claimStatCd"
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeClaimStatCd(claimStatCd)#'
                      ,width:90
                   }
                 , {   //조작
                       title:"<spring:message code='par.lbl.itemOper' />"
                      ,field:"itemOper"
                      ,width:140
                   }
                 , { field:"" }
             ]
         });


         // 클레임상태
         changeClaimStatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = claimStatCdObj[val];
             }
             return returnVal;
         };


        // 부품 팝업 열기 함수.
        function selectClaimItemPopupWindow(){

            searchClaimItemPopupWindow = dms.window.popup({
                windowId:"searchClaimItemPopupWindow"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectClaimItemPopup.do'/>"
                    ,data:{
                         "autoBind":false
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);
                                $("#sItemNm").val(data[0].itemNm);
                            }
                        }
                    }
                }
            });
        }

        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;


            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            //$("#grid").data("kendoExtGrid").dataSource.data([]);

            popItemObj = {};

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        }

        function fnChkDateValue(e){

            var  elmt  = e.sender.element[0],
                 id    = elmt.id,
                 toYY,
                 toMM,
                 toDD,
                 frYY,
                 frMM,
                 frDD;

            console.log("val:" + this.value());
            console.log('id:',id);
            if(this.value() == null){
                if(id === 'sRegDtFr'){
                    var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sRegDtTo'){
                    var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sRegDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sRegDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

        initPage();
    });

    $(document).on("click", ".grid-checkAll", function(e){
        console.log('chkAll!');
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    //부품 팝업 열기 함수
    function selectClaimItemPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
           ,content:{
               url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :true
                 ,"selectable"  :"multiple"
                 ,"callbackFunc":function(data){

                     searchItemPopupWindow.close();
                 }

              }
           }
        });
    }


</script>
<!-- //script -->

