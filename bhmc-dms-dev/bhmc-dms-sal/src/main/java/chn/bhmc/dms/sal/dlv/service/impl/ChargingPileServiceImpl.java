package chn.bhmc.dms.sal.dlv.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.dlv.service.ChargingPileService;
import chn.bhmc.dms.sal.dlv.service.dao.ChargingPileDAO;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CancDeliveryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.      Kim yewon              최초 생성
 * </pre>
 */

@Service("chargingPileService")
public class ChargingPileServiceImpl extends HService implements ChargingPileService,JxlsSupport {
	//2019/06/14 qiandelai 修复充电桩发送数据 start
	@Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;
	
	@Autowired
    SalesCommonCamelService salesCommonCamelService;
	//2019/06/14 qiandelai 修复充电桩发送数据 end
    /**
     * 引入充电桩DAO
     */
    @Resource(name="chargingPileDAO")
    ChargingPileDAO chargingPileDAO;
    /**
     *  贾明 2020-5-9 
     * CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	@Override
	public int selectChargingPileTotal(ChargingPileVO chargingPileVO) {
		return chargingPileDAO.selectChargingPileTotal(chargingPileVO);
	}

	@Override
	public List<ChargingPileVO> selectChargingPileList(ChargingPileVO chargingPileVO) {
		return chargingPileDAO.selectChargingPileList(chargingPileVO);
	}
	
	//2019/06/14 qiandelai 修复充电桩发送数据 start
	@Override
	public void updateChargingPile(ChargingPileVO chargingPileVO) throws Exception {
		//CRS NO 35 申请充电桩时，判断新能源车是不是试乘试驾车，如果试乘试驾车，就无法申请充电桩 试乘试架车不能进行提报 贾明 2019-12-3 start
		ChargingPileVO charPileVO = selectTescDriveVino(chargingPileVO);
		//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel 贾明 2020-5-9 START
		boolean verBlo = veriChargingInfo(charPileVO.getOrdTp(),charPileVO.getCarlineEnNm());
		if(!verBlo){
			throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.vinNoOrdtTypeCantReport", new String[]{charPileVO.getVinNo(),charPileVO.getOrdTp()}, LocaleContextHolder.getLocale())});
//			if("C9".equals(charPileVO.getOrdTp())){
//				throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.vinNoOrdtTypeModelCantReport", new String[]{charPileVO.getVinNo(),charPileVO.getOrdTp(),charPileVO.getCarlineEnNm()}, LocaleContextHolder.getLocale())});
//			}else {
//				throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.vinNoOrdtTypeCantReport", new String[]{charPileVO.getVinNo(),charPileVO.getOrdTp()}, LocaleContextHolder.getLocale())});
//			}
		}
		//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel 贾明 2020-5-9 END
		//if("N7".equals(charPileVO.getOrdTp())){
			//throw processException("sal.err.testDriveIsNotAllowToReport");
		//}
		//CRS NO 35 申请充电桩时，判断新能源车是不是试乘试驾车，如果试乘试驾车，就无法申请充电桩 试乘试架车不能进行提报 贾明 2019-12-3 end
		chargingPileVO.setState("02");
		chargingPileVO.setInsertDate(new Date());
		chargingPileDAO.updateChargingPile(chargingPileVO);
		//向is表中添加数据
		chargingPileDAO.insertChargingIs(chargingPileVO);

		CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL224");
        camelClient.sendRequest();
        Data receiveData = camelClient.sendRequest();

        if (!receiveData.getFooter().getIfResult().equals("Z")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }
		//2019/06/14 qiandelai 修复充电桩发送数据 end
	}
	/**
     * 校验是否给充电桩发信息 贾明 2020-5-9 
     * CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel
     * @return
     */
    private boolean veriChargingInfo(String ordTp,String carlineEnNm){
    	 String langCd = LocaleContextHolder.getLocale().getLanguage();
    	 boolean judeVal = false;
    	 String carline = carlineEnNm.trim();
    	try {
    		List<CommonCodeVO> comCodeList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL014", "Y", langCd);
    		List<String>  list = new ArrayList<String>();
    		list.clear();
    		for(CommonCodeVO comVo : comCodeList ){
    			list.add(comVo.getCmmCd());
    		}
    		//2020.09.09 update by tjx CSR156  系统可根据共同编码中定义的订单类型和任意REMARK值判断生成充电桩安装申请 strat
    		//sal014包含车辆订单类型则为true
    		judeVal	= list.contains(ordTp);
    		//存在，并且对应的10个REMARK值都为空，则生成充电桩安装申请
    		if(judeVal) {
    			for(CommonCodeVO comVo : comCodeList ){
    				if(ordTp.equals(comVo.getCmmCd())) {
    					//对应的10个REMARK值都为空，则生成充电桩安装申请
    					if(comVo.getRemark1()==null && comVo.getRemark2()==null
    	    					&& comVo.getRemark3()==null && comVo.getRemark4()==null
    	    					&& comVo.getRemark5()==null && comVo.getRemark6()==null
    	    					&& comVo.getRemark7()==null && comVo.getRemark8()==null
    	    					&& comVo.getRemark9()==null && comVo.getRemark10()==null) {
    	    						judeVal = true;
    	    					}
    					//对应的10个REMARK值字段不全为空，则再判断出库车辆是否属于REMARK的值之内，属于则生成充电桩安装申请
    					else if(  carline.equals(comVo.getRemark1()==null ? "":comVo.getRemark1().trim()) || carline.equals(comVo.getRemark2()==null? "":comVo.getRemark2().trim())
    							||carline.equals(comVo.getRemark3()==null ? "":comVo.getRemark3().trim()) || carline.equals(comVo.getRemark4()==null? "":comVo.getRemark4().trim())
    							||carline.equals(comVo.getRemark5()==null ? "":comVo.getRemark5().trim()) || carline.equals(comVo.getRemark6()==null? "":comVo.getRemark6().trim())
    							||carline.equals(comVo.getRemark7()==null ? "":comVo.getRemark7().trim()) || carline.equals(comVo.getRemark8()==null? "":comVo.getRemark8().trim())
    							||carline.equals(comVo.getRemark9()==null ? "":comVo.getRemark9().trim()) || carline.equals(comVo.getRemark10()==null? "":comVo.getRemark10().trim())){
    						judeVal = true;
    					}
    					//不属于不生成
    					else {
    						judeVal = false;
    					}
    				}
    			}
    		}
    		list.clear();
    		//2020.09.09 update by tjx CSR156  系统可根据共同编码中定义的订单类型和任意REMARK值判断生成充电桩安装申请 end
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			judeVal = false;
		}
    	return judeVal;
	}

	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		ChargingPileVO chargingPileVO = new ChargingPileVO();
		chargingPileVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
		 ObjectUtil.convertMapToObject(params, chargingPileVO, "beanName", "templateFile", "fileName");
		 
