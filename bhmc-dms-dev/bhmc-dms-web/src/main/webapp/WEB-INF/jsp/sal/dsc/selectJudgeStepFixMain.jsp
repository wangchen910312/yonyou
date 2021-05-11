<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 심사단계설정 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.judgeStepFix' /></h1> <!-- 심사단계설정 -->
        <div class="btn_right">
            <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>    <!-- 저장 -->
        </div>
    </div>

    <div class="table_grid">
        <div id="grid"></div>
    </div>
</section>
<!-- //심사단계설정 -->

<script>

//대상업무 SAL008
var gradeCdDSList = [];
var gradeCdObj = {};
<c:forEach var="obj" items="${gradeCdDS}">
    gradeCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    gradeCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    $("#btnSave").kendoButton({ // 저장
        enable:true,
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            var param = grid.getCUDData("insertList", "updateList", "deleteList");

            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/sal/dsc/judgeStepFix/multiJudgeStepFixs.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.read();

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });



    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113333"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dsc/judgeStepFix/selectJudgeStepFixs.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"wrkDstinCd",
                    fields:{
                         wrkDstinCd  :{type:"string", editable:false}
                        ,wrkDstinNm  :{type:"string", editable:false}
                        ,gradeCd     :{type:"string", editable:false}
                        ,one         :{type:"string"}
                        ,two         :{type:"string"}
                        ,three       :{type:"string"}
                    }
                }
            }
        }
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind   :true
       ,editable:false
       ,height:500
       ,selectable :"row"
       ,sortable:false
       ,columns:[
            {field:"wrkDstinCd", hidden:true}
          , {field:"wrkDstinNm", title:"<spring:message code='sal.lbl.wrkDstin' />", width:300}         // 업무대행
          , {title:"<spring:message code='sal.lbl.wrkStep' />", headerAttributes:{ "class":"hasBob" }, // 업무단계
                  columns:[
                            {   field:"one", title:"<spring:message code='sal.lbl.wrkstepOne' />", width:200, attributes:{"class":"ac"}
                               ,template:'<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkGiStat(this, \'#=uid#\')" id="one" #= one=="Y" ? checked="checked":"" #  />'
                            }   // 1급
                            ,{  field:"two", title:"<spring:message code='sal.lbl.wrkstepTwo' />", width:200, attributes:{"class":"ac"}
                               ,template:'<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkGiStat(this, \'#=uid#\')" id="two" #= two=="Y" ? checked="checked":"" #  />'
                            }   // 2급
                            ,{  field:"three", title:"<spring:message code='sal.lbl.wrkstepThree' />", width:200, attributes:{"class":"ac"}
                               ,template:'<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkGiStat(this, \'#=uid#\')" id="three" #= three=="Y" ? checked="checked":"" #  />'
                            }   // 3급
                        ]
            }
       ]
   });


  //다른 콤보박스 체크 초기화
    bf_checkGiStat = function(obj, uid){
      var uidVal = uid;

      var grid = $("#grid").data("kendoExtGrid");
      var rows = grid.tbody.find("tr");

       if(obj.checked){
           $.each(rows, function(idx, row){
               var item = grid.dataItem(row);
               //console.log(obj.id);

               if(uidVal == item.uid){
                    var cells = $(row).find("td > input");
                    $.each(cells, function(i, cell){
                        cell.checked = false;
                    });

                    item.dirty = true;      // update로 인식
                    item.one = "N";
                    item.two = "N";
                    item.three = "N";

                    item[obj.id] = "Y";

                    // 저장시 db에는 grade_cd에 숫자값으로 들어감.
                    switch (obj.id) {
                        case 'one' :
                            item.gradeCd = "1";
                            break;
                        case 'two' :
                            item.gradeCd = "2";
                            break;
                        case 'three' :
                            item.gradeCd = "3";
                            break;
                    }
               }
           });
           obj.checked = true;
       }else{
           // 업무단계는 해제하실 수 없습니다.
           dms.notification.info("<spring:message code='sal.info.judgeStepMsg'/>");

           obj.checked = true;      // 다시 체크처리 시킴.
       }
    }

});
</script>