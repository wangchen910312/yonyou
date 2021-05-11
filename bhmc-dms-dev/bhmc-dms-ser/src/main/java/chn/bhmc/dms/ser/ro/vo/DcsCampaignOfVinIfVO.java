package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName: PreCheckVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 * since author description
 * ===================================================
 * 2016. 3. 28. Kwon Ki Hyun 최초 생성
 * </pre>
 */

public class DcsCampaignOfVinIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2375143456488245249L;

    /**
     * DLR_CD
     **/
    @JsonProperty("DLR_CD")
    private String dlrCd;

    /**
     * CR_NO
     */
    @JsonProperty("CR_NO")
    private String crNo;

    /**
     * lbr_cd
     **/
    @JsonProperty("LBR_CD")
    private String lbrCd;

    /**
     * VIN_NO
     **/
    @JsonProperty("VIN_NO")
    private String vinNo;

    /**
     * cr_tp
     **/
    @JsonProperty("CR_TP")
    private String crTp;

    /**
     * reg_usr_id
     **/
    @JsonProperty("REG_USR_ID")
    private String regUsrId;

    /**
     * regDt
     **/
    @JsonProperty("REG_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * updt_usr_id
     **/
    @JsonProperty("UPDT_USR_ID")
    private String updtUsrId;

    /**
     * UPDT_DT
     **/
    @JsonProperty("UPDT_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * del_yn
     **/
    @JsonProperty("DEL_YN")
    private String delYn;

    /**
     * ro_doc_no
     **/
    @JsonProperty("RO_DOC_NO")
    private String roDocNo;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the crTp
     */
    public String getCrTp() {
        return crTp;
    }

    /**
     * @param crTp the crTp to set
     */
    public void setCrTp(String crTp) {
        this.crTp = crTp;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

}
