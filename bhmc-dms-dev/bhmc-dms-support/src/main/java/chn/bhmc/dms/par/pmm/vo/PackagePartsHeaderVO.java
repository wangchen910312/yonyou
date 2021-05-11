package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 패키지 부품관리 VO
 *
 * @ClassName   : PackagePartsHeaderVO.java
 * @Description : PackagePartsHeaderVO Class
 * @author In Bo Shim
 * @since 2016. 11. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class PackagePartsHeaderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7186535014670795633L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 패키지품목코드
     */
    private String pkgItemCd;

    /**
     * 패키지품목명
     */
    private String pkgItemNm;

    /**
     * 패키지문서번호
     */
    private String pkgDocNo;

    /**
     * LTS모델코드
     */
    private String ltsModelCd;

    /**
     * 브랜드코드
     */
    private String brandCd;

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
     * 패키지 유형
     */
    private String pkgTp;

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
     * @return the pkgDocNo
     */
    public String getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(String pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
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

    public String getBrandCd() {
        return brandCd;
    }

    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
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

}
