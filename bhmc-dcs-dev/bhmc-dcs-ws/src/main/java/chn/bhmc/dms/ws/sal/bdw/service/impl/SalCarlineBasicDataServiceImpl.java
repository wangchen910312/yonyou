package chn.bhmc.dms.ws.sal.bdw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;
import chn.bhmc.dms.ws.sal.bdw.service.dao.SalCarlineBasicDataDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalCarlineBasicDataServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 16.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Service("salCarlineBasicDataService")
public class SalCarlineBasicDataServiceImpl implements SalBasicDataService {

    @Resource(name="salCarlineBasicDataDAO")
    SalCarlineBasicDataDAO salCarlineBasicDataDAO;

    @Override
    public boolean isSupport(String id) {
        if("SAL001".equals(id)){
            return true;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> params) throws Exception {
        return salCarlineBasicDataDAO.getCarLineBasicDataSearch(params);
    }
}
