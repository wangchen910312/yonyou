package chn.bhmc.dms.ser.rcv.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustChargeMgmtService;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstVO;
import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveDetailService;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.vo.ServicePackageReceiveSaveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSaveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveController.java
 * @Description : 수납 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.    YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class ServiceReceiveController extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="serviceReceiveService")
    ServiceReceiveService serviceReceiveService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Autowired
    ServiceReceiveDetailService serviceReceiveDetailService;

    @Autowired
    CustChargeMgmtService custChargeMgmtService;

    /**
     * 수납 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveMain.do", method = RequestMethod.GET)
    public String selectServiceReceiveMain(Model model
                        ,@RequestParam(value="rcvDocNo",defaultValue="") String rcvDocNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //청산여부
        model.addAttribute("paymYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //수납상태
        model.addAttribute("receiveCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //시스템일자
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat + " HH:mm:ss"));

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        model.addAttribute("sCalcToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sCalcFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );
        model.addAttribute("rcvDocNo", rcvDocNo );

        return "/ser/rcv/serviceReceive/selectServiceReceiveMain";

    }

    /**
     * 수납 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServiceReceives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceReceives(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {
         
    	
        /**	String dlrCd = LoginUtil.getDlrCd();
        	searchVO.setsDlrCd(dlrCd);
        */

        SearchResult result = new SearchResult();
		if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
	        result.setTotal(serviceReceiveService.selectServiceReceiveByConditionCnt(searchVO));
	    	if(result.getTotal() != 0){
	        	result.setData(serviceReceiveService.selectServiceReceiveByCondition(searchVO));
	        }
	    	return result;
    	}
        //服务历史结算费用(付款类型查询)    
        List<ServiceReceiveVO> list = serviceReceiveService.selectServiceReceiveByCondition(searchVO);
        if(list.size() > 0) {
        	result.setData(list);
        	result.setTotal(list.size());
        }

        return result;

    }

    /**
     * 수납  정보를 수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/updateServiceReceive.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateServiceReceive(@Validated @RequestBody ServiceReceiveVO serviceReceiveVO) throws Exception{

        serviceReceiveService.updateServiceReceive(serviceReceiveVO);

        return true;
    }

    /**
     * 수납  정보를 삭제한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/deleteServiceReceive.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteServiceReceive(@Validated @RequestBody ServiceReceiveVO serviceReceiveVO) throws Exception{

        serviceReceiveService.deleteServiceReceive(serviceReceiveVO);

        return true;
    }

    /**
     * 수납디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectServiceReceiveDetails(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(serviceReceiveDetailService.selectServiceReceiveDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(serviceReceiveDetailService.selectServiceReceiveDetailsByCondition(searchVO));
        }

        return result;

     }

    /**
     * 수납디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveDetailsHist.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectServiceReceiveDetailsHist(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(serviceReceiveDetailService.selectServiceReceiveDetailsHistByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(serviceReceiveDetailService.selectServiceReceiveDetailsHistByCondition(searchVO));
        }

        return result;

    }

    /**
     * 수납  디테일을 등록/수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/multiServiceReceiveDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiServiceReceiveDetail(@Validated @RequestBody ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception{

        serviceReceiveDetailService.multiServiceReceiveDetail(serviceReceiveSaveVO);

        return true;
    }
    /**
     * 수납  디테일을 등록/수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/updateRefundReceiveDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData updateRefundReceiveDetail(@Validated @RequestBody ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception{

        ResponseData detail = serviceReceiveDetailService.updateRefundReceiveDetail(serviceReceiveSaveVO);

        //return true; by wushibin 修改返回类型  boolean ---》 ResponseData
        return detail;
    }

    /**
     * 수납 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveByKey.do",  method = RequestMethod.POST)
    public @ResponseBody ServiceReceiveVO selectServiceReceiveByKey(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        return serviceReceiveService.selectServiceReceiveByKey(searchVO);

     }

    /**
     * 수납 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveStatusMain.do", method = RequestMethod.GET)
    public String selectServiceReceiveStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //청산여부
        model.addAttribute("paymYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //수납등록상태
        model.addAttribute("receiveCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //수납상태
        model.addAttribute("receiveHistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER071", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //시스템일자
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat + " HH:mm:ss"));

        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));


        model.addAttribute("sRcvCpltFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        model.addAttribute("sRcvCpltToDt", DateUtil.getDate(dateFormat));

        return "/ser/rcv/serviceReceive/selectServiceReceiveStatusMain";

    }

    /**
     * 수납현황 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServiceReceiveStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceReceiveStatus(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setTotal(serviceReceiveService.selectServiceReceiveStatusByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(serviceReceiveService.selectServiceReceiveStatusByCondition(searchVO));
        }

        return result;

    }

    /**
     * 수납현황 리스트 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServiceReceiveStatusCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectServiceReceiveStatusCnt(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(serviceReceiveService.selectServiceReceiveStatusByConditionCnt(searchVO));
        return result;
    }


    /**
     * 일괄수납 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rcv/serviceReceive/selectServicePackageReceiveMain.do", method = RequestMethod.GET)
    public String selectServicePackageReceiveMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수납상태
        model.addAttribute("receiveCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //시스탬일자
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat + " HH:mm:ss"));

        return "/ser/rcv/serviceReceive/selectServicePackageReceiveMain";

    }

    /**
     * 일괄수납 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServicePackageReceives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServicePackageReceives(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setTotal(serviceReceiveService.selectServicePackageReceiveByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(serviceReceiveService.selectServicePackageReceiveByCondition(searchVO));
        }

        return result;

    }

    /**
     * 수납  디테일을 등록/수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/multiServicePackageReceiveDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiServicePackageReceiveDetail(@Validated @RequestBody ServicePackageReceiveSaveVO servicePackageReceiveSaveVO) throws Exception{

        serviceReceiveService.multiServicePackageReceives(servicePackageReceiveSaveVO);

        return true;
    }

    /**
     * 고객예치금내역을 조회 한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectCustChargeMst.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustChargeMstByKey(@Validated @RequestBody CustChargeMstSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<CustChargeMstVO> list = new ArrayList<CustChargeMstVO>();
        CustChargeMstVO custChargeMstVO = custChargeMgmtService.selectCustChargeMstByKey(searchVO);

        if(custChargeMstVO != null){
            list.add(custChargeMstVO);
            result.setTotal(list.size());
            result.setData(list);
        } else {
            result.setTotal(0);
        }

        return result;
    }

    /**
     * 수납통계 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServiceReceiveStatsPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderCancelPopup(Model model) throws Exception {

        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, LocaleContextHolder.getLocale().getLanguage()));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/rcv/serviceReceive/selectServiceReceiveStatsPopup";
    }

    /**
     * 일괄수납 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServiceReceiveStats.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceReceiveStats(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setData(serviceReceiveDetailService.selectServiceReceiveStats(searchVO));

        return result;

    }
    
    
    
    /**
     * 修改之前pos下单的
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/updateTrade.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateTrade(@Validated @RequestBody ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception{
        serviceReceiveDetailService.updateTrade(serviceReceiveDetailVO);
        return true;
    }

}
