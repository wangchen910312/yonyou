package chn.bhmc.dms.cmm.nms.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationMessageSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2743126613549442948L;
    
    /**
     * 수신자ID
     */
    private String sReceiveUsrId;
    
    /**
     * 메세지유형
     * 'P':Push
     * 'W':웹 Push
     * 'S':단문메세지
     */
    private String sMesgTp;
    
    /**
     * 전송여부
     */
    private String sSendYn;
    
    /**
     * 전송일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartSendDt;
    
    /**
     * 전송일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndSendDt;
    
    /**
     * 수신여부
     */
    private String sReceiveYn;
    
    /**
     * 수신일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReceiveDt;
    
    /**
     * 수신일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReceiveDt;


    /**
     * @return the sReceiveUsrId
     */
    public String getsReceiveUsrId() {
        return sReceiveUsrId;
    }
    /**
     * @param sReceiveUsrId the sReceiveUsrId to set
     */
    public void setsReceiveUsrId(String sReceiveUsrId) {
        this.sReceiveUsrId = sReceiveUsrId;
    }
    /**
     * @return the sMesgTp
     */
    public String getsMesgTp() {
        return sMesgTp;
    }
    /**
     * @param sMesgTp the sMesgTp to set
     */
    public void setsMesgTp(String sMesgTp) {
        this.sMesgTp = sMesgTp;
    }
    /**
     * @return the sSendYn
     */
    public String getsSendYn() {
        return sSendYn;
    }
    /**
     * @param sSendYn the sSendYn to set
     */
    public void setsSendYn(String sSendYn) {
        this.sSendYn = sSendYn;
    }
    /**
     * @return the sReceiveYn
     */
    public String getsReceiveYn() {
        return sReceiveYn;
    }
    /**
     * @param sReceiveYn the sReceiveYn to set
     */
    public void setsReceiveYn(String sReceiveYn) {
        this.sReceiveYn = sReceiveYn;
    }
    /**
     * @return the sStartSendDt
     */
    public Date getsStartSendDt() {
        return sStartSendDt;
    }
    /**
     * @param sStartSendDt the sStartSendDt to set
     */
    public void setsStartSendDt(Date sStartSendDt) {
        this.sStartSendDt = sStartSendDt;
    }
    /**
     * @return the sEndSendDt
     */
    public Date getsEndSendDt() {
        return sEndSendDt;
    }
    /**
     * @param sEndSendDt the sEndSendDt to set
     */
    public void setsEndSendDt(Date sEndSendDt) {
        this.sEndSendDt = sEndSendDt;
    }
    /**
     * @return the sStartReceiveDt
     */
    public Date getsStartReceiveDt() {
        return sStartReceiveDt;
    }
    /**
     * @param sStartReceiveDt the sStartReceiveDt to set
     */
    public void setsStartReceiveDt(Date sStartReceiveDt) {
        this.sStartReceiveDt = sStartReceiveDt;
    }
    /**
     * @return the sEndReceiveDt
     */
    public Date getsEndReceiveDt() {
        return sEndReceiveDt;
    }
    /**
     * @param sEndReceiveDt the sEndReceiveDt to set
     */
    public void setsEndReceiveDt(Date sEndReceiveDt) {
        this.sEndReceiveDt = sEndReceiveDt;
    }

}
