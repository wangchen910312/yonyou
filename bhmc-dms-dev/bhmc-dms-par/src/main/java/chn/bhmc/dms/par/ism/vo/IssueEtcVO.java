package chn.bhmc.dms.par.ism.vo;

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
 * @ClassName   : PurcOrdVO.java
 * @Description : PurcOrdVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="etcGiDocNo", mesgKey="par.lbl.etcGiDocNo")
    ,@ValidField(field="statCd", mesgKey="par.lbl.statNm")
    ,@ValidField(field="mvtTp", mesgKey="par.lbl.mvtTp")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
   })
public class IssueEtcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 기타출고문서번호
     **/
    private String etcGiDocNo;

    /**
     * 상태코드
     **/
    private String statCd;

    /**
     * 반환상태
     **/
    private String returnStat;

    /**
     * 수불유형
     **/
    private String mvtTp;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 등록자명
     **/
    private String regUsrNm;

    /**
     * 항목 수
     **/
    private int itemCnt;

    /**
     * 품목수량
     **/
    private Double itemQty;

    /**
     * 부가세 제외 총금액
     **/
    private Double giTaxDdctAmt;

    /**
     * 총금액
     **/
    private Double giTotAmt;

    /**
     * 세액
     **/
    private Double giTaxAmt;

    /**
     * 부가세
     **/
    private Double vatAmt;

    /**
     * 할인율
     **/
    private Double dcRate;


    /**
     * 반품건수
     **/
    private Double returnItemCnt;

    /**
     * 반품수량(합)
     **/
    private Double returnItemQty;

    /**
     * 반품금액(합)
     **/
    private Double returnTaxDdctAmt;

    /**
     * 반품금액
     **/
    private Double returnTotAmt;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

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
     * @return the etcGiDocNo
     */
    public String getEtcGiDocNo() {
        return etcGiDocNo;
    }

    /**
     * @param etcGiDocNo the etcGiDocNo to set
     */
    public void setEtcGiDocNo(String etcGiDocNo) {
        this.etcGiDocNo = etcGiDocNo;
    }

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
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
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
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
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the giTaxDdctAmt
     */
    public Double getGiTaxDdctAmt() {
        return giTaxDdctAmt;
    }

    /**
     * @param giTaxDdctAmt the giTaxDdctAmt to set
     */
    public void setGiTaxDdctAmt(Double giTaxDdctAmt) {
        this.giTaxDdctAmt = giTaxDdctAmt;
    }

    /**
     * @return the giTotAmt
     */
    public Double getGiTotAmt() {
        return giTotAmt;
    }

    /**
     * @param giTotAmt the giTotAmt to set
     */
    public void setGiTotAmt(Double giTotAmt) {
        this.giTotAmt = giTotAmt;
    }

    /**
     * @return the giTaxAmt
     */
    public Double getGiTaxAmt() {
        return giTaxAmt;
    }

    /**
     * @param giTaxAmt the giTaxAmt to set
     */
    public void setGiTaxAmt(Double giTaxAmt) {
        this.giTaxAmt = giTaxAmt;
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
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the returnItemCnt
     */
    public Double getReturnItemCnt() {
        return returnItemCnt;
    }

    /**
     * @param returnItemCnt the returnItemCnt to set
     */
    public void setReturnItemCnt(Double returnItemCnt) {
        this.returnItemCnt = returnItemCnt;
    }

    /**
     * @return the returnItemQty
     */
    public Double getReturnItemQty() {
        return returnItemQty;
    }

    /**
     * @param returnItemQty the returnItemQty to set
     */
    public void setReturnItemQty(Double returnItemQty) {
        this.returnItemQty = returnItemQty;
    }

    /**
     * @return the returnTaxDdctAmt
     */
    public Double getReturnTaxDdctAmt() {
        return returnTaxDdctAmt;
    }

    /**
     * @param returnTaxDdctAmt the returnTaxDdctAmt to set
     */
    public void setReturnTaxDdctAmt(Double returnTaxDdctAmt) {
        this.returnTaxDdctAmt = returnTaxDdctAmt;
    }

    /**
     * @return the returnStat
     */
    public String getReturnStat() {
        return returnStat;
    }

    /**
     * @param returnStat the returnStat to set
     */
    public void setReturnStat(String returnStat) {
        this.returnStat = returnStat;
    }

    /**
     * @return the returnTotAmt
     */
    public Double getReturnTotAmt() {
        return returnTotAmt;
    }

    /**
     * @param returnTotAmt the returnTotAmt to set
     */
    public void setReturnTotAmt(Double returnTotAmt) {
        this.returnTotAmt = returnTotAmt;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

    /**
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }
}
