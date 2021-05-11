package chn.bhmc.dms.ser.cal.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cal.service.CalculateService;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDAO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;

@Service("calculateService")
public class CalculateServiceImpl extends HService implements CalculateService  , JxlsSupport{

	/**
     * 정산 DAO
     */
    @Resource(name="calculateDAO")
    CalculateDAO calculateDAO;

    /*
     * {@inheritDoc}
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception {
//        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
//            searchVO.setsDlrCd(LoginUtil.getDlrCd());
//        }
        return calculateDAO.selectCalculateByKey(searchVO);
    }

    /*
    *
    * {@inheritDoc}
    */
   @Override
   public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO) throws Exception {
       if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return calculateDAO.selectCalculateListByConditionCnt(searchVO);
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
       List<CalculateVO> resvList = calculateDAO.selectCalculateListByCondition(searchVO);

       return resvList;
   }

   /**
    * 조회 조건에 해당하는 정산토탈금액을 조회한다.
    * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
    * @return 조회 목록
    */
   public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception {
//       if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
//           searchVO.setsDlrCd(LoginUtil.getDlrCd());
//       }
       return calculateDAO.selectCalculateAmtByCondition(searchVO);
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
}