package chn.bhmc.dms.bat.ser.svi.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLaborCodeDetailVO.java
 * @Description : 공임코드 상세 VO
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */
public class BatLaborCodeDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 433227499160786674L;

    /**
     * 구분코드
     */
    private String dstinCd;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    private String lbrCd;

    /**
     * 공임코드명
     */
    private String lbrNm;

    /**
     * 수량
     */
    private int lbrQty;


    /**
     * LTS MODEL 코드
     */
    private String ltsModelCd;

    /**
     * LTS MODEL 명
     */
    private String ltsModelNm;

    /**
     * 공임시간
     */
    private Double lbrHm;

    /**
     * 유효시작일자
     */
    private Date validStartDt;

    /**
     * 유효종료일자
     */
    private Date validEndDt;

    /**
     * 삭제여부
     */
    private String delYn;

    private Double lbrRate01; /** 일반  **/

    private Double lbrRate02; /** 보증  **/

    private Double lbrRate03; /** 보험  **/

    private Double lbrRate04; /** 내부  **/

    private Double lbrRate05; /** 판금페인트  **/

    private String ltsModelCd_input;

    /**
     * 브랜드 코드
     */
    private String brandCd;


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
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
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
     * @return the validStartDt
     */
    public Date getValidStartDt() {
        return validStartDt;
    }

    /**
     * @param validStartDt the validStartDt to set
     */
    public void setValidStartDt(Date validStartDt) {
        this.validStartDt = validStartDt;
    }


    /**
     * @return the validEndDt
     */
    public Date getValidEndDt() {
        return validEndDt;
    }

    /**
     * @param validEndDt the validEndDt to set
     */
    public void setValidEndDt(Date validEndDt) {
        this.validEndDt = validEndDt;
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
     * @return the lbrRate01
     */
    public Double getLbrRate01() {
        return lbrRate01;
    }

    /**
     * @param lbrRate01 the lbrRate01 to set
     */
    public void setLbrRate01(Double lbrRate01) {
        this.lbrRate01 = lbrRate01;
    }

    /**
     * @return the lbrRate02
     */
    public Double getLbrRate02() {
        return lbrRate02;
    }

    /**
     * @param lbrRate02 the lbrRate02 to set
     */
    public void setLbrRate02(Double lbrRate02) {
        this.lbrRate02 = lbrRate02;
    }

    /**
     * @return the lbrRate03
     */
    public Double getLbrRate03() {
        return lbrRate03;
    }

    /**
     * @param lbrRate03 the lbrRate03 to set
     */
    public void setLbrRate03(Double lbrRate03) {
        this.lbrRate03 = lbrRate03;
    }

    /**
     * @return the lbrRate04
     */
    public Double getLbrRate04() {
        return lbrRate04;
    }

    /**
     * @param lbrRate04 the lbrRate04 to set
     */
    public void setLbrRate04(Double lbrRate04) {
        this.lbrRate04 = lbrRate04;
    }

    /**
     * @return the lbrRate05
     */
    public Double getLbrRate05() {
        return lbrRate05;
    }

    /**
     * @param lbrRate05 the lbrRate05 to set
     */
    public void setLbrRate05(Double lbrRate05) {
        this.lbrRate05 = lbrRate05;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    public String getLtsModelCd_input() {
        return ltsModelCd_input;
    }

    public void setLtsModelCd_input(String ltsModelCd_input) {
        this.ltsModelCd_input = ltsModelCd_input;
    }



}
