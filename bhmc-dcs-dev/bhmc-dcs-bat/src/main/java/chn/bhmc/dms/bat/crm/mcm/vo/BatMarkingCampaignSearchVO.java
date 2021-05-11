package chn.bhmc.dms.bat.crm.mcm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMarkingCampaignSearchVO.java
 * @Description : 캠페인 배치를 조회하기 위한 SearchVO
 * @author Hyoung Jun An
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.    Hyoung Jun An     최초 생성
 * </pre>
 */

public class BatMarkingCampaignSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4285344022095006639L;


    //[TODO] 조회용

    private String sDlrCd;
    private String sSeq;
    private Date   sCurruntDt;


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
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }
    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sCurruntDt
     */
    public Date getsCurruntDt() {
        return sCurruntDt;
    }
    /**
     * @param sCurruntDt the sCurruntDt to set
     */
    public void setsCurruntDt(Date sCurruntDt) {
        this.sCurruntDt = sCurruntDt;
    }
}
