package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairPreCheckDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairPreCheckService;
import chn.bhmc.dms.mob.api.repair.vo.PreCheckSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.PreCheckVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0gv
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("RepairPreCheckService")
public class RepairPreCheckServiceImpl extends HService implements RepairPreCheckService, JxlsSupport{

    @Resource(name="RepairPreCheckDAO")
    RepairPreCheckDAO RepairPreCheckDAO;

    public int selectPreCheckListByConditionCnt(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return RepairPreCheckDAO.selectPreCheckListByConditionCnt(searchVO);
    }

    public List<PreCheckVO> selectPreCheckListByCondition(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairPreCheckDAO.selectPreCheckListByCondition(searchVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        PreCheckSearchVO searchVO = new PreCheckSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(!StringUtils.isBlank(params.get("sFromDt").toString())){
            String sFromDt = params.get("sFromDt").toString();
            Date dFromDt = DateUtil.convertToDate(sFromDt);
            searchVO.setsFromDt(dFromDt);
        }
        if(!StringUtils.isBlank(params.get("sToDt").toString())){
            String sToDt = params.get("sToDt").toString();
            Date dToDt = DateUtil.convertToDate(sToDt);
            searchVO.setsToDt(dToDt);
        }

        List<PreCheckVO> list = selectPreCheckListByCondition(searchVO);
        context.putVar("items", list);

    }
}
