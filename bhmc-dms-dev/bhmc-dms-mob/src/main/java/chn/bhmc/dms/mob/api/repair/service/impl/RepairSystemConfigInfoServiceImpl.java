package chn.bhmc.dms.mob.api.repair.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.repair.dao.RepairSystemConfigInfoDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.SystemConfigInfoVO;

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

@Service("RepairSystemConfigInfoService")
public class RepairSystemConfigInfoServiceImpl extends HService implements RepairSystemConfigInfoService {

    @Resource(name="RepairSystemConfigInfoDAO")
    RepairSystemConfigInfoDAO RepairSystemConfigInfoDAO;


    @Override
    @Cacheable(value="systemConfigInfoCache")
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey)  throws Exception {
        return RepairSystemConfigInfoDAO.selectSystemConfigInfoByKey(prefKey);
    }

    @Override
    @Cacheable(value="systemConfigInfoCache")
    public String selectStrValueByKey(String prefKey)  throws Exception {
        return selectSystemConfigInfoByKey(prefKey).getPrefVal();
    }

}
