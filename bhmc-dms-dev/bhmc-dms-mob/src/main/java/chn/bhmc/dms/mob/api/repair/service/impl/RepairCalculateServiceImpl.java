package chn.bhmc.dms.mob.api.repair.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairCalculateDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairCalculateService;
import chn.bhmc.dms.mob.api.repair.vo.CalculateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CalculateVO;


@Service("RepairCalculateService")
public class RepairCalculateServiceImpl extends HService implements RepairCalculateService  , JxlsSupport{

	/**
     * 정산 DAO
     */
    @Resource(name="RepairCalculateDAO")
    RepairCalculateDAO RepairCalculateDAO;

    
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception {
        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return RepairCalculateDAO.selectCalculateByKey(searchVO);
    }

    @Override
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO) throws Exception {
        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairCalculateDAO.selectCalculateListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO) throws Exception {

        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<CalculateVO> resvList = RepairCalculateDAO.selectCalculateListByCondition(searchVO);

        return resvList;
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        CalculateSearchVO searchVO = new CalculateSearchVO();
        searchVO.setsDlrCd(dlrCd);
        if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
            String sCalcFromDt = params.get("sCalcFromDt").toString();
            Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
            searchVO.setsCalcFromDt(dCalcFromDt);
        }
        if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
            String sCalcToDt = params.get("sCalcToDt").toString();
            Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
            searchVO.setsCalcToDt(dCalcToDt);
        }
        if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
            String sRoFromDt = params.get("sRoFromDt").toString();
            Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
            searchVO.setsRoFromDt(dRoFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
            String sRoToDt = params.get("sRoToDt").toString();
            Date dRoToDt = DateUtil.convertToDate(sRoToDt);
            searchVO.setsRoToDt(dRoToDt);
        }

        if(!StringUtils.isBlank(params.get("sRoTpList").toString())){
            String[] result = params.get("sRoTpList").toString().split(",");
            List<String> sRoTpList = new ArrayList<String>();
            for(int i=0;i<result.length;i++){
                sRoTpList.add(i, result[i]);
            }
            searchVO.setsRoTpList(sRoTpList);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<CalculateVO> list = selectCalculateListByCondition(searchVO);
        context.putVar("items", list);

    }

	@Override
	public String selectCalculatesAmouts(CalculateSearchVO searchVO)
			throws Exception {
		if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        String amouts = RepairCalculateDAO.selectCalculatesAmouts(searchVO);

        return amouts;
	}



   

}