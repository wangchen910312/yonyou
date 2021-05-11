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
import chn.bhmc.dms.mob.api.repair.dao.RepairEstimateDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairEstimateService;
import chn.bhmc.dms.mob.api.repair.vo.EstimateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.EstimateVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Service("RepairEstimateService")
public class RepairEstimateServiceImpl extends HService implements RepairEstimateService , JxlsSupport{

    @Resource(name="RepairEstimateDAO")
    RepairEstimateDAO RepairEstimateDAO;


    public EstimateVO selectEstimateManageByKey(EstimateSearchVO searchVO) throws Exception {


        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        EstimateVO estimateVO = new EstimateVO();

        if( !StringUtil.isEmpty(searchVO.getsEstDocNo())){

            estimateVO = RepairEstimateDAO.selectEstimateManageByKey(searchVO);

        }
        return estimateVO;
    }

    public int selectEstimateListByConditionCnt(EstimateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return RepairEstimateDAO.selectEstimateListByConditionCnt(searchVO);
    }

    public List<EstimateVO> selectEstimateListByCondition(EstimateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return RepairEstimateDAO.selectEstimateListByCondition(searchVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        EstimateSearchVO searchVO = new EstimateSearchVO();
        searchVO.setsDlrCd(dlrCd);
        if(!StringUtils.isBlank(params.get("sEstFromDt").toString())){
            String sEstFromDt = params.get("sEstFromDt").toString();
            Date dEstFromDt = DateUtil.convertToDate(sEstFromDt);
            searchVO.setsEstFromDt(dEstFromDt);
        }
        if(!StringUtils.isBlank(params.get("sEstToDt").toString())){
            String sEstToDt = params.get("sEstToDt").toString();
            Date dEstToDt = DateUtil.convertToDate(sEstToDt);
            searchVO.setsEstToDt(dEstToDt);
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

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<EstimateVO> list = selectEstimateListByCondition(searchVO);
        context.putVar("items", list);

    }
}
