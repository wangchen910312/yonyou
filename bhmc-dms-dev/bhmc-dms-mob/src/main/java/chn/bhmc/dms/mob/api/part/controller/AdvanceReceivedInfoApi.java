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

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartAdvanceReceivedInfoDetailService;
import chn.bhmc.dms.mob.api.part.service.PartAdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoSearchVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobAdvanceReceivedInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 2. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 27.     HG                     최초 생성
 * </pre>
 */

@Controller
@RequestMapping("/api/part/AdvanceReceivedInfo")
@Api("配件资金查询")
public class AdvanceReceivedInfoApi extends HController{

     /**
     * 공통코드 관리 서비스(改完)
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    /**
     * 선수금상세 서비스(改完)
     */
    @Resource(name="PartAdvanceReceivedInfoDetailService")
    PartAdvanceReceivedInfoDetailService partAdvanceReceivedInfoDetailService;

    /**
     * 선수금헤더 서비스(改完)
     */
    @Resource(name="PartAdvanceReceivedInfoHeaderService")
    PartAdvanceReceivedInfoHeaderService partAdvanceReceivedInfoHeaderService;
    
    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

     /**
     * 선수금 헤더 메인 화면을 출력한다.
     * (over)
     * @return
     * @throws Exception
     */
    @ApiOperation("配件资金查询(页面加载)")
    @RequestMapping(value = "/selectadvanceReceivedInfoMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectadvanceReceivedInfoMain(Model model) throws Exception {

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 공통코드 : 선수금유형
        model.addAttribute("preAmtTpList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR501", null, LocaleContextHolder.getLocale().getLanguage()));
        //dlrCd
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("_urlBaseJsp","/WEB-INF/jsp/ZnewMob/par/cpm/advanceReceivedInfo/baseJsp/selectAdvanceReceivedInfoMain.jsp");

     //   return "/ZnewMob/templatesNewMob/mobTemplateA";
         BaseJSON  baseJSON =  new BaseJSON();
         baseJSON.setResult(model);
         return baseJSON;

    }

     /**
     * 선수금 리스트 메인 화면을 출력한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoList.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoList(Model model) throws Exception {

        return "/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoList";

    }

    /**
     * 선수금 상세 목록 데이터를 조회한다.
     * over
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAdvanceReceivedInfoDetails.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("明细金额信息")
    public BaseJSON selectAdvanceReceivedInfoDetails(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(searchVO.getsDlrCd());
        result.setTotal(partAdvanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partAdvanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByCondition(searchVO));
        }

        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;

    }

    /**
     * 선수금 헤더 데이터를 조회한다.
     * over
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAdvanceReceivedInfoHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("金额信息头信息")
    public BaseJSON selectAdvanceReceivedInfoHeaderByKey(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = partAdvanceReceivedInfoHeaderService.selectAdvanceReceivedInfoHeaderByKey(searchVO.getsDlrCd());

        if(advanceReceivedInfoHeaderVO == null){
            advanceReceivedInfoHeaderVO = new AdvanceReceivedInfoHeaderVO();
        }
        BaseJSON json = new BaseJSON();
        json.setResult(advanceReceivedInfoHeaderVO);
        return json;

    }
    
   /**
    * 
    * @param searchVO
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/selectGrGiSummary.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("配件统计")
    public BaseJSON   selectGrGiSummary(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
    	BaseJSON json = new BaseJSON();
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
      /*  Date date = new Date();  
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
    	String formatDate = sdf.format(date);
        searchVO.setsGiDtFr(sdf.parse(formatDate));
        searchVO.setsGiDtTo(sdf.parse(formatDate));
        searchVO.setsMvtGrGiTp("I");
        List<String> sMvtTpLst = new ArrayList<String>();
        sMvtTpLst.add("71");
        sMvtTpLst.add("73");
        searchVO.setsMvtTpLst(sMvtTpLst);
        */
     
       List<MvtDocVO> mvtDocList = new ArrayList<MvtDocVO>();;
       mvtDocList.add(mvtDocService.selectGrGiSummary(searchVO));
       result.setData(mvtDocList);
	   json.setResult(result);
        return json;
    }
    
    /**
     * 입출고 현황 데이타(출고)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     */
    @RequestMapping(value = "/selectGiList.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("配件统计-前期判断是否展示")
    public SearchResult selectGiList(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(mvtDocService.selectGiListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(mvtDocService.selectGiList(searchVO));
        }

        return result;
    }

    
   

}
