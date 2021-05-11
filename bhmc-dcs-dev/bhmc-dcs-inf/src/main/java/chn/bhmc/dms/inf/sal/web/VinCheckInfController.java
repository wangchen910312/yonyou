package chn.bhmc.dms.inf.sal.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.inf.sal.service.VinCheckInfService;
import chn.bhmc.dms.inf.sal.vo.VinCheckSearchVO;

/**
 * <pre>
 * </pre>
 *
 * @ClassName   : VinCheckInfController.java
 * @Description : DMS -> DCS VinNo Check Interface
 * @author Choi Kyung Yong
 * @since 2017. 03. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author                  description
 *  ===========    =================    ===========================
 *  2017. 03. 19.   Choi Kyung Yong               최초 생성
 * </pre>
 */
@Controller
public class VinCheckInfController extends HController {

    /**
     * Vin No Check Interace
     */
    @Resource(name="vinCheckInfService")
    VinCheckInfService vinCheckInfService;

    /**
     * Vin No Check Interface
     * @param cvaCommonService
     * @return
     */
   @ResponseBody
   @RequestMapping(value = "/inf/sal/vinCheckInf/selectVinCheckInf.do"/*, method = RequestMethod.POST*/)
   public SearchResult selectVinCheckInf(@RequestBody VinCheckSearchVO vinCheckSearchVO) throws Exception {

       SearchResult result = new SearchResult();
       vinCheckSearchVO.setVinNo("LBEADADC9GX072560");

       result.setData(vinCheckInfService.selectVinCheckInf(vinCheckSearchVO));

       return result;
   }
}
