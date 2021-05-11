package chn.bhmc.dms.ws.sal.bdw.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 판매 기초데이터 서비스 인터페이스
 * </pre>
 *
 * @ClassName   : SalBasicDataService.java
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

public interface SalBasicDataService {
    public static final String SUCCESS = "9000";
    public static final String NOT_SUPPORTED = "9001";

    public boolean isSupport(String id);
    public List<Map<String, Object>> selectList(Map<String, Object> params) throws Exception;
}
