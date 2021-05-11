package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairServiceReceiveDetailDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceReceiveDetailService;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailServiceImpl.java
 * @Description : 수납 디테일 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("RepairServiceReceiveDetailService")
public class RepairServiceReceiveDetailServiceImpl extends HService implements RepairServiceReceiveDetailService {

    /**
     * 수납 디테일 DAO
     */
    @Resource(name="RepairServiceReceiveDetailDAO")
    RepairServiceReceiveDetailDAO RepairServiceReceiveDetailDAO;

    public int selectServiceReceiveDetailsHistByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairServiceReceiveDetailDAO.selectServiceReceiveDetailsHistByConditionCnt(searchVO);
    }

    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsHistByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return RepairServiceReceiveDetailDAO.selectServiceReceiveDetailsHistByCondition(searchVO);
    }

   
}