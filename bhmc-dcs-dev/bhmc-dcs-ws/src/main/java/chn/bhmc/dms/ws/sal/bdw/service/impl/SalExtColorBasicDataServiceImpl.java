package chn.bhmc.dms.ws.sal.bdw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;
import chn.bhmc.dms.ws.sal.bdw.service.dao.SalExtColorBasicDataDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalExtColorBasicDataServiceImpl.java
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
@Service("salExtColorBasicDataService")
public class SalExtColorBasicDataServiceImpl implements SalBasicDataService {

    @Resource(name="salExtColorBasicDataDAO")
    SalExtColorBasicDataDAO salExtColorBasicDataDAO;

    @Override
    public boolean isSupport(String id) {
        if("SAL003".equals(id)){
            return true;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> params) throws Exception {
        return salExtColorBasicDataDAO.getExtColorBasicDataSearch(params);
    }
}
