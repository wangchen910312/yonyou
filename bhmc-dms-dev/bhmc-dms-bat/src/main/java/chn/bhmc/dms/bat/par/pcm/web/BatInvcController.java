package chn.bhmc.dms.bat.par.pcm.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO;

/**
 * 송장 배치 관리 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.17         In Bo Shim            최초 생성
 * </pre>
 */
@Controller
public class BatInvcController {

    /**
     * 송장 인터페이스 서비스
     */
    @Resource(name="batInvcInrService")
    BatInvcInrService batInvcInrService;


    /**
     *  송장 인터페이스 정보를 송장 헤더/상세 정보를 저장,수정,삭제 한다.
     * @return
     */
    @RequestMapping(value = "/bat/par/pmm/multiBatInvcInr.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBatInvcInr(@Validated @RequestBody BatInvcInrSearchVO searchVO) throws Exception {

        batInvcInrService.multiBatInvcInr(searchVO);
        return true;

    }

    /**
     * 송장 To DCS 전송
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/pcm/insertInvoiceInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public void insertInvoiceInfo() throws Exception {
        batInvcInrService.insertInvoiceInfo(0);
    }
}
