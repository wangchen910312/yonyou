package chn.bhmc.dms.ser.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.NpnPartSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Controller
public class ServiceCommonController extends HController{


    @Resource(name="serviceCommonService")
    ServiceCommonService serviceCommonService;

    /**
     * 공통부품 서비스
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 공통공임 서비스
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;


    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     *
     * 고객요구사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectCustDemands.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustDemands(@RequestBody TabInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      tianjx 20191021

        result.setData(serviceCommonService.selectCustDemandsByCondition(searchVO));

        result.setTotal(result.getData().size());



        return result;
    }

    /**
     *
     * 고장설명  조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectTrobleDescs.do" , method=RequestMethod.POST)
    @ResponseBody
    public TrobleDescVO selectTrobleDescs(@RequestBody TabInfoSearchVO searchVO)throws Exception{

        TrobleDescVO trobleVO = new TrobleDescVO();

        trobleVO = serviceCommonService.selectTrobleDescsByKey(searchVO);

        if(trobleVO == null)trobleVO = new TrobleDescVO();

        return trobleVO;
    }

    /**
     *
     * 고객요청사항/고장설명  저장
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/tabInfo/multiCustDemand.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean multiTabInfos(@Validated @RequestBody TabInfoSaveVO saveVO)throws Exception{

        serviceCommonService.multiTabInfos(saveVO);

        return true;
    }

    /**
     *
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectEtcIssues.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEtcIssues(@RequestBody TabInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(serviceCommonService.selectEtcIssuesByCondition(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
     *
     * 수리건의 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectLbrSuggest.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLbrSuggest(@RequestBody TabInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(serviceCommonService.selectLbrSuggestByCondition(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 부품 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectServiceParts.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationParts(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(servicePartService.selectServicePartsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(servicePartService.selectServicePartsByCondition(searchVO));
        }

        return result;

     }

    /**
     * 공임 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectServiceLabors.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationLabors(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(serviceLaborService.selectServiceLaborsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(serviceLaborService.selectServiceLaborsByCondition(searchVO));
        }

        return result;

     }

    /**
     * 부품 히스토리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectServicePartsHist.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectServicePartsHist(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(servicePartService.selectServicePartsHistByCondition(searchVO));

        return result;

    }

    /**
     * 공임 히스토리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/tabInfo/selectServiceLaborsHist.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationLaborsHist(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(serviceLaborService.selectServiceLaborsHistByCondition(searchVO));

        return result;

    }

    /**
     * NPN PART 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NpnPartSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/claim/selectNpnParts.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectNpnParts(@RequestBody NpnPartSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(serviceCommonService.selectNpnPartByCondition(searchVO));

        return result;

    }


    @RequestMapping(value="/ser/wa/selectTabletMain.do",  method = RequestMethod.GET)
    public String selectTabletMain(Model model)throws Exception{
        //String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sysDate", sysDate);
        return "/ser/wa/selectTabletMain";
    }
}
