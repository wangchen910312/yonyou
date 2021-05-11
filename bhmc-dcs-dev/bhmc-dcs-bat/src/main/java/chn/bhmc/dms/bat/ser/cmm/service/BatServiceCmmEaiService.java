package chn.bhmc.dms.bat.ser.cmm.service;

import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatServiceCmmEaiService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface BatServiceCmmEaiService {


    public CommDMSDoc executeEaiService(String pgmId) throws Exception;

}
