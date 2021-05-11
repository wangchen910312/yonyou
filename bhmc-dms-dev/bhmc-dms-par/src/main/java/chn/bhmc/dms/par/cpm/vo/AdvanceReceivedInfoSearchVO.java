package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 선수금 헤더 검색 VO
 *
 * @ClassName   : AdvanceReceivedInfoSearchVO.java
 * @Description : AdvanceReceivedInfoSearchVO Class
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim     최초 생성
 * </pre>
 */
public class AdvanceReceivedInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6695952521920951487L;

    /**
     * 딜러번호
     **/
    private String sDlrCd = "";

    /**
     * 선수금유형
     **/
    private String sPreAmtTp;

    /**
     * 수입시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sImpStartDt;

    /**
     * 수입종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sImpEndDt;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPreAmtTp
     */
    public String getsPreAmtTp() {
        return sPreAmtTp;
    }

    /**
     * @param sPreAmtTp the sPreAmtTp to set
     */
    public void setsPreAmtTp(String sPreAmtTp) {
        this.sPreAmtTp = sPreAmtTp;
    }

    /**
     * @return the sImpStartDt
     */
    public Date getsImpStartDt() {
        return sImpStartDt;
    }

    /**
     * @param sImpStartDt the sImpStartDt to set
     */
    public void setsImpStartDt(Date sImpStartDt) {
        this.sImpStartDt = sImpStartDt;
    }

    /**
     * @return the sImpEndDt
     */
    public Date getsImpEndDt() {
        return sImpEndDt;
    }

    /**
     * @param sImpEndDt the sImpEndDt to set
     */
    public void setsImpEndDt(Date sImpEndDt) {
        this.sImpEndDt = sImpEndDt;
    }

}
