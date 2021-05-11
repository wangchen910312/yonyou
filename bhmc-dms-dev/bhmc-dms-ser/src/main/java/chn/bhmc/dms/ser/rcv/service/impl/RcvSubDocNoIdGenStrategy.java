package chn.bhmc.dms.ser.rcv.service.impl;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : RcvSubDocNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

public class RcvSubDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    /*
     * @see egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl#setPrefix(java.lang.String)
     */

    private String orgPrefix;
    private String rcvDocNo;


    public void setPrefix(String prefix){
       this.orgPrefix = prefix;
     //  applyPrefix();
    }

    public void setRcvDocNo(String rcvDocNo) {
        this.rcvDocNo = rcvDocNo;
    }
     
    @Override
    public String buildPrefix(String prefix) {
        
        return rcvDocNo;
    }
    
    

}
