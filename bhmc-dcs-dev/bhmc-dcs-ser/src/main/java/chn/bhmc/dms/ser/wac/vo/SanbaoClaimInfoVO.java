package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoClaimInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoClaimInfoVO extends BaseVO{

   /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -1199718015944900709L;

   //DLR_CD
    public String dlrCd; //딜러코드

    //RO_DOC_NO
    public String roDocNo;//ro번호

    //CLAIM_DOC_NO
    public String claimDocNo;//클레임번호

    //CLAIM_TP
    public String claimTp;//클레임유형

    //RUN_DIST_VAL
    public int runDistVal;//주행거리

    //CAU_ITEM_CD
    public String cauItemCd;//원인부품코드

    //CAU_ITEM_NM
    public String cauItemNm;//원인부품명

    //CAU_CD
    public String cauCd; //원인코드

    //CAU_NM
    public String cauNm;//원인코드명

    //PHEN_CD
    public String phenCd;//현상코드

    //PHEN_NM
    public String phenNm;//현상코드명

    //RO_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date roStartDt;//ro 시작일

    //RO_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date roEndDt;//ro 종료일

    //RO_WORK_HM
    public int roWorkHm;//작업시간

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getRoDocNo() {
        return roDocNo;
    }

    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    public String getClaimDocNo() {
        return claimDocNo;
    }

    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    public String getClaimTp() {
        return claimTp;
    }

    public void setClaimTp(String claimTp) {
        this.claimTp = claimTp;
    }

    public int getRunDistVal() {
        return runDistVal;
    }

    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

    public String getCauItemCd() {
        return cauItemCd;
    }

    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    public String getCauItemNm() {
        return cauItemNm;
    }

    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    public String getCauCd() {
        return cauCd;
    }

    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    public String getCauNm() {
        return cauNm;
    }

    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    public String getPhenCd() {
        return phenCd;
    }

    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    public String getPhenNm() {
        return phenNm;
    }

    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

    public Date getRoStartDt() {
        return roStartDt;
    }

    public void setRoStartDt(Date roStartDt) {
        this.roStartDt = roStartDt;
    }

    public Date getRoEndDt() {
        return roEndDt;
    }

    public void setRoEndDt(Date roEndDt) {
        this.roEndDt = roEndDt;
    }

    public int getRoWorkHm() {
        return roWorkHm;
    }

    public void setRoWorkHm(int roWorkHm) {
        this.roWorkHm = roWorkHm;
    }

     
}
