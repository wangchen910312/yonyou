package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부품판매 VO
 *
 * @ClassName   : PartsSaleOrdVO.java
 * @Description : PartsSaleOrdVO Class
 * @author Ju Won Lee
 * @since 2018. 2. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 08.     Ju Won Lee    최초 생성
 * </pre>
 */
public class PartsSaleOrdVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4480981519418159602L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String issDlrCd;

    /**
     * 딜러명
     **/
    private String dlrNm;

    /**
     * 년월
     **/
    private String issYymm;

    /**
     * 판매건수
     **/
    private double issSaleCnt;

    /**
     * 판매수량
     **/
    private double issSaleQty;

    /**
     * 판매금액
     **/
    private double issSaleAmt;

    /**
     * 할인금액
     **/
    private double issDcAmt;

    /**
     * 세금제외금액
     **/
    private double issTaxDdctAmt;

    /**
     * 세금금액
     **/
    private double issTaxAmt;

    /**
     * @return the issDlrCd
     */
    public String getIssDlrCd() {
        return issDlrCd;
    }

    /**
     * @param issDlrCd the issDlrCd to set
     */
    public void setIssDlrCd(String issDlrCd) {
        this.issDlrCd = issDlrCd;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the issYymm
     */
    public String getIssYymm() {
        return issYymm;
    }

    /**
     * @param issYymm the issYymm to set
     */
    public void setIssYymm(String issYymm) {
        this.issYymm = issYymm;
    }

    /**
     * @return the issSaleCnt
     */
    public double getIssSaleCnt() {
        return issSaleCnt;
    }

    /**
     * @param issSaleCnt the issSaleCnt to set
     */
    public void setIssSaleCnt(double issSaleCnt) {
        this.issSaleCnt = issSaleCnt;
    }

    /**
     * @return the issSaleQty
     */
    public double getIssSaleQty() {
        return issSaleQty;
    }

    /**
     * @param issSaleQty the issSaleQty to set
     */
    public void setIssSaleQty(double issSaleQty) {
        this.issSaleQty = issSaleQty;
    }

    /**
     * @return the issSaleAmt
     */
    public double getIssSaleAmt() {
        return issSaleAmt;
    }

    /**
     * @param issSaleAmt the issSaleAmt to set
     */
    public void setIssSaleAmt(double issSaleAmt) {
        this.issSaleAmt = issSaleAmt;
    }

    /**
     * @return the issDcAmt
     */
    public double getIssDcAmt() {
        return issDcAmt;
    }

    /**
     * @param issDcAmt the issDcAmt to set
     */
    public void setIssDcAmt(double issDcAmt) {
        this.issDcAmt = issDcAmt;
    }

    /**
     * @return the issTaxDdctAmt
     */
    public double getIssTaxDdctAmt() {
        return issTaxDdctAmt;
    }

    /**
     * @param issTaxDdctAmt the issTaxDdctAmt to set
     */
    public void setIssTaxDdctAmt(double issTaxDdctAmt) {
        this.issTaxDdctAmt = issTaxDdctAmt;
    }

    /**
     * @return the issTaxAmt
     */
    public double getIssTaxAmt() {
        return issTaxAmt;
    }

    /**
     * @param issTaxAmt the issTaxAmt to set
     */
    public void setIssTaxAmt(double issTaxAmt) {
        this.issTaxAmt = issTaxAmt;
    }

}
