package chn.bhmc.dms.ws.sal.bdw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;
import chn.bhmc.dms.ws.sal.bdw.service.dao.DealerSyncDAO;

/**
 * @ClassName   : DealerSyncServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim jin suk
 * @since 2017. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 18.    Kim jin suk            최초 생성
 * </pre>
 */
@Service("dealerSyncService")
public class DealerSyncServiceImpl implements SalBasicDataService {

    @Resource(name="dealerSyncDAO")
    DealerSyncDAO dealerSyncDAO;

    @Override
    public boolean isSupport(String id) {
        if("SAL005".equals(id)){
            return true;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> params) throws Exception {
        return dealerSyncDAO.getdealerDataSearch(params);
    }
}
