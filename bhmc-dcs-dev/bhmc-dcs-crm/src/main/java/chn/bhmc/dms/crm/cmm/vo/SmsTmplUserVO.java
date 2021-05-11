package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsTmplUserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.06.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.27.     In Moon Lee         최초 생성
 * </pre>
 */

@ValidDescriptor({

    @ValidField(field="regUsrId"  , mesgKey="global.lbl.regUsrId")
   ,@ValidField(field="regDt"     , mesgKey="global.lbl.regDt")
   ,@ValidField(field="updtUsrId" , mesgKey="global.lbl.updtUsrId")
   ,@ValidField(field="updtDt"    , mesgKey="global.lbl.updtDt")
   })

public class SmsTmplUserVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7066322624247967312L;

    /**
     * 일련번호
     **/
    private  int        seq;

    /**
     * 고객번호
     **/
    private  String     custNo;

    /**
     * 고객명
     **/
    private  String     custNm;

    /**
     * 휴대폰번호
     **/
    private  String     hpNo;

    /**
     * 참조키
     **/
    private  String     refKeyNm;

    /**
     * 등록자ID
     **/
    private  String     regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       regDt;

    /**
     * 수정자ID
     **/
    private  String     updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       updtDt;

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
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
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }

    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SmsTmplUserVO [seq=" + seq + ", custNo=" + custNo + ", custNm=" + custNm + ", hpNo=" + hpNo
                + ", refKeyNm=" + refKeyNm + ", regUsrId=" + regUsrId + ", regDt=" + regDt + ", updtUsrId=" + updtUsrId
                + ", updtDt=" + updtDt + "]";
    }

}