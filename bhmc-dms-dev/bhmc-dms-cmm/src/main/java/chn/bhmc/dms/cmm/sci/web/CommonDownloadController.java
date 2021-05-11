package chn.bhmc.dms.cmm.sci.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import able.com.exception.BizException;
import able.com.vo.HMap;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.util.FileUtils;
import org.jxls.common.Context;
import org.jxls.transform.jexcel.JexcelTransformer;
import org.jxls.util.JxlsHelper;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chn.bhmc.dms.core.context.WebAppContext;
import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.event.DownloadEvent;
import chn.bhmc.dms.core.event.ExcelDownloadEvent;
import chn.bhmc.dms.core.support.excel.ExtJexcelTransformer;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonDownloadController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class CommonDownloadController extends HController {

    /**
     * 공통 엑셀 다운로드
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/sci/selectExcelTemplateDownload.do", method = RequestMethod.GET)
    public ModelAndView selectExcelTemplateDownload(@RequestParam HMap params, HttpServletRequest request) throws Exception {
        //문서파일명 체크
        if (!params.containsKey("fileNm")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        }

        String fileName = (String)params.get("fileNm");
        String filePath = request.getServletContext().getRealPath("/WEB-INF/resources/excelUploadTemplate/" + fileName);

        File destFile = new File(filePath);

        if(!destFile.exists()){
            throw new BizException(messageSource.getMessage("global.error.fileNotFound", null, LocaleContextHolder.getLocale()));
        }

        DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName(fileName);
        downloadVO.setFilePath(destFile.getAbsolutePath());
        downloadVO.setFileSize(destFile.length());

        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("FILE_INFO", downloadVO);

        return mav;
    }

    /**
     * Apache POI 적용 공통 엑셀 다운로드
     *
     * @param params
     * @return
     * @throws Exception
     */
    /*@RequestMapping(value = "/cmm/sci/excelDownload.do", method = RequestMethod.GET)
    public ModelAndView excelDownload(@RequestParam HMap params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //서비스 체크
        if (!params.containsKey("beanName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("templateFile")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("fileName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        }

        String beanName = (String)params.get("beanName");
        String templateFile = (String)params.get("templateFile");
        String fileName = (String)params.get("fileName");

        DownloadEvent downloadEvent = null;
        if(params.get("excelExportId") != null){
        	downloadEvent = new ExcelDownloadEvent(request, response, (String)params.get("excelExportId"));
        }

        Object bean = WebAppContext.getApplicationContext().getBean(beanName);

        if(!(bean instanceof JxlsSupport)) {
            throw new BizException(messageSource.getMessage("global.error.notImplementationJxlsSupport", null, LocaleContextHolder.getLocale()));
        }

        JxlsSupport jxlsSupport = (JxlsSupport)bean;

        Context context = new Context();
        jxlsSupport.initJxlsContext(context, params);

        String destFolderPath = WebContext.getInitParameter("JXLS_TEMP_FOLDER") + "/" + DateUtil.getDate("yyyyMMdd");
        FileUtils.mkdir(new File(destFolderPath), true);

        InputStream is = null;
        OutputStream os = null;
        File destFile = new File(destFolderPath + "/" + fileName);

        try {
            is = new FileInputStream(new File(request.getServletContext().getRealPath("/WEB-INF/resources/excelDownloadTemplate/poi/" + templateFile)));//this.getClass().getClassLoader().getResourceAsStream("excelTemplate/" + templateFile);
            os = new FileOutputStream(destFile);

            JxlsHelper.getInstance().processTemplate(is, os, context);

        } catch(Exception e) {
            e.printStackTrace();
            throw new BizException(messageSource.getMessage("global.error.failedCreateExcel", null, LocaleContextHolder.getLocale()));
        } finally {
            if(is != null){
                try {
                    is.close();
                }catch(IOException e){ e.printStackTrace(); }
            }

            if(os != null){
                try {
                    os.close();
                }catch(IOException e){ e.printStackTrace(); }
            }
        }

        DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName(fileName);
        downloadVO.setFilePath(destFile.getAbsolutePath());
        downloadVO.setFileSize(destFile.length());


        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("DOWNLOAD_EVENT", downloadEvent);
        mav.addObject("FILE_INFO", downloadVO);

        return mav;
    }*/


    /**
     * Java Excel API 적용 공통 엑셀 다운로드
     *
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/sci/excelDownload.do", method = RequestMethod.GET)
    public ModelAndView excelDownload(@RequestParam HMap params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //서비스 체크
        if (!params.containsKey("beanName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("templateFile")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("fileName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        }

        String beanName = (String)params.get("beanName");
        String templateFile = (String)params.get("templateFile");
        String fileName = (String)params.get("fileName");

        templateFile = templateFile.replace(".xlsx", ".xls");
        fileName = fileName.replace(".xlsx", ".xls");

        DownloadEvent downloadEvent = null;
        if(params.get("excelExportId") != null){
            downloadEvent = new ExcelDownloadEvent(request, response, (String)params.get("excelExportId"));
        }

        Object bean = WebAppContext.getApplicationContext().getBean(beanName);

        if(!(bean instanceof JxlsSupport)) {
            throw new BizException(messageSource.getMessage("global.error.notImplementationJxlsSupport", null, LocaleContextHolder.getLocale()));
        }

        //파라메터 공백제거
        for( Object key : params.keySet() ){
            Object value = params.get(key);
            if(value instanceof String){
                params.put(key, StringUtils.trim(value.toString()));
            }
        }

        JxlsSupport jxlsSupport = (JxlsSupport)bean;

        Context context = JexcelTransformer.createInitialContext();
        jxlsSupport.initJxlsContext(context, params);

        String destFolderPath = WebContext.getInitParameter("JXLS_TEMP_FOLDER") + "/" + DateUtil.getDate("yyyyMMdd");
        FileUtils.mkdir(new File(destFolderPath), true);

        InputStream is = null;
        OutputStream os = null;
        File destFile = new File(destFolderPath + "/" + fileName);

        try {
            is = new FileInputStream(new File(request.getServletContext().getRealPath("/WEB-INF/resources/excelDownloadTemplate/jexcel/" + templateFile)));//this.getClass().getClassLoader().getResourceAsStream("excelTemplate/" + templateFile);
            os = new FileOutputStream(destFile);

            ExtJexcelTransformer transformer = ExtJexcelTransformer.createTransformer(is, os);
            transformer.setTimeZone(TimeZone.getDefault());
            JxlsHelper.getInstance().processTemplate(context, transformer);

        } catch(Exception e) {
            e.printStackTrace();
            throw new BizException(messageSource.getMessage("global.error.failedCreateExcel", null, LocaleContextHolder.getLocale()));
        } finally {
            if(is != null){
                try {
                    is.close();
                }catch(IOException e){ e.printStackTrace(); }
            }

            if(os != null){
                try {
                    os.close();
                }catch(IOException e){ e.printStackTrace(); }
            }
        }

        DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName(fileName);
        downloadVO.setFilePath(destFile.getAbsolutePath());
        downloadVO.setFileSize(destFile.length());


        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("DOWNLOAD_EVENT", downloadEvent);
        mav.addObject("FILE_INFO", downloadVO);

        return mav;
    }

    /**
     * 공통 엑셀 다운로드 진행상태 체크
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/sci/excelDownloadStatus.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Integer> excelDownloadStatus(HttpServletRequest request) throws ServletException, IOException{
    	String excelExportId = request.getParameter("excelExportId");
    	HttpSession session = request.getSession();
    	Map<String, Integer> result = new HashMap<String, Integer>();

    	if(excelExportId != null){
    		if(session.getAttribute(excelExportId) != null){
    			Integer status = (Integer)session.getAttribute(excelExportId);

    			if(status == DownloadEvent.DOWNLOAD_STATUS_END || status == DownloadEvent.DOWNLOAD_STATUS_ERROR){
    				session.removeAttribute(excelExportId);
    			}

    			result.put("status", status);

    			return result;
    		}
    	}

    	result.put("status", DownloadEvent.DOWNLOAD_STATUS_NONE);
    	return result;
    }
}
