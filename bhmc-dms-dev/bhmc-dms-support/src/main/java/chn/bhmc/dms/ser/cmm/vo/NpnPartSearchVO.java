package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NpnPartSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class NpnPartSearchVO extends BaseSearchVO {
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 1792819057318358748L;

    /**
     * NPN PART NUMBER     
     **/
    private String sNpnpPartNo;
    
    /**
     * PART  ENG NAME      
     **/
    //NPNP_PART_NM_ENG
    private String sNpnpPartNm;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimDt;

    public String getsNpnpPartNo() {
        return sNpnpPartNo;
    }

    public void setsNpnpPartNo(String sNpnpPartNo) {
        this.sNpnpPartNo = sNpnpPartNo;
    }

    public String getsNpnpPartNm() {
        return sNpnpPartNm;
    }

    public void setsNpnpPartNm(String sNpnpPartNm) {
        this.sNpnpPartNm = sNpnpPartNm;
    }

    public Date getsClaimDt() {
        return sClaimDt;
    }

    public void setsClaimDt(Date sClaimDt) {
        this.sClaimDt = sClaimDt;
    }   
    
    

}
