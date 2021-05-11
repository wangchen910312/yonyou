package chn.bhmc.dms.crm.cif.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.VehicleBaseInfoService;
import chn.bhmc.dms.crm.cif.service.dao.VehicleBaseInfoDAO;
import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoVO;
import able.com.service.HService;
import able.com.vo.HMap;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : VehicleBaseInfoServiceImpl.java
 * @Description :车辆基础画面查询
 * @author Jia Ming
 * @since 2019. 1. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since     author             description
 *  ===========    =============    ===========================
 *  2019. 1. 9.     Jia Ming        车辆基础画面查询
 * </pre>
 */
@Service("vehicleBaseInfoService")
public class VehicleBaseInfoServiceImpl extends HService implements VehicleBaseInfoService ,JxlsSupport{
	
	/**
	  * VehicleBaseInfoDAO
	  */
	@Resource(name="vehicleBaseInfoDAO")
	VehicleBaseInfoDAO vehicleBaseInfoDAO;
	
	

	@Override
	public int selectVehicleBaseinfoConditionCnt(VehicleBaseInfoSearchVO searchVO) throws Exception {
		
		return vehicleBaseInfoDAO.selectVehicleBaseinfoConditionCnt(searchVO);
	}

	@Override
	public List<VehicleBaseInfoVO> selectVehicleBaseinfoCondition(	VehicleBaseInfoSearchVO searchVO) throws Exception {
		
		return vehicleBaseInfoDAO.selectVehicleBaseinfoCondition(searchVO);
	}
	
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		VehicleBaseInfoSearchVO searchVO = new VehicleBaseInfoSearchVO();
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
		searchVO.setsDlrCd(LoginUtil.getDlrCd());
		List<VehicleBaseInfoVO> list = null;
		
		if(!StringUtils.isBlank(params.get("sCustFromSaveDt").toString())){
            String sCustFromSaveDt = params.get("sCustFromSaveDt").toString();
            Date dCustFromSaveDt = DateUtil.convertToDate(sCustFromSaveDt);
            searchVO.setsCustFromSaveDt(dCustFromSaveDt);
        }
		
		if(!StringUtils.isBlank(params.get("sCustToSaveDt").toString())){
            String sCustToSaveDt = params.get("sCustToSaveDt").toString();
            Date dCustToSaveDt = DateUtil.convertToDate(sCustToSaveDt);
            searchVO.setsCustToSaveDt(dCustToSaveDt);
        }
		
		if(!StringUtils.isBlank(params.get("sWrrntFromEndDt").toString())){
            String sWrrntFromEndDt = params.get("sWrrntFromEndDt").toString();
            Date dWrrntFromEndDt = DateUtil.convertToDate(sWrrntFromEndDt);
            searchVO.setsWrrntFromEndDt(dWrrntFromEndDt);
        }
		
		if(!StringUtils.isBlank(params.get("sWrrntToEndDt").toString())){
            String sWrrntToEndDt = params.get("sWrrntToEndDt").toString();
            Date dWrrntToEndDt = DateUtil.convertToDate(sWrrntToEndDt);
            searchVO.setsWrrntToEndDt(dWrrntToEndDt);
        }
		
		if(!StringUtils.isBlank(params.get("sFiirFromCalcDt").toString())){
            String sFiirFromCalcDt = params.get("sFiirFromCalcDt").toString();
            Date dFiirFromCalcDt = DateUtil.convertToDate(sFiirFromCalcDt);
            searchVO.setsFiirFromCalcDt(dFiirFromCalcDt);
        }
		
		if(!StringUtils.isBlank(params.get("sFiirToCalcDt").toString())){
            String sFiirToCalcDt = params.get("sFiirToCalcDt").toString();
            Date dFiirToCalcDt = DateUtil.convertToDate(sFiirToCalcDt);
            searchVO.setsFiirToCalcDt(dFiirToCalcDt);
        }
		
		
		if(!StringUtils.isBlank(params.get("sLatelyFromCalcDt").toString())){
            String sLatelyFromCalcDt = params.get("sLatelyFromCalcDt").toString();
            Date dLatelyFromCalcDt = DateUtil.convertToDate(sLatelyFromCalcDt);
            searchVO.setsLatelyFromCalcDt(dLatelyFromCalcDt);
        }
		
		if(!StringUtils.isBlank(params.get("sLatelyToCalcDt").toString())){
            String sLatelyToCalcDt = params.get("sLatelyToCalcDt").toString();
            Date dLatelyToCalcDt = DateUtil.convertToDate(sLatelyToCalcDt);
            searchVO.setsLatelyToCalcDt(dLatelyToCalcDt);
        }
		
		if(!StringUtils.isBlank(params.get("sClaimFromConfDt").toString())){
            String sClaimFromConfDt = params.get("sClaimFromConfDt").toString();
            Date dClaimFromConfDt = DateUtil.convertToDate(sClaimFromConfDt);
            searchVO.setsClaimFromConfDt(dClaimFromConfDt);
        }
		
		if(!StringUtils.isBlank(params.get("sClaimToConfDt").toString())){
            String sClaimToConfDt = params.get("sClaimToConfDt").toString();
            Date dClaimToConfDt = DateUtil.convertToDate(sClaimToConfDt);
            searchVO.setsClaimToConfDt(dClaimToConfDt);
        }
		
		/**
		if(!StringUtils.isBlank(params.get("sBirthFromDt").toString())){
            String sBirthFromDt = params.get("sBirthFromDt").toString();
            Date dBirthFromDt = DateUtil.convertToDate(sBirthFromDt);
            searchVO.setsBirthFromDt(dBirthFromDt);
        }
		
		if(!StringUtils.isBlank(params.get("sBirthToDt").toString())){
            String sBirthToDt = params.get("sBirthToDt").toString();
            Date dBirthToDt = DateUtil.convertToDate(sBirthToDt);
            searchVO.setsBirthToDt(dBirthToDt);
        }
        **/
		
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		list = selectVehicleBaseinfoCondition(searchVO);
		context.putVar("items", list);
	}
	

	
}
