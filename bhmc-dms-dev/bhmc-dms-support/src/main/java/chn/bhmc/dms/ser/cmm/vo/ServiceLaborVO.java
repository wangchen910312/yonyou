package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ServiceLaborVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5484193064778881931L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * PREFIX ID
     **/
    @NotEmpty
    private String preFixId;

    /**
     * 문서번호
     **/
    @NotEmpty
    private String docNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * RO유형
     **/
    //RO_TP
    private String roTp;

    /**
     * 공임코드
     **/
    //LBR_CD
    private String lbrCd;

    /**
     * 공임명
     **/
    //LBR_NM
    private String lbrNm;

    /**
     * 패키지품목코드
     **/
    //PKG_ITEM_CD
    private String pkgItemCd;

    /**
     * 공임유형
     **/
    //LBR_TP
    private String lbrTp;

    /**
     * 공임유형
     **/
    //LBR_TP_NM
    private String lbrTpNm;

    /**
     * 공임단가
     **/
    //LBR_PRC
    private Double lbrPrc;

    /**
     * 공임수량
     **/
    //LBR_QTY
    private Double lbrQty;

    /**
     * 공임시간
     **/
    //LBR_HM
    private Double lbrHm;

    /**
     * 보증 공임시간
     **/
    private Double lbrOrgHm;

    /**
     * 배분시간
     **/
    //DSTB_HM
    private Double dstbHm;

    /**
     * 할인금액
     **/
    //DC_AMT
    private Double dcAmt;

    /**
     * 할인율
     **/
    //DC_RATE
    private Double dcRate;

    /**
     * 공임합계금액
     **/
    //LBR_TOT_AMT
    private Double lbrTotAmt;

    private Double lbrAmt;

    /**
     * 캠페인리콜번호
     **/
    //CR_NO
    private String crNo;

    /**
     * 캠페인리콜명
     **/
    //CR_NM
    private String crNm;

    /**
     * 캠페인리콜유형
     **/
    //CR_TP
    private String crTp;

    /**
     * FMS쿠폰품목코드
     **/
    //FMS_CUPN_ITEM_CD
    private String fmsCupnItemCd;

    /**
     * FMS품목코드
     **/
    //FMS_ITEM_CD
    private String fmsItemCd;

    /**
     * 외주거래처코드
     **/
    //SUB_BP_CD
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    //SUB_BP_NM
    private String subBpNm;

    /**
     * 지불회사명
     **/
    //PAY_CMP_NM
    private String payCmpNm;

    /**
     * 결제자유형
     **/
    //PAYM_TP
    private String paymTp;

    /**
     * 결제자번호
     */
    private String paymCd;

    /**
     * 결제자명
     **/
    //PAYM_USR_NM
    private String paymUsrNm;

    /**
     * 비고
     **/
    //REMARK
    private String remark;

    /**
     * 원인코드
     **/
    //CAU_CD
    private String cauCd;

    /**
     * 원인명
     **/
    //CAU_NM
    private String cauNm;

    /**
     * 현상코드
     **/
    //PHEN_CD
    private String phenCd;

    /**
     * 현상명
     **/
    //PHEN_NM
    private String phenNm;

    /**
     * 캠페인 사용이력 삭제여부
     **/
    private String delYn;

    /**
     * 캠페인 사용이력 삭제여부
     **/
    private String vinNo;


    /**
     * 배정 정비사
     */
    private String realTecNm;

    /**
     * 구분코드
     */
    private String dstinCd;

    /**
     * BAY 번호
     */
    private String bayNo;

    /**
     * BAY 명
     */
    private String bayNm;

    /**
     * 정비소조
     */
    private String wkgrpNm;

    /**
     * 정비건수
     */
    private int serCnt;
    /**
     * 난의도계수
     */
    private int diffVal;
    /**
     * 공임계수
     */
    private int lbrCnt;

    /**
     * 주작업 여부
     */
    private String cauLbrYn;

    /**
     * 보조작업 연관 여부
     */
    private String relCauLbrYn;

    /**
     * 작업배분상태
     */
    private String allocStatCd;

    /**
     * 작업진도상태
     */
    private String wrkStatCd;

    /**
     * 작업배분공임시간
     */
    private String wrkAllocHm;

    /**
     * 배분공임시간
     */
    private Double allocHm;


    public String getCauLbrYn() {
        return cauLbrYn;
    }

    public void setCauLbrYn(String cauLbrYn) {
        this.cauLbrYn = cauLbrYn;
    }

    public String getRelCauLbrYn() {
        return relCauLbrYn;
    }

    public void setRelCauLbrYn(String relCauLbrYn) {
        this.relCauLbrYn = relCauLbrYn;
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
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }

    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
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
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }

    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the lbrPrc
     */
    public Double getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the lbrQty
     */
    public Double getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(Double lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    /**
     * @return the dstbHm
     */
    public Double getDstbHm() {
        return dstbHm;
    }

    /**
     * @param dstbHm the dstbHm to set
     */
    public void setDstbHm(Double dstbHm) {
        this.dstbHm = dstbHm;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the lbrTotAmt
     */
    public Double getLbrTotAmt() {
        return lbrTotAmt;
    }

    /**
     * @param lbrTotAmt the lbrTotAmt to set
     */
    public void setLbrTotAmt(Double lbrTotAmt) {
        this.lbrTotAmt = lbrTotAmt;
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
     * @return the crNm
     */
    public String getCrNm() {
        return crNm;
    }

    /**
     * @param crNm the crNm to set
     */
    public void setCrNm(String crNm) {
        this.crNm = crNm;
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
     * @return the fmsCupnItemCd
     */
    public String getFmsCupnItemCd() {
        return fmsCupnItemCd;
    }

    /**
     * @param fmsCupnItemCd the fmsCupnItemCd to set
     */
    public void setFmsCupnItemCd(String fmsCupnItemCd) {
        this.fmsCupnItemCd = fmsCupnItemCd;
    }

    /**
     * @return the fmsItemCd
     */
    public String getFmsItemCd() {
        return fmsItemCd;
    }

    /**
     * @param fmsItemCd the fmsItemCd to set
     */
    public void setFmsItemCd(String fmsItemCd) {
        this.fmsItemCd = fmsItemCd;
    }

    /**
     * @return the subBpCd
     */
    public String getSubBpCd() {
        return subBpCd;
    }

    /**
     * @param subBpCd the subBpCd to set
     */
    public void setSubBpCd(String subBpCd) {
        this.subBpCd = subBpCd;
    }

    /**
     * @return the subBpNm
     */
    public String getSubBpNm() {
        return subBpNm;
    }

    /**
     * @param subBpNm the subBpNm to set
     */
    public void setSubBpNm(String subBpNm) {
        this.subBpNm = subBpNm;
    }

    /**
     * @return the payCmpNm
     */
    public String getPayCmpNm() {
        return payCmpNm;
    }

    /**
     * @param payCmpNm the payCmpNm to set
     */
    public void setPayCmpNm(String payCmpNm) {
        this.payCmpNm = payCmpNm;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }



    /**
     * @return the paymCd
     */
    public String getPaymCd() {
        return paymCd;
    }

    /**
     * @param paymCd the paymCd to set
     */
    public void setPaymCd(String paymCd) {
        this.paymCd = paymCd;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
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
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
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
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    /**
     * @return the lbrOrgHm
     */
    public Double getLbrOrgHm() {
        return lbrOrgHm;
    }

    /**
     * @param lbrOrgHm the lbrOrgHm to set
     */
    public void setLbrOrgHm(Double lbrOrgHm) {
        this.lbrOrgHm = lbrOrgHm;
    }


    /**
     * @return the realTecNm
     */
    public String getRealTecNm() {
        return realTecNm;
    }

    /**
     * @param realTecNm the realTecNm to set
     */
    public void setRealTecNm(String realTecNm) {
        this.realTecNm = realTecNm;
    }

    /**
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }

    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }

    /**
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }

    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    /**
     * @return the wkgrpNm
     */
    public String getWkgrpNm() {
        return wkgrpNm;
    }

    /**
     * @param wkgrpNm the wkgrpNm to set
     */
    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
    }

    public int getSerCnt() {
        return serCnt;
    }

    public void setSerCnt(int serCnt) {
        this.serCnt = serCnt;
    }

    /**
     * @return the diffVal
     */
    public int getDiffVal() {
        return diffVal;
    }

    /**
     * @param diffVal the diffVal to set
     */
    public void setDiffVal(int diffVal) {
        this.diffVal = diffVal;
    }

    /**
     * @return the lbrCnt
     */
    public int getLbrCnt() {
        return lbrCnt;
    }

    /**
     * @param lbrCnt the lbrCnt to set
     */
    public void setLbrCnt(int lbrCnt) {
        this.lbrCnt = lbrCnt;
    }

    /**
     * @return the allocStatCd
     */
    public String getAllocStatCd() {
        return allocStatCd;
    }

    /**
     * @param allocStatCd the allocStatCd to set
     */
    public void setAllocStatCd(String allocStatCd) {
        this.allocStatCd = allocStatCd;
    }

    /**
     * @return the wrkStatCd
     */
    public String getWrkStatCd() {
        return wrkStatCd;
    }

    /**
     * @param wrkStatCd the wrkStatCd to set
     */
    public void setWrkStatCd(String wrkStatCd) {
        this.wrkStatCd = wrkStatCd;
    }

    /**
     * @param wrkAllocHm the wrkAllocHm to set
     */
    public void setWrkAllocHm(String wrkAllocHm) {
        this.wrkAllocHm = wrkAllocHm;
    }

    /**
     * @return the wrkAllocHm
     */
    public String getWrkAllocHm() {
        return wrkAllocHm;
    }

    /**
     * @param allocHm the allocHm to set
     */
    public void setAllocHm(Double allocHm) {
        this.allocHm = allocHm;
    }

    /**
     * @return the allocHm
     */
    public Double getAllocHm() {
        return allocHm;
    }

    /**
     * @param lbrTpNm the lbrTpNm to set
     */
    public void setLbrTpNm(String lbrTpNm) {
        this.lbrTpNm = lbrTpNm;
    }

    /**
     * @return the lbrTpNm
     */
    public String getLbrTpNm() {
        return lbrTpNm;
    }


}