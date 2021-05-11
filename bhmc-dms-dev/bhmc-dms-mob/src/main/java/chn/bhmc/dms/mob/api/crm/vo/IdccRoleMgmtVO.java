package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회프로세스  VO
 *
 * @ClassName   : IdccRoleMgmtVO.java
 * @Description : IdccRoleMgmtVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class IdccRoleMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2370497889286958323L;

       /**
        * 딜러코드
        **/
       private  String         dlrCd;

       private  String         usrId;

       private  String         usrNm;

       private  String         remark;

       private  String         usrNmRemark;

       /**
        * 등록자ID
        **/
       private  String         regUsrId;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID

       private  String         updtUsrId;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           updtDt;

       private  String         holdMngTp;

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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the usrNmRemark
     */
    public String getUsrNmRemark() {
        return usrNmRemark;
    }

    /**
     * @param usrNmRemark the usrNmRemark to set
     */
    public void setUsrNmRemark(String usrNmRemark) {
        this.usrNmRemark = usrNmRemark;
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
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
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
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the holdMngTp
     */
    public String getHoldMngTp() {
        return holdMngTp;
    }

    /**
     * @param holdMngTp the holdMngTp to set
     */
    public void setHoldMngTp(String holdMngTp) {
        this.holdMngTp = holdMngTp;
    }

}