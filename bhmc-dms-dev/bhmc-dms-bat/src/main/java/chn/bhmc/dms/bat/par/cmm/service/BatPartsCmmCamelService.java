package chn.bhmc.dms.bat.par.cmm.service;

import java.util.Map;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatServiceCmmCamelService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface BatPartsCmmCamelService {

    public boolean executeCamelClient(Map<String, Object> message , String ifId)throws Exception;

}
