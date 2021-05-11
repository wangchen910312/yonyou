package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairServicePartDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairServicePartService;
import chn.bhmc.dms.mob.api.repair.vo.ServicePartVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("RepairServicePartService")
public class RepairServicePartServiceImpl extends HService implements RepairServicePartService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="RepairServicePartDAO")
    RepairServicePartDAO RepairServicePartDAO;

    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairServicePartDAO.selectServicePartsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairServicePartDAO.selectServicePartsByCondition(searchVO);
    }

}