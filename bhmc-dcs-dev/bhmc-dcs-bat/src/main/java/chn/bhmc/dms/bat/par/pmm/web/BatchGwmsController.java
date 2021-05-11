package chn.bhmc.dms.bat.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsMarkupService;
import chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsPriceService;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchGwmsController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 10.     In Bo Shim     최초 생성
 * </pre>
 */
@Controller
public class BatchGwmsController extends HController {

    /**
     * GWMS 가격 인터페이스 서비스
     */
    @Resource(name="batchGwmsPartsPriceService")
    BatchGwmsPartsPriceService batchGwmsPartsPriceService;

    /**
     * GWMS 가격 마크업 인터페이스 서비스
     */
    @Resource(name="batchGwmsPartsMarkupService")
    BatchGwmsPartsMarkupService batchGwmsPartsMarkupService;

    /**
     * 정비수령조회 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/gwms/selectGwmsProcedureMain.do", method = RequestMethod.GET)
    public String selectIssueReqStatusMain(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        return "/par/gwms/selectGwmsProcedureMain";

    }

    /**
     *  GWMS 부품 마크업 프로시져를 호출한다.
     * @return
     */
    @RequestMapping(value = "/bat/par/pmm/selectBatchGwmsPartsMarkupProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectBatchGwmsPartsMarkupProcedure() throws Exception {

        //GWMS 부품 마크업 정보 가져오기 프로시져 호출.
        batchGwmsPartsMarkupService.executeGwmsPartsMarkupProcedure();

        return true;
    }

    /**
     *  GWMS 부품 가격 프로시져를 호출한다.
     * @return
     */
    @RequestMapping(value = "/bat/par/pmm/selectBatchGwmsPartsPriceProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectBatchGwmsPartsPriceProcedure() throws Exception {

        //GWMS 부품 가격 정보 가져오기 프로시져 호출.
        batchGwmsPartsPriceService.executeGwmsPartsPriceProcedure();

        return true;
    }

}
