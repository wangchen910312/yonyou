package chn.bhmc.dms.cmm.ath.taglibs;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.tree.Tree;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.security.vo.MenuVO;
import chn.bhmc.dms.security.web.MenuTreeModel;
import chn.bhmc.dms.security.web.MenuTreeModelBuilder;

public class MenuBuildTag extends TagSupport {
    /**
    *
    */
   private static final long serialVersionUID = -8664286763656469190L;

   /**
    * APP 컨텍스트
    */
   private ApplicationContext context;

   /**
    * 메세지소스
    */
   private MessageSource messageSource;

   /**
    * 화면정보관리서비스
    */
   private ViewInfoService viewInfoService;

   /**
    * 루트 화면ID
    */
   private String rootViewId = Constants.ROOT_VIEW_ID;

   /**
    * 루트 화면명 메세지키
    */
   private String rootViewMesgKey = "global.lbl.rootViewNm";

   /**
    * 시스템구분
    * 'D':딜러
    * 'I':법인
    */
   private String sysCd = Constants.SYS_CD_DLR;

   /**
    * 웹/모바일 구분
    * 'W':웹
    * 'M':모바일
    * 'T':태블릿
    */
   private String webMobileDstinCd = Constants.WEB_MOBILE_DSTIN_CD_WEB;

   /**
     * @param rootViewId the rootViewId to set
     */
    public void setRootViewId(String rootViewId) {
        this.rootViewId = rootViewId;
    }

    /**
     * @param rootViewMesgKey the rootViewMesgKey to set
     */
    public void setRootViewMesgKey(String rootViewMesgKey) {
        this.rootViewMesgKey = rootViewMesgKey;
    }

    /**
     * @param sysCd the sysCd to set
     */
    public void setSysCd(String sysCd) {
        this.sysCd = sysCd;
    }

    /**
     * @param webMobileDstinCd the webMobileDstinCd to set
     */
    public void setWebMobileDstinCd(String webMobileDstinCd) {
        this.webMobileDstinCd = webMobileDstinCd;
    }

   @Override
   public int doStartTag() throws JspException {

       try{
           initializeIfRequired();

           String contextPath = ((HttpServletRequest)pageContext.getRequest()).getContextPath();

           String usrId = LoginUtil.getUserId();
           List<MenuVO> list = null;

           //사용자별 메뉴 목록을 조회한다.
           try{
               list = viewInfoService.selectMenuListByUser(sysCd, webMobileDstinCd, usrId);
           }catch(Exception e){
               return Tag.SKIP_BODY;
           }

           if(list.size() == 0){
               return Tag.SKIP_BODY;
           }

           //메뉴명 다국어 처리
           for(MenuVO menu : list){
               String viewNm = "";

               if(!StringUtils.isBlank(menu.getMesgKey())){
                   viewNm = messageSource.getMessage(menu.getMesgKey(), null, menu.getViewNm(), LocaleContextHolder.getLocale());
               }

               //메뉴명에 T코드 출력적용
               //if(!StringUtils.isBlank(menu.gettCd())){
               //    viewNm += "[" + menu.gettCd() + "]";
               //}
               menu.setViewNm(viewNm);
           }

           //메뉴트리
           Tree<MenuVO> tree = new Tree<MenuVO>();

           //루트메뉴 생성
           MenuVO rootMenu = new MenuVO(rootViewId, null);
           rootMenu.setViewNm(messageSource.getMessage(rootViewMesgKey, null, LocaleContextHolder.getLocale()));

           tree.addNode(rootViewId, null, rootMenu);

           //메뉴트리 구성
           for(MenuVO vo : list){
               //tree.addNode(vo.getParentViewId(), vo.getChildViewId(), vo);
               tree.addNode(vo.getChildViewId(), vo.getParentViewId(), vo);
           }

           //메뉴트리 출력[디버그용]
           //tree.display(rootViewId);

           //메뉴트리 모델 구성
           MenuTreeModel menuTreeModel = (MenuTreeModel)tree.buildTreeModel(rootViewId, new MenuTreeModel(rootViewId, null), new MenuTreeModelBuilder(0));
           
           //웹
           if(Constants.WEB_MOBILE_DSTIN_CD_WEB.equals(webMobileDstinCd)){
               buildWebMenu(menuTreeModel, contextPath);
           //모바일
           }else if(Constants.WEB_MOBILE_DSTIN_CD_MOBILE.equals(webMobileDstinCd)){
               buildMobileMenu(menuTreeModel, contextPath);
           //태블릿
           }//else{
           //    buildWebMenu(menuTreeModel, contextPath);
           //}

       }catch(Exception e){
           e.printStackTrace();
           throw new JspException(e);
       }

       return Tag.SKIP_BODY;
   }

