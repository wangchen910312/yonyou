package chn.bhmc.dms.bat.par.dli.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.dli.service.BatchDealerInfoService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchDealerInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 27.     Lee Hyeong Gyun     최초 생성
 * </pre>
 */
@Controller
public class BatchDealerInfoController extends HController{

    @Resource(name="batchDealerInfoService")
    BatchDealerInfoService batchDealerInfoService;

    /**
     * 배치 실행 테스트
     * @return chn.bhmc.dms.bat.par.dli.service
     */
    @RequestMapping(value = "/bat/par/dli/batDealerInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public int batDealerInfo() throws Exception {
        return batchDealerInfoService.batDealerInfo();
    }

}
