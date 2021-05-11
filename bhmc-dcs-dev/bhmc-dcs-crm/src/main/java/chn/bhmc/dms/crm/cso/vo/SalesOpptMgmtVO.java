package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 영업 스케쥴  VO
 *
 * @ClassName   : SalesOpptMgmtSaveVO.java
 * @Description : SalesOpptMgmtSaveVO.Class
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     in moon lee     최초 생성
 * </pre>
 */

/*
 *
 *
 *
 *
 * */
@ValidDescriptor({
    @ValidField(field="saleOpptNo"     , mesgKey="global.lbl.saleOpptSeq")       // 판매기회번호
})
public class SalesOpptMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5042730199872922038L;

    @NotEmpty(groups={Modify.class})                // 상태값 변경일때만 validation (최초 등록 / 수정일때는 안함 )
    private  String           saleOpptNo;          // 판매기회일련번호
    private  String           leadNo;               // 리드번호
    @NotEmpty(groups={Draft.class})
    private  String           remark;               // 판매기회 개술
    @NotEmpty(groups={Draft.class})
    private  String           custNo;               // 고객번호
    private  String           custTp;               // 고객유형
    private  String           custNm;               // 고객명
    private  String           custCd;               // 잠재/보유고객
    @NotEmpty(groups={Draft.class})
    private  String           hpNo;                 // 휴대폰번호                             trim 필수
    @NotEmpty(groups={Draft.class})
    private  String           saleOpptStepCd;       // 판매기회단계코드

    //@NotNull(groups={Draft.class})        // TODO validate group 지정 안됨.
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             expcSaleDt;           // 예상판매일자

    private  String           saleOpptSrcCd;        // 판매기회출처코드
    private  String           trsfStatCd;           // 전출상태코드
    private  String           succPrbCd;            // 성공확률코드
    @NotEmpty(groups={Draft.class})
    private  String           scId;                 // 판매고문
    private  String           scNm;                 // 판매고문이름




    private  int              seq;                  // 판매 기회 히스토리 일련번호
    private  String           dlrCd;                // 딜러코드

    private  String           bhmcYn = "N";         // BHMC여부
    private  String           carlineCd;            // 차종 코드
    private  String           carlineNm;            // 차종 이름
    private  String           modelCd;              // 차량 코드
    private  String           modelNm;              // 차량 이름
    private  int              regPrid;              //  판매기회 등록 기간 ( 등록일 기준 )

    private  String           mathDocTp;              //신분증유형
    private  String           ssnCrnNo;               //증서번호
    private  String           emailNm;               //이메일


    /**
     * @return the saleOpptNo
     */
    public String getSaleOpptNo() {
        return saleOpptNo;
    }
    /**
     * @param saleOpptNo the saleOpptNo to set
     */
    public void setSaleOpptNo(String saleOpptNo) {
        this.saleOpptNo = saleOpptNo;
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
        this.hpNo = hpNo.trim();
    }
    /**
     * @return the saleOpptStepCd
     */
    public String getSaleOpptStepCd() {
        return saleOpptStepCd;
    }
    /**
     * @param saleOpptStepCd the saleOpptStepCd to set
     */
    public void setSaleOpptStepCd(String saleOpptStepCd) {
        this.saleOpptStepCd = saleOpptStepCd;
    }
    /**
     * @return the expcSaleDt
     */
    public Date getExpcSaleDt() {
        return expcSaleDt;
    }
    /**
     * @param expcSaleDt the expcSaleDt to set
     */
    public void setExpcSaleDt(Date expcSaleDt) {
        this.expcSaleDt = expcSaleDt;
    }
    /**
     * @return the saleOpptSrcCd
     */
    public String getSaleOpptSrcCd() {
        return saleOpptSrcCd;
    }
    /**
     * @param saleOpptSrcCd the saleOpptSrcCd to set
     */
    public void setSaleOpptSrcCd(String saleOpptSrcCd) {
        this.saleOpptSrcCd = saleOpptSrcCd;
    }
    /**
     * @return the trsfStatCd
     */
    public String getTrsfStatCd() {
        return trsfStatCd;
    }
    /**
     * @param trsfStatCd the trsfStatCd to set
     */
    public void setTrsfStatCd(String trsfStatCd) {
        this.trsfStatCd = trsfStatCd;
    }
    /**
     * @return the succPrbCd
     */
    public String getSuccPrbCd() {
        return succPrbCd;
    }
    /**
     * @param succPrbCd the succPrbCd to set
     */
    public void setSuccPrbCd(String succPrbCd) {
        this.succPrbCd = succPrbCd;
    }
    /**
     * @return the scId
     */
    public String getScId() {
        return scId;
    }
    /**
     * @param scId the scId to set
     */
    public void setScId(String scId) {
        this.scId = scId;
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
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }
    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the regPrid
     */
    public int getRegPrid() {
        return regPrid;
    }
    /**
     * @param regPrid the regPrid to set
     */
    public void setRegPrid(int regPrid) {
        this.regPrid = regPrid;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }
    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }
    /**
     * @return the leadNo
     */
    public String getLeadNo() {
        return leadNo;
    }
    /**
     * @param leadNo the leadNo to set
     */
    public void setLeadNo(String leadNo) {
        this.leadNo = leadNo;
    }

    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }
    /**
     * @param mathDocTp the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
    }
    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }

    /**
     * @return the scNm
     */
    public String getScNm() {
        return scNm;
    }
    /**
     * @param scNm the scNm to set
     */
    public void setScNm(String scNm) {
        this.scNm = scNm;
    }
    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }
    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }
    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SalesOpptMgmtVO [saleOpptNo=" + saleOpptNo + ", leadNo=" + leadNo + ", remark=" + remark + ", custNo="
                + custNo + ", custTp=" + custTp + ", custNm=" + custNm + ", custCd=" + custCd + ", hpNo=" + hpNo
                + ", saleOpptStepCd=" + saleOpptStepCd + ", expcSaleDt=" + expcSaleDt + ", saleOpptSrcCd="
                + saleOpptSrcCd + ", trsfStatCd=" + trsfStatCd + ", succPrbCd=" + succPrbCd + ", scId=" + scId
                + ", scNm=" + scNm + ", seq=" + seq + ", dlrCd=" + dlrCd + ", bhmcYn=" + bhmcYn + ", carlineCd="
                + carlineCd + ", carlineNm=" + carlineNm + ", modelCd=" + modelCd + ", modelNm=" + modelNm
                + ", regPrid=" + regPrid + ", mathDocTp=" + mathDocTp + ", ssnCrnNo=" + ssnCrnNo + "]";
    }


}