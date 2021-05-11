package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SyncCmdSendReceiveHistVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SyncCommandSendReceiveHistoryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -403936369753298146L;

    private String flag                  ;

    private String sendReceiveTrxId      ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   eventDt               ;

    private String cmdCd                 ;

    private String dlrCd                 ;

    private String dlrNm                 ;

    private String cmdTcXmlBodyCont      ;

    private String resTcXmlBodyCont      ;

    private String resProcRsltCd         ;

    private String resProcRsltMesgCont   ;

    private String dlrIpAddrNm;

    private String dlrPortNo;

    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }

    /**
     * @param sendReceiveTrxId the sendReceiveTrxId to set
     */
    public void setSendReceiveTrxId(String sendReceiveTrxId) {
        this.sendReceiveTrxId = sendReceiveTrxId;
    }

    /**
     * @return the sendReceiveTrxId
     */
    public String getSendReceiveTrxId() {
        return sendReceiveTrxId;
    }

    /**
     * @param eventDt the eventDt to set
     */
    public void setEventDt(Date eventDt) {
        this.eventDt = eventDt;
    }

    /**
     * @return the eventDt
     */
    public Date getEventDt() {
        return eventDt;
    }

    /**
     * @param cmdCd the cmdCd to set
     */
    public void setCmdCd(String cmdCd) {
        this.cmdCd = cmdCd;
    }

    /**
     * @return the cmdCd
     */
    public String getCmdCd() {
        return cmdCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param cmdTcXmlBodyCont the cmdTcXmlBodyCont to set
     */
    public void setCmdTcXmlBodyCont(String cmdTcXmlBodyCont) {
        this.cmdTcXmlBodyCont = cmdTcXmlBodyCont;
    }

    /**
     * @return the cmdTcXmlBodyCont
     */
    public String getCmdTcXmlBodyCont() {
        return cmdTcXmlBodyCont;
    }

    /**
     * @param resTcXmlBodyCont the resTcXmlBodyCont to set
     */
    public void setResTcXmlBodyCont(String resTcXmlBodyCont) {
        this.resTcXmlBodyCont = resTcXmlBodyCont;
    }

    /**
     * @return the resTcXmlBodyCont
     */
    public String getResTcXmlBodyCont() {
        return resTcXmlBodyCont;
    }

    /**
     * @param resProcRsltCd the resProcRsltCd to set
     */
    public void setResProcRsltCd(String resProcRsltCd) {
        this.resProcRsltCd = resProcRsltCd;
    }

    /**
     * @return the resProcRsltCd
     */
    public String getResProcRsltCd() {
        return resProcRsltCd;
    }

    /**
     * @param resProcRsltMesgCont the resProcRsltMesgCont to set
     */
    public void setResProcRsltMesgCont(String resProcRsltMesgCont) {
        this.resProcRsltMesgCont = resProcRsltMesgCont;
    }

    /**
     * @return the resProcRsltMesgCont
     */
    public String getResProcRsltMesgCont() {
        return resProcRsltMesgCont;
    }


    /**
     * @param dlrPortNo the dlrPortNo to set
     */
    public void setDlrPortNo(String dlrPortNo) {
        this.dlrPortNo = dlrPortNo;
    }

    /**
     * @return the dlrPortNo
     */
    public String getDlrPortNo() {
        return dlrPortNo;
    }

    /**
     * @param dlrIpAddrNm the dlrIpAddrNm to set
     */
    public void setDlrIpAddrNm(String dlrIpAddrNm) {
        this.dlrIpAddrNm = dlrIpAddrNm;
    }

    /**
     * @return the dlrIpAddrNm
     */
    public String getDlrIpAddrNm() {
        return dlrIpAddrNm;
    }

}