   /**
    * 웹메뉴 생성
    *
    * @param model
    * @param contextPath
    * @throws IOException
    */
   private void buildWebMenu(MenuTreeModel model, String contextPath) throws IOException{
       StringBuilder sb = new StringBuilder(1000);
       sb.append("<div class=\"gnb_wrap\">\n");
       sb.append("<ul id=\"gnb\">\n");
       sb.append("    <li class=\"nav_favorites\"><a id=\"favoriteMenu\" href=\"javascript:;\">").append(messageSource.getMessage("global.menu.fav", null, LocaleContextHolder.getLocale())).append("</a>\n");
       sb.append("       <ul class=\"depth2_area scrollbar-outer\">\n");
       sb.append("            <li>\n");
       sb.append("                <ul id=\"fav_cont\">\n");
       sb.append("                </ul>\n");
       sb.append("            </li>\n");
       sb.append("        </ul>\n");
       sb.append("    </li>\n");

       buildWebMenuItem(model, sb, contextPath);

       sb.append("</ul>\n");
       sb.append("</div>\n");
       sb.append("<a href=\"javascript:;\" id=\"btn_closeGnb\" class=\"btn_closeGnb\"></a>\n");

       //자바스크립트 생성
       sb.append("<script type=\"text/javascript\">\n");
       sb.append("//즐겨찾기 초기화\n");
       sb.append("function initFavorite(){\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/selectFavorites.do").append("\"\n");
       sb.append("        ,data:\"webMobileDstinCd=W\" //웹:W, 모바일:M\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(favoriteList) {\n");
       sb.append("      htmlText=\"\";\n");
       sb.append("      for(var i=0; i<favoriteList.length; i++) {\n");
       sb.append("          htmlText = htmlText + \"<li id=\\\"favList\" + favoriteList[i].viewId + \"\\\"><a class=\\\"menuItem\\\" data-viewId=\\\"\" + favoriteList[i].viewId + \"\\\" data-url=\\\"\" + _contextPath + favoriteList[i].viewUrl + \"\\\" data-title=\\\"\" + favoriteList[i].viewNm + \"\\\" data-tCd=\\\"\" + dms.string.defaultString(favoriteList[i].tCd, \"\") + \"\\\" href=\\\"javascript:;\\\">\" + favoriteList[i].viewNm + \"</a> <button onclick=\\\"removeFavorite(this, '\" + favoriteList[i].viewId + \"')\\\" class=\\\"btn_favorites active\\\" ></button></li>\";\n");
       sb.append("          $('#menuFavIcon' + favoriteList[i].viewId).addClass(\"active\")\n");
       sb.append("      }\n");

       sb.append("      $('#fav_cont').html(htmlText);\n");
       sb.append("      _favoriteReloadFlag = false;\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 추가/삭제 토글\n");
       sb.append("function toggleFavorite(element, viewId, viewNm, viewUrl, tCd){\n");
       sb.append("    var actionUrl;\n");
       sb.append("    //즐겨찾기 삭제\n");
       sb.append("    if($(element).hasClass(\"active\")){\n");
       sb.append("        removeFavorite(element, viewId);\n");
       sb.append("    //즐겨찾기 추가\n");
       sb.append("    }else{\n");
       sb.append("        addFavorite(element, viewId, viewNm, viewUrl, tCd);\n");
       sb.append("    }\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 추가\n");
       sb.append("function addFavorite(element, viewId, viewNm, viewUrl, tCd){\n");
       sb.append("    tCd = dms.string.defaultString(tCd, \"\");\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/insertFavorite.do").append("\"\n");
       sb.append("        ,data:\"viewId=\" + viewId\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(viewData) {\n");
       sb.append("        //메뉴 즐겨찾기 아이콘 활성화\n");
       sb.append("        $(element).addClass(\"active\");\n");

       sb.append("        //즐겨찾기 목록에 추가\n");
       sb.append("        htmlText=\"<li id=\\\"favList\" + viewId + \"\\\"><a class=\\\"menuItem\\\" data-viewId=\\\"\" + viewId + \"\\\" data-url=\\\"\" + viewUrl + \"\\\" data-title=\\\"\" + viewNm + \"\\\" data-tCd=\\\"\" + tCd + \"\\\" href=\\\"javascript:;\\\">\" + viewNm + \"</a> <button onclick=\\\"removeFavorite(this, '\" + viewId + \"')\\\" class=\\\"btn_favorites active\\\" ></button></li>\";\n");
       sb.append("        $('#fav_cont').html($('#fav_cont').html() + htmlText);\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 삭제\n");
       sb.append("function removeFavorite(element, viewId){\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/deleteFavorite.do").append("\"\n");
       sb.append("        ,data:\"viewId=\" + viewId\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(viewData) {\n");
       sb.append("        //메뉴 즐겨찾기 아이콘 비활성화\n");
       sb.append("        $(\"#menuFavIcon\" + viewId).removeClass(\"active\");\n");

       sb.append("        //즐겨찾기 목록에서 삭제\n");
       sb.append("        $(\"#favList\" + viewId).remove();\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("$(document).ready(function() {\n");
       sb.append("    //메뉴 슬라이더 구성\n");
       sb.append("    $('.scrollbar-outer').scrollbar();\n");

       sb.append("    //메뉴클릭시 탭메뉴 생성\n");
       sb.append("    $('#gnb').on(\"click\", \".menuItem\", function(e) {\n");
       sb.append("        var data = $(this).data();\n");

       sb.append("        _addTabMenu(data.title, data.url, data.tcd, data.viewid);\n");
       sb.append("        $(\"#btn_closeGnb\").click();\n");
       sb.append("    });\n");

       sb.append("    //즐겨찾기 초기화\n");
       sb.append("    initFavorite();\n");
       sb.append("});\n");
       sb.append("</script>\n");

       pageContext.getOut().println(sb.toString());
   }

   /**
    * 웹메뉴 목록 구성
    *
    * @param model
    * @param sb
    */
   private void buildWebMenuItem(MenuTreeModel model, StringBuilder sb, String contextPath){
       if(model.isHasChildren()){

           for(MenuTreeModel child : model.getChildren()){
               MenuVO menuVO = child.getData();

               switch(child.getLevel()){
                   case 1 :
                       sb.append("    <li class=\"").append(menuVO.getIconNm()).append("\"><a href=\"javascript:;\">").append(menuVO.getViewNm()).append("</a>\n");
                       sb.append("        <ul class=\"depth2_area scrollbar-outer\">\n");
                       break;
                   case 2 :
                       sb.append("            <li>\n");
                       if(StringUtils.isNotBlank(menuVO.getViewUrl())){
                       sb.append("                <a class=\"menuItem\" data-viewId=\"").append(menuVO.getChildViewId()).append("\" data-url=\"").append(contextPath).append(menuVO.getViewUrl()).append("\" data-title=\"").append(menuVO.getViewNm()).append("\" data-tCd=\"").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("\" href=\"javascript:;\">").append(menuVO.getViewNm()).append("</a>\n");
                       }else{
                       sb.append("                <a href=\"javascript:;\">").append(menuVO.getViewNm()).append("</a>\n");
                       }
                       sb.append("                <ul>\n");
                       break;
                   case 3 :
                       if(child.isHasChildren()){
                       sb.append("                    <li class=\"has_4depth\">\n");
                       }else{
                       sb.append("                    <li>\n");
                       };

                       if(StringUtils.isNotBlank(menuVO.getViewUrl())){
                       sb.append("                        <a class=\"menuItem\" data-viewId=\"").append(menuVO.getChildViewId()).append("\" data-url=\"").append(contextPath).append(menuVO.getViewUrl()).append("\" data-title=\"").append(menuVO.getViewNm()).append("\" data-tCd=\"").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("\" href=\"javascript:;\">").append(menuVO.getViewNm()).append("</a>").append(" <button id=\"menuFavIcon").append(menuVO.getChildViewId()).append("\" onclick=\"toggleFavorite(this, '").append(menuVO.getChildViewId()).append("', '").append(menuVO.getViewNm()).append("', '").append(contextPath).append(menuVO.getViewUrl()).append("', '").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("')\" class=\"btn_favorites\"></button>\n");
                       }else{
                       sb.append("                        <a href=\"javascript:;\">").append(menuVO.getViewNm()).append("</a>").append("<button id=\"menuFavIcon").append(menuVO.getChildViewId()).append("\" onclick=\"toggleFavorite(this, '").append(menuVO.getChildViewId()).append("', '").append(menuVO.getViewNm()).append("', '").append(contextPath).append(menuVO.getViewUrl()).append("', '").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("')\" class=\"btn_favorites\"></button>\n");
                       }
                       break;
               }

               if(child.isHasChildren()){
                   buildWebMenuItem(child, sb, contextPath);
               }

               switch(child.getLevel()){
                   case 3 :
                       sb.append("                   </li>\n");
                       break;
                   case 2 :
                       sb.append("                </ul>\n");
                       sb.append("            </li>\n");
                       break;
                   case 1 :
                       sb.append("        </ul>\n");
                       sb.append("    </li>\n");
                       break;
               }
           }
       }
   }

   /**
    * 모바일메뉴 생성
    *
    * @param model
    * @param contextPath
    * @throws IOException
    */
   private void buildMobileMenu(MenuTreeModel model, String contextPath) throws IOException{
       StringBuilder sb = new StringBuilder(1000);
       //sb.append("<div class=\"gnb_wrap\">\n");
       sb.append("<ul id=\"gnb\">\n");
       sb.append("    <li class=\"nav_favorites active\"><span id=\"favorite\" href=\"javascript:;\">").append(messageSource.getMessage("global.menu.fav", null, LocaleContextHolder.getLocale())).append("</span>\n");
       //sb.append("       <ul class=\"depth2_area scrollbar-outer\">\n");
       //sb.append("            <li>\n");
       sb.append("                <ul id=\"fav_cont\">\n");
       sb.append("                </ul>\n");
       //sb.append("            </li>\n");
       //sb.append("        </ul>\n");
       sb.append("    </li>\n");

       sb.append("    <li class=\"nav_allmenu active\"><span>").append(messageSource.getMessage("global.menu.allMenu", null, LocaleContextHolder.getLocale())).append("</span>\n");
       sb.append("      <ul>\n");

       buildMobileMenuItem(model, sb, contextPath);

       sb.append("      </ul>\n");
       sb.append("    </li>\n");


       sb.append("</ul>\n");
       //sb.append("</div>\n");
       //sb.append("<a href=\"javascript:;\" id=\"btn_closeGnb\" class=\"btn_closeGnb\">");

       //자바스크립트 생성
       sb.append("<script type=\"text/javascript\">\n");
       sb.append("//즐겨찾기 초기화\n");
       sb.append("function initFavorite(){\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/selectFavorites.do").append("\"\n");
       sb.append("        ,data:\"webMobileDstinCd=M\" //웹:W, 모바일:M\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(favoriteList) {\n");
       sb.append("      htmlText=\"\";\n");
       sb.append("      for(var i=0; i<favoriteList.length; i++) {\n");
       sb.append("          htmlText = htmlText + \"<li id=\\\"favList\" + favoriteList[i].viewId + \"\\\"><span class=\\\"menu\\\" data-viewId=\\\"\" + favoriteList[i].viewId + \"\\\"  data-url=\\\"\" + _contextPath + favoriteList[i].viewUrl + \"\\\" data-title=\\\"\" + favoriteList[i].viewNm + \"\\\" data-tCd=\\\"\" + favoriteList[i].tCd + \"\\\" href=\\\"javascript:;\\\" onclick=\\\"favClick(this);\\\">\" + favoriteList[i].viewNm + \"</span> <span onclick=\\\"removeFavorite(this, '\" + favoriteList[i].viewId + \"')\\\" class=\\\"btn_favorites active\\\" ></span></li>\";\n");
       sb.append("          $('#menuFavIcon' + favoriteList[i].viewId).addClass(\"active\")\n");
       sb.append("      }\n");

       sb.append("      $('#fav_cont').html(htmlText);\n");
       sb.append("      _favoriteReloadFlag = false;\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 추가/삭제 토글\n");
       sb.append("function toggleFavorite(element, viewId, viewNm, viewUrl, tCd){\n");
       sb.append("    var actionUrl;\n");
       sb.append("    //즐겨찾기 삭제\n");
       sb.append("    if($(element).hasClass(\"active\")){\n");
       sb.append("        removeFavorite(element, viewId);\n");
       sb.append("    //즐겨찾기 추가\n");
       sb.append("    }else{\n");
       sb.append("        addFavorite(element, viewId, viewNm, viewUrl, tCd);\n");
       sb.append("    }\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 추가\n");
       sb.append("function addFavorite(element, viewId, viewNm, viewUrl, tCd){\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/insertFavorite.do").append("\"\n");
       sb.append("        ,data:\"viewId=\" + viewId\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(viewData) {\n");
       sb.append("        //메뉴 즐겨찾기 아이콘 활성화\n");
       sb.append("        $(element).addClass(\"active\");\n");

       sb.append("        //즐겨찾기 목록에 추가\n");
       sb.append("        htmlText=\"<li id=\\\"favList\" + viewId + \"\\\"><span class=\\\"menu\\\" data-viewId=\\\"\" + viewId + \"\\\"  data-url=\\\"\" + viewUrl + \"\\\" data-title=\\\"\" + viewNm + \"\\\" data-tCd=\\\"\" + tCd + \"\\\" href=\\\"javascript:;\\\" onclick=\\\"favClick(this);\\\">\" + viewNm + \"</span> <span onclick=\\\"removeFavorite(this, '\" + viewId + \"')\\\" class=\\\"btn_favorites active\\\" ></span></li>\";\n");
       sb.append("        $('#fav_cont').html($('#fav_cont').html() + htmlText);\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("//즐겨찾기 삭제\n");
       sb.append("function removeFavorite(element, viewId){\n");
       sb.append("    $.ajax({\n");
       sb.append("        url:\"").append(contextPath).append("/deleteFavorite.do").append("\"\n");
       sb.append("        ,data:\"viewId=\" + viewId\n");
       sb.append("        ,type:\"POST\"\n");
       sb.append("        ,dataType:\"json\"\n");
       sb.append("        ,error:function(jqXHR,status,error){\n");
       sb.append("            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);\n");
       sb.append("        }\n");
       sb.append("    }).done(function(viewData) {\n");
       sb.append("        //메뉴 즐겨찾기 아이콘 비활성화\n");
       sb.append("        $(\"#menuFavIcon\" + viewId).removeClass(\"active\");\n");

       sb.append("        //즐겨찾기 목록에서 삭제\n");
       sb.append("        $(\"#favList\" + viewId).remove();\n");
       sb.append("    });\n");
       sb.append("}\n");

       sb.append("$(document).ready(function() {\n");
       /*
       sb.append("    //메뉴 슬라이더 구성\n");
       sb.append("    $('.scrollbar-outer').scrollbar();\n");

       sb.append("    //메뉴클릭시 탭메뉴 생성\n");
       sb.append("    $('#gnb').on(\"click\", \".menuItem\", function(e) {\n");
       sb.append("        var _url = $(this).data(\"url\");\n");
       sb.append("        var _title = $(this).data(\"title\");\n");

       sb.append("        _addTabMenu(_title, _url);\n");
       sb.append("        $(\"#btn_closeGnb\").click();\n");
       sb.append("    });\n");
       */

       sb.append("    //즐겨찾기 초기화\n");
       sb.append("    initFavorite();\n");
       sb.append("});\n");
       sb.append("</script>\n");

       pageContext.getOut().println(sb.toString());
   }

   /**
    * 모바일메뉴 목록 구성
    *
    * @param model
    * @param sb
    */
   private void buildMobileMenuItem(MenuTreeModel model, StringBuilder sb, String contextPath){
       if(model.isHasChildren()){

           for(MenuTreeModel child : model.getChildren()){
               MenuVO menuVO = child.getData();

               switch(child.getLevel()){
                   case 1 :
                       sb.append("    <li><span>").append(menuVO.getViewNm()).append("</span>\n");
                       sb.append("        <ul class=\"depth2_area scrollbar-outer\">\n");
                       break;
                   case 2 :
                       sb.append("            <li>\n");
                       if(StringUtils.isNotBlank(menuVO.getViewUrl())){
                       sb.append("                <span class=\"menuItem\" data-viewId=\"").append(menuVO.getChildViewId()).append("\" data-url=\"").append(contextPath).append(menuVO.getViewUrl()).append("\" data-title=\"").append(menuVO.getViewNm()).append("\" data-tCd=\"").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("\" href=\"javascript:;\">").append(menuVO.getViewNm()).append("</span>\n");
                       }else{
                       sb.append("                <span href=\"javascript:;\">").append(menuVO.getViewNm()).append("</span>\n");
                       }
                       sb.append("                <ul>\n");
                       break;
                   case 3 :
                       if(child.isHasChildren()){
                       sb.append("                    <li class=\"has_4depth\">\n");
                       }else{
                       sb.append("                    <li>\n");
                       }

                       if(StringUtils.isNotBlank(menuVO.getViewUrl())){
                       sb.append("                        <span class=\"menu\" data-viewId=\"").append(menuVO.getChildViewId()).append("\" data-url=\"").append(contextPath).append(menuVO.getViewUrl()).append("\" data-title=\"").append(menuVO.getViewNm()).append("\" data-tCd=\"").append(StringUtils.defaultString(menuVO.gettCd(), "")).append("\" href=\"javascript:;\">").append(menuVO.getViewNm()).append("</span>").append(" <span id=\"menuFavIcon").append(menuVO.getChildViewId()).append("\" onclick=\"toggleFavorite(this, '").append(menuVO.getChildViewId()).append("', '").append(menuVO.getViewNm()).append("', '").append(contextPath).append(menuVO.getViewUrl()).append("', '").append(menuVO.gettCd()).append("')\" class=\"btn_favorites\"></span>\n");
                       }else{
                       sb.append("                        <span class=\"menu\" href=\"javascript:;\">").append(menuVO.getViewNm()).append("</span>").append("<span id=\"menuFavIcon").append(menuVO.getChildViewId()).append("\" onclick=\"toggleFavorite(this, '").append(menuVO.getChildViewId()).append("', '").append(menuVO.getViewNm()).append("', '").append(contextPath).append(menuVO.getViewUrl()).append("', '").append(menuVO.gettCd()).append("')\" class=\"btn_favorites\"></span>\n");
                       }
                       break;
               }

               if(child.isHasChildren()){
                   buildMobileMenuItem(child, sb, contextPath);
               }

               switch(child.getLevel()){
                   case 3 :
                       sb.append("                    </li>\n");
                       break;
                   case 2 :
                       sb.append("                </ul>\n");
                       sb.append("            </li>\n");
                       break;
                   case 1 :
                       sb.append("        </ul>\n");
                       sb.append("    </li>\n");
                       break;
               }
           }
       }
   }

   @Override
   public int doEndTag() throws JspException {
       return EVAL_PAGE;
   }

   /**
    * find context of Spring
    *
    * @return
    */
   protected ApplicationContext getContext() {
       return WebApplicationContextUtils.getRequiredWebApplicationContext(pageContext.getServletContext());
   }

   /**
    * As initialize logic of tag, get Spring context to use viewResourceAccessService bean.
    *
    * @throws JspException
    */
   protected void initializeIfRequired() throws JspException {
       if (context != null) {
           return;
       }

       context = getContext();

       viewInfoService = (ViewInfoService)context.getBean("viewInfoService");
       messageSource = (MessageSource)context.getBean("messageSource");
   }
}
