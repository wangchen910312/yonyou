package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 작업Package master VO
 * </pre>
 *
 * @ClassName   : PackageMasterVO.java
 * @Description : 작업Package master VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PackageMasterVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5137654610907884139L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * LTS MODEL CD
     */
    private String ltsModelCd;

    /**
     * 패키지 문서번호
     */
    private int pkgDocNo;

    /**
     * package 품목코드
     */
    @NotEmpty
    private String pkgItemCd;

    /**
     * package 품목명
     */
    private String pkgItemNm;

    /**
     * 공급상구분
     */
    private String spyrCd;

    /**
     * 브랜드코드
     */
    private String brandCd;

    /**
     * 부품 총금액
     */
    private Double itemTotAmt;

    /**
     * 공임 총금액
     */
    private Double lbrTotAmt;

    /**
     * 총금액
     */
    private Double totAmt;

    /**
     * 패키지 유효시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pkgStartDt;

    /**
     * 패키지 유효종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pkgEndDt;

    /**
     * 패키지유형
     */
    private String pkgTp;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //PKG_UPDT_DT_STR(패키지마스터용)
    private  String          pkgUpdtDtStr;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR(부품마스터용)
    private  String          updtDtStr;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getPkgItemCd() {
        return pkgItemCd;
    }

    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the pkgItemNm
     */
    public String getPkgItemNm() {
        return pkgItemNm;
    }

    /**
     * @param pkgItemNm the pkgItemNm to set
     */
    public void setPkgItemNm(String pkgItemNm) {
        this.pkgItemNm = pkgItemNm;
    }

    /**
     * @return the spyrCd
     */
    public String getSpyrCd() {
        return spyrCd;
    }

    /**
     * @param spyrCd the spyrCd to set
     */
    public void setSpyrCd(String spyrCd) {
        this.spyrCd = spyrCd;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    /**
     * @return the pkgDocNo
     */
    public int getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(int pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
    }


    public String getBrandCd() {
        return brandCd;
    }

    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    public Double getItemTotAmt() {
        return itemTotAmt;
    }

    public void setItemTotAmt(Double itemTotAmt) {
        this.itemTotAmt = itemTotAmt;
    }

    public Double getLbrTotAmt() {
        return lbrTotAmt;
    }

    public void setLbrTotAmt(Double lbrTotAmt) {
        this.lbrTotAmt = lbrTotAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the pkgStartDt
     */
    public Date getPkgStartDt() {
        return pkgStartDt;
    }

    /**
     * @param pkgStartDt the pkgStartDt to set
     */
    public void setPkgStartDt(Date pkgStartDt) {
        this.pkgStartDt = pkgStartDt;
    }

    /**
     * @return the pkgEndDt
     */
    public Date getPkgEndDt() {
        return pkgEndDt;
    }

    /**
     * @param pkgEndDt the pkgEndDt to set
     */
    public void setPkgEndDt(Date pkgEndDt) {
        this.pkgEndDt = pkgEndDt;
    }

    /**
     * @return the pkgTp
     */
    public String getPkgTp() {
        return pkgTp;
    }

    /**
     * @param pkgTp the pkgTp to set
     */
    public void setPkgTp(String pkgTp) {
        this.pkgTp = pkgTp;
    }

    /**
     * @return the pkgUpdtDtStr
     */
    public String getPkgUpdtDtStr() {
        return pkgUpdtDtStr;
    }

    /**
     * @param pkgUpdtDtStr the pkgUpdtDtStr to set
     */
    public void setPkgUpdtDtStr(String pkgUpdtDtStr) {
        this.pkgUpdtDtStr = pkgUpdtDtStr;
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

}
