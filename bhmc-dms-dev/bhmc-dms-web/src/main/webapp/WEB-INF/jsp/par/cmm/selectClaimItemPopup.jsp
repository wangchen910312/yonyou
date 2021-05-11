<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 클레임부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSave" class="btn_m btn_save"  type="button"><spring:message code="par.btn.save" /><!-- 저장 --></button>
                <button id="btnSend" class="btn_m btn_send" type="button"><spring:message code="par.btn.send" /><!-- 발송 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:19%;">
                    <col style="width:15%;">
                    <col style="width:18%;">
                    <col style="width:15%;">
                    <col style="width:18%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCdSameGrp" /><!-- 딜러코드 --></span></th>
                        <td class="required_area">
                            <input id="sGroupDealers" type="text" class="form_input"/>
                        </td>
                        <th scope="row">索赔方名称<!-- 클레임측명칭 --></th>
                        <td>
                            <input id="sClaimNm" class="form_input">
                        </td>
                        <th scope="row">申报日期<!-- 보고일자 --></th>
                        <td>
                            <input class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></span></th>
                        <td class="required_area">
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                            <th scope="row">销售清单编号<!-- 판매명세서번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row">运单编号</th> <!-- 운송번호 -->
                        <td>
                            <input id="sTrsfNo" type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.arrvDt" /><!--도착일자 --></span></th>
                        <td class="required_area">
                            <input id="arrvDt" class="form_datepicker" data-type="maskDate"/>
                        </td>
                        <th scope="row">提货清单日期<!-- 출고명세서일자 --></th>
                        <td>
                            <input id="sEtcGiDocDt" class="form_input" readonly />
                        </td>
                        <th scope="row">提货清单号码<!-- 출고명세서번호 --></th>
                        <td>
                            <input id="sEtcGiDocNo" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="btn_right mt10">
            <button type="button" class="btn_s btn_add btn_s_min5" id="btnAdd">新增</button><!-- 추가 -->
            <button type="button" class="btn_s btn_s_min5" id="itemPop">导入配件</button><!-- 부품가져오기 -->
        </div>

        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:25%;">
                    <col style="width:15%;">
                    <col style="width:30%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required">包装是否完好 <!--배송중깨짐여부 --></span></th>
                        <td class="required_area bor_none">
                            <label class="label_check"><input type="radio" id="intClaimYn_Y" name="intClaimYn" class="form_check" value="Y" >破损</label><!-- 파손 -->
                            <label class="label_check"><input type="radio" id="intClaimYn_N" name="intClaimYn" class="form_check" value="N" checked >完好</label><!-- 이상없음 -->
                        </td>
                        <th scope="row"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></th>
                        <td>
                            <input id="sClaimOpn" type="text" class="form_input" style="width:150px;" />
                            <button class="btn_s btn_s_min5" id="fileDelete">浏览</button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required">索赔申报人 <!--클레임보고자 --></span></th>
                        <td class="required_area" colspan="9">
                            <input id="sClaimOpn" type="text" class="form_input"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //클레임부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.searchClaimItemPopupWindow.options.content.data,
             itemDstinCdList     = [],
             itemDstinCdObj      = {},
             itemGrpCdObj        = {},
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             sStrgeCd;

         //itemDstinCdList     = dms.data.getCmmCdList({cmmGrpCd:'PAR101', isAppendEmptyData:true});
         var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
         <c:forEach var="obj" items="${itemDstinCdList}">
         itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>

         for(var i = 0, itemDstinCdLen = itemDstinCdList.length; i < itemDstinCdLen; i = i + 1){
             itemDstinCdObj[itemDstinCdList[i].cmmCd] = itemDstinCdList[i].cmmCdNm;
         }

         <c:forEach var="obj" items="${itemGroupList}">
             if(itemGrpCdObj.hasOwnProperty("${obj.itemDstinCd}")){
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }else{
                 itemGrpCdObj["${obj.itemDstinCd}"] = [];
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:" ", cmmCdNm:"ALL"});
                 itemGrpCdObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
             }
         </c:forEach>

         $("#arrvDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });


        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });

        // 조회 버튼
        $("#btnSend").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 추가 버튼
        $("#btnAdd").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 부품가져오기 버튼
        $("#itemPop").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-144301"
           ,dataSource:{
                transport:{
                    read:{
                        //url :
                          dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"itemCd"
                        , fields:{
                              dlrCd        :{ type:"string" }
                            , ordNo        :{ type:"string" }
                            , itemCd       :{ type:"string" }
                            , claimTp      :{ type:"string" }
                            , errdlItemCd  :{ type:"string" }
                            , orderQty     :{ type:"number" }
                            , claimQty     :{ type:"number" }
                            , itemOper     :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:280
            ,columns:[
                 {field:"ordNo"
                     ,title:"<spring:message code='global.lbl.ordNo' />"
                     ,width:120 }                //오더번호
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:120 }                //부품번호
                ,{field:"claimTp"
                     ,title:"<spring:message code='ser.lbl.claimTp' />"
                     ,width:100 }                //클레임유형
                ,{field:"errdlItemCd"
                     ,title:"错发配件编号"
                     ,width:120}                //오배송부품번호
                ,{field:"orderQty"
                     ,title:"订购数量"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0}                  //주문수량
                ,{field:"claimQty"
                     ,title:"索赔数量"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0}                  //클레임수량
                , {field:"itemOper"
                   ,title:"<spring:message code='par.lbl.itemOper' />"
                   ,width:100                   //조작
                }
            ]
        });

    });

 </script>