			  if (StringUtils.isNotEmpty((String)params.get("invoiceDateSta"))) {
				  chargingPileVO.setInvoiceDateSta((String) params.get("invoiceDateSta"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("invoiceDateEnd"))) {
				  chargingPileVO.setInvoiceDateEnd((String) params.get("invoiceDateEnd"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("sSrchStartDt"))) {
				  chargingPileVO.setsSrchStartDt((String) params.get("sSrchStartDt"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("sSrchEndDt"))) {
				  chargingPileVO.setsSrchEndDt((String) params.get("sSrchEndDt"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("insertDateSta"))) {
				  chargingPileVO.setInsertDateSta((String) params.get("insertDateSta"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("insertDateEnd"))) {
				  chargingPileVO.setInsertDateEnd((String) params.get("insertDateEnd"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("custName"))) {
				  chargingPileVO.setCustName((String)params.get("custName"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("custPhone"))) {
				  chargingPileVO.setCustPhone((String)params.get("custPhone"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("state"))) {
				  chargingPileVO.setCarState((String)params.get("state"));
			  }
			  if (StringUtils.isNotEmpty((String)params.get("carState"))) {
				  chargingPileVO.setCarState((String)params.get("carState"));
			  }
		 List<ChargingPileVO> list = selectChargingPileList(chargingPileVO);
	     context.putVar("items", list);
	}

	@Override
	public void updateStateByVin(ChargingPileVO chargingPileVO) {
		chargingPileDAO.updateStateByVin(chargingPileVO);
		
	}

	@Override
	public ChargingPileVO selectTescDriveVino(ChargingPileVO chargingPileVO) throws Exception {
		return chargingPileDAO.selectTescDriveVino(chargingPileVO);
	}
   
}
