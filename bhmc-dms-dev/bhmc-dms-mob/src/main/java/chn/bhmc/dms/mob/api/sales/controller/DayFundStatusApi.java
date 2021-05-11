package chn.bhmc.dms.mob.api.sales.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesDayFundStatusService;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusViewVO;
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
 * @ClassName   : MobDayFundStatusController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 19.     HG                 최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/api/sales/dayFundStatus")
@Api("销售-资金管理-日扣款现况")
public class DayFundStatusApi extends HController{

	 /**
     * 일 자금현황 서비스
     */
    @Resource(name="SalesDayFundStatusService")
    SalesDayFundStatusService SalesDayFundStatusService;

     /**
     * 일자금현황 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDayFundStatusMain.do", method = RequestMethod.GET)
    public String selectDayFundStatusConditionMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("toMonth", DateUtil.getDate("yyyyMM"));
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/trm/dayFundStatus/baseJsp/selectDayFundStatusMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 일자금현황 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDayFundStatusSearch.do", method = RequestMethod.POST)
    @ApiOperation("日扣款现况查询")
    @ResponseBody
    public BaseJSON selectDayFundStatusSearch(@RequestBody DayFundStatusSearchVO searchVO) throws Exception {
    	DayFundStatusViewVO   result = new DayFundStatusViewVO();
    	BaseJSON baseJ = new BaseJSON();
    	try {
    		result = SalesDayFundStatusService.selectDayFundStatusByCondition(searchVO);
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
    	baseJ.setResult(result);
    	//baseJ.setResultMsg();
    	//result.getData();

        return baseJ;
    }

}
