package chn.bhmc.dms.sal.dlv.web;


import java.util.Calendar;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryMngService;
import chn.bhmc.dms.sal.dlv.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnVSApplicationVehicleNetworkingSystemVo;
import chn.bhmc.dms.sal.dlv.vo.NewEnerVSApplicationOutOfStockVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;



/**
 * 계약출고
 *
 * @author yewon.kim
 * @since 2016. 10. 23
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 10. 23          yewon.kim            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/contDelivery")
public class ContDeliveryMngController extends HController {

	
	@Resource(name="NewEnergyVSApplicationService")
	NewEnergyVSApplicationService newEnergyVSApplicationService;
    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 계약출고관리 서비스
     */
    @Resource(name="contDeliveryMngService")
    ContDeliveryMngService contDeliveryMngService;

    
    /**
     * 계약출고관리 Main View 을 출력한다.   -- OCX 스캔 적용화면
     * @return
     */
    @RequestMapping(value = "/selectContDeliveryMngOldMain.do", method = RequestMethod.GET)
    public String selectContDeliveryMngOldMain(Model model
            ,@RequestParam(value="sContractNo", defaultValue="") String sContractNo ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);
        String nowMonth = DateUtil.getDate("MM");
        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nowMonth", nowMonth);
        model.addAttribute("toDay", sysDate);

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("retlTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL130", null, langCd));
        //판매취소사유 공통코드 목록
        model.addAttribute("cancReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));
        //강제판매처리신청사유
        model.addAttribute("fceSaleReqReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, langCd));
        //심사여부 SAL131
        model.addAttribute("approveYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL131", null, langCd));
        //강제판매처리신청상태 SAL154
        model.addAttribute("reqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL154", null, langCd));
        //회사차구분 SAL053
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        //판매고문 (계약)
        model.addAttribute("saleEmpContInfo", crmCommonService.selectMngScIdListByCondition());

        //판매고문 (출고)
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        model.addAttribute("sContractNo", sContractNo);

        return "/sal/dlv/contDelivery/selectContDeliveryMngOldMain";
    }


    /**
     * 계약출고관리 Main View 을 출력한다.  -- RFID APP 적용화면
     * @return
     */
    @RequestMapping(value = "/selectContDeliveryMngMain.do", method = RequestMethod.GET)
    public String selectContDeliveryMngMain(Model model
            ,@RequestParam(value="sContractNo", defaultValue="") String sContractNo ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);
        String nowMonth = DateUtil.getDate("MM");
        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nowMonth", nowMonth);
        model.addAttribute("toDay", sysDate);

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("retlTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL130", null, langCd));
        //판매취소사유 공통코드 목록
        model.addAttribute("cancReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));
        //강제판매처리신청사유
        model.addAttribute("fceSaleReqReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, langCd));
        //심사여부 SAL131
        model.addAttribute("approveYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL131", null, langCd));
        //강제판매처리신청상태 SAL154
        model.addAttribute("reqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL154", null, langCd));
        //회사차구분 SAL053
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        //판매고문 (계약)
        model.addAttribute("saleEmpContInfo", crmCommonService.selectMngScIdListByCondition());

        //판매고문 (출고)
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        model.addAttribute("sContractNo", sContractNo);

        return "/sal/dlv/contDelivery/selectContDeliveryMngMain";
    }

    /**
     * 계약출고관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectContDeliveryMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContDeliveryMng(@RequestBody ContDeliverySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(contDeliveryMngService.selectContDeliveryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contDeliveryMngService.selectContDeliveryByCondition(searchVO));
        }

        return result;
    }

    /**
     * 계약출고관리 - 차량정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectDeliveryVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeliveryVehicle(@RequestBody ContDeliverySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contDeliveryMngService.selectDeliveryVehicleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contDeliveryMngService.selectDeliveryVehicleByCondition(searchVO));
        }

        return result;
    }


    /**
     * 계약출고관리 - 인도처리
     * @param <DeliveryVO>
     * @param ContDeliveryVO contDeliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/vehicleContDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public String vehicleContDelivery(@RequestBody ContDeliveryVO contDeliveryVO) throws Exception {

    	contDeliveryVO.setUpdtUsrId(LoginUtil.getUserId());
    	contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
    	//Q21011300013 2020年12月13号，D1096店正常零售的一台车，dms合同信息和sap收到的零售信息，销售顾问不一致。jiaMing 2021-1-27 START
  	      contDeliveryMngService.checkContractNoInfoSaleEmpNo(contDeliveryVO);
  	    //Q21011300013 2020年12月13号，D1096店正常零售的一台车，dms合同信息和sap收到的零售信息，销售顾问不一致。jiaMing 2021-1-27 END
    	ContDeliveryVO vo = contDeliveryMngService.selectIsCharging(contDeliveryVO);
    	/*String team = "";
    	//查询车辆主表判断是否是新能源车
    	if("Y".equals(vo.getZfnewen())){
    		//在出库后增加新数据到新能源充电桩表中需要查询用户表获取用户名手机号
    		ChargingPileVO chargingPileVO = contDeliveryMngService.selectUserVO(contDeliveryVO);
    		if(chargingPileVO!=null){
    			 synchronized (retailContractOrdNoIdgenService) {
    	                //((RetailContractOrdNoIdGenStrategy)retailContractOrdNoIdgenService.getStrategy()).setCarlineCd(cntVO.getCarlineCd());
    	                //((RetailContractOrdNoTableNameStrategy)retailContractOrdNoIdgenService.getTableNameStrategy()).setCarlineCd(cntVO.getCarlineCd());
    	               String contractNo = retailContractOrdNoIdgenService.getNextStringId();
    	               team = contractNo.substring(1);
    	               team = "X"+team;
    	            }
    			chargingPileVO.setInstallationNo(team);
    			chargingPileVO.setIsNeed("02");
    			chargingPileVO.setState("01");
    			chargingPileVO.setVinNo(contDeliveryVO.getVinNo());
    			chargingPileVO.setDlrCd(LoginUtil.getDlrCd());
    			contDeliveryMngService.insertChargingPile(chargingPileVO);
    		}
    	}*/
    	/*if(null!=vo && "X".equals(vo.getZfnewsub())){
    		//判断将要出库车辆新能源申请补贴
        	NewEnergyVSApplicationVO newVo = contDeliveryMngService.getNewEnergySubsidy(contDeliveryVO);
        	if(newVo!= null){
        		String statusNo = newVo.getStatusNo();
        		if("03".equals(statusNo)){
        			contDeliveryMngService.updateVehicleContDelivery(contDeliveryVO);
        			return true;
        		}else{
        			return false;
        		}
        	}else{
        		
        		return false;
        	}
    	}else{
    		contDeliveryMngService.updateVehicleContDelivery(contDeliveryVO);
    		return true;
    	}*/
    	//flag 标识  01：不是新能源车 正常出库 、 04：当前新能源车辆申请审核中 、03：审核通过正常出库 、 05：审核作废重新申请提报  02：未作补贴申请
    	String flag = "";
    	if(null!=vo && "X".equals(vo.getZfnewsub())){
    		//判断将要出库车辆新能源申请补贴
        	NewEnergyVSApplicationVO newVo = contDeliveryMngService.getNewEnergySubsidy(contDeliveryVO);
        	if(newVo!= null){
        		String statusNo = newVo.getStatusNo();
        		if("03".equals(statusNo)){
        			contDeliveryMngService.updateVehicleContDelivery(contDeliveryVO);
        			NewEnerVSApplicationOutOfStockVO newEnerVSApplicationOutOfStockVO = new NewEnerVSApplicationOutOfStockVO();
        			NewEnVSApplicationVehicleNetworkingSystemVo newEnVSApplicationVehicleNetworkingSystemVo = new NewEnVSApplicationVehicleNetworkingSystemVo();
        			newEnerVSApplicationOutOfStockVO.setVinNo(contDeliveryVO.getVinNo());
        			newEnerVSApplicationOutOfStockVO.setContractCustNo(contDeliveryVO.getContractNo());
        			newEnVSApplicationVehicleNetworkingSystemVo.setVinNo(contDeliveryVO.getVinNo());
        			newEnVSApplicationVehicleNetworkingSystemVo.setContractCustNo(contDeliveryVO.getContractNo());
        			//新能源车辆出库向SA_0509IS表中插入数据 出库接口用
        			newEnergyVSApplicationService.insertNewEnVSApplicationOutOfStock(newEnerVSApplicationOutOfStockVO);
        			//新能源车辆出库向SA_0506_1IS表中插入数据 向监控平台传输数据，SAL228接口用
        			newEnergyVSApplicationService.insertNewEnVSApplicationVehicleNetworkingSystem(newEnVSApplicationVehicleNetworkingSystemVo);
        			flag = "03";
        			return flag;
        		}else if("05".equals(statusNo)){
        			flag = "05";
        			return flag;
        		}else {
        			flag = "04";
        			return flag;
        		}
        	}else{
        		flag = "02";
    			return flag;
        	}
    	}else{
    		contDeliveryMngService.updateVehicleContDelivery(contDeliveryVO);
    		flag = "01";
    		return flag;
    	}
    }
    /**
     * 계약출고관리 - 출고 스캔요청.
     * @param <DeliveryVO>
     * @param DeliveryVO deliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/deliveryAsk.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deliveryAsk(@RequestBody ContDeliveryVO contDeliveryVO) throws Exception {

        contDeliveryVO.setRegUsrId(LoginUtil.getUserId());
        contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
        contDeliveryMngService.deliveryAsk(contDeliveryVO);

        return true;
    }

    
    
    
    
    
    /**
     * 계약출고관리 - 이상출고처리
     * @param <DeliveryVO>
     * @param DeliveryVO deliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/exceptionDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public String exceptionDelivery(@RequestBody ContDeliveryVO contDeliveryVO) throws Exception {

    	contDeliveryVO.setRegUsrId(LoginUtil.getUserId());
    	contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
    	ContDeliveryVO vo = contDeliveryMngService.selectIsCharging(contDeliveryVO);
    	String flag = "";
    	if(null!=vo&&"X".equals(vo.getZfnewsub())){
    		//判断将要出库车辆新能源申请补贴
        	NewEnergyVSApplicationVO newVo = contDeliveryMngService.getNewEnergySubsidy(contDeliveryVO);
        	if(newVo!= null){
        		String statusNo = newVo.getStatusNo();
        		if("03".equals(statusNo)){
        			contDeliveryMngService.insertExceptionDelivery(contDeliveryVO);
        			NewEnerVSApplicationOutOfStockVO newEnerVSApplicationOutOfStockVO = new NewEnerVSApplicationOutOfStockVO();
        			NewEnVSApplicationVehicleNetworkingSystemVo newEnVSApplicationVehicleNetworkingSystemVo = new NewEnVSApplicationVehicleNetworkingSystemVo();
        			newEnerVSApplicationOutOfStockVO.setVinNo(contDeliveryVO.getVinNo());
        			newEnerVSApplicationOutOfStockVO.setContractCustNo(contDeliveryVO.getContractNo());//异常出库时  contDeliveryVO.getContractCustNo() 为客户编号,应取合同号 contDeliveryVO.getContractNo() 贾明2020-5-27  
        			newEnVSApplicationVehicleNetworkingSystemVo.setVinNo(contDeliveryVO.getVinNo());
        			newEnVSApplicationVehicleNetworkingSystemVo.setContractCustNo(contDeliveryVO.getContractNo());
        			//新能源车辆出库向SA_0509IS表中插入数据 出库接口用
        			//异常出库时,不能新能源发,正常出库时,才发 贾明 2020-5-27 
        			//newEnergyVSApplicationService.insertNewEnVSApplicationOutOfStock(newEnerVSApplicationOutOfStockVO);
        			//新能源车辆出库向SA_0506_1IS表中插入数据 向监控平台传输数据，SAL228接口用
        			newEnergyVSApplicationService.insertNewEnVSApplicationVehicleNetworkingSystem(newEnVSApplicationVehicleNetworkingSystemVo);
        			flag = "03";
        			return flag;
        		}else if("05".equals(statusNo)){
        			flag = "05";
        			return flag;
        		}else {
        			flag = "04";
        			return flag;
        		}
        	}else{
        		flag = "02";
    			return flag;
        	}
    	}else{
    		contDeliveryMngService.insertExceptionDelivery(contDeliveryVO);
    		flag = "01";
    		return flag;
    	}
    }

    /**
     * 계약건의 이상출고처리 신청상태 조회
     */
    @RequestMapping(value = "/selectContractExceptionStatYnSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectContractExceptionStatYnSearch(@RequestBody ContDeliverySearchVO searchVO) throws Exception {
        return contDeliveryMngService.selectContractExceptionStatYnSearchByCondition(searchVO);
    }


}