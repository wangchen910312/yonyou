package chn.bhmc.dms.bat.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemPriceService;

/**
 * 부품예류 취소 배치 관리 컨트롤러
 *
 * @author In Bo Shim
 * @since 2017. 2. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.02.22         In Bo Shim            최초 생성
 * </pre>
 */
@Controller
public class BatchPartsItemPriceActionController extends HController {

    /**
     * 부품가격 인터페이스 서비스
     */
    @Resource(name="batchPartsItemPriceService")
    BatchPartsItemPriceService batchPartsItemPriceService;

    /**
     *  부품예류 자동취소.
     * @return
     */
    @RequestMapping(value = "/bat/par/partsPriceMaster/executeItemPriceProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBatchPartsIssueReadyActionCancel() throws Exception {

        batchPartsItemPriceService.executeItemPriceProcedure("PTS407");
        return true;

    }

}
