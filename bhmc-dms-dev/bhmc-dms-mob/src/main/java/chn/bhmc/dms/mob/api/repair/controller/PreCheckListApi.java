package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCarInfoService;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.api.repair.service.RepairPreCheckService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.PreCheckSearchVO;
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
 * @ClassName   : MobPreCheckListController.java
 * @Description : 사전점검현황 Controller
 * @author JongHee Lim
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
@Api("维修-服务接待-接车检查查询 ")
@RequestMapping(value = "/api/repair/preCheckList")
public class PreCheckListApi  extends HController{

    @Autowired
    RepairPreCheckService RepairPreCheckService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    RepairLtsModelMappingService RepairLtsModelMappingService;


    @Resource(name="RepairSystemConfigInfoService")
    RepairSystemConfigInfoService RepairSystemConfigInfoService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="RepairCommonCodeService")
    RepairCommonCodeService RepairCommonCodeService;

    @Resource(name="RepairCarInfoService")
    RepairCarInfoService RepairCarInfoService;


    /**
     * 사전점검 메인 화면을 출력한다.
     * @return
     */
    @ResponseBody
    @ApiOperation("接车检查查询页面加载")
    @RequestMapping(value="/selectPreCheckListMain.do", method = RequestMethod.GET)
    public BaseJSON selectPreCheckListMain(Model model) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", RepairLtsModelMappingService.selectLtsModelsByCondition(searchVO));
        //입고점검유형
        model.addAttribute("carAcptTp", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));

        //사전점검상태
        model.addAttribute("diagStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER023", null, langCd));
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carLineList", RepairCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        baseJSON.setResult(model);
        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/preCheck/baseJsp/selectPreCheckListMain.jsp");
        return baseJSON;
    }
    /**
    *
    * 사전점검  정보 조회
    *
    * @param searchVO - 사전점검  정보 조회
    * @return
    * @throws Exception
    */
    @ApiOperation("接车检查查询")
    @RequestMapping(value="/selectPreCheckListMains.do" , method=RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectPreCheckListMains(@RequestBody PreCheckSearchVO searchVO)throws Exception{
        BaseJSON  baseJ = new BaseJSON();

        SearchResult result = new SearchResult();
        try {
        	result.setTotal(RepairPreCheckService.selectPreCheckListByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(RepairPreCheckService.selectPreCheckListByCondition(searchVO));
            }
            baseJ.setResult(result);
		} catch (Exception e) {
			 baseJ.setResultCode(1);
			 baseJ.setResultMsg("失败");
			e.printStackTrace();
		}


        return baseJ;
    }

}
