package chn.bhmc.dms.ser.wac.service.impl;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimReqDocNoIdGenStrategy.java
 * @Description : 클레임 요청 DOC NO
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ClaimReqDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

  
    
    @Override
    public String buildPrefix(String prefix) {
        return "";
    }



}
