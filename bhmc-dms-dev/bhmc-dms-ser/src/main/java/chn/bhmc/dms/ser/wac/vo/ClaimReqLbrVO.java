package chn.bhmc.dms.ser.wac.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : ClaimReqLbrVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *   since  authordescription
 * ===========  =============  ===========================
 * 2016. 5. 17.   Kwon Ki Hyun   최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="roDocNo", mesgKey="ser.lbl.roDocNo")
    ,@ValidField(field="claimDocNo", mesgKey="ser.lbl.claimNo")
})
public class ClaimReqLbrVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5482939655830392690L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    @NotBlank
    private String claimDocNo;

    /**
     * 라인번호
     **/
    private int   lineNo;

    /**
     * RO문서번호
     **/
    private String roDocNo;

    /**
     * 공임코드
     **/
    private String lbrCd;

    /**
     * 공임명
     **/
    private String lbrNm;

    /**
     * 패키지품목코드
     **/
    private String pkgItemCd;

    /**
     * 공임단가
     **/
    private Double lbrPrc;

    /**
     * 공임시간
     **/
    private Double lbrHm;

    /**
     * 공임수량
     */
    private int lbrQty;

    /**
     * 공임금액
     **/
    private Double lbrAmt;

    /**
     * 확정공임금액
     **/
    private Double comfirmLbrAmt;

    /**
     * 캠페인리콜번호
     **/
    private String crNo;

    /**
     * 외주거래처코드
     **/
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    private String subBpNm;

    /**
     * 클레임연도
     **/
    private String claimYy;

    /**
     * 원인공임여부
     **/
    @NotBlank
    private String cauLbrYn;

    private String cauCd;
    private String cauNm;
    private String phenCd;
    private String phenNm;

    private String lbrTp;
    private String lbrCdTp;

    /**
     * 보조작업 연관 여부
     */
    private String relCauLbrYn;

    /**
     * 공임 구분코드
     */
    private String dstinCd;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
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
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
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
     * @return the comfirmLbrAmt
     */
    public Double getComfirmLbrAmt() {
        return comfirmLbrAmt;
    }

    /**
     * @param comfirmLbrAmt the comfirmLbrAmt to set
     */
    public void setComfirmLbrAmt(Double comfirmLbrAmt) {
        this.comfirmLbrAmt = comfirmLbrAmt;
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
     * @return the claimYy
     */
    public String getClaimYy() {
        return claimYy;
    }

    /**
     * @param claimYy the claimYy to set
     */
    public void setClaimYy(String claimYy) {
        this.claimYy = claimYy;
    }

    /**
     * @return the cauLbrYn
     */
    public String getCauLbrYn() {
        return cauLbrYn;
    }

    /**
     * @param cauLbrYn the cauLbrYn to set
     */
    public void setCauLbrYn(String cauLbrYn) {
        this.cauLbrYn = cauLbrYn;
    }

    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
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
     * @return the relCauLbrYn
     */
    public String getRelCauLbrYn() {
        return relCauLbrYn;
    }

    /**
     * @param relCauLbrYn the relCauLbrYn to set
     */
    public void setRelCauLbrYn(String relCauLbrYn) {
        this.relCauLbrYn = relCauLbrYn;
    }

    public String getDstinCd() {
        return dstinCd;
    }

    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
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
     * @return the lbrCdTp
     */
    public String getLbrCdTp() {
        return lbrCdTp;
    }

    /**
     * @param lbrCdTp the lbrCdTp to set
     */
    public void setLbrCdTp(String lbrCdTp) {
        this.lbrCdTp = lbrCdTp;
    }



}
