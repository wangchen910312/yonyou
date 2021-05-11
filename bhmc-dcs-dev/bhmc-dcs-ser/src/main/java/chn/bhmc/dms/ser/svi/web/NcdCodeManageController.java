package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.CcdCodeManageService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.NcdCodeManageService;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdCodeManageController.java
 * @Description : 현상코드 관리 컨트롤러
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class NcdCodeManageController extends HController{

    /**
     * 현상코드관리 서비스
     */
    @Resource(name="ncdCodeManageService")
    NcdCodeManageService ncdCodeManageService;

    @Autowired
    CcdCodeManageService ccdCodeManageServie;

    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     *
     * 현상코드관리 화면 메인
     *
     * @param model
     * @return 현상코드관리 화면
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectNcdCodeManageMain.do")
    public String selectNcdCodeManageMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //현상코드 분류
        model.addAttribute("levelList", commonCodeService.selectCommonCodesByCmmGrpCd("SER092", null, langCd));
        return "/ser/svi/ncCode/selectNcdCodeManageMain";

    }

    /**
     *
     * 현상코드 목록데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 NcdCodeManageSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectNcdCodeManageMains.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNcdCodeManageMains(@RequestBody NcdCodeManageSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        log.debug("LTS MODEL CD :::: > "+ltsModelMappingService.selectLtsModelMapping("LBEPCCDH14X000123"));

        result.setTotal(ncdCodeManageService.selectNcdCodeManageByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(ncdCodeManageService.selectNcdCodeManageByCondition(searchVO));
        }

        return result;
    }

    /**
     *
     * 현상코드 관리 정보를 수정한다.
     *
     * @param saveVO - 현상코드 수정정보가 포함된 NcdCodeManageSaveVO
     * @return
     * @throws Exception
     */

    @RequestMapping(value="/ser/svi/ncCode/updateNcdCodeManages.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean updateNcdCodeManages(@Validated @RequestBody NcdCodeManageSaveVO saveVO)throws Exception{

        ncdCodeManageService.updateNcdCodeManages(saveVO);
        return true;
    }




}
