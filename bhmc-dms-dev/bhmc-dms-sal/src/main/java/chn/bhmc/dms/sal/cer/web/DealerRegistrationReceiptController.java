package chn.bhmc.dms.sal.cer.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.cer.service.DealerRegistrationReceiptService;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSaveVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSearchVO;

/**
 * 딜러 영수증 등록
 *
 * @author Bong
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.23         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cer/dealerRegistrationReceipt")
public class DealerRegistrationReceiptController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 영수증 등록 서비스
     */
    @Resource(name="dealerRegistrationReceiptService")
    DealerRegistrationReceiptService dealerRegistrationReceiptService;

    /**
     * 딜러 영수증 등록 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDealerRegistrationReceiptMain.do", method = RequestMethod.GET)
    public String selectDealerRegistrationReceiptMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        return "/sal/cer/dealerRegistrationReceipt/selectDealerRegistrationReceiptMain";
    }


    /**
     * DealerRegistrationReceipt 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerRegistrationReceiptSearchVO
     * @return
     */
    @RequestMapping(value = "/selectDealerRegistrationReceipt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerRegistrationReceipt(@RequestBody DealerReceiptSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(dealerRegistrationReceiptService.selectDealerRegistrationReceiptByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dealerRegistrationReceiptService.selectDealerRegistrationReceiptByCondition(searchVO));
        }

        return result;
    }


    /**
     * 딜러 영수증 정보를(마감일자) 수정 한다.
     * @param saveVO - 수정 목록을 포함하는 DealerReceiptSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/updateDealerRegistrationReceipt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDealerRegistrationReceipt(@Validated @RequestBody DealerReceiptSaveVO saveVO) throws Exception {
        dealerRegistrationReceiptService.updateDealerRegistrationReceipt(saveVO);
        return true;

    }

    /**
     * 딜러 영수증 정보를 삭제 한다.
     * @param DealerReceiptSaveVO - 삭제 목록을 포함하는 DealerReceiptSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/deleteDealerRegistrationReceipt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteDealerRegistrationReceipt(@Validated @RequestBody DealerReceiptSaveVO saveVO) throws Exception {
        dealerRegistrationReceiptService.deleteDealerRegistrationReceipt(saveVO);
        return true;

    }
}
