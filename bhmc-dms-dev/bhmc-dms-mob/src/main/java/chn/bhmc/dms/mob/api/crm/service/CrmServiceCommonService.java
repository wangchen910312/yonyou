package chn.bhmc.dms.mob.api.crm.service;

import java.util.Map;

import chn.bhmc.dms.core.support.camel.Data;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface CrmServiceCommonService {

    /**
     *
     * CamelClent
     *
     * @param message
     * @param ifId
     * @return
     * @throws Exception
     */
    public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception;


}
