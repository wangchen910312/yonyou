package chn.bhmc.dms.bat.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * BatchInvoice DMS VO
 *
 * @ClassName   : BatInvcVO.java
 * @Description : BatInvcVO Class
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */
public class BatInvcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4000196348932602272L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    @NotEmpty
    private String invcDocNo;

    /**
     * 송장유형
     **/
    //INVC_TP
    private String invcTp;

    /**
     * 송장구분코드
     **/
    private String invcDstinCd;

    /**
     * 송장상태코드
     **/
    private String invcStatCd;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 거래처코드
     **/
    //BP_CD
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 통화코드
     **/
    //CURR_CD
    private String currCd;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 부가세코드
     **/
    private String vatCd;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 인터페이스여부
     **/
    private String ifYn;

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
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
     * @return the invcDocNo
     */
    public String getInvcDocNo() {
        return invcDocNo;
    }

    /**
     * @param invcDocNo the invcDocNo to set
     */
    public void setInvcDocNo(String invcDocNo) {
        this.invcDocNo = invcDocNo;
    }

    /**
     * @return the invcTp
     */
    public String getInvcTp() {
        return invcTp;
    }

    /**
     * @param invcTp the invcTp to set
     */
    public void setInvcTp(String invcTp) {
        this.invcTp = invcTp;
    }

    /**
     * @return the invcDstinCd
     */
    public String getInvcDstinCd() {
        return invcDstinCd;
    }

    /**
     * @param invcDstinCd the invcDstinCd to set
     */
    public void setInvcDstinCd(String invcDstinCd) {
        this.invcDstinCd = invcDstinCd;
    }

    /**
     * @return the invcStatCd
     */
    public String getInvcStatCd() {
        return invcStatCd;
    }

    /**
     * @param invcStatCd the invcStatCd to set
     */
    public void setInvcStatCd(String invcStatCd) {
        this.invcStatCd = invcStatCd;
    }

    /**
     * @return the invcDt
     */
    public Date getInvcDt() {
        return invcDt;
    }

    /**
     * @param invcDt the invcDt to set
     */
    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
    }

    /**
     * @return the arrvDt
     */
    public Date getArrvDt() {
        return arrvDt;
    }

    /**
     * @param arrvDt the arrvDt to set
     */
    public void setArrvDt(Date arrvDt) {
        this.arrvDt = arrvDt;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the mobisInvcNo
     */
    public String getMobisInvcNo() {
        return mobisInvcNo;
    }

    /**
     * @param mobisInvcNo the mobisInvcNo to set
     */
    public void setMobisInvcNo(String mobisInvcNo) {
        this.mobisInvcNo = mobisInvcNo;
    }

    /**
     * @return the purcOrdNo
     */
    public String getPurcOrdNo() {
        return purcOrdNo;
    }

    /**
     * @param purcOrdNo the purcOrdNo to set
     */
    public void setPurcOrdNo(String purcOrdNo) {
        this.purcOrdNo = purcOrdNo;
    }

    /**
     * @return the currCd
     */
    public String getCurrCd() {
        return currCd;
    }

    /**
     * @param currCd the currCd to set
     */
    public void setCurrCd(String currCd) {
        this.currCd = currCd;
    }

    /**
     * @return the invcTotAmt
     */
    public Double getInvcTotAmt() {
        return invcTotAmt;
    }

    /**
     * @param invcTotAmt the invcTotAmt to set
     */
    public void setInvcTotAmt(Double invcTotAmt) {
        this.invcTotAmt = invcTotAmt;
    }

    /**
     * @return the vatCd
     */
    public String getVatCd() {
        return vatCd;
    }

    /**
     * @param vatCd the vatCd to set
     */
    public void setVatCd(String vatCd) {
        this.vatCd = vatCd;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
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
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }

    /**
     * @return the ifYn
     */
    public String getIfYn() {
        return ifYn;
    }

    /**
     * @param ifYn the ifYn to set
     */
    public void setIfYn(String ifYn) {
        this.ifYn = ifYn;
    }

}
