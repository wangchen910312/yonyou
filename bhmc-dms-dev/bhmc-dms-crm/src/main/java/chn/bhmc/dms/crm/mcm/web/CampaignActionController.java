package chn.bhmc.dms.crm.mcm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;

import chn.bhmc.dms.crm.mcm.service.CampaignResultService;

import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

/**
 * 마케팅 캠페인 관리 컨트롤러
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Controller
public class CampaignActionController extends HController {

    /**
     * 캠페인결과 관리 서비스
     */
    @Resource(name="campaignResultService")
    CampaignResultService campaignResultService;

    /**
     * 캠페인실행 관리 서비스
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 캠페인실행 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignAction/selectCampaignActionMain.do", method = RequestMethod.GET)
    public String selectCampaignActionMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형
        model.addAttribute("statList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태
        model.addAttribute("hostList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최
        model.addAttribute("receiveRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM064", null, LocaleContextHolder.getLocale().getLanguage()));     // SMS발송결과

        return "/crm/mcm/campaignAction/selectCampaignActionMain";
    }





    /**
     * 캠페인실행 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignAction/selectCampaignActions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignActions(@RequestBody CampaignResultSearchVO searchVO) throws Exception {
//    public SearchResult selectCampaignActions(@RequestBody CampaignActionSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

//        result.setTotal(campaignActionService.selectCampaignActionsByConditionCnt(searchVO));
//
//        if(result.getTotal() != 0){
//
//            List<CampaignActionVO> selectCampaignActionsByCondition = campaignActionService.selectCampaignActionsByCondition(searchVO);
//
//            result.setData(selectCampaignActionsByCondition);
//        }
        result.setTotal(campaignResultService.selectCampaignResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<CampaignResultVO> selectCampaignResultsByCondition = campaignResultService.selectCampaignResultsByCondition(searchVO);

            result.setData(selectCampaignResultsByCondition);
        }

        return result;

    }





    /**
     * 캠페인실행(SMS) 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignAction/selectActions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActions(@RequestBody CampaignActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(campaignActionService.selectActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<CampaignActionVO> selectActionsByCondition = campaignActionService.selectActionsByCondition(searchVO);

            result.setData(selectActionsByCondition);
        }

        return result;

    }





    /**
     * 캠페인실행이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignAction/selectActionRecords.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActionRecords(@RequestBody CampaignActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(campaignActionService.selectActionRecordsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<CampaignActionVO> selectActionRecordsByCondition = campaignActionService.selectActionRecordsByCondition(searchVO);

            result.setData(selectActionRecordsByCondition);
        }

        return result;

    }

    /**
     * 대상자를 콜센터로 전송한다.
     * @param campaignActionVO - 대상자 정보
     * @return saveVO
     */
    @RequestMapping(value = "/crm/cmm/campaignAction/selectCallCenterSends.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectCallCenterSends(@RequestBody CampaignActionVO campaignActionVO)throws Exception {

        Map<String,Object> result = new HashMap<String,Object>();

        campaignActionVO.setRegUsrId(LoginUtil.getUserId());
        campaignActionVO.setUpdtUsrId(LoginUtil.getUserId());
        campaignActionVO.setBizCd("06");

        CampaignActionVO saveVO = new CampaignActionVO();

        saveVO = campaignActionService.selectCallCenterSends(campaignActionVO);

        result.put("result", saveVO.getResult());

        return result;
    }
}