package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.service.ContractProgressService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.dlv.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.dlv.service.dao.NewEnergyVSApplicationDAO;
import chn.bhmc.dms.sal.dlv.vo.NewEnVSApplicationVehicleNetworkingSystemVo;
import chn.bhmc.dms.sal.dlv.vo.NewEnerVSApplicationOutOfStockVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import org.apache.commons.lang3.StringUtils;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 
 * @ClassName: NewEnergyVSApplicationServiceImpl 
 * @Description: TODO
 * @author: Administrator
 * @date: 2019年4月3日 下午2:04:45
 */

@Service("NewEnergyVSApplicationService")
public class NewEnergyVSApplicationServiceImpl extends HService implements NewEnergyVSApplicationService ,JxlsSupport{
	
	@Resource(name="contractMntService")
    ContractMntService contractMntService;

	@Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;
	
	@Autowired
    SalesCommonCamelService salesCommonCamelService;
	
    @Resource(name="newEnergyVSApplicationDAO")
    NewEnergyVSApplicationDAO newEnergyVSApplicationDAO;
    
    @Resource(name="newEnergyVSApplicationOrdNoIdgenService")
    EgovIdGnrService newEnergyVSApplicationOrdNoIdgenService;

    @Resource(name="contractProgressService")
	ContractProgressService contractProgressService;

    @Resource(name = "customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;
    
    @Autowired
	CamelClientFactory camelClientFactory;
    @Override
    public List<NewEnergyVSApplicationVO> selectNewEnergyVSApplicationByCondition(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
        return newEnergyVSApplicationDAO.selectNewEnergyVSApplicationByCondition(searchVO);
    }

    
	@Override
	public int selectNewEnergyVSApplicationByConditionCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.selectNewEnergyVSApplicationByConditionCnt(searchVO);
	}


	@Override
	public void insertNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO)
			throws Exception {
		synchronized (newEnergyVSApplicationOrdNoIdgenService) {
			String nextId = newEnergyVSApplicationOrdNoIdgenService.getNextStringId();
		newEnergyVSApplicationVO.setApplicationNo(nextId);
		}
		//车牌城市拼接
		String carRegCity = newEnergyVSApplicationVO.getSungNm() + "-" + newEnergyVSApplicationVO.getCityNm() + "-" + newEnergyVSApplicationVO.getDistNm();
		newEnergyVSApplicationVO.setCarRegCity(carRegCity);
		//业务表插入数据
		newEnergyVSApplicationDAO.insertNewEnVSApplication(newEnergyVSApplicationVO);
		//B标识为提报
		if (newEnergyVSApplicationVO.getApproveCd().equals("B")) {
			//IS表插入数据
			newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
			try {
				CamelClient camelClient = camelClientFactory.createCamelClient();
	            camelClient.setIfId("SAL222");
	            camelClient.sendRequest();
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				throw e;
			}
		}

	}


	@Override
	public void updateNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception {
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		//车牌城市拼接
		String carRegCity = newEnergyVSApplicationVO.getSungNm() + "-" + newEnergyVSApplicationVO.getCityNm() + "-" + newEnergyVSApplicationVO.getDistNm();
		newEnergyVSApplicationVO.setCarRegCity(carRegCity);
		//更新业务表数据
		newEnergyVSApplicationDAO.updateNewEnVSApplication(newEnergyVSApplicationVO);
		if (newEnergyVSApplicationVO.getApproveCd().equals("B")) {
				/*searchVO.setsApplicationNo(newEnergyVSApplicationVO.getApplicationNo());
				searchVO.setsDlrCd(newEnergyVSApplicationVO.getDlrCd());
				int count = newEnergyVSApplicationDAO.checkAppNoContInIS(searchVO);
				if(count>0) {
					Date date = new Date();
					newEnergyVSApplicationVO.setIfRegDt(date);
					//更新IS表数据
					newEnergyVSApplicationDAO.updateNewEnVSApplicationIs(newEnergyVSApplicationVO);
				}else {
					newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
				}
				newEnergyVSApplicationDAO.updateCommit();*/
			    newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
				try {
					CamelClient camelClient = camelClientFactory.createCamelClient();
		            camelClient.setIfId("SAL222");
		            camelClient.sendRequest();
				} catch (Exception e) {
					log.error(e.getMessage(), e);
					throw e;
				}
		}

	}


	/**
	 * excel下载
	 */
	@Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); 
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
		  if (StringUtils.isNotEmpty((String)params.get("applStartDt"))) {
		  //searchVO.setApplStartDt((Date)params.get("applStartDt"));
		  searchVO.setApplStartDt(DateUtil.convertToDate((String)params.get("applStartDt")));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("applEndDt"))) {
			  //searchVO.setApplEndDt((Date)params.get("applEndDt"));
			  searchVO.setApplEndDt(DateUtil.convertToDate((String)params.get("applEndDt")));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("invoStartDt"))) {
			  //searchVO.setInvoStartDt((Date)params.get("invoStartDt"));
			  searchVO.setInvoStartDt(DateUtil.convertToDate((String)params.get("invoStartDt")));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("invoEndDt"))) {
			  //searchVO.setInvoEndDt((Date)params.get("invoEndDt"));
			  searchVO.setInvoEndDt(DateUtil.convertToDate((String)params.get("invoEndDt")));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("custTp"))) {
			  searchVO.setCustTp((String)params.get("custTp"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("sStatusNo"))) {
			  searchVO.setStatusNo((String)params.get("sStatusNo"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("sCustNm"))) {
			  searchVO.setCustNm((String)params.get("sCustNm"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("sHpNo"))) {
			  searchVO.setHpNo((String)params.get("sHpNo"));
		  }
		  //R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 start
		  if (StringUtils.isNotEmpty((String)params.get("sVinNo"))) {
			  searchVO.setVinNo(((String)params.get("sVinNo")));
		  }
		  //R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 end

        List<NewEnergyVSApplicationVO> list = selectNewEnergyVSApplicationByCondition(searchVO);
        context.putVar("items", list);
    }


	/**
	 * 推车业务 更新补贴申请状态
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateNewEnVSApplicationTc(String vinNo) throws Exception {
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		if (StringUtils.isNotEmpty(vinNo)) {
			SearchResult result = new SearchResult();
	        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
	        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
	        searchVO.setVinNo(vinNo);
	        searchVO.setCarReturn("05");
	        result.setTotal(this.selectNewEnergyVSApplicationByConditionCnt(searchVO));
			if(result.getTotal() != 0){
	            result.setData(this.selectNewEnergyVSApplicationByCondition(searchVO));
	            List <NewEnergyVSApplicationVO> list = (List<NewEnergyVSApplicationVO>) result.getData();
	            NewEnergyVSApplicationVO newEnergyVSApplicationVO = list.get(0);
	            newEnergyVSApplicationVO.setStatusNo("05");
	            Date date = new Date();
	            newEnergyVSApplicationVO.setIfRegDt(date);
	            newEnergyVSApplicationDAO.updateNewEnVSApplication(newEnergyVSApplicationVO);
	            if(StringUtils.isNotEmpty(newEnergyVSApplicationVO.getStatusNo())) {
	            	if(!newEnergyVSApplicationVO.getStatusNo().equals("01")) {
	            		newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
						try {
							CamelClient camelClient = camelClientFactory.createCamelClient();
				            camelClient.setIfId("SAL222");
				            camelClient.sendRequest();
						} catch (Exception e) {
							log.error(e.getMessage(), e);
							throw e;
						}
	            	}
	            }
				
				
	        }
	      }
		
	}


	/**
	 * 查看当前库存是否存在 VinNo
	 */
	@Override
	public int checkVinNoIfContainCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.checkVinNoIfContainCnt(searchVO);
	}


	@Override
	public int checkVinNoContInT(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.checkVinNoContInT(searchVO);
	}


	@Override
	public int checkAppNoContInIS(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.checkAppNoContInIS(searchVO);
	}


	@SuppressWarnings("unchecked")
	@Override
	public void insertNewEnVSApplicationOutOfStock(NewEnerVSApplicationOutOfStockVO newEnerVSApplicationOutOfStockVO)
			throws Exception {
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("vin",newEnerVSApplicationOutOfStockVO.getVinNo());
		//之前去客户信息 改为 合同中信息 因此注掉  以备更改业务需求
		/*SearchResult result = new SearchResult();
		CustomerInfoSearchVO searchVOs = new  CustomerInfoSearchVO();
		searchVOs.setsCustNo(newEnerVSApplicationOutOfStockVO.getContractCustNo());
		CustomerInfoVO customerInfoVO = new CustomerInfoVO();
		result.setTotal(customerInfoOutBoundService.selectCustomerListByConditionCnt(searchVOs));
        if (result.getTotal() != 0) {
            result.setData(customerInfoOutBoundService.selectCustomerListByCondition(searchVOs));
            List <CustomerInfoVO> list = (List<CustomerInfoVO>) result.getData();
            customerInfoVO = list.get(0);
        }*/
		ContractReSearchVO searchVOs = new ContractReSearchVO();
		SearchResult result = new SearchResult();
        searchVOs.setsDlrCd(LoginUtil.getDlrCd());
        searchVOs.setsContractNo(newEnerVSApplicationOutOfStockVO.getContractCustNo());

        result.setTotal(contractMntService.selectContractResByConditionCnt(searchVOs));

        ContractReVO contractReVO = new ContractReVO();
        if(result.getTotal() != 0){
            result.setData(contractMntService.selectContractResByCondition(searchVOs));
            List<ContractReVO> list = (List<ContractReVO>) result.getData();
            contractReVO = list.get(0);
        }
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		searchVO.setVinNo(newEnerVSApplicationOutOfStockVO.getVinNo());
		searchVO.setCarReturn("05");
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); 
		List<NewEnergyVSApplicationVO> newEnergyVSApplicationList = (List<NewEnergyVSApplicationVO>) this.selectNewEnergyVSApplicationByCondition(searchVO);
		NewEnergyVSApplicationVO newEnergyVSApplicationVo = new NewEnergyVSApplicationVO();
		if(newEnergyVSApplicationList!=null) {
		   newEnergyVSApplicationVo = newEnergyVSApplicationList.get(0);
		}
		newEnerVSApplicationOutOfStockVO.setLicensePlate(newEnergyVSApplicationVo.getCarRegNo());  //车牌号
		message.put("licensePlate",newEnergyVSApplicationVo.getCarRegNo());
		//个人
		if("01".equals(contractReVO.getCustTp())){
			newEnerVSApplicationOutOfStockVO.setOwnerName(contractReVO.getCustNm());  //所有人姓名（个人）
			newEnerVSApplicationOutOfStockVO.setIdnum(contractReVO.getSsnCrnNo()); //证件号码
			//R19091200233 张伟丽反馈：DMS新能源补贴申请画面，选择“私人用户信息”后，车辆用途的下拉框的的内容在“私人用车”的下面增加“出租乘用车”  溯源系统 接口传送  111806  贾明 2019-9-16 start
			if("12".equals(newEnergyVSApplicationVo.getWehicleUse())){
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111806"); //车辆用途
			}else{
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111808"); //车辆用途
			};
			//R19091200233 张伟丽反馈：DMS新能源补贴申请画面，选择“私人用户信息”后，车辆用途的下拉框的的内容在“私人用车”的下面增加“出租乘用车”  溯源系统 接口传送  111806  贾明 2019-9-16 end
			//newEnerVSApplicationOutOfStockVO.setVehTypeName("111808"); //车辆用途
			//newEnerVSApplicationOutOfStockVO.setVehTypeName("私人乘用车"); //车辆用途
			//R19091200233 张伟丽反馈：DMS新能源补贴申请画面，选择“私人用户信息”后，车辆用途的下拉框的的内容在“私人用车”的下面增加“出租乘用车”  溯源系统 接口传送  111806  贾明 2019-9-16 start
			if("12".equals(newEnergyVSApplicationVo.getWehicleUse())){
				message.put("vehTypeName","111806");
			}else{
				message.put("vehTypeName","111808");
			};
			//R19091200233 张伟丽反馈：DMS新能源补贴申请画面，选择“私人用户信息”后，车辆用途的下拉框的的内容在“私人用车”的下面增加“出租乘用车”  溯源系统 接口传送  111806  贾明 2019-9-16 start
			message.put("ownerName",contractReVO.getCustNm());
			message.put("Idnum",contractReVO.getSsnCrnNo());
			message.put("epname","");
			message.put("epaddress","");
			message.put("epcode","");
		//企业
		}else {
			newEnerVSApplicationOutOfStockVO.setEpname(contractReVO.getCustNm()); //单位名称
			//之前去客户信息 改为 合同中信息 因此注掉  以备更改业务需求
			/*if(!"".equals(contractReVO.getAddrDetlCont())) {
				newEnerVSApplicationOutOfStockVO.setEpaddress(contractReVO.getAddrDetlCont());//单位详细地址
				message.put("epaddress",contractReVO.getAddrDetlCont());
			}else {
				newEnerVSApplicationOutOfStockVO.setEpaddress(newEnergyVSApplicationVo.getOfficeAds());//单位详细地址
				message.put("epaddress",newEnergyVSApplicationVo.getOfficeAds());
			}*/
			newEnerVSApplicationOutOfStockVO.setEpaddress(contractReVO.getAddrDetlCont());//单位详细地址
			message.put("epaddress",contractReVO.getAddrDetlCont());
			newEnerVSApplicationOutOfStockVO.setEpcode(contractReVO.getSsnCrnNo()); //统一社会信用代码
			if("01".equals(newEnergyVSApplicationVo.getWehicleUse())) {
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111807"); //车辆用途租赁乘用车
				message.put("vehTypeName","111807");
			}else if("02".equals(newEnergyVSApplicationVo.getWehicleUse())) {
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111805"); //车辆用途公务乘用车
				message.put("vehTypeName","111805");
			}else if("03".equals(newEnergyVSApplicationVo.getWehicleUse())){
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111806");//车辆用途出租乘用车
				message.put("vehTypeName","111806");
			 
			 //SAL227 接口调整：CSR 97 贾明 2020-6-29 start
			}else if("11".equals(newEnergyVSApplicationVo.getWehicleUse())){
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111808");//车辆用私人用车
				message.put("vehTypeName","111806");
			}else if("12".equals(newEnergyVSApplicationVo.getWehicleUse())){
				newEnerVSApplicationOutOfStockVO.setVehTypeName("111806");//车辆用途出租乘用车
				message.put("vehTypeName","111806");
			}
			//SAL227 接口调整：CSR 97 贾明 2020-6-29 end
			message.put("ownerName","");
			message.put("Idnum","");
			message.put("epname",contractReVO.getCustNm());
			message.put("epcode",contractReVO.getSsnCrnNo());
		}
		newEnerVSApplicationOutOfStockVO.setSaleArea(newEnergyVSApplicationVo.getCarRegCity());
		message.put("saleArea",newEnergyVSApplicationVo.getCarRegCity());
		//Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//message.put("saleTime",sdf.format(date));
        newEnerVSApplicationOutOfStockVO.setSaleTime(sdf.format(newEnergyVSApplicationVo.getInvoDt())); //销售日期
		message.put("saleTime",sdf.format(newEnergyVSApplicationVo.getInvoDt()));
		newEnerVSApplicationOutOfStockVO.setIfresult("N");
		newEnerVSApplicationOutOfStockVO.setIfRegDt(new Date());
		message.put("ifRegDt", sdf.format(new Date()));
		newEnergyVSApplicationDAO.insertNewEnVSApplicationOutOfStock(newEnerVSApplicationOutOfStockVO);
		newEnergyVSApplicationDAO.callIfMergeCommit("SAL227");
		try {
			salesCommonCamelService.executeCamelClent(message, "SAL227"); 
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
	}


	@Override
	public String selectSaleDateFrCarMain(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.selectSaleDateFrCarMain(searchVO);
	}


	
	@SuppressWarnings("unchecked")
	@Override
	public void insertNewEnVSApplicationVehicleNetworkingSystem(
			NewEnVSApplicationVehicleNetworkingSystemVo newEnVSApplicationVehicleNetworkingSystemVo) throws Exception {
		
		Map<String, Object> message = new HashMap<String, Object>();
		
		message.put("vin",newEnVSApplicationVehicleNetworkingSystemVo.getVinNo()); //车辆VIN码
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//获取合同数据
		ContractReSearchVO searchVOs = new ContractReSearchVO();
		SearchResult result = new SearchResult();
        searchVOs.setsDlrCd(LoginUtil.getDlrCd());
        searchVOs.setsContractNo(newEnVSApplicationVehicleNetworkingSystemVo.getContractCustNo());
        result.setTotal(contractMntService.selectContractResByConditionCnt(searchVOs));
        ContractReVO contractReVO = new ContractReVO();
        if(result.getTotal() != 0){
            result.setData(contractMntService.selectContractResByCondition(searchVOs));
            List<ContractReVO> list = (List<ContractReVO>) result.getData();
            contractReVO = list.get(0);
        }
        //获取新能源补贴申请数据
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		searchVO.setVinNo(newEnVSApplicationVehicleNetworkingSystemVo.getVinNo());
		searchVO.setCarReturn("05");
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); 
		List<NewEnergyVSApplicationVO> newEnergyVSApplicationList = (List<NewEnergyVSApplicationVO>) this.selectNewEnergyVSApplicationByCondition(searchVO);
		NewEnergyVSApplicationVO newEnergyVSApplicationVo = new NewEnergyVSApplicationVO();
		if(newEnergyVSApplicationList!=null) {
		   newEnergyVSApplicationVo = newEnergyVSApplicationList.get(0);
		}
		
		//向接口表插入数据 同时向message中插入业务数据
		//销售日期
		newEnVSApplicationVehicleNetworkingSystemVo.setSellTime((sdf.format(newEnergyVSApplicationVo.getInvoDt())));
		message.put("sellTime",sdf.format(newEnergyVSApplicationVo.getInvoDt())); 
		
		//购车城市
		newEnVSApplicationVehicleNetworkingSystemVo.setSellCity(newEnergyVSApplicationVo.getCarRegCity());
		message.put("sellCity", newEnergyVSApplicationVo.getCityNm());
		
		//经销商名称
		newEnVSApplicationVehicleNetworkingSystemVo.setDealerName(newEnergyVSApplicationVo.getDlrCdStr());
		message.put("dealerName",newEnergyVSApplicationVo.getDlrCdStr());
		
		//特约店（经销商）代码
		newEnVSApplicationVehicleNetworkingSystemVo.setDlrCd(LoginUtil.getDlrCd());
		message.put("dealerCode", newEnergyVSApplicationVo.getDlrCd());
		
		//车牌号
	    newEnVSApplicationVehicleNetworkingSystemVo.setCarLicense(newEnergyVSApplicationVo.getCarRegNo());  
		message.put("carLicense",newEnergyVSApplicationVo.getCarRegNo());
		
		//车牌颜色
		newEnVSApplicationVehicleNetworkingSystemVo.setCarLicenseColor(newEnergyVSApplicationVo.getCarRegColor());
		message.put("carLicenseColor", newEnergyVSApplicationVo.getCarRegColor());
		
		//存放城市
		newEnVSApplicationVehicleNetworkingSystemVo.setSaveCity(newEnergyVSApplicationVo.getCityNm());
		message.put("saveCity",newEnergyVSApplicationVo.getCityNm());
		
		//机动车行驶证编号
		newEnVSApplicationVehicleNetworkingSystemVo.setDriveLicenseno(newEnergyVSApplicationVo.getDrivePermitNo());
		message.put("driveLicenseNo", newEnergyVSApplicationVo.getDrivePermitNo());
		
		//行驶证注册日期
		newEnVSApplicationVehicleNetworkingSystemVo.setLicenseRegisterDate(sdf.format(newEnergyVSApplicationVo.getDrivLicenseDt()));
		message.put("licenseRegisterDate", sdf.format(newEnergyVSApplicationVo.getDrivLicenseDt()));
		
		//行驶证发放日期  
		newEnVSApplicationVehicleNetworkingSystemVo.setLicenseGrantDate(sdf.format(newEnergyVSApplicationVo.getDrivLicenseDt()));
		message.put("licenseGrantDate", sdf.format(newEnergyVSApplicationVo.getDrivLicenseDt()));
		
		//客户类型1：个人2：公司
		newEnVSApplicationVehicleNetworkingSystemVo.setCustomerType(newEnergyVSApplicationVo.getCustTp());
		message.put("customerType", newEnergyVSApplicationVo.getCustTp());
		
		//个人
		if("01".equals(newEnergyVSApplicationVo.getCustTp())) {
			//存放地址
			newEnVSApplicationVehicleNetworkingSystemVo.setSaveAddress(newEnergyVSApplicationVo.getAddrDetlCont());
			message.put("saveAddress",newEnergyVSApplicationVo.getAddrDetlCont());
			//个人车主名字
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerName(newEnergyVSApplicationVo.getCustNm());
			message.put("privateOwnerName", newEnergyVSApplicationVo.getCustNm());
			//个人车主证件号
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerIdentity(newEnergyVSApplicationVo.getSsnCrnNo());
			message.put("privateOwnerIdentity", newEnergyVSApplicationVo.getSsnCrnNo());
			//个人车主联系电话
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerPhone(newEnergyVSApplicationVo.getHpNo());
			message.put("privateOwnerPhone", newEnergyVSApplicationVo.getHpNo());
			//个人车主联系地址    
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerAddress(newEnergyVSApplicationVo.getAddrDetlCont());
			message.put("privateOwnerAddress", newEnergyVSApplicationVo.getAddrDetlCont());
			
			//公司客户名称
			newEnVSApplicationVehicleNetworkingSystemVo.setUnitName("");
			message.put("unitName", "");
			//公司客户对该车用途  
			newEnVSApplicationVehicleNetworkingSystemVo.setVehUseFor("");
			message.put("vehUseFor", "");
			//公司客户统一社会信用码 
			newEnVSApplicationVehicleNetworkingSystemVo.setOrganizationCode("");
			message.put("organizationCode", "");
			//公司法人姓名
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonName("");
			message.put("legalPersonName", "");
			//公司法人手机号
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonPhone("");
			message.put("legalPersonPhone", "");
			//legalPersonAddress 公司法人联系地址
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonAddress("");
			message.put("legalPersonAddress", "");
		}else {
			//存放地址
			newEnVSApplicationVehicleNetworkingSystemVo.setSaveAddress(newEnergyVSApplicationVo.getOfficeAds());
			message.put("saveAddress",newEnergyVSApplicationVo.getOfficeAds());
			//个人车主名字
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerName("");
			message.put("privateOwnerName", "");
			//个人车主证件号
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerIdentity("");
			message.put("privateOwnerIdentity", "");
			//个人车主联系电话
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerPhone("");
			message.put("privateOwnerPhone", "");
			//个人车主联系地址    
			newEnVSApplicationVehicleNetworkingSystemVo.setPrivateOwnerAddress("");
			message.put("privateOwnerAddress", "");
			
			//公司客户名称
			newEnVSApplicationVehicleNetworkingSystemVo.setUnitName(newEnergyVSApplicationVo.getOfficeNm());
			message.put("unitName", newEnergyVSApplicationVo.getOfficeNm());
			//公司客户对该车用途  
			if(null!=newEnergyVSApplicationVo.getWehicleUse()){
				if("01".equals(newEnergyVSApplicationVo.getWehicleUse())) {
					newEnVSApplicationVehicleNetworkingSystemVo.setVehUseFor("7");   //租赁乘用车
					message.put("vehUseFor","7");
				}else if("02".equals(newEnergyVSApplicationVo.getWehicleUse())) {
					newEnVSApplicationVehicleNetworkingSystemVo.setVehUseFor("5");   //公务乘用车
					message.put("vehUseFor","5");
				}else if("03".equals(newEnergyVSApplicationVo.getWehicleUse())) {
					newEnVSApplicationVehicleNetworkingSystemVo.setVehUseFor("6");   //出租乘用车
					message.put("vehUseFor","6");
				}
			}
			//公司客户统一社会信用码 
			newEnVSApplicationVehicleNetworkingSystemVo.setOrganizationCode(newEnergyVSApplicationVo.getRegNo());
			message.put("organizationCode", newEnergyVSApplicationVo.getRegNo());
			//公司法人姓名
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonName(newEnergyVSApplicationVo.getOwnRgstNm());
			message.put("legalPersonName", newEnergyVSApplicationVo.getOwnRgstNm());
			//公司法人手机号
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonPhone(newEnergyVSApplicationVo.getOwnRgstTelNo());
			message.put("legalPersonPhone",newEnergyVSApplicationVo.getOwnRgstTelNo());
			//公司法人联系地址
			newEnVSApplicationVehicleNetworkingSystemVo.setLegalPersonAddress(newEnergyVSApplicationVo.getOfficeAds());
			message.put("legalPersonAddress",newEnergyVSApplicationVo.getOfficeAds());
		}
		newEnVSApplicationVehicleNetworkingSystemVo.setIfresult("N");
		message.put("ifresult", "N");
		newEnVSApplicationVehicleNetworkingSystemVo.setIfRegDt(sdf.format(new Date()));
		message.put("ifRegDt", sdf.format(new Date()));
		newEnergyVSApplicationDAO.insertNewEnVSApplicationVehicleNetworkingSystem(newEnVSApplicationVehicleNetworkingSystemVo);
		newEnergyVSApplicationDAO.callIfMergeCommit("SAL228");
		//2019-07-10 update by lyy 暂时关闭调用EAI接口，等到EAI开放后再执行调用 start
		try {
			salesCommonCamelService.executeCamelClent(message, "SAL228"); 
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		//2019-07-10 update by lyy 暂时关闭调用EAI接口，等到EAI开放后再执行调用 end
		
	}



}
