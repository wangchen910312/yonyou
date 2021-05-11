package chn.bhmc.dms.ser.svi.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.svi.service.CampaignInfoManageService;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignInfoManageController.java
 * @Description : 캠페인 정보 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Controller
public class CampaignInfoManageController extends HController{


    @Resource(name="campaignInfoManageService")
    CampaignInfoManageService campaignInfoManageService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 캠페인 기본정보 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignInfoManageMain.do" , method=RequestMethod.GET)
    public String selectCampaignInfoManageMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("toDt", DateUtil.getDate(dateFormat));
        model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));

        // 사용여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        return "/ser/svi/campaign/selectCampaignInfoManageMain";

    }

    /**
     * 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignInfoManages.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignInfoManages(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(campaignInfoManageService.selectCampaignInfoManagesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(campaignInfoManageService.selectCampaignInfoManagesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 캠페인 상세 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 상세 정보 목록 데이터를 조회한다.
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignInfos.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignInfos(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(campaignInfoManageService.selectCampaignInfosDetailByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(campaignInfoManageService.selectCampaignInfosDetailByCondition(searchVO));
        }

        return result;
    }


}
