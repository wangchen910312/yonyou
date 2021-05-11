package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SyncCommandSendReceiveSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class SyncCommandSendReceiveHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2916226288884195374L;

    private String sDlrCd;

    private String sCmdCd;

    private String sSendReceiveTrxId;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartTrxDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndTrxDt;

    private String sFlag;

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sCmdCd the sCmdCd to set
     */
    public void setsCmdCd(String sCmdCd) {
        this.sCmdCd = sCmdCd;
    }

    /**
     * @return the sCmdCd
     */
    public String getsCmdCd() {
        return sCmdCd;
    }

    /**
     * @param sSendReceiveTrxId the sSendReceiveTrxId to set
     */
    public void setsSendReceiveTrxId(String sSendReceiveTrxId) {
        this.sSendReceiveTrxId = sSendReceiveTrxId;
    }

    /**
     * @return the sSendReceiveTrxId
     */
    public String getsSendReceiveTrxId() {
        return sSendReceiveTrxId;
    }

    /**
     * @param sStartTrxDt the sStartTrxDt to set
     */
    public void setsStartTrxDt(Date sStartTrxDt) {
        this.sStartTrxDt = sStartTrxDt;
    }

    /**
     * @return the sStartTrxDt
     */
    public Date getsStartTrxDt() {
        return sStartTrxDt;
    }

    /**
     * @param sEndTrxDt the sEndTrxDt to set
     */
    public void setsEndTrxDt(Date sEndTrxDt) {
        this.sEndTrxDt = sEndTrxDt;
    }

    /**
     * @return the sEndTrxDt
     */
    public Date getsEndTrxDt() {
        return sEndTrxDt;
    }


    /**
     * @param sFlag the sFlag to set
     */
    public void setsFlag(String sFlag) {
        this.sFlag = sFlag;
    }

    /**
     * @return the sFlag
     */
    public String getsFlag() {
        return sFlag;
    }



}
