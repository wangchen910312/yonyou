package chn.bhmc.dms.crm.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CronMakerVO;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmCommonController.java
 * @Description : 공통 컨트롤러
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Controller
public class CrmCommonController extends HController{



    /**
     * Customer Information Management Service
     */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;

    /**
     * Call Information Management Service
     */
    @Resource(name="callInfoService")
    CallInfoService callInfoService;

    /**
     * Address Information Management Service
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * CRM 공통
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 관심차종 정보를 저장 한다.
     * @param carLineInfoVO - 관심차량정보
     * @return
     */
    @RequestMapping(value = "/crm/cmm/carLineInfo/multiCarLineInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCarLineInfo(@RequestBody BaseSaveVO<CarLineInfoVO> saveVO)throws Exception {

        carLineInfoService.multiCarLine(saveVO);
        return true;
    }

    /**
     * 관심차종 정보를 조회 한다.
     * @param carLineInfoSearchVO - 관심차종
     * @return
     */
    @RequestMapping(value = "/crm/cmm/carLineInfo/selectCarLineInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarLineInfo(@RequestBody CarLineInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(carLineInfoService.selectCarLineInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carLineInfoService.selectCarLineInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 콜 정보를 저장 한다.
     * @param callInfoVO - 콜
     * @return
     */
    @RequestMapping(value = "/crm/cmm/callInfo/insertCallInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCallInfo(@RequestBody CallInfoVO saveVO)throws Exception {
        callInfoService.insertCallInfo(saveVO);
        return true;
    }

    /**
     * 콜 정보를 조회한다.
     * @param callInfoVO - 콜
     * @return
     */
    @RequestMapping(value = "/crm/cmm/callInfo/selectCallInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallInfo(@RequestBody CallInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(callInfoService.selectCallInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callInfoService.selectCallInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 주소 정보를 저장 한다.
     * @param addressInfoVO - 주소
     * @return
     */
    @RequestMapping(value = "/crm/cmm/addressInfo/multiAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAddressInfo(@RequestBody BaseSaveVO<AddressInfoVO> saveVO)throws Exception {

        addressInfoService.multiAddressInfo(saveVO);
        return true;
    }

    /**
     * 주소 정보를 조회 한다.
     * @param addressInfoSearchVO - 주소
     * @return
     */
    @RequestMapping(value = "/crm/cmm/addressInfo/selectAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAddressInfo(@RequestBody AddressInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(addressInfoService.selectAddressInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(addressInfoService.selectAddressInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * CRON 주기 설정 팝업
     * @return
     */
    @RequestMapping(value = "/crm/cmm/cronMaker/selectCronMakerPopup.do", method = RequestMethod.GET)
    public String selectCronMakerPopup(Model model) throws Exception {

        return "/crm/cmm/cronMaker/selectCronMakerPopup";
    }


    /**
     * CRON 주기 설정 ( 초,분,시,일,월,주 <-> Cron 주기 변환 )
     * @param CronMakerVO
     * @return CronMakerVO
     */
    @RequestMapping(value = "/crm/cmm/cronMaker/cronExpression.do", method = RequestMethod.POST)
    @ResponseBody
    public CronMakerVO saveCronMaker(@Validated(Draft.class) @RequestBody CronMakerVO saveVO) throws Exception {

        CronMakerVO cronMakerVO = new CronMakerVO();

        cronMakerVO = crmCommonService.cronExpression(saveVO);

        return cronMakerVO;

    }

    /**
     * CRON 주기 설정 ( Cron 주기 변환 <-> 초,분,시,일,월,주 )
     * @return
     */
    @RequestMapping(value = "/crm/cmm/cronMaker/resolveCronMaker.do", method = RequestMethod.POST)
    @ResponseBody
    public CronMakerVO resolveCronMaker(@Validated(Modify.class) @RequestBody CronMakerVO saveVO) throws Exception {

        CronMakerVO cronMakerVO = new CronMakerVO();

        cronMakerVO = crmCommonService.cronExpression(saveVO);

        return cronMakerVO;
    }

}
