package chn.bhmc.dms.mis.tdt.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.mis.tdt.service.TargetDcptToolSaleService;
import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolSaleVO;
/**
 * <pre>
 * [딜러사] 목표분해도구(판매고문)
 * </pre>
 *
 * @ClassName   : TargetDcptToolSaleController.java
 * @Description : [딜러사] 목표분해도구(판매고문)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetDcptToolSaleController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [딜러사] 목표분해도구(판매고문) 서비스
     */
    @Resource(name="targetDcptToolSaleService")
    TargetDcptToolSaleService targetDcptToolSaleService;

    /**
     * [딜러사] 목표분해도구(판매고문) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdt/selectTargetDcptToolSaleMain.do", method = RequestMethod.GET)
    public String selectTargetDcptToolSaleMain(Model model, TargetDcptToolSaleVO targetDcptToolSaleVO) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        List<TargetDcptToolSaleVO> dcptInfoList = targetDcptToolSaleService.selectTargetDcptToolSaleAll(targetDcptToolSaleVO);

        if(dcptInfoList != null){
            targetDcptToolSaleVO = dcptInfoList.get(0);
        }

        model.addAttribute("targetDcptToolSaleVO", targetDcptToolSaleVO);

        return "/mis/tdt/selectTargetDcptToolSaleMain";
    }

    @RequestMapping(value = "/mis/tdt/selectTargetDcptToolSaleSearch.do", method = RequestMethod.POST)
    public String selectTargetDcptToolSaleSearch(Model model, TargetDcptToolSaleVO targetDcptToolSaleVO) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        List<TargetDcptToolSaleVO> dcptInfoList = targetDcptToolSaleService.selectTargetDcptToolSaleAll(targetDcptToolSaleVO);

        if(dcptInfoList != null){
            targetDcptToolSaleVO = dcptInfoList.get(0);
        }

        model.addAttribute("targetDcptToolSaleVO", targetDcptToolSaleVO);

        return "/mis/tdt/selectTargetDcptToolSaleMain";
    }

}
