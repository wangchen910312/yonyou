package chn.bhmc.dms.mob.api.part.controller;

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

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqDetailService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqResvStatusService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqTechManService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqDetailVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


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
@RequestMapping("/api/part/IssueReq")
@Api("配件领用汇总")
public class IssueReqApi {
	
//    /**
//     * 출고등록 서비스
//     */
//    @Resource(name="issuePartsOutService")
//    IssuePartsOutService issuePartsOutService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService partCommonCodeService;

//    /**
//     * 차량,모델,OCN, 로컬옵션 정보 서비스
//     */
//    @Resource(name="carInfoService")
//    CarInfoService carInfoService;

//    /**
//     * ABC Class
//     */
//    @Resource(name="abcClassService")
//    AbcClassService abcClassService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService partStorageService;

    /**
     * 구매요청 서비스
     */
    @Resource(name="PartIssueReqService")
    PartIssueReqService partIssueReqService;

    /**
     * 구매요청상세 서비스
     */
    @Resource(name="PartIssueReqDetailService")
    PartIssueReqDetailService partIssueReqDetailService;

    /**
     * SA 서비스
     */
    @Resource(name="PartIssueReqTechManService")
    PartIssueReqTechManService partIssueReqTechManService;

    /**
     * 부품예약현황 서비스
     */
    @Resource(name="PartIssueReqResvStatusService")
    PartIssueReqResvStatusService partIssueReqResvStatusService;

    /**
     * 출고확정 메인
     */
    @ApiOperation("配件领用(页面加载)")
    @RequestMapping(value = "/selectIssueReqStatusMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectIssueReqStatusMain(Model model) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //RO상태
        model.addAttribute("roStatusCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeRoVO = partCommonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeRoVO != null){
            parGiTpList.add(commonCodeRoVO);
        }
        // 공통코드 : 위탁서 유형(IN) : 내부운용
        CommonCodeVO commonCodeInVO = partCommonCodeService.selectCommonCodeByKey("PAR301", "IN");
        if(commonCodeInVO != null){
            parGiTpList.add(commonCodeInVO);
        }
        // 공통코드 : 위탁서 유형(BR) : 정비차용
        CommonCodeVO commonCodeBrVO = partCommonCodeService.selectCommonCodeByKey("PAR301", "BR");
        if(commonCodeBrVO != null){
            parGiTpList.add(commonCodeBrVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);

        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("tecCdList", partIssueReqTechManService.selectTechManFnMasterByCondition(searchVO));

        //RO유형
        model.addAttribute("roTpCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", partStorageService.selectStoragesByCondition(storageSearchVO));

        /*model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/ism/issueReq/baseJsp/selectIssueReqStatusMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateE";*/
        baseJSON.setResult(model);
        return baseJSON;
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
        mainList = partIssueReqService.selectIssueReqsByCondition(searchVO);


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

//    /** 与实际调用方法名重复
//     * 출고확정 부품 목록 [조회]
//     */
//    @RequestMapping(value = "/mob/par/ism/issueReq/selectIssueReqStatusItemLists", method = RequestMethod.POST)
//    @ResponseBody
//    public SearchResult selectIssueReqDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        SearchResult result = new SearchResult();
//        // 딜러코드
//        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
//        // 센터코드
//        searchVO.setsPltCd(mobLoginVO.getPltCd());
//        result.setTotal(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO));
//
//        if (result.getTotal() != 0) {
//            result.setData(issueReqDetailService.selectIssueReqDetailsByCondition(searchVO));
//        }
//
//        return result;
//    }

    /**
     * 정비수령 부품요청상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIssueReqDetailes.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("配件领用明细查询")
    public BaseJSON selectIssueReqDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(partIssueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partIssueReqDetailService.selectIssueReqDetailsByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);

        return json;
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
        list = partIssueReqDetailService.selectIssueReqDetailsByCondition(searchVO);

        if (list != null) {
            if (list.size() == 1) {
                issueReqDetailVO = list.get(0);
            }
        }

        return issueReqDetailVO;
    }

//    /**
//     * 출고확정 등록
//     */
//    @RequestMapping(value = "/mob/par/ism/issueReq/insertIssueReqStatus.do", method = RequestMethod.POST)
//    @ResponseBody
//    public IssuePartsOutSaveVO insertIssuePartsOutInves(@RequestBody IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception{
//        issuePartsOutService.insertIssuePartsOut(issuePartsOutSaveVO);
//        return issuePartsOutSaveVO;
//    }
//
    
    /**
     * 부품예약현황 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIssueReqReserveStatus.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("配件领用查询")
    public BaseJSON selectIssueReqReserveStatus(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(partIssueReqResvStatusService.selectIssueReqResvStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partIssueReqResvStatusService.selectIssueReqResvStatusByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);

        return json;

    }


}