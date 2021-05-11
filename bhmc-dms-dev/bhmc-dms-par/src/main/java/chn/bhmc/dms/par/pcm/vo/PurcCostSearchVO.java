package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 구매소요량 검색 VO
 *
 * @ClassName   : PurcCostSearchVO.java
 * @Description : PurcCostSearchVO Class
 * @author In Bo Shim
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 1.     In Bo Shim     최초 생성
 * </pre>
 */

public class PurcCostSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2984182446327461339L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 기준일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStdDt;

    /**
     * 구매소요량계산 여부
    **/
    private String sPurcCqtyCalcYn;

    /**
     * 종료여부
    **/
    private String sEndYn;

    /**
     * 공급처코드
    **/
    private String sBpCd;

    /**
     * 센터코드
    **/
    private String sPltCd;

    /**
     * 입고예정정보 반영여부
    **/
    private String sStockInYn;

    /**
     * 출고예정정보 반영여부
    **/
    private String sStockOutYn;

    /**
     * 현재고정보 반영여부
    **/
    private String sStockNowYn;

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
     * @return the sStdDt
     */
    public Date getsStdDt() {
        return sStdDt;
    }

    /**
     * @param sStdDt the sStdDt to set
     */
    public void setsStdDt(Date sStdDt) {
        this.sStdDt = sStdDt;
    }

    /**
     * @return the sPurcCqtyCalcYn
     */
    public String getsPurcCqtyCalcYn() {
        return sPurcCqtyCalcYn;
    }

    /**
     * @param sPurcCqtyCalcYn the sPurcCqtyCalcYn to set
     */
    public void setsPurcCqtyCalcYn(String sPurcCqtyCalcYn) {
        this.sPurcCqtyCalcYn = sPurcCqtyCalcYn;
    }

    /**
     * @return the sEndYn
     */
    public String getsEndYn() {
        return sEndYn;
    }

    /**
     * @param sEndYn the sEndYn to set
     */
    public void setsEndYn(String sEndYn) {
        this.sEndYn = sEndYn;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sStockInYn
     */
    public String getsStockInYn() {
        return sStockInYn;
    }

    /**
     * @param sStockInYn the sStockInYn to set
     */
    public void setsStockInYn(String sStockInYn) {
        this.sStockInYn = sStockInYn;
    }

    /**
     * @return the sStockOutYn
     */
    public String getsStockOutYn() {
        return sStockOutYn;
    }

    /**
     * @param sStockOutYn the sStockOutYn to set
     */
    public void setsStockOutYn(String sStockOutYn) {
        this.sStockOutYn = sStockOutYn;
    }

    /**
     * @return the sStockNowYn
     */
    public String getsStockNowYn() {
        return sStockNowYn;
    }

    /**
     * @param sStockNowYn the sStockNowYn to set
     */
    public void setsStockNowYn(String sStockNowYn) {
        this.sStockNowYn = sStockNowYn;
    }
}
