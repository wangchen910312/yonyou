package chn.bhmc.dms.ws.sal.bdw.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleSalBasicDataServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 15.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("sampleSalBasicDataService")
public class SampleSalBasicDataServiceImpl implements SalBasicDataService {

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isSupport(String id) {
        if("TEST001".equals(id)){
            return true;
        }
        return false;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> params) throws Exception {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> obj1 = new HashMap<String, Object>();
        obj1.put("name","홍길동1");
        obj1.put("value","1");

        Map<String, Object> obj2 = new HashMap<String, Object>();
        obj2.put("name","홍길동2");
        obj2.put("value","2");

        list.add(obj1);
        list.add(obj2);

        return list;
    }
}
