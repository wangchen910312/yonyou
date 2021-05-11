package chn.bhmc.dms.cmm.sci.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.LanguageCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeVO;
import chn.bhmc.dms.cmm.sci.vo.SystemConfigInfoSaveVO;
import chn.bhmc.dms.cmm.sci.vo.SystemConfigInfoVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemConfigInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class SystemConfigInfoController extends HController {

    /**
     * 시스템 설정 정보 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 언어코드 관리 서비스
     */
    @Resource(name="languageCodeService")
    LanguageCodeService languageCodeService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
    /**
     * 캐시 관리자
     */
    @Resource(name="cacheManager")
    EhCacheCacheManager cacheManager;
    
    /**
	 * 메세지소스 
	 */
	@Resource(name="dataSourceMessageSource")
	ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 시스템 설정 정보 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/systemConfigInfo/selectSystemConfigInfoMain.do", method = RequestMethod.GET)
    public String selectSystemConfigInfoMain(Model model) throws Exception {
        //시스템설정 정보
        List<SystemConfigInfoVO> configList = (List<SystemConfigInfoVO>)systemConfigInfoService.selectSystemConfigInfos();

        //지원대상언어 목록
        LanguageCodeSearchVO languageCodeSearchVO = new LanguageCodeSearchVO();
        languageCodeSearchVO.setsEnabledYn("Y");

        List<LanguageCodeVO> supportLangs = languageCodeService.selectLanguageCodesByCondition(languageCodeSearchVO);

        model.addAttribute("configList", configList);
        model.addAttribute("supportLangs", supportLangs);

        return "/cmm/sci/systemConfigInfo/selectSystemConfigInfoMain";
    }

    /**
     * 시스템 설정 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/systemConfigInfo/updateSystemConfigInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSystemConfigInfo(@Validated @RequestBody SystemConfigInfoSaveVO saveVO) throws Exception {
        systemConfigInfoService.updateSystemConfigInfo(saveVO.getUpdateList());
        return true;
    }
    
    /**
     * 시스템 캐시를 삭제한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/systemConfigInfo/delectCache.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteCache(@Validated @RequestBody List<String> removeCacheList) throws Exception {   
    	for(String cacheName : removeCacheList){
    		if("messageSourceCache".equals(cacheName)){
    			dataSourceMessageSource.clearCache();
    		}else{
    			cacheManager.getCache(cacheName).clear();
    		}
    	}
    	
        return true;
    }
}
