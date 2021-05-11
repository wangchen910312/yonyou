package chn.bhmc.dms.cmm.sci.vo;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 통화코드 정보 VO
 * </pre>
 *
 * @ClassName   : CurrencyVO.java
 * @Description :
 * @author Kang Seok Han
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CurrencyVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9179229962392259558L;

    /**
     * <pre>
     * 통화코드
     * <a href="http://www.iso.org/iso/home/standards/currency_codes.htm">ISO-4217 Currency Code</a>
     * </pre>
     */
    @NotEmpty
    @Length(min=1, max=10)
    private String currencyCd;

    /**
     * 통화기호
     */
    @NotEmpty
    @Length(min=1, max=10)
    private String currencySym;

    /**
     * <pre>
     * 통화기호 표시위치
     * P:앞쪽, S:뒤쪽
     * </pre>
     */
    @NotEmpty
    @Length(min=1, max=1)
    @Pattern(regexp="[P|S]")
    private String symbolPosTp;

    /**
     * 통화기준금액
     */
    @DecimalMin("0")
    private int exrUnitAmt;

    /**
     * 통화명
     */
    @NotEmpty
    @Length(max=50)
    private String currencyNm;

    /**
     * 소수점자리수
     */
    @DecimalMin("0")
    @DecimalMax("3")
    private int fractionCnt;

    /**
     * 숫자구분기호
     */
    @NotEmpty
    @Length(min=1, max=1)
    private String numberSym;

    /**
     * 소수점구분기호
     */
    @NotEmpty
    @Length(min=1, max=1)
    private String decimalSym;

    /**
     * <pre>
     * 환율관리대상여부
     * Y:환율관리대상
     * N:환율관리대상 아님
     * </pre>
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String exrTargYn;


    /**
     * @return the currencyCd
     */
    public String getCurrencyCd() {
        return currencyCd;
    }

    /**
     * @param currencyCd the currencyCd to set
     */
    public void setCurrencyCd(String currencyCd) {
        this.currencyCd = currencyCd;
    }

    /**
     * @return the currencySym
     */
    public String getCurrencySym() {
        return currencySym;
    }

    /**
     * @param currencySym the currencySym to set
     */
    public void setCurrencySym(String currencySym) {
        this.currencySym = currencySym;
    }

    /**
     * @return the symbolPosTp
     */
    public String getSymbolPosTp() {
        return symbolPosTp;
    }

    /**
     * @param symbolPosTp the symbolPosTp to set
     */
    public void setSymbolPosTp(String symbolPosTp) {
        this.symbolPosTp = symbolPosTp;
    }

    /**
     * @return the exrUnitAmt
     */
    public int getExrUnitAmt() {
        return exrUnitAmt;
    }

    /**
     * @param exrUnitAmt the exrUnitAmt to set
     */
    public void setExrUnitAmt(int exrUnitAmt) {
        this.exrUnitAmt = exrUnitAmt;
    }

    /**
     * @return the currencyNm
     */
    public String getCurrencyNm() {
        return currencyNm;
    }

    /**
     * @param currencyNm the currencyNm to set
     */
    public void setCurrencyNm(String currencyNm) {
        this.currencyNm = currencyNm;
    }

    /**
     * @return the fractionCnt
     */
    public int getFractionCnt() {
        return fractionCnt;
    }

    /**
     * @param fractionCnt the fractionCnt to set
     */
    public void setFractionCnt(int fractionCnt) {
        this.fractionCnt = fractionCnt;
    }

    /**
     * @return the numberSym
     */
    public String getNumberSym() {
        return numberSym;
    }

    /**
     * @param numberSym the numberSym to set
     */
    public void setNumberSym(String numberSym) {
        this.numberSym = numberSym;
    }

    /**
     * @return the decimalSym
     */
    public String getDecimalSym() {
        return decimalSym;
    }

    /**
     * @param decimalSym the decimalSym to set
     */
    public void setDecimalSym(String decimalSym) {
        this.decimalSym = decimalSym;
    }

    /**
     * @return the exrTargYn
     */
    public String getExrTargYn() {
        return exrTargYn;
    }

    /**
     * @param exrTargYn the exrTargYn to set
     */
    public void setExrTargYn(String exrTargYn) {
        this.exrTargYn = exrTargYn;
    }

}
