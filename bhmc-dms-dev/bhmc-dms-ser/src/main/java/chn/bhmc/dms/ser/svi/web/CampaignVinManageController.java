package chn.bhmc.dms.ser.svi.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.ro.vo.DcsBatchActivityQueRecorOfVinVO;
import chn.bhmc.dms.ser.svi.service.CampaignInfoManageService;
import chn.bhmc.dms.ser.svi.service.CampaignVinManageService;
import chn.bhmc.dms.ser.svi.vo.CampaignMasterVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignVinManageController.java
 * @Description : 캠페인 빈 정보 컨트롤러
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
public class CampaignVinManageController extends HController{

    @Resource(name="campaignVinManageService")
    CampaignVinManageService campaignVinManageService;

    @Autowired
    CampaignInfoManageService campaignInfoManageService;

    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     * 캠페인 빈 정보 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignVinManageMain.do" , method=RequestMethod.GET)
    public String selectCampaignInfoManageMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));

        // 사용여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        return "/ser/svi/campaign/selectCampaignVinManageMain";


    }

    /**
     * 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignInfoVin.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignInfoVin(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(campaignInfoManageService.selectCampaignInfoManagesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(campaignInfoManageService.selectCampaignInfoManagesByCondition(searchVO));
        }

        return result;
    }



    /**
     * 캠페인 빈 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 빈 정보 목록 데이터
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignVinInfos.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignVinInfos(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        //result.setTotal(campaignVinManageService.selectCampaignVinInfosCnt(searchVO));

        //if(result.getTotal() != 0){
        //    result.setData(campaignVinManageService.selectCampaignVinInfos(searchVO));
        //}

        result.setData(campaignVinManageService.selectCampaignVinInfos(searchVO));


        return result;
    }

    /**
     * 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보 목록 데이터
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignLbrInfos.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignLbrInfos(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(campaignVinManageService.selectCampaignLbrInfosCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(campaignVinManageService.selectCampaignLbrInfos(searchVO));
        }

        return result;

    }

    /**
     * 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보 목록 데이터
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignItems.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignItems(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(campaignVinManageService.selectCampaignItemsCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(campaignVinManageService.selectCampaignItems(searchVO));
        }

        return result;

    }

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignForVinInfos.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignInfoPopup(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        /*result.setTotal(campaignVinManageService.selectCampaignForVinInfosCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(campaignVinManageService.selectCampaignForVinInfos(searchVO));
        }
*/
        VehOfCustInfoSearchVO vehOfCustInfoSearchVO = new VehOfCustInfoSearchVO();
        vehOfCustInfoSearchVO.setsVinNo(searchVO.getsVinNo());
        String pdiYn = vehOfCustInfoService.selectVehOfPdiChkByKey(vehOfCustInfoSearchVO);

        if(!StringUtil.nullConvert(pdiYn).equals("")){
            searchVO.setsPdiYn(pdiYn);
        }
        List<CampaignMasterVO> campaignList = campaignVinManageService.selectCampaignForVinInfos(searchVO);
        List<CampaignMasterVO> campaignMasterList =new ArrayList<CampaignMasterVO>();
        //result.setData(campaignList);
        //result.setTotal(result.getData().size());
        //R19110702336 售后批量活动校验从DCS获取数据进行校验  贾明  2019-11-8 start
        // DcsBatchActivityQueRecorOfVinVO  创建SER117返回值结果集接受实体
        List<DcsBatchActivityQueRecorOfVinVO>  batchActivityList = new ArrayList<DcsBatchActivityQueRecorOfVinVO>();
        if(0 < campaignList.size()) {
        	for(int i = 0; i< campaignList.size(); i++) {
        		Map<String, Object> message = new HashMap<String, Object>();
            	message.put("I_CR_NO", campaignList.get(i).getCrNo());
            	message.put("I_VIN_NO", searchVO.getsVinNo());
	            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message, "SER117");
	            if (receiveData.getFooter().getIfResult().equals("Z")) {
	            	batchActivityList = receiveData.readMessages(DcsBatchActivityQueRecorOfVinVO.class);
	            	//结果为空,说明活动未使用,可正常显示
	            	if(batchActivityList.isEmpty()) {
	            		campaignMasterList.add(campaignList.get(i));
	            	}
	            }
        	}
        	//将可用的所有活动显示
        	result.setData(campaignMasterList);
        	result.setTotal(result.getData().size());
        }
        //R19110702336 售后批量活动校验从DCS获取数据进行校验  贾明  2019-11-8  end
        return result;

    }



}
