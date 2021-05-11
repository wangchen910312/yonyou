package chn.bhmc.dms.sal.ctl.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import able.com.web.HController;
import chn.bhmc.dms.cmm.cmp.vo.CarSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.NumberContrastVO;
import chn.bhmc.dms.cmm.cmp.vo.OrderSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsOrderCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsOrderCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsUpdateSqlVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.ctl.service.OneShotCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngVO;
import chn.bhmc.dms.sal.mon.service.SalesMonthService;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;

/**
 * 원샷마감통제
 *
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                           수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.11.10         Lee Seungmin          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/ctl/oneShotControl")
public class OneShotCtrlMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 마감시간관리 관리 서비스
     */
    @Resource(name="oneShotCtrlMngService")
    OneShotCtrlMngService oneShotCtrlMngService;

    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;
    
    @Resource(name="salesMonthService")
    SalesMonthService salesMonthService;

    /**
     * 원샷마감통제 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDeadlineCtrlMngMain.do", method = RequestMethod.GET)
    public String selectDeadlineCtrlMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectOneShotCtrlMngMain";
    }

    /**
     * 원샷마감통제 좌측 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOneShotCtrlMngLeft.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOneShotCtrlMngLeft(@RequestBody OneShotCtrlMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = oneShotCtrlMngService.selectOneShotLeftByConditionCnt(searchVO);

        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(oneShotCtrlMngService.selectOneShotLeftByCondition(searchVO));
        }

        return result;
    }

    /**
     * 원샷마감통제 우측 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOneShotCtrlMngRight.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOneShotCtrlMngRight(@RequestBody OneShotCtrlMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = oneShotCtrlMngService.selectOneShotRightByConditionCnt(searchVO);

        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(oneShotCtrlMngService.selectOneShotRightByCondition(searchVO));
        }

        return result;
    }

    /**
     * 원샷마감통제 좌측 엑셀업로드
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectOneShotCtrlMngUploadPopupL.do", method = RequestMethod.GET)
    public String selectOneShotCtrlMngLeftUploadPopupL(Model model, HttpServletRequest request) throws Exception {

        //배기등급 : SAL159
        //model.addAttribute("dispGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL159", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/ctl/oneShotControl/selectOneShotCtrlMngUploadPopupL";
    }

    /**
     * 원샷마감통제 우측 엑셀업로드
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectOneShotCtrlMngLeftUploadPopupR.do", method = RequestMethod.GET)
    public String selectOneShotCtrlMngLeftUploadPopupR(Model model, HttpServletRequest request) throws Exception {

        //배기등급 : SAL159
        //model.addAttribute("dispGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL159", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/ctl/oneShotControl/selectOneShotCtrlMngUploadPopupR";
    }

    /**
     * 원샷마감통제 좌측 정보를 수정한다.
     * @param saveVO - 원샷마감통제 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/saveOneShotCtrlMng.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveOneShotCtrlMng(@Validated @RequestBody OneShotCtrlMngSaveVO saveVO) throws Exception {

        oneShotCtrlMngService.saveOneShotCtrlMng(saveVO);

        return true;

    }

    /**
     * 원샷마감통제 좌측 정보 일괄로 수정한다.
     * @param saveVO - 원샷마감통제 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/saveOneShotCtrlMngAll.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveOneShotCtrlMngAll(@Validated @RequestBody OneShotCtrlMngSaveVO saveVO) throws Exception {
        oneShotCtrlMngService.saveOneShotCtrlMngAll(saveVO);
        return true;
    }

    /**
     * 원샷마감통제 좌측 정보 일괄로 수정한다.
     * @param saveVO - 원샷마감통제 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/saveOneShotCtrlMngRightAll.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveOneShotCtrlMngRightAll(@RequestBody OneShotCtrlMngSaveVO saveVO) throws Exception {
        oneShotCtrlMngService.saveOneShotCtrlMngRightAll(saveVO);
        return true;
    }


    /**
     * 파일 업로드
     * @param uploadFile
     * @param progressId
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertOneShotControlConditionUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertCorpStockConditionUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        ExcelUploadStatus status = new ExcelUploadStatus();

        List<OneShotCtrlMngVO> list = new ArrayList<OneShotCtrlMngVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<OneShotCtrlMngVO> excelReader = new ExcelReader<OneShotCtrlMngVO>(OneShotCtrlMngVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);

                /**
                 * 모델, 지도가격, 배기등급을 불러온다.
                 */
                if(list.size() > 0){
                    list = oneShotCtrlMngService.selectSungCityCondition(list);
                }

                result.setTotal(list.size());
                result.setData(list);


            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }
    
    /**
     * 进入DCS自动化月结Tab签
     * @return
     */
    /*@RequestMapping(value = "/selectDcsSalesMonthMain.do", method = RequestMethod.GET)
    public String selectDcsSalesMonthMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        Calendar calendar = new GregorianCalendar();

        calendar.setTime(new Date());

        Calendar calendarYes = new GregorianCalendar();

        calendarYes.setTime(new Date());

        calendarYes.add(calendar.DATE,-1);

     // 현재일자 DateUtil
        String sysDate = DateUtil.getDate(calendar.getTime(),"yyyyMMdd");
        String yesDay  = DateUtil.getDate(calendarYes.getTime(),"yyyyMM");
        
        System.out.println(sysDate);
        System.out.println(yesDay);
        
        model.addAttribute("toDay", sysDate);
        model.addAttribute("yesDay", yesDay);

        return "/sal/ctl/oneShotControl/selectDcsSalesMonthMain";
    }*/
    
    /**
     * 进入DMS自动化月结Tab签
     * @return
     */
    /*@RequestMapping(value = "/selectDmsSalesMonthMain.do", method = RequestMethod.GET)
    public String selectDmsSalesMonthMain(Model model) throws Exception {

 	   String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        
        
        Calendar calendar = new GregorianCalendar();

        calendar.setTime(new Date());

        Calendar calendarYes = new GregorianCalendar();

        calendarYes.setTime(new Date());

        calendarYes.add(calendar.DATE,-1);

     // 현재일자 DateUtil
        String sysDate = DateUtil.getDate(calendar.getTime(),"yyyyMMdd");
        String yesDay  = DateUtil.getDate(calendarYes.getTime(),"yyyyMM");
        
        System.out.println(sysDate);
        System.out.println(yesDay);
        
        model.addAttribute("toDay", sysDate);
        model.addAttribute("yesDay", yesDay);

        return "/sal/ctl/oneShotControl/selectDmsSalesMonthMain";
    }*/
    
    /**
     * 进入车辆选项卡
     * @return
     */
    /*@RequestMapping(value = "/selectDmsSalesCarMain.do", method = RequestMethod.GET)
    public String selectDmsSalesCarMain(Model model) throws Exception {
    	
    	String langCd = LocaleContextHolder.getLocale().getLanguage();
    	
    	model.addAttribute("userId", LoginUtil.getUserId());
    	model.addAttribute("userNm", LoginUtil.getUserNm());
    	model.addAttribute("dlrCd", LoginUtil.getDlrCd());
    	model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm
    	
    	
    	
    	Calendar calendar = new GregorianCalendar();
    	
    	calendar.setTime(new Date());
    	
    	Calendar calendarYes = new GregorianCalendar();
    	
    	calendarYes.setTime(new Date());
    	
    	calendarYes.add(calendar.DATE,-1);
    	
    	// 현재일자 DateUtil
    	String sysDate = DateUtil.getDate(calendar.getTime(),"yyyyMMdd");
    	String yesDay  = DateUtil.getDate(calendarYes.getTime(),"yyyyMM");
    	
    	System.out.println(sysDate);
    	System.out.println(yesDay);
    	
    	model.addAttribute("toDay", sysDate);
    	model.addAttribute("yesDay", yesDay);
    	
    	return "/sal/ctl/oneShotControl/selectDmsSalesCarMain";
    }*/
    
    /**自动化月结start
     * 进入主页面
     * @return
     */
    /*@RequestMapping(value = "/initSalesMonthMain.do", method = RequestMethod.GET)
    public String initSalesMonthMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectDcsSalesMonthMain";
    }*/
    
    @RequestMapping(value = "/updateDcsBySql.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDcsOrderBySql(@RequestBody OrderSearchVO searchVO)throws Exception{
        System.out.println("参数:"+searchVO.getSql());
    	return salesMonthService.updateDcsBySql(searchVO.getSql());
    }
    
    /**
     * 查询DCS没有与SAP同步成功的数据
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDcsErpOrdDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcsErpOrdDetail(@RequestBody TmpDcsOrderCheckVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesMonthService.selectDcsErpOrdDetailCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesMonthService.selectDcsErpOrdDetail(searchVO));
        }

        return result;
    }
    
    /**
     * DMS订单通过页面sql执行
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateDmsOrderBySql.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateDmsOrderBySql(@RequestBody NotAssignedOrderSearchVO searchVO)throws Exception{
    	return salesMonthService.updateDmsOrderBySql(searchVO.getsCarlineCd(),searchVO.getsModelCd(),searchVO.getsDlrCd());
    }
    
    /**
     * 查询DMS没有同步成功的数据
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDmsErpOrdDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsSalesMonth(@RequestBody TmpDmsOrderCheckVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesMonthService.selectDmsErpOrdDetailCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesMonthService.selectDmsErpOrdDetail(searchVO));
        }

        return result;
    }
    
    /**
     * 查询DMS没有同步的车辆数据
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesCar.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsSalesCar(@RequestBody AssignSearchVO searchVO) throws Exception {
    	
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDmsSalesCarCnt(searchVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDmsSalesCar(searchVO));
    	}
    	
    	return result;
    }
    
    /**
     * DMS车辆执行sql
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateDmsCarBySql.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateDmsCarBySql(@RequestBody AssignSearchVO searchVO) throws Exception {
    	return salesMonthService.updateDmsCarBySql(searchVO.getsVinNo1(),searchVO.getsVinNo2());
    
    }
    
    /**
     * DMS车辆修改在途
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateDmsCar.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateDmsCar(@RequestBody AssignSearchVO searchVO) throws Exception {
    	 return salesMonthService.updateDmsCar(searchVO);
    }
    
    /**自动化月结end
     */
    
    /** 2019/6/12 自动化月结增加数量对比 start
     * sap/dcs/dms 数量对比
     * @param 
     * @return SUCCESS OR errorStr
     */
    @RequestMapping(value = "/numberContrast.do", method = RequestMethod.POST)
    @ResponseBody
    public String numberContrast(@RequestBody NumberContrastVO numberContrastVO) throws Exception {
    	 return salesMonthService.updateNumberContrast(numberContrastVO.getMonth());
    }
    
    /**
     * 进入数量对比选项卡
     * @return
     */
    @RequestMapping(value = "/selectNumberContrastMain.do", method = RequestMethod.GET)
    public String selectNumberContrastMain(Model model) throws Exception {
    	
    	return "/sal/ctl/oneShotControl/selectNumberContrastMain";
    }
    /** 
     * 数量对比列表
     * @param numberContrastVO
     * @return SearchResult
     */
    @RequestMapping(value = "/selectNumberContrast.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNumberContrast(@RequestBody NumberContrastVO numberContrastVO) throws Exception {
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectNumberContrastCnt(numberContrastVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectNumberContrast(numberContrastVO));
    	}
    	return result;
    }
    
    
    
    /** 2019/6/12 自动化月结增加数量对比 end
     */
    
    
    //20190620月结修改
    /*-------------------------------------------------------月结Start-------------------------------------------------------*/
    
    /*-------------------------------------------------------页签跳转 Start-------------------------------------------------------*/
    /**
     * 进入月结DCS订单主页面
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesOrderMonthMain.do", method = RequestMethod.GET)
    public String selectDcsSalesOrderMonthMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectDcsSalesOrderMonthMain";
    }
    
    /**
     * 进入DCS订单差异对比签
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesOrderSearchMain.do", method = RequestMethod.GET)
    public String selectDcsSalesOrderSearchMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDcsSalesOrderSearchMain";
    }
    
    /**
     * 进入DCS订单差异处理签
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesOrderManageMain.do", method = RequestMethod.GET)
    public String selectDcsSalesOrderManageMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDcsSalesOrderManageMain";
    }
    
    /**
     * 进入月结DCS车辆主页面
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesCarMonthMain.do", method = RequestMethod.GET)
    public String selectDcsSalesCarMonthMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectDcsSalesCarMonthMain";
    }
    
    /**
     * 进入DCS车辆差异对比签
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesCarSearchMain.do", method = RequestMethod.GET)
    public String selectDcsSalesCarSearchMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDcsSalesCarSearchMain";
    }
    
    /**
     * 进入DCS车辆差异处理签
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesCarManageMain.do", method = RequestMethod.GET)
    public String selectDcsSalesCarManageMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDcsSalesCarManageMain";
    }
    
    /**
     * 进入月结DMS主页面
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesOrderMonthMain.do", method = RequestMethod.GET)
    public String selectDmsSalesOrderMonthMain(Model model) throws Exception {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectDmsSalesOrderMonthMain";
    }
    
    /**
     * 进入DMS订单差异对比签
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesOrderSearchMain.do", method = RequestMethod.GET)
    public String selectDmsSalesOrderSearchMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDmsSalesOrderSearchMain";
    }
    
    /**
     * 进入DMS订单处理签
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesOrderManageMain.do", method = RequestMethod.GET)
    public String selectDmsSalesOrderManageMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDmsSalesOrderManageMain";
    }
    
    /**
     * 进入月结DMS车辆主页面
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesCarMonthMain.do", method = RequestMethod.GET)
    public String selectDmsSalesCarMonthMain(Model model) throws Exception {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        DealerSearchVO searchVO = new DealerSearchVO();
            //사업부 리스트
        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        //원샷마감통제 상태
        model.addAttribute("onShotStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));

        return "/sal/ctl/oneShotControl/selectDmsSalesCarMonthMain";
    }
    
    /**
     * 进入DMS车辆差异对比签
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesCarSearchMain.do", method = RequestMethod.GET)
    public String selectDmsSalesCarSearchMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDmsSalesCarSearchMain";
    }
    
    /**
     * 进入DMS车辆处理签
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesCarManageMain.do", method = RequestMethod.GET)
    public String selectDmsSalesCarManageMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectDmsSalesCarManageMain";
    }
    
    /**
     * 进入执行SQL主页面
     * @return
     */
    @RequestMapping(value = "/selectSalesMonthUpdateBySqlMain.do", method = RequestMethod.GET)
    public String selectSalesMonthUpdateBySqlMain(Model model) throws Exception{

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        //获得月结月份
        Calendar cale = null;  
        cale = Calendar.getInstance();  
        int day = cale.get(Calendar.DATE);
        
        String checkMonth="";
        //如果是月初，则取上个月的月份，否则取当月
        if(day<3){
        	cale.setTime(new Date());//设置当前日期
        	cale.add(Calendar.MONTH, -1);//月份减一
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        else{
        	checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
        }
        model.addAttribute("checkMonth", checkMonth);

        return "/sal/ctl/oneShotControl/selectSalesMonthUpdateBySqlMain";
    }
    
    /**
     * 进入DCS执行SQL页签
     * @return
     */
    @RequestMapping(value = "/selectDcsSalesUpdateBySqlMain.do", method = RequestMethod.GET)
    public String selectDcsSalesUpdateBySqlMain(Model model) throws Exception{
    	
    	String langCd = LocaleContextHolder.getLocale().getLanguage();
    	
    	model.addAttribute("userId", LoginUtil.getUserId());
    	model.addAttribute("userNm", LoginUtil.getUserNm());
    	model.addAttribute("dlrCd", LoginUtil.getDlrCd());
    	model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm
    	
    	//获得月结月份
    	Calendar cale = null;  
    	cale = Calendar.getInstance();  
    	int day = cale.get(Calendar.DATE);
    	
    	String checkMonth="";
    	//如果是月初，则取上个月的月份，否则取当月
    	if(day<3){
    		cale.setTime(new Date());//设置当前日期
    		cale.add(Calendar.MONTH, -1);//月份减一
    		checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
    	}
    	else{
    		checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
    	}
    	model.addAttribute("checkMonth", checkMonth);
    	
    	return "/sal/ctl/oneShotControl/selectDcsSalesUpdateBySqlMain";
    }
    
    /**
     * 进入DMS执行SQL页签
     * @return
     */
    @RequestMapping(value = "/selectDmsSalesUpdateBySqlMain.do", method = RequestMethod.GET)
    public String selectDmsSalesUpdateBySqlMain(Model model) throws Exception{
    	
    	String langCd = LocaleContextHolder.getLocale().getLanguage();
    	
    	model.addAttribute("userId", LoginUtil.getUserId());
    	model.addAttribute("userNm", LoginUtil.getUserNm());
    	model.addAttribute("dlrCd", LoginUtil.getDlrCd());
    	model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm
    	
    	//获得月结月份
    	Calendar cale = null;  
    	cale = Calendar.getInstance();  
    	int day = cale.get(Calendar.DATE);
    	
    	String checkMonth="";
    	//如果是月初，则取上个月的月份，否则取当月
    	if(day<3){
    		cale.setTime(new Date());//设置当前日期
    		cale.add(Calendar.MONTH, -1);//月份减一
    		checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
    	}
    	else{
    		checkMonth = DateUtil.getDate(cale.getTime(),"yyyyMM");
    	}
    	model.addAttribute("checkMonth", checkMonth);
    	
    	return "/sal/ctl/oneShotControl/selectDmsSalesUpdateBySqlMain";
    }
    
    /*-------------------------------------------------------页签跳转 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DCS 订单处理 Start-------------------------------------------------------*/
    /**
     * 存储过程将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/callDcsSalesOrderCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int callDcsSalesOrderCheck(@RequestBody NotAssignedOrderSearchVO searchVO)throws Exception{
        return salesMonthService.callDcsSalesOrderCheck(searchVO.getsModelCd());
    }
    
    /** 
     * 数量对比列表
     * @param TmpDcsOrderCheckVO
     * @return SearchResult
     */
    @RequestMapping(value = "/selectDcsOrderDiff.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcsOrderDiff(@RequestBody TmpDcsOrderCheckVO tmpDcsOrderCheckVO) throws Exception {
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDcsOrderDiffCnt(tmpDcsOrderCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDcsOrderDiff(tmpDcsOrderCheckVO));
    	}
    	return result;
    }
    
    /**
     * 存储过程erp同步dcs订单数据
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateOrderInfoErpToDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateOrderInfoErpToDcs(@RequestBody NotAssignedOrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateOrderInfoErpToDcs(searchVO.getsModelCd());
    }
    
    /*-------------------------------------------------------DCS 订单处理 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DMS 订单处理 Start-------------------------------------------------------*/
    
    /**
     * 通过存储过程，将EPR待查询的经销商信息放入到临时表中，并初始化数量为0。
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/callDmsSalesOrderCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int callDmsSalesOrderCheck(@RequestBody OrderSearchVO searchVO)throws Exception{
        return salesMonthService.callDmsSalesOrderCheck(searchVO.getCheckMonth());
    }
    
    /**
     * 通过连接经销商DMS数据库执行SQL，将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/searchOrderInfoErpToDms.do", method = RequestMethod.POST)
    @ResponseBody
    public String searchOrderInfoErpToDms(@RequestBody OrderSearchVO searchVO)throws Exception{
    	return salesMonthService.searchOrderInfoErpToDms(searchVO);
    }
    
    /**
     * 通过连接经销商DMS数据库执行SQL，将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/searchOrderInfoErpToDmsByThread.do", method = RequestMethod.POST)
    @ResponseBody
    public String searchOrderInfoErpToDmsByThread(@RequestBody OrderSearchVO searchVO)throws Exception{
    	return salesMonthService.searchOrderInfoErpToDmsByThread(searchVO);
    }
    
    /**
     * 查询当前执行了多少家的查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkOrderProcessShow.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkOrderProcessShow(@RequestBody OrderSearchVO searchVO)throws Exception{
    	return salesMonthService.checkOrderProcessShow(searchVO);
    }
    
    
    /**
     * DMS订单查询差异
     * @param TmpDmsOrderCheckVO
     * @return
     */
    @RequestMapping(value = "/selectDmsOrderDiff.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsOrderDiff(@RequestBody TmpDmsOrderCheckVO tmpDmsOrderCheckVO) throws Exception {
    	
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDmsOrderDiffCnt(tmpDmsOrderCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDmsOrderDiff(tmpDmsOrderCheckVO));
    	}
    	
    	return result;
    }
    
    /**
     * DMS订单批量修改按钮执行方法
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateOrderInfoErpToDms.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateOrderInfoErpToDms(@RequestBody OrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateOrderInfoErpToDms(searchVO);
    }
    
    /**
     * DMS订单批量修改按钮执行方法多线程
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateOrderInfoErpToDmsByThread.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateOrderInfoErpToDmsByThread(@RequestBody OrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateOrderInfoErpToDmsByThread(searchVO);
    }
    
    /**
     * 查询当前执行了多少家的修改
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateOrderProcessShow.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateOrderProcessShow(@RequestBody OrderSearchVO searchVO)throws Exception{
    	return salesMonthService.updateOrderProcessShow(searchVO);
    }
    
    /*-------------------------------------------------------DMS 订单处理 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DCS 车辆处理 Start-------------------------------------------------------*/
    /**
     * 存储过程将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/callDcsSalesCarCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int callDcsSalesCarCheck(@RequestBody NotAssignedOrderSearchVO searchVO)throws Exception{
        return salesMonthService.callDcsSalesCarCheck(searchVO.getsModelCd());
    }
    
    /** 
     * 数量对比列表
     * @param TmpDcsOrderCheckVO
     * @return SearchResult
     */
    @RequestMapping(value = "/selectDcsCarDiff.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcsCarDiff(@RequestBody TmpDcsCarCheckVO tmpDcsCarCheckVO) throws Exception {
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDcsCarDiffCnt(tmpDcsCarCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDcsCarDiff(tmpDcsCarCheckVO));
    	}
    	return result;
    }
    
    /** 
     * DCS车辆详情列表
     * @param TmpDcsOrderCheckVO
     * @return SearchResult
     */
    @RequestMapping(value = "/selectDcsErpCarDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcsErpCarDetail(@RequestBody TmpDcsCarCheckVO tmpDcsCarCheckVO) throws Exception {
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDcsErpCarDetailCnt(tmpDcsCarCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDcsErpCarDetail(tmpDcsCarCheckVO));
    	}
    	return result;
    }
    
    /**
     * 存储过程erp同步dcs车辆数据
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateCarInfoErpToDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateCarInfoErpToDcs(@RequestBody NotAssignedOrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateCarInfoErpToDcs(searchVO.getsModelCd());
    }
    
    /*-------------------------------------------------------DCS 车辆处理 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DMS 车辆处理 Start-------------------------------------------------------*/
    
    /**
     * 通过连接经销商DMS数据库执行SQL，将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/callDmsSalesCarCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int callDmsSalesCarCheck(@RequestBody CarSearchVO searchVO)throws Exception{
        return salesMonthService.callDmsSalesCarCheck(searchVO.getCheckMonth());
    }
    
    /**
     * 通过连接经销商DMS数据库执行SQL，将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/searchCarInfoErpToDms.do", method = RequestMethod.POST)
    @ResponseBody
    public String searchCarInfoErpToDms(@RequestBody CarSearchVO searchVO)throws Exception{
    	return salesMonthService.searchCarInfoErpToDms(searchVO);
    }
    
    /**
     * 查询当前执行了多少家的查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkCarProcessShow.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkCarProcessShow(@RequestBody CarSearchVO searchVO)throws Exception{
    	return salesMonthService.checkCarProcessShow(searchVO);
    }
    
    
    /**
     * DMS订单查询差异
     * @param TmpDmsCarCheckVO
     * @return
     */
    @RequestMapping(value = "/selectDmsCarDiff.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsCarDiff(@RequestBody TmpDmsCarCheckVO tmpDmsCarCheckVO) throws Exception {
    	
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDmsCarDiffCnt(tmpDmsCarCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDmsCarDiff(tmpDmsCarCheckVO));
    	}
    	
    	return result;
    }
    
    /** 
     * DMS车辆详情列表
     * @param TmpDmsOrderCheckVO
     * @return SearchResult
     */
    @RequestMapping(value = "/selectDmsErpCarDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsErpCarDetail(@RequestBody TmpDmsCarCheckVO tmpDmsCarCheckVO) throws Exception {
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDmsErpCarDetailCnt(tmpDmsCarCheckVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDmsErpCarDetail(tmpDmsCarCheckVO));
    	}
    	return result;
    }
    
    /**
     * DMS订单批量修改按钮执行方法
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateCarInfoErpToDms.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateCarInfoErpToDms(@RequestBody CarSearchVO searchVO)throws Exception{
        return salesMonthService.updateCarInfoErpToDms(searchVO.getCheckMonth());
    }
    
    /**
     * DMS订单批量修改按钮执行方法
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateCarInfoErpToDmsByThread.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateCarInfoErpToDmsByThread(@RequestBody CarSearchVO searchVO)throws Exception{
        return salesMonthService.updateCarInfoErpToDmsByThread(searchVO.getCheckMonth());
    }
    
    /**
     * 查询当前执行了多少家的修改
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateCarProcessShow.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateCarProcessShow(@RequestBody CarSearchVO searchVO)throws Exception{
    	return salesMonthService.updateCarProcessShow(searchVO);
    }
    
    /*-------------------------------------------------------DMS 车辆处理 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DMS 执行SQL Start-------------------------------------------------------*/
    /**
     * 初始化待查询的经销商，之后通过查询修改结果
     * @param TmpDmsUpdateSqlVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/batchInsertDealerForUpdate.do", method = RequestMethod.POST)
    @ResponseBody
    public String batchInsertDealerForUpdate(@RequestBody TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO)throws Exception{
    	return salesMonthService.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
    }
    
    /**
     * DMS执行SQL结果查询
     * @param TmpDmsOrderCheckVO
     * @return
     */
    @RequestMapping(value = "/selectDmsUpdateResult.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsUpdateResult(@RequestBody TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO) throws Exception {
    	
    	SearchResult result = new SearchResult();
    	result.setTotal(salesMonthService.selectDmsUpdateResultCnt(tmpDmsUpdateSqlVO));
    	if(result.getTotal() != 0){
    		result.setData(salesMonthService.selectDmsUpdateResult(tmpDmsUpdateSqlVO));
    	}
    	
    	return result;
    }
    
    /**
     * DMS批量修改按钮执行方法
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateBySql.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateBySql(@RequestBody OrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateBySql(searchVO.getDlrCd(),searchVO.getSql());
    }
    
    /**
     * DMS批量修改按钮执行方法
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateBySqlByThread.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateBySqlByThread(@RequestBody OrderSearchVO searchVO)throws Exception{
        return salesMonthService.updateBySqlByThread(searchVO.getDlrCd(),searchVO.getSql());
    }
    
    /**
     * 查询当前在多少家执行了SQL语句
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/batchUpdateBySqlProcessShow.do", method = RequestMethod.POST)
    @ResponseBody
    public String batchUpdateBySqlProcessShow(@RequestBody CarSearchVO searchVO)throws Exception{
    	return salesMonthService.batchUpdateBySqlProcessShow(searchVO);
    }
    
    /*-------------------------------------------------------DMS 执行SQL End-------------------------------------------------------*/
    
    /*-------------------------------------------------------DMS 多线程 Start-------------------------------------------------------*/
    /**
     * 通过连接经销商DMS数据库执行SQL，将ERP与DCS的差异数据比对出来并放入临时表中，以便于后面查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/searchCarInfoErpToDmsByThread.do", method = RequestMethod.POST)
    @ResponseBody
    public String searchCarInfoErpToDmsByThread(@RequestBody CarSearchVO searchVO)throws Exception{
    	return salesMonthService.searchCarInfoErpToDmsByThread(searchVO);
    }
    /*-------------------------------------------------------DMS 多线程 End-------------------------------------------------------*/
    
    /*-------------------------------------------------------月结 End-------------------------------------------------------*/
    
}