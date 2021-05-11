package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.ClaimPioItemManageService;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioItemManageController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class ClaimPioItemManageController extends HController {



    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="claimPioItemManageService")
    ClaimPioItemManageService claimPioItemManageService;

    /**
     * PIO 부품 관리 메인
     * @param
     * @return PIO 부품 관리  화면으로 이동한다.
     */
    @RequestMapping(value="/ser/svi/pioItem/selectClaimPioItemManageMain.do", method=RequestMethod.GET)
    public String selectClaimPioItemManageMain(Model model) throws Exception{
        //사용여부

        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/svi/pioItem/selectClaimPioItemManageMain";
    }

    /**
     *
     * PIO 부품 목록을 조회
     *
     * @param searchVO
     * @return PIO 부품 목록
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/pioItem/selectClaimPioItemManageMains.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimPioItemManageMains(@RequestBody ClaimPioItemSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(claimPioItemManageService.selectClaimPioItemManageByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimPioItemManageService.selectClaimPioItemManageByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value="/ser/svi/pioItem/multiClaimPioItemManage.do",method=RequestMethod.POST)
    @ResponseBody
    public boolean multiClaimPioItemManage(@RequestBody @Validated ClaimPioItemSaveVO saveVO)throws Exception{

        claimPioItemManageService.mulitClaimPioItemMange(saveVO);
        return true;
    }

}
