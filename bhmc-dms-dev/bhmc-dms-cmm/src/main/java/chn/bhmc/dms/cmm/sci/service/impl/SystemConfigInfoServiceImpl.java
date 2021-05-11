package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.dao.SystemConfigInfoDAO;
import chn.bhmc.dms.cmm.sci.vo.SystemConfigInfoVO;

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

@Service("systemConfigInfoService")
public class SystemConfigInfoServiceImpl extends HService implements SystemConfigInfoService {

    /**
     * 시스템설정 관리 DAO
     */
    @Resource(name="systemConfigInfoDAO")
    SystemConfigInfoDAO systemConfigInfoDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="systemConfigInfoCache", allEntries=true)
    public int updateSystemConfigInfo(SystemConfigInfoVO systemConfigInfoVO)  throws Exception {
       return systemConfigInfoDAO.updateSystemConfigInfo(systemConfigInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="systemConfigInfoCache", allEntries=true)
    public void updateSystemConfigInfo(List<SystemConfigInfoVO> list)  throws Exception {
        for(SystemConfigInfoVO systemConfigInfoVO: list){
            updateSystemConfigInfo(systemConfigInfoVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<SystemConfigInfoVO> selectSystemConfigInfos()  throws Exception {
        return systemConfigInfoDAO.selectSystemConfigInfos();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="systemConfigInfoCache")
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey)  throws Exception {
        return systemConfigInfoDAO.selectSystemConfigInfoByKey(prefKey);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="systemConfigInfoCache")
    public String selectStrValueByKey(String prefKey)  throws Exception {
        return selectSystemConfigInfoByKey(prefKey).getPrefVal();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="systemConfigInfoCache")
    public String[] selectStrValuesByKey(String prefKey)  throws Exception {
        return selectStrValueByKey(prefKey).split(",");
    }
}
