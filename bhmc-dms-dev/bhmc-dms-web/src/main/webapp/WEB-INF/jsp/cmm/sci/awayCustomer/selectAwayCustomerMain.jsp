<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 게시판 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.awayCustomer" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
            <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
            <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.searchPeriod"/></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRevStartDt" name="sRevStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRevEndDt" name="sRevEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">
    //등록 시작일
    $("#sRevStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 등록 종료일
    $("#sRevEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    var awayCustomerPopupWin;

    fnGeneralBoardWritePopup = function (flag, revDt, revStartHm, revEndHm) {
        var grid = $("#grid").data("kendoExtGrid");
        var title = "";

        title += "<spring:message code='cmm.title.awayCustomer' />";

        if (flag == "I") {
            // Insert
            title += " <spring:message code='global.title.add' />";
        }
        else {
            // Update
            title += " <spring:message code='global.title.update' />";
        }

        awayCustomerPopupWin = dms.window.popup({
            windowId:"awayCustomerWritePopupWin"
          , title:title
          , draggable:true
          , modal:false
          , content:{
                url:"<c:url value='/cmm/sci/awayCustomer/selectAwayCustomerWritePopup.do' />"
              , data:{
                    "autoBind"         :false
                  , "flag"             :flag
                  , "revDt"            :revDt
                  , "revStartHm"       :revStartHm
                  , "revEndHm"         :revEndHm
                  , "callbackFunc"     :function (data) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                    }
                }
            }
          , height:250
        });
    }

    $(document).ready(function() {
        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        // 버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                fnGeneralBoardWritePopup("I", "", "", "");
            }
        });

        // 버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        // 버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
                var json = "";
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                json = "{\"insertList\":[],\"updateList\":[],\"deleteList\":[";

                $.each(saveData.deleteList, function(index, value) {
                    json += "{\"revOldDt\":\"" + value.revDt + "\", \"revOldStartHm\":\"\"}";

                    if (saveData.deleteList.length > (index + 1)) {
                        json += ",";
                    }
                });

                json += "]}";

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/sci/awayCustomer/multiAwayCustomer.do' />",
                        data:json,
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {
                            if (jqXHR) {
                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

                                // 정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success' />");
                            }
                            else {
                                // 현재일 이전 데이터는 삭제가 불가 합니다.
                                dms.notification.warning("<spring:message code='cmm.info.awayWarningMsg' />");

                                $('#grid').data('kendoExtGrid').cancelChanges();
                            }
                        }
                    });
                }
                else {
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        // 버튼 - 취소
        $("#btnCancel").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').cancelChanges();
            }
        });

        // 그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/awayCustomer/selectAwayCustomer.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sRevStartDt"] = $("#sRevStartDt").val();
                            params["sRevEndDt"] = $("#sRevEndDt").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"revDt"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,revDt:{type:"string", editable:false}
                        }
                    }
                }
            }
            , multiSelectWithCheckbox:true
            , editableOnlyNewExcludeColumns:["revStartHm", "revEndHm"]
            , editableOnlyNew:true
            , columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
               , {field:"revDt", title:"<spring:message code='global.lbl.date' />", width:100, attributes:{"class":"ac"}}
               , {title:"8", width:30
                  ,template:function (data) {
                      var div = "";
                      var key = data.revDt + " " + 8;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"9", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 9;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"10", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 10;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"11", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 11;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"12", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 12;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"13", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 13;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"14", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 14;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"15", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 15;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"16", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 16;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"17", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 17;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"18", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 18;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"19", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 19;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"20", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 20;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"21", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 21;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"22", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 22;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"23", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 23;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"0", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 0;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"1", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 1;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"2", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 2;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"3", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 3;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"4", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 4;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"5", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 5;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"6", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 6;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"7", width:30
                  ,template:function (data) {
                      var div = "";

                      var key = data.revDt + " " + 7;

                      if (data[key] != undefined) {
                          div = "<div style='width:100;background-color:red;cursor:pointer' onClick='fnGeneralBoardWritePopup(\"U\", \"" + data.revDt + "\", \"" + data[key].toString().substring(11, 16) + "\", \"" + data[key].toString().substring(17, 22) + "\")'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:""}
            ]
        });
    });
</script>