<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 메세지소스 관리 -->
<section class="group">
    <!-- 그리드 시작 -->
    <div class="table_grid">
                         <input type="hidden" id="sBbsId"        name="sBbsId"       value="${bbsId}" />
                        <input type="hidden" id="sNttId"        name="sNttId"       value="${boardMaster.nttId}" />
                        <input type="hidden" id="sRepTp"        name="sRepTp"       value="${boardMaster.repTp}" />
                        <input type="hidden" id="sCmntUseYn"    name="sCmntUseYn"   value="${boardMaster.cmntUseYn}" />
                        <input type="hidden" id="sNttTileNm" class="form_input">

        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">
    // 게시판 추가  팝업
    var generalBoardWritePopupWin;

    fnGeneralBoardWritePopup = function (board) {
        var grid = $("#grid").data("kendoExtGrid");

        if (board == undefined) {
            // Insert
            generalBoardPopupWin = dms.window.popup({
                windowId:"generalBoardWritePopupWin"
              , title:"<spring:message code="global.title.boardPopup" />"
              , content:{
                    url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoardWritePopup.do' />"
                  , data:{
                        "autoBind"         :false
                      , "flag"             :"I"
                      , "bbsId"            :$("#sBbsId").val()
                      , "repTp"            :$("#sRepTp").val()
                      , "cmntUseYn"        :$("#sCmntUseYn").val()
                      , "nttId"            :""
                      , "nttTitleNm"       :""
                      , "nttCont"          :""
                      , "nttRootId"        :""
                      , "nttRefId"         :""
                      , "repLvlVal"        :"0"
                      , "repSortOrderVal"  :"0"
                      , "fileDocNo"        :""
                      , "regUsrId"         :""
                      , "regDt"            :""
                      , "callbackFunc"     :function (data) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);
                        }
                    }
                }
            });
        }
        else {
            // Update
            generalBoardPopupWin = dms.window.popup({
                windowId:"generalBoardWritePopupWin"
              , title:"<spring:message code='cmm.title.messageTmplGrpMng' />"
              , content:{
                    url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoardWritePopup.do' />"
                  , data:{
                        "autoBind"         :false
                      , "flag"             :"U"
                      , "bbsId"            :$("#sBbsId").val()
                      , "repTp"            :$("#sRepTp").val()
                      , "cmntUseYn"        :$("#sCmntUseYn").val()
                      , "nttId"            :board.nttId
                      , "nttTitleNm"       :board.nttTitleNm
                      , "nttCont"          :board.nttCont
                      , "nttRootId"        :board.nttRootId
                      , "nttRefId"         :board.nttRefId
                      , "repLvlVal"        :board.repLvlVal
                      , "repSortOrderVal"  :board.repSortOrderVal
                      , "fileDocNo"        :board.fileDocNo
                      , "regUsrId"         :board.regUsrId
                      , "regDt"            :board.regDt
                      , "callbackFunc"     :function (data) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);
                        }
                    }
                }
            });
        }
    }

    $(document).ready(function() {


        // 그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoard.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"]    = 5;
                            params["pageIndex"]             = 1;
                            params["firstIndex"]            = 0;
                            params["lastIndex"]             = 5;
                            params["sort"]                  = options.sort;

                            params["sNttTitleNm"]   = $("#sNttTitleNm").val();
                            params["sNttCont"]      = $("#sNttCont").val();
                            params["sBbsId"]        = $("#sBbsId").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"bbsId"
                      , fields:{
                            rnum:            {type:"string", editable     :false}
                          , bbsId:           {type:"string"}
                          , nttId:           {type:"string"}
                          , nttTitleNm:      {type:"string", validation   :{required:true}}
                          , nttCont:         {type:"string", validation   :{required:true}}
                          , nttRootId:       {type:"string", validation   :{required:true}}
                          , nttRefId:        {type:"string", validation   :{required:true}}
                          , repLvlVal:       {type:"number", validation   :{required:true}}
                          , repSortOrderVal: {type:"number", validation   :{required:true, min:0}}
                          , fileNm:          {type:"string", validation   :{required:true}}
                          , fileDocNo:       {type:"string", validation   :{required:true, min:0}}
                          , regUsrId:        {type:"string", editable     :false}
                          , regDt:           {type:"string", editable     :false}
                        }
                    }
                }
            }
            , edit:function(e) {
                e.container.find("input[name=nttTitleNm]").attr("maxlength", 255);
                e.container.find("input[name=nttCont]");
            }
            , multiSelectWithCheckbox:true
            , editableOnlyNew:true
            , height:150
            , pageable:false
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());

                fnGeneralBoardWritePopup(selectedVal);
            }
            , columns:[
                {field:"rnum",        title:"<spring:message code='global.lbl.no' />",          width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"nttTitleNm",  title:"<spring:message code='global.lbl.nttTitleNm' />",  width:250
                  ,template:function (data) {
                      var dataItem1 = data;
                      var txtNbsp = "";
                      if(dataItem1.repLvlVal!=0) {
                          for(var i=1; i<dataItem1.repLvlVal; i++) {
                              txtNbsp = txtNbsp + "&nbsp;&nbsp;"
                          }
                          txtNbsp = txtNbsp + "<span class='icon_reply'></span>";
                      }
                      var title = txtNbsp +" " + dataItem1.nttTitleNm;
                      return title;
                  }
                }
              //, {field:"fileNm",      title:"<spring:message code='global.lbl.fileNm' />",      width:120, format:"{0:n0}", attributes:{"class":"ar"}}
              //, {field:"regUsrId",    title:"<spring:message code='global.lbl.wrtrNm' />",      width:120, attributes:{"class":"ac"}}
              , {field:"regDt",       title:"<spring:message code='global.lbl.wrtrDt' />",      width:150, attributes:{"class":"ac"}}
            ]
        });
    });
</script>