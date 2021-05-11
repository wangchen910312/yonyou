<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";


</script>


<form id="syncCommandSendReceiveHistoryForm" name="syncCommandSendReceiveHistoryForm" method="POST" onsubmit="return false;">
<!-- Sync Command Send Receive History List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic">SYNC COMMAND TEST</h1>
        <div class="btn_right">
            <!-- button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button -->
            <button id="btnSync" class="btn_m btn_search" >SYNC</button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->

    <div style=" height:200px;">
        <section style=" float:left; width:600px;">
            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:35%;">
                        <col style="width:65%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">DCS_DPLY_SVR_IP_ADDR</th>
                            <td>
                                <input id="ipAddr" type="text" class="form_input" value="127.0.0.1">   <!-- 10.25.226.14  10.125.211.116 -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">SYNCCMDSNDR_LOCAL_PORT</th>
                            <td>
                                <input id="port" type="text" class="form_input"  value="55554">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">DCS_MQ_PORT</th>
                            <td>
                                <input id="dcsMqPort" type="text" class="form_input"  value="61617">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">MESSEGE GROUP CODE</th>
                            <td>
                                <input id="mesgGrpCd" type="text" class="form_input"  value="E">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">MESSAGE CODE</th>
                            <td>
                                <input id="mesgCd" type="text" class="form_input"  value="10001">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">DEALER CODE</th>
                            <td>
                                <input id="dlrCd" type="text" class="form_input" value="D1208">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">SYMBOLIC NAME</th>
                            <td>
                                <input id="symbolicName" type="text" class="form_input" value="">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">OPERATION TYPE</th>
                            <td>
                                <!-- <input id="operType" type="text" class="form_input" value=""> -->
                                <input id="operType" type="text" value="INSTALL">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">GROUP ID</th>
                            <td>
                                <input id="groupId" type="text" class="form_input" value="">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">ARTIFACT ID</th>
                            <td>
                                <input id="artifactid" type="text" class="form_input" value="">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">VERSION</th>
                            <td>
                                <input id="version" type="text" class="form_input" value="1.0.0">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">SPEC CODE</th>
                            <td>
                                <input id="specCd" type="text" class="form_input" value="2016050002">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">DEPLOY VERSION NO</th>
                            <td>
                                <input id="deployVerNo" type="text" class="form_input" value="001">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section style=" overflow:hidden; margin-left:610px;">
            <div class="table_grid">
                <div id="bundleGrid"></div>
            </div>

            <div class="header_area">
                <h2 class="title_basic">SHOW HIDE</h2>
                <div class="btn_right">
                    <button class="btn_s" id="btnControl" >SHOW</button>
                </div>
            </div>


            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:35%;">
                        <col style="width:65%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">List View</th>
                            <td>
                                <div id="listView"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </section>
    </div>

    <!-- 조회 조건 종료 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:90%;">
            </colgroup>
            <tbody>

                <tr>
                    <th scope="row">XML BODY</th>
                    <td >
                        <textarea id="cmdTcXmlBodyCont" name="cmdTcXmlBodyCont" rows="20" placeholder="" class="form_textarea"  style="width:100%" data-json-obj="true" ></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="testGrid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</form>


<script type="text/javascript">


/******************************************
 * 함수영역 - start
 ******************************************/


function initDetail() {

}

function processRsltOfSyncCmd(jqXHR, params) {
    // alert(jqXHR);
    // alert(JSON.stringify(jqXHR));
    // alert(JSON.stringify(params));

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    if(params["mesgCd"] == '30001') {  // DMS Check Alive Sync Message

    } else if(params["mesgCd"] == '30002') {  // DMS Bundle List Query Sync Message
        var objTarget = $(objXML).find('bundle');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

//         alert(objTarget.length);
        $('#testGrid').data("kendoExtGrid").dataSource.data(objJson.bundle);

    } else if(params["mesgCd"] == '30003') {  // DMS Bundle Status Query Sync Message
        var objTarget = $(objXML).find('bundle');
        alert(objJson.bundle.symbolic_name);

    } else if(params["mesgCd"] == '30004') {  // Immediately Bundle Deploy Request Sync Message
        var objTarget = $(objXML).find('bundle');
        alert(objJson.bundle.symbolic_name);

    } else if(params["mesgCd"] == '30015') {  // OSGi Bundle Repository Resource Query
        var objTarget = $(objXML).find('resource');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));

        alert(objTarget.length);
        $('#testGrid').data("kendoExtGrid").dataSource.data(objJson.resource);

    } else if(params["mesgCd"] == '10001') {  // Immediately Deploy Request Message
        alert("In processRsltOfSyncCmd");
        var objTarget = $(objXML).find('mesg_code');

    }

}

/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    // SYNC TEST
    $("#btnSync").kendoButton({
        click:function(e) {

            var bundleList = $("#bundleGrid").data("kendoExtGrid").dataSource.data();

            var params = {
                    "syncCommandBundleVOList":bundleList

            };
            params["ipAddr"]          = $("#ipAddr").val();
            params["port"]            = $("#port").val();
            params["dcsMqPort"]       = $("#dcsMqPort").val();

            params["mesgGrpCd"]       = $("#mesgGrpCd").val();
            params["mesgCd"]          = $("#mesgCd").val();
            params["dlrCd"]           = $("#dlrCd").val();
            params["symbolicName"]    = $("#symbolicName").val();
            params["operType"]        = $("#operType").data("kendoExtDropDownList").value();
            params["groupId"]         = $("#groupId").val();
            params["artifactid"]      = $("#artifactid").val();
            params["version"]         = $("#version").val();
            params["specCd"]          = $("#specCd").val();
            params["deployVerNo"]     = $("#deployVerNo").val();


//             alert(JSON.stringify(params));

//             return;
            $('#cmdTcXmlBodyCont').val("");

            $.ajax({
                url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
//                 dataType:'text',
//                 dataType:'xml',  // 에러 발생함
                contentType:'application/json',
//                 contentType:'application/x-www-form-urlencoded', // 에러 발생함
                error:function(jqXHR, status, error) {
                    //dms.notification.error(jqXHR.responseJSON.errors);
                    alert("error");
                    alert(error);

                },
                success:function(jqXHR, textStatus) {

                    $('#cmdTcXmlBodyCont').val(jqXHR);
//                     $('#cmdTcXmlBodyCont').val(JSON.stringify(jqXHR));

                    processRsltOfSyncCmd(jqXHR, params);
                }
            });

        }
    });


    $("#bundleGrid").kendoExtGrid({
        dataSource:[
                      {symbolicName:'bhmc.dcs.dplysvr.ComApiUtilFactory', version:'1.0.0'}
                      ,{symbolicName:'bhmc.dcs.dplysvr.SharedMemoryFactory', version:'1.0.0'}
                     ]

        ,multiSelectWithCheckbox:false
//         ,selectable:"row"
        ,height:150
        ,autoBind:true
        ,pageable:false
        ,navigatable:true
        ,editable:true
        ,columns:[
            {field:"symbolicName", title:"symbolicName", width:280
            }
            ,{field:"version", title:"version", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {


        }

    });

    // Operation Type
    $("#operType").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:'INSTALL', cmmCd:'INSTALL'}, {cmmCdNm:'UNINSTALL', cmmCd:'UNINSTALL'}, {cmmCdNm:'START', cmmCd:'START'}, {cmmCdNm:'STOP', cmmCd:'STOP'}]
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });



    $("#testGrid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:false
        ,height:250
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,columns:[
            {field:"id", title:"ID", width:150
            }
            ,{field:"symbolic_name", title:"symbolic Name", width:350
            }
            ,{field:"version", title:"version", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"modified", title:"Modified Date", width:140
                ,attributes:{"class":"ac"}
            }
            ,{field:"state", title:"STATE", width:100
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {


        }

    });

    var dataSource = new kendo.data.DataSource({
        data:[{ name:"Jane Doe" }, { name:"John Doe" },{ name:"Jane Doe" }, { name:"John Doe" },{ name:"Jane Doe" }, { name:"John Doe" }]
    });

    $('#listView').kendoListView({
        dataSource:dataSource,
        navigatable:true,
        selectable:"row",
        template:"<div>#:name#</div>",
        autoBind:false

    });

    dataSource.read();

    $('#listView').hide();


    $("#btnControl").kendoButton({
        click:function(e){
            $('#listView').show();

        }
    });

});

</script>

