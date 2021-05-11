package chn.bhmc.dms.ser.svi.web;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.OrderConfirmManageService;
import chn.bhmc.dms.ser.svi.service.ReviewWarrantyOrderService;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderSearchVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ReviewWarrantyOrderController.java
 * @Description : 保修工单审核
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核
 *               </pre>
 */
@Controller
public class ReviewWarrantyOrderController extends HController {

    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name = "reviewWarrantyOrderService")
    ReviewWarrantyOrderService reviewWarrantyOrderService;
    
    /**
     * 保修工单确认设置Service
     */
    @Resource(name = "orderConfirmManageService")
    OrderConfirmManageService orderConfirmManageService;
    
    /**
     * 保修工单审核页面展示
     * <p>
     * Title:
     * </p >
     * 
     * @author lixinfei 2021年4月2日 下午5:10:24
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/reviewWarrantyOrder/selectReviewWarrantyOrderMain.do", method = RequestMethod.GET)
    public String selectReviewWarrantyOrderMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        
        // 事业部
        model.addAttribute("regionList", orderConfirmManageService.findRegion(null));
        // 办事处
        model.addAttribute("officeList", orderConfirmManageService.findOffice(null));
        
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        
        // SER600 审核状态
        model.addAttribute("approveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER600", null, langCd));
        // SER602 申请原因类别
        model.addAttribute("approveDescList", commonCodeService.selectCommonCodesByCmmGrpCd("SER602", null, langCd));
        // SER031 维修委托类型
        model.addAttribute("roTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        return "/ser/svi/reviewWarrantyOrder/selectReviewWarrantyOrderMain";

    }

    /**
     * 根据条件查询保修工单
     * <p>
     * Title:
     * </p >
     * 
     * @author lixinfei 2021年4月2日 下午5:19:33
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/reviewWarrantyOrder/selectReviewWarrantyOrders.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReviewWarrantyOrderByCondition(@RequestBody ReviewWarrantyOrderSearchVO searchVO)
            throws Exception {

        //设置语言
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setsLangCd(langCd);
        /**
         * 保修工单审核查询，默认带出全部待审核的工单，也就是“审核状态”为“未审核”的工单信息 对应的表字段为：SE_1162T ->
         * REQ_STAT_CD = 01(提报)
         */
        SearchResult result = new SearchResult();
        result.setTotal(reviewWarrantyOrderService.selectReviewWarrantyOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(reviewWarrantyOrderService.selectReviewWarrantyOrderByCondition(searchVO));
        }

        return result;
    }
    
    /**
     * 提交审核结果
     * @author lixinfei 2021年4月2日 下午5:19:33
     * @param warrantyOrderVO
     * @return String
     */
    @RequestMapping(value = "/ser/svi/reviewWarrantyOrder/updateReviewWarrantyOrders.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateReviewWarrantyOrderByCondition(@RequestBody WarrantyOrderVO warrantyOrderVO) throws Exception {
    	return reviewWarrantyOrderService.updateReviewWarrantyOrderByCondition(warrantyOrderVO);
    }

}
