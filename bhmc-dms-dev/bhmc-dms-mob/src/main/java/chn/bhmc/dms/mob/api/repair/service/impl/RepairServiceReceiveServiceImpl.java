package chn.bhmc.dms.mob.api.repair.service.impl;


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
import chn.bhmc.dms.mob.api.repair.dao.RepairServiceReceiveDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceReceiveService;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveVO;


/**
 * <pre>
 * 수납관리 구현 서비스
 * </pre>
 *
 * @ClassName   : ServiceReceiveServiceImpl.java
 * @Description : 수납관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.4. 20.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("RepairServiceReceiveService")
public class RepairServiceReceiveServiceImpl extends HService implements RepairServiceReceiveService, JxlsSupport{

    /**
    * 수납관리 DAO
    */
   @Resource(name="RepairServiceReceiveDAO")
   RepairServiceReceiveDAO RepairServiceReceiveDAO;


   @Override
   public List<ServiceReceiveVO> selectServiceReceiveStatusByCondition(ServiceReceiveSearchVO searchVO) throws Exception {

       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return RepairServiceReceiveDAO.selectServiceReceiveStatusByCondition(searchVO);
   }

   @Override
   public int selectServiceReceiveStatusByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return RepairServiceReceiveDAO.selectServiceReceiveStatusByConditionCnt(searchVO);
   }
   
   @Override
   public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return RepairServiceReceiveDAO.selectServiceReceiveByCondition(searchVO);
   }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ServiceReceiveSearchVO searchVO = new ServiceReceiveSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String sTabId = (String)params.get("sTabId");
        if(StringUtil.nullConvert(sTabId).equals("LIST")){
            if(!StringUtils.isBlank(params.get("sRcvCpltFromDt").toString())){
                String sRcvCpltFromDt = params.get("sRcvCpltFromDt").toString();
                Date dRcvCpltFromDt = DateUtil.convertToDate(sRcvCpltFromDt);
                searchVO.setsRcvCpltFromDt(dRcvCpltFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRcvCpltToDt").toString())){
                String sRcvCpltToDt = params.get("sRcvCpltToDt").toString();
                Date dRcvCpltToDt = DateUtil.convertToDate(sRcvCpltToDt);
                searchVO.setsRcvCpltToDt(dRcvCpltToDt);
            }

            List<ServiceReceiveVO> list = selectServiceReceiveStatusByCondition(searchVO);
            context.putVar("items", list);

        }else{
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

            List<ServiceReceiveVO> list = selectServiceReceiveByCondition(searchVO);
            context.putVar("items", list);
        }


    }

	@Override
	public String selectServiceReceiveAmouts(ServiceReceiveSearchVO searchVO)
			throws Exception {
		searchVO.setsDlrCd(LoginUtil.getDlrCd());
	    searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
	    return RepairServiceReceiveDAO.selectServiceReceiveAmouts(searchVO);
	}

}
