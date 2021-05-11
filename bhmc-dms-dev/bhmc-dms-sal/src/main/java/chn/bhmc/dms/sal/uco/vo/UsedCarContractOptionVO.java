package chn.bhmc.dms.sal.uco.vo;

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
 * @ClassName   : UsedCarContractReOptionVO
 * @Description : 중고차 - 부가비용 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 14.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"     , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo", mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="seq"       , mesgKey="sal.lbl.seq")
   ,@ValidField(field="addAtcNm"  , mesgKey="sal.lbl.addAtcNm")
   ,@ValidField(field="addAmt"    , mesgKey="sal.lbl.addAmt")
   ,@ValidField(field="regUsrId"  , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"     , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId" , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"    , mesgKey="sal.lbl.updtDt")
   })
public class UsedCarContractOptionVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4796951784247370366L;

    /**
     * 딜러코드
     **/
    private  String     dlrCd;

    /**
     * 계약번호
     **/
    private  String     contractNo;

    /**
     * 일련번호
     **/
    private  int        seq;

    /**
     * 부가항목명
     **/
    //ADD_ATC_NM
    private  String     addAtcNm;

    /**
     * 부가금액
     **/
    //ADD_ATC_AMT
    private  Double     addAtcAmt;

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
    //UPDT_USR_ID
    private  String     updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       updtDt;

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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

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
     * @return the addAtcNm
     */
    public String getAddAtcNm() {
        return addAtcNm;
    }

    /**
     * @param addAtcNm the addAtcNm to set
     */
    public void setAddAtcNm(String addAtcNm) {
        this.addAtcNm = addAtcNm;
    }

    /**
     * @return the addAtcAmt
     */
    public Double getAddAtcAmt() {
        return addAtcAmt;
    }

    /**
     * @param addAtcAmt the addAtcAmt to set
     */
    public void setAddAtcAmt(Double addAtcAmt) {
        this.addAtcAmt = addAtcAmt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
