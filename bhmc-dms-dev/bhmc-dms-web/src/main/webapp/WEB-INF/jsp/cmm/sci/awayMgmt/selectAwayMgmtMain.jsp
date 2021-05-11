<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 게시판 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.awayMgmt" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.usrId" /></th>
                    <td>
                        <input type="text" id="sUsrId" name="sUsrId" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.usrNm" /></th>
                    <td>
                        <input type="text" id="sUsrNm" name="sUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input type="text" id="sEmpNo" name="sEmpNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.searchDate" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSearchDt" name="sSearchDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
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
    $("#sSearchDt").val("<c:out value='${sysDate}' />");

    $("#sSearchDt").kendoExtMaskedDatePicker();

    $(document).ready(function() {
        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        // 그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/awayCustomer/selectAwayMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sUsrId"] = $("#sUsrId").val();
                            params["sUsrNm"] = $("#sUsrNm").val();
                            params["sEmpNo"] = $("#sEmpNo").val();
                            params["sSearchDt"] = $("#sSearchDt").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"usrId"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,usrId:{type:"string", editable:false}
                            ,usrNm:{type:"string", editable:false}
                            ,empNo:{type:"string", editable:false}
                        }
                    }
                }
            }
            , multiSelectWithCheckbox:true
            , editableOnlyNew:true
            , columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
               , {field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:100, attributes:{"class":"ac"}}
               , {field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:100, attributes:{"class":"ac"}}
              , {title:"8", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 8;
                      var customerKey = data.leftDt + " C " + 8;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"9", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 9;
                      var customerKey = data.leftDt + " C " + 9;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"10", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 10;
                      var customerKey = data.leftDt + " C " + 10;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"11", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 11;
                      var customerKey = data.leftDt + " C " + 11;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"12", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 12;
                      var customerKey = data.leftDt + " C " + 12;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"13", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 13;
                      var customerKey = data.leftDt + " C " + 13;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"14", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 14;
                      var customerKey = data.leftDt + " C " + 14;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"15", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftt + " M " + 15;
                      var customerKey = data.leftDt + " C " + 15;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"16", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 16;
                      var customerKey = data.leftDt + " C " + 16;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"17", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 17;
                      var customerKey = data.leftDt + " C " + 17;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"18", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 18;
                      var customerKey = data.leftDt + " C " + 18;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"19", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 19;
                      var customerKey = data.leftDt + " C " + 19;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"20", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 20;
                      var customerKey = data.leftDt + " C " + 20;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"21", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 21;
                      var customerKey = data.leftDt + " C " + 21;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"22", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 22;
                      var customerKey = data.leftDt + " C " + 22;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"23", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 23;
                      var customerKey = data.leftDt + " C " + 23;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"0", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 0;
                      var customerKey = data.leftDt + " C " + 0;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"1", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.left + " M " + 1;
                      var customerKey = data.leftDt + " C " + 1;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"2", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 2;
                      var customerKey = data.leftDt + " C " + 2;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"3", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 3;
                      var customerKey = data.leftDt + " C " + 3;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"4", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 4;
                      var customerKey = data.leftDt + " C " + 4;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"5", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 5;
                      var customerKey = data.leftDt + " C " + 5;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"6", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 6;
                      var customerKey = data.leftDt + " C " + 6;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:"7", width:30
                  ,template:function (data) {
                      var div = "";
                      var mgmtKey = data.leftDt + " M " + 7;
                      var customerKey = data.leftDt + " C " + 7;

                      if (data[customerKey] != undefined && data[mgmtKey] != undefined) {
                          // 이석 예약 && 이석
                          div = "<div style='width:100;background-color:gray'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] != undefined && data[mgmtKey] == undefined) {
                          // 이석 예약 && 배석
                          div = "<div style='width:100;background-color:green'>&nbsp;&nbsp;&nbsp;</div>";
                      }
                      else if (data[customerKey] == undefined && data[mgmtKey] != undefined) {
                          // 이석
                          div = "<div style='width:100;background-color:red'>&nbsp;&nbsp;&nbsp;</div>";
                      }

                      return div;
                  }
                  , attributes:{"class":"ac"}}
              , {title:""}
            ]
        });
    });
</script>