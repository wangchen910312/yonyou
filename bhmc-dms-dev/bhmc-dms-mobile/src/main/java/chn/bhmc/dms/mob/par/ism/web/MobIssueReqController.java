package chn.bhmc.dms.mob.par.ism.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobIssueController.java
 * @Description : 출고확정 Controller
 * @author JongHee Lim
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobIssueReqController {
    /**
     * 출고등록 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 구매요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 구매요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /**
     * 출고확정 메인
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusMain.do", method = RequestMethod.GET)
    public String selectIssueReqStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeRoVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeRoVO != null){
            parGiTpList.add(commonCodeRoVO);
        }
        // 공통코드 : 위탁서 유형(IN) : 내부운용
        CommonCodeVO commonCodeInVO = commonCodeService.selectCommonCodeByKey("PAR301", "IN");
        if(commonCodeInVO != null){
            parGiTpList.add(commonCodeInVO);
        }
        // 공통코드 : 위탁서 유형(BR) : 정비차용
        CommonCodeVO commonCodeBrVO = commonCodeService.selectCommonCodeByKey("PAR301", "BR");
        if(commonCodeBrVO != null){
            parGiTpList.add(commonCodeBrVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);

        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterByCondition(searchVO));

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/ism/issueReq/baseJsp/selectIssueReqStatusMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateE";
    }


    /**
     * 출고확정 목록
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusList.do", method = RequestMethod.GET)
    public String selectIssueReqStatusList(Model model) throws Exception {
        return "/mob/par/ism/issueReq/selectIssueReqStatusList";
    }

    /**
     * 출고확정 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 딜러코드
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(mobLoginVO.getPltCd());

        List<IssueReqVO> mainList = new ArrayList<IssueReqVO>();
        mainList = issueReqService.selectIssueReqsByCondition(searchVO);


        // jhlim todo
        /*
        ArrayList<String> keyList = new ArrayList<String>();
        List<IssueReqVO> newList = new ArrayList<IssueReqVO>();

        if(mainList != null){
            if(mainList.size() > 0){
                for(int i=0; i<mainList.size(); i++){
                    keyList.add(mainList.get(i).getParReqDocNo());
                }
                //HashSet<String> hs = new HashSet<String>(keyList);
                HashSet<String> hs = new LinkedHashSet<String>(keyList);
                Iterator it = hs.iterator();

                for(int i=0; i<keyList.size(); i++){
                    int cnt=0;
                    while(keyList.get(i) != mainList.get(cnt).getParReqDocNo()){
                        newList.add(newList.get(cnt));
                        cnt++;
                    }
                }
            }
        }
        */

        result.setTotal(mainList.size());

        if (result.getTotal() != 0) {
            result.setData(mainList);
        }
        return result;
    }

    /**
     * 출고확정 부품 목록
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusItemList.do", method = RequestMethod.GET)
    public String selectIssueReqStatusItemList(Model model) throws Exception {
        return "/mob/par/ism/issueReq/selectIssueReqStatusItemList";
    }

    /**
     * 출고확정 부품 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusItemLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(mobLoginVO.getPltCd());
        result.setTotal(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(issueReqDetailService.selectIssueReqDetailsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 출고확정 푸품 상세 [조회]
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusItemListDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqDetailVO selectIssueReqDetaile(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 딜러코드
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(mobLoginVO.getPltCd());

        List<IssueReqDetailVO> list = new ArrayList<IssueReqDetailVO>();
        list = issueReqDetailService.selectIssueReqDetailsByCondition(searchVO);

        if (list != null) {
            if (list.size() == 1) {
                issueReqDetailVO = list.get(0);
            }
        }

        return issueReqDetailVO;
    }

    /**
     * 출고확정 등록
     */
    @RequestMapping(value = "/mob/par/ism/issueReq/insertIssueReqStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutSaveVO insertIssuePartsOutInves(@RequestBody IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception{
        issuePartsOutService.insertIssuePartsOut(issuePartsOutSaveVO);
        return issuePartsOutSaveVO;
    }
}