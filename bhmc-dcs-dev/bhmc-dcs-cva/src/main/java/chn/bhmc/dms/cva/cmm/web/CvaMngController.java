package chn.bhmc.dms.cva.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cva.cmm.service.CvaCommonService;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CvaMngController.java
 * @Description : 고객전체현황관리화면
 * @author Yoon Se Ran
 * @since 2016. 11. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 27.     Yoon Se Ran     최초 생성
 * </pre>
 */
@RequestMapping("/cva/cmm")
@Controller
public class CvaMngController extends HController {

    /**
     * cva 공통 정보 서비스
     */
    @Resource(name="cvaCommonService")
    CvaCommonService cvaCommonService;
    /**
     * cva-1 comment
     * @param cvaCommonService
     * @return
     */
    @RequestMapping(value = "/selectCustomerTotalStatus.do", method = RequestMethod.GET)
    public String selectCustomerTotalStatus(Model model, @Param("pCallMenu") String pCallMenu) throws Exception {
        model.addAttribute("pCallMenu", pCallMenu);

        return "/cva/cmm/selectCustomerTotalStatus";
    }

   /**
    * 딜러마스터에서 딜러조회.
    * @param searchVO - 조회 조건을 포함하는 CvaDealerSearchVO
    * @return

   @RequestMapping(value = "selectCvaDealer.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCvaDealer(@RequestBody CvaDealerSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(cvaCommonService.selectCvaDealerCnt(searchVO));

       if(result.getTotal() > 0){
           result.setData(cvaCommonService.selectCvaDealer(searchVO));
       }

       return result;
   }*/
}
