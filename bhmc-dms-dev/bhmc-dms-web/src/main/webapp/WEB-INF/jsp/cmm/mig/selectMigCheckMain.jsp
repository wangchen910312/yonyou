<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <section class="group" style="margin:5px 10px;">

        <div class="header_area">
            <h1 class="title_basic">Migration Check</h1>
            <div class="btn_right">
                <button type="button" class="btn_m btn_search" id="btnValidate" >Validate</button>
                <button type="button" class="btn_m btn_search" id="btnSearch" >Search</button>
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
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
                        <th scope="row">Dealer Code</th>
                        <td>
                            <input type="text" id="sDlrCd" name="sDlrCd" class="form_input" />
                        </td>
                        <th scope="row">Check Flag</th>
                        <td>
                            <input type="text" id="sChkTp" name="sChkTp" class="form_comboBox" />
                        </td>
                        <th scope="row">Check Result</th>
                        <td>
                            <input type="text" id="sChkRsltTp" name="sChkRsltTp" class="form_comboBox" />
                        </td>
                        <th scope="row">Error Flag</th>
                        <td>
                            <input type="text" id="sErrCd" name="sErrCd" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script type="text/javascript">

var sCheckTpList = [];
sCheckTpList.push({"cmmCd":"", "cmmCdNm":"All"}
                 ,{"cmmCd":"P", "cmmCdNm":"Project"}
                 ,{"cmmCd":"Y", "cmmCdNm":"YonYou"});

var sChkRsltTpList = [];
sChkRsltTpList.push({"cmmCd":"", "cmmCdNm":"All"}
                   ,{"cmmCd":"N", "cmmCdNm":"Normal"}
                   ,{"cmmCd":"E", "cmmCdNm":"Error"});

var sErrCdList = [];
sErrCdList.push({"cmmCd":"", "cmmCdNm":"All"},
                {"cmmCd":"00", "cmmCdNm":"Normal"},
                {"cmmCd":"01", "cmmCdNm":"Error - Count Check"},
                {"cmmCd":"02", "cmmCdNm":"Error - Validate Check"},
                {"cmmCd":"03", "cmmCdNm":"Error - Mandatory Check"},
                {"cmmCd":"99", "cmmCdNm":"Error - ETC"});

$(document).ready(function() {

    //점검 구분
    $("#sChkTp").kendoExtDropDownList({
        dataSource:sCheckTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //점검결과 구분
    $("#sChkRsltTp").kendoExtDropDownList({
        dataSource:sChkRsltTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //에러 구분
    $("#sErrCd").kendoExtDropDownList({
        dataSource:sErrCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //버튼 - 업데이트 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    //버튼 - 업데이트 조회
    $("#btnValidate").kendoButton({
        click:function(e) {
            if($("#sDlrCd").val() == "" || $("#sDlrCd").val() == "D0000"){
                alert("Please input dealer code");
            }else{
                setValidate();
                alert("Success Execute!!!");
            }
        }
    });

    function setValidate(){
        $.ajax({
            url:"<c:url value='/cmm/mig/multiMigCheckInfo.do' />"
            ,data:JSON.stringify({
                "dlrCd":$("#sDlrCd").val()
            })
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:true
            ,beforeSend:function(xhr){
                //dms.notification.info("Success Execute!!!");
            }
        });
    }

    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/mig/selectMigCheckList.do' />"
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

                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sChkTp"] = $("#sChkTp").data("kendoExtDropDownList").value();
                        params["sChkRsltTp"] = $("#sChkRsltTp").data("kendoExtDropDownList").value();
                        params["sErrCd"] = $("#sErrCd").data("kendoExtDropDownList").value();

                        console.log("param:"+kendo.stringify(params));

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,seq:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,chkNm:{type:"string", editable:false}
                        ,chkTp:{type:"string", editable:false}
                        ,tblNm:{type:"string", editable:false}
                        ,colNm:{type:"colNm", editable:false}
                        ,chkRsltTp:{type:"string", editable:false}
                        ,errCd:{type:"string", editable:false}
                        ,msg:{type:"string", editable:false}
                        ,cnt:{type:"number", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,regDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateTimeFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,filterable:false
        ,indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false         //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true
        ,pageable:false
        ,selectable:true
        ,editable:true
        ,autoBind:false
        ,height:500
        ,columns:[
            {field:"rnum", title:"No", width:30, sortable:false, attributes:{"class":"ar"}}
            ,{field:"seq", title:"Seq", width:50, sortable:false, attributes:{"class":"ar"}}
            ,{field:"dlrCd", title:"Dealer Code", width:100, sortable:false, attributes:{"class":"ac"}}
            ,{field:"chkNm", title:"Check Name", width:150, sortable:false, attributes:{"class":"ac"}}
            ,{field:"chkTp", title:"Check Flag", width:130, sortable:false, attributes:{"class":"ac"}}
            ,{field:"tblNm", title:"Table Name", width:150, sortable:false, attributes:{"class":"ac"}}
            ,{field:"colNm", title:"Column Name", width:100, sortable:false, attributes:{"class":"ac"}}
            ,{field:"chkRsltTp", title:"Check Result Flag", width:100, sortable:false, attributes:{"class":"ac"}}
            ,{field:"errCd", title:"Error Flag", width:100, sortable:false, attributes:{"class":"ac"}}
            ,{field:"msg", title:"Message", width:500, sortable:false, attributes:{"class":"ac"}}
            ,{field:"cnt", title:"Count", width:70, sortable:false, attributes:{"class":"ar"}}
            ,{field:"regDtFormat", title:"Check Date", width:150                  //등록일
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
            }
        ]
    });
});
</script>