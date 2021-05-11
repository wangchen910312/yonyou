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
import chn.bhmc.dms.ser.svi.service.CcdCodeManageService;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @Description : 원인코드 관리 컨트롤러
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class CcdCodeManageController extends HController{

    /**
     * 원인코드 관리  서비스
     */
    @Resource(name="ccdCodeManageService")
    CcdCodeManageService ccdCodeManageServie;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 원인코드 관리 메인
     * @param
     * @return 원인코드 화면으로 이동한다.
     */
    @RequestMapping(value="/ser/svi/ccCode/selectCcdCodeManageMain.do", method=RequestMethod.GET)
    public String selectCcdCodeManageMain(Model model) throws Exception{
        //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/svi/ccCode/selectCcdCodeManageMain";
    }

    /**
     *
     * 원인코드 목록데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 CcdCodeManageSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ccCode/selectCcdCodeManages.do")
    @ResponseBody
    public SearchResult selectCcdCodeManages(@RequestBody CcdCodeManageSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(ccdCodeManageServie.selectCcdCodeManageByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(ccdCodeManageServie.selectCcdCodeManageByCondition(searchVO));
        }

//        LocaleContextHolder.getLocale().getLanguage()

        return result;
    }


    /**
     *
     * 원인코드 정보를 수정한다.
     *
     * @param saveVO - 원인코드 수정정보가 포함된 CcdCodeManageSaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ccCode/updateCcdCodeManages.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean updateCcdCodeManages(@Validated @RequestBody CcdCodeManageSaveVO saveVO)throws Exception{

        ccdCodeManageServie.updateCcdCodeManages(saveVO);

        return true;
    }

    /**
    *
    * 현상코드 소분류 팝업 목록을 조회한다.
    *
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/svi/ccCode/selectCcdCodePopups.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCcdCodePopups(@RequestBody CcdCodeManageSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(ccdCodeManageServie.selectCcdCodeByKey(searchVO));


       return result;
   }

}
