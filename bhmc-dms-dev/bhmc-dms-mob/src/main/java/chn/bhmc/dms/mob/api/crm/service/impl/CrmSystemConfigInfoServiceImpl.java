package chn.bhmc.dms.mob.api.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSystemConfigInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSystemConfigInfoService;
import chn.bhmc.dms.mob.api.crm.vo.SystemConfigInfoVO;

/**
 * 시스템설정정보 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("CrmsystemConfigInfoService")
public class CrmSystemConfigInfoServiceImpl extends HService implements CrmSystemConfigInfoService {

    /**
     * 시스템설정 관리 DAO
     */
    @Resource(name="CrmsystemConfigInfoDAO")
    CrmSystemConfigInfoDAO CrmsystemConfigInfoDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="systemConfigInfoCache")
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey)  throws Exception {
        return CrmsystemConfigInfoDAO.selectSystemConfigInfoByKey(prefKey);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="systemConfigInfoCache")
    public String selectStrValueByKey(String prefKey)  throws Exception {
        return selectSystemConfigInfoByKey(prefKey).getPrefVal();
    }
}
