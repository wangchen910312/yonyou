package chn.bhmc.dms.cmm.sci.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistoryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class ChangeHistoryVO extends BaseVO implements Serializable {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1504331882429181886L;

    private String  chgHisSeq;
    private String  sysDstinCd;
    private String  chgTp;
    private String  chgDt;
    private String  chgUsrId;
    private String  chgUsrNm;
    private String  chgKey;
    private String  chgValue;
    private String  chgBefDataVal;
    private String  chgAftDataVal;

    /**
     * @return the chgHisSeq
     */
    public String getChgHisSeq() {
        return chgHisSeq;
    }
    /**
     * @param chgHisSeq the chgHisSeq to set
     */
    public void setChgHisSeq(String chgHisSeq) {
        this.chgHisSeq = chgHisSeq;
    }
    /**
     * @return the sysDstinCd
     */
    public String getSysDstinCd() {
        return sysDstinCd;
    }
    /**
     * @param sysDstinCd the sysDstinCd to set
     */
    public void setSysDstinCd(String sysDstinCd) {
        this.sysDstinCd = sysDstinCd;
    }
    /**
     * @return the chgTp
     */
    public String getChgTp() {
        return chgTp;
    }
    /**
     * @param chgTp the chgTp to set
     */
    public void setChgTp(String chgTp) {
        this.chgTp = chgTp;
    }
    /**
     * @return the chgDt
     */
    public String getChgDt() {
        return chgDt;
    }
    /**
     * @param chgDt the chgDt to set
     */
    public void setChgDt(String chgDt) {
        this.chgDt = chgDt;
    }
    /**
     * @return the chgUsrId
     */
    public String getChgUsrId() {
        return chgUsrId;
    }
    /**
     * @param chgUsrId the chgUsrId to set
     */
    public void setChgUsrId(String chgUsrId) {
        this.chgUsrId = chgUsrId;
    }
    /**
     * @return the chgUsrNm
     */
    public String getChgUsrNm() {
        return chgUsrNm;
    }
    /**
     * @param chgUsrNm the chgUsrNm to set
     */
    public void setChgUsrNm(String chgUsrNm) {
        this.chgUsrNm = chgUsrNm;
    }
    /**
     * @return the chgKey
     */
    public String getChgKey() {
        return chgKey;
    }
    /**
     * @param chgKey the chgKey to set
     */
    public void setChgKey(String chgKey) {
        this.chgKey = chgKey;
    }
    /**
     * @return the chgValue
     */
    public String getChgValue() {
        return chgValue;
    }
    /**
     * @param chgValue the chgValue to set
     */
    public void setChgValue(String chgValue) {
        this.chgValue = chgValue;
    }
    /**
     * @return the chgBefDataVal
     */
    public String getChgBefDataVal() {
        return chgBefDataVal;
    }
    /**
     * @param chgBefDataVal the chgBefDataVal to set
     */
    public void setChgBefDataVal(String chgBefDataVal) {
        this.chgBefDataVal = chgBefDataVal;
    }
    /**
     * @return the chgAftDataVal
     */
    public String getChgAftDataVal() {
        return chgAftDataVal;
    }
    /**
     * @param chgAftDataVal the chgAftDataVal to set
     */
    public void setChgAftDataVal(String chgAftDataVal) {
        this.chgAftDataVal = chgAftDataVal;
    }
}