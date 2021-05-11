<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
    <!-- 입고단참조팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:17%;">
                    <col style="width:12%;">
                    <col style="width:30%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><span id="titleGrStat"><spring:message code="par.lbl.statNm" /></span><!-- 상태 --></th>
                        <td>
                            <input id="sStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>

    </section>
    <!-- //부품선택 팝업 -->
</div>
 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.repairOrderInitTargetListPopupWindow.options.content.data,
             statCdList          = [],
             strgeTpList         = [],
             strgeTpObj          = {},
             statCdObj           = {},
             initDataYn;

        //입고창고
         strgeTpObj[' '] = "";
         <c:forEach var="obj" items="${storageList}" varStatus="status">
             strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
             strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
         </c:forEach>

        //상태코드
         statCdObj[' '] = "";
         <c:forEach var="obj" items="${statCdList}" varStatus="status">
             statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        //기타입고상태선택
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:statCdList
            ,index:0
        });

        // 입고창고 선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정
        $("#sStatCd").data("kendoExtDropDownList").value(options.initDataYn);

        /************************************************************
                    그리드 설정
        *************************************************************/
     // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0617-231250"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectRepairOrderInitTargetData.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sInitDataYn"]        = $("#sStatCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:"data"
                    ,total:"total"
                    ,model:{
                       id:"itemCd"
                      ,fields:{
                              itemCd          :{ type:"string", editable:false  }
                            , strgeCd         :{ type:"string", editable:false  }
                            , qty             :{ type:"number", editable:false  }
                            , prc             :{ type:"number", editable:false  }
                            , grStatCd        :{ type:"string", editable:false  }
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            //, multiSelectWithCheckbox:true
            , pageable:{
                   refresh:false
                  ,pageSize:100
                  ,buttonCount:3
                  ,input:false
                }
            , editable:false
            , columns:[
                  {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:140
                  }
                , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"strgeCd"
                     ,width:120
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimal:2
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.prc' />"
                     ,field:"prc"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,decimals:2
                  }
                ,{field:"grStatCd" ,title:"<spring:message code='par.lbl.statNm' />" ,width:100
                    ,template:'#= changeStatCd(grStatCd)#'
               }//문서상태
            ]
        });

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(strgeTpObj[val])){
                    returnVal = strgeTpObj[val];
                }else{
                    returnVal = "";
                }
            }
            return returnVal;
        };

        //입고상태
        changeStatCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(statCdObj[val])){
                    returnVal = statCdObj[val];
                }else{
                    returnVal = "";
                }
            }
            return returnVal;
        };

        $("#grid").data("kendoExtGrid").dataSource.read();

    });


 </script>

