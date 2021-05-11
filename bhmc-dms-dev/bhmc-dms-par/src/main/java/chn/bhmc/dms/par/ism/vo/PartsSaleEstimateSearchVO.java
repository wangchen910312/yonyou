package chn.bhmc.dms.par.ism.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleEstimateSearchVO.java
 * @Description : PartsSaleEstimateSearchVO.class
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

public class PartsSaleEstimateSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5889788098505718469L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 부품판매오더번호
     **/
    private String sEstimateDocNo;

    /**
     * 상태코드리스트
     **/
    private List<String> sEstimateStatLst;


    /**
     * 오더상태코드
     **/
    private String sStatCd;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEstimateDt;


    /**
     * 견적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEstimateDtFr;

    /**
     * 견적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEstimateDtTo;

    /**
     * 고객유형
     **/
    private String sCustTp;

    /**
     * 판매유형
     **/
    private String sSaleTp;

    /**
     * 고객코드
     **/
    private String sCustNo;

    /**
     * 고객명
     **/
    private String sCustNm;

    /**
     * 고객전화번호
     **/
    private String sCustTelNo;

    /**
     * SAID
     **/
    private String sSaId;

    /**
     * SANM
     **/
    private String sSaNm;

    /**
     * SALE_PRSN_ID
     **/
    private String sSalePrsnId;

    /**
     * SALE_PRSN_NM
     **/
    private String sSalePrsnNm;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 할인율
     **/

    private int sDcRate;

    /**
     * 할인전총금액
     **/
    private Double sDcBefTotAmt;

    /**
     * 할인금액
     **/
    private Double sDcAmt;

    /**
     * 총금액
     **/
    private Double sTotAmt;

    /**
     * 부가세금액
     **/
    private Double sVatAmt;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sEstimateDocNo
     */
    public String getsEstimateDocNo() {
        return sEstimateDocNo;
    }

    /**
     * @param sEstimateDocNo the sEstimateDocNo to set
     */
    public void setsEstimateDocNo(String sEstimateDocNo) {
        this.sEstimateDocNo = sEstimateDocNo;
    }

    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }

    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }

    /**
     * @return the sEstimateDt
     */
    public Date getsEstimateDt() {
        return sEstimateDt;
    }

    /**
     * @param sEstimateDt the sEstimateDt to set
     */
    public void setsEstimateDt(Date sEstimateDt) {
        this.sEstimateDt = sEstimateDt;
    }

    /**
     * @return the sEstimateDtFr
     */
    public Date getsEstimateDtFr() {
        return sEstimateDtFr;
    }

    /**
     * @param sEstimateDtFr the sEstimateDtFr to set
     */
    public void setsEstimateDtFr(Date sEstimateDtFr) {
        this.sEstimateDtFr = sEstimateDtFr;
    }

    /**
     * @return the sEstimateDtTo
     */
    public Date getsEstimateDtTo() {
        return sEstimateDtTo;
    }

    /**
     * @param sEstimateDtTo the sEstimateDtTo to set
     */
    public void setsEstimateDtTo(Date sEstimateDtTo) {
        this.sEstimateDtTo = sEstimateDtTo;
    }

    /**
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sCustTelNo
     */
    public String getsCustTelNo() {
        return sCustTelNo;
    }

    /**
     * @param sCustTelNo the sCustTelNo to set
     */
    public void setsCustTelNo(String sCustTelNo) {
        this.sCustTelNo = sCustTelNo;
    }

    /**
     * @return the sSaId
     */
    public String getsSaId() {
        return sSaId;
    }

    /**
     * @param sSaId the sSaId to set
     */
    public void setsSaId(String sSaId) {
        this.sSaId = sSaId;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sDcRate
     */
    public int getsDcRate() {
        return sDcRate;
    }

    /**
     * @param sDcRate the sDcRate to set
     */
    public void setsDcRate(int sDcRate) {
        this.sDcRate = sDcRate;
    }

    /**
     * @return the sDcBefTotAmt
     */
    public Double getsDcBefTotAmt() {
        return sDcBefTotAmt;
    }

    /**
     * @param sDcBefTotAmt the sDcBefTotAmt to set
     */
    public void setsDcBefTotAmt(Double sDcBefTotAmt) {
        this.sDcBefTotAmt = sDcBefTotAmt;
    }

    /**
     * @return the sDcAmt
     */
    public Double getsDcAmt() {
        return sDcAmt;
    }

    /**
     * @param sDcAmt the sDcAmt to set
     */
    public void setsDcAmt(Double sDcAmt) {
        this.sDcAmt = sDcAmt;
    }

    /**
     * @return the sTotAmt
     */
    public Double getsTotAmt() {
        return sTotAmt;
    }

    /**
     * @param sTotAmt the sTotAmt to set
     */
    public void setsTotAmt(Double sTotAmt) {
        this.sTotAmt = sTotAmt;
    }

    /**
     * @return the sVatAmt
     */
    public Double getsVatAmt() {
        return sVatAmt;
    }

    /**
     * @param sVatAmt the sVatAmt to set
     */
    public void setsVatAmt(Double sVatAmt) {
        this.sVatAmt = sVatAmt;
    }

    /**
     * @return the sSaNm
     */
    public String getsSaNm() {
        return sSaNm;
    }

    /**
     * @param sSaNm the sSaNm to set
     */
    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }
    /**
     * @return the sSalePrsnId
     */
    public String getsSalePrsnId() {
        return sSalePrsnId;
    }

    /**
     * @param sSalePrsnId the sSalePrsnId to set
     */
    public void setsSalePrsnId(String sSalePrsnId) {
        this.sSalePrsnId = sSalePrsnId;
    }
    /**
     * @return the sSalePrsnNm
     */
    public String getsSalePrsnNm() {
        return sSalePrsnNm;
    }

    /**
     * @param sSalePrsnNm the sSalePrsnNm to set
     */
    public void setsSalePrsnNm(String sSalePrsnNm) {
        this.sSalePrsnNm = sSalePrsnNm;
    }

    /**
     * @return the sEstimateStatLst
     */
    public List<String> getsEstimateStatLst() {
        return sEstimateStatLst;
    }

    /**
     * @param sEstimateStatLst the sEstimateStatLst to set
     */
    public void setsEstimateStatLst(List<String> sEstimateStatLst) {
        this.sEstimateStatLst = sEstimateStatLst;
    }

    /**
     * @return the sSaleTp
     */
    public String getsSaleTp() {
        return sSaleTp;
    }

    /**
     * @param sSaleTp the sSaleTp to set
     */
    public void setsSaleTp(String sSaleTp) {
        this.sSaleTp = sSaleTp;
    }
}
