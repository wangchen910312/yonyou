package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.dao.PartServicePartDAO;
import chn.bhmc.dms.mob.api.part.service.PartServicePartService;
import chn.bhmc.dms.mob.api.part.vo.ServicePartVO;
import chn.bhmc.dms.mob.api.part.vo.TabInfoSearchVO;

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

@Service("PartServicePartService")
public class PartServicePartServiceImpl extends HService implements PartServicePartService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="PartServicePartDAO")
    PartServicePartDAO PartServicePartDAO;

    

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return PartServicePartDAO.selectServicePartsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return PartServicePartDAO.selectServicePartsByCondition(searchVO);
    }

   
}