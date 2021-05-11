package chn.bhmc.dms.mob.api.sales.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesFundStatusService;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusSearchVO;
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
 * @ClassName : MobDayFundStatusController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 19.     HG                 최초 생성
 * </pre>
 */

@Controller
@Api("销售-资金管理-月资金现况")
@RequestMapping(value = "/api/sales/fundStatus")
public class FundStatusApi extends HController {

	/**
	 * 자금현황 서비스
	 */
	@Resource(name = "SalesFundStatusService")
	SalesFundStatusService SalesFundStatusService;

	/**
	 * 월자금현황 View 을 출력한다.
	 *
	 * @return
	 */
	@RequestMapping(value = "/selectFundStatusMain.do", method = RequestMethod.GET)
	public String selectFundStatusMain(Model model) throws Exception {

		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		model.addAttribute("userId", LoginUtil.getUserId());
		model.addAttribute("userNm", LoginUtil.getUserNm());
		model.addAttribute("dlrCd", LoginUtil.getDlrCd());
		model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

		// 현재일자 DateUtil
		String sysDate = DateUtil.getDate("yyyy-MM-dd");
		model.addAttribute("toDay", sysDate);
		model.addAttribute("userId", LoginUtil.getUserId());
		model.addAttribute("dlrCd", LoginUtil.getDlrCd());

		model.addAttribute("_urlBaseJsp",
				"/WEB-INF/jsp/ZnewMob/sal/trm/fundStatus/baseJsp/selectFundStatusMain.jsp");

		return "/ZnewMob/templatesNewMob/mobTemplateA";
	}

	/**
	 * 월별 자금현황을 조회한다.
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("月资金现况查询headList")
	@RequestMapping(value = "/selectFundStatusSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectFundStatusSearch(
			@RequestBody FundStatusSearchVO searchVO) throws Exception {
		SearchResult result = new SearchResult();
		BaseJSON baseJ = new BaseJSON();
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); // 딜러코드
		try {
			result.setTotal(SalesFundStatusService.selectFundStatusByConditionCnt(searchVO));
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}


		if (result.getTotal() == 0) {
			String nYyMm = DateUtil.getDate("yyyyMM");
			String sYyMm = searchVO.getsYy() + searchVO.getsMm();
			if (nYyMm.equals(sYyMm)) {
				result.setTotal(1);
			}
		}

		if (result.getTotal() != 0) {
			result.setData(SalesFundStatusService
					.selectFundStatusByCondition(searchVO));
		}
		baseJ.setResult(result);
		return baseJ;
	}

	/**
	 * 일별 자금현황을 조회한다.
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("月资金现况查询")
	@RequestMapping(value = "/selectFundStatusDaySearch.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectFundStatusDaySearch(
			@RequestBody FundStatusSearchVO searchVO) throws Exception {
		SearchResult result = new SearchResult();
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); // 딜러코드
		BaseJSON baseJ = new BaseJSON();

		try {
			result.setData(SalesFundStatusService
					.selectFundStatusDaysByCondition(searchVO));
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
		baseJ.setResult(result);

		return baseJ;
	}
}
