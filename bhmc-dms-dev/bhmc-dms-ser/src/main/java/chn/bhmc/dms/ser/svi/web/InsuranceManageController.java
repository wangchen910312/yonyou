package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.InsuranceManageService;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageController.java
 * @Description : 보험관리 마스터
 * @author Ki Hyun Kwon
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author          description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Controller
public class InsuranceManageController extends HController{


    @Resource(name="insuranceManageService")
    InsuranceManageService insuranceManageService;

    /**
     *
     * 보험관리 메인 화면
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/insurance/selectInsuranceManageMain.do" , method = RequestMethod.GET)
    public String selectInsuranceManageMain(Model model) throws Exception{

        log.debug("selectInsuranceMain Start~");

        model.addAttribute("dlrCd",LoginUtil.getDlrCd());

        return "/ser/svi/insurance/selectInsuranceManageMain";
    }
    
    /**
     *
     * 보험관리화면 목록 데이터 조회
     *
     * @param searchVO : 조회조건 InsuranceMangageSearchVO
     * @return 보험관리 목록 list
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/insurance/selectInsuranceManages.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInsuranceManages(@RequestBody InsuranceManageSearchVO searchVO ) throws Exception{
        SearchResult result = new SearchResult();

        result.setTotal(insuranceManageService.selectInsuranceManagesByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(insuranceManageService.selectInsuranceManagesByCondition(searchVO));
        }
        return result;
    }

    /**
     * 보험관리 정보를 등록한다.
     * Statements
     *
     * @param insuranceMangeVO - 보험관리 정보 등록/수정 정보를 담고있는 VO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/insurance/multiInsuranceMangages.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean multiInsuranceMangages(@Validated @RequestBody InsuranceManageSaveVO saveVO ) throws Exception{

        insuranceManageService.multiInsuranceMangages(saveVO);

        return true;

    }






}
