package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockDueSearchVO
 * @Description : 재고실사 조회 VO
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 08. 04.   Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockDueSearchVO extends SearchVO{

    /**
     * Statements
     */
    private static final long serialVersionUID = 3208062743712977869L;

    private String sDlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               sStockDt;

    private String sAgingCntRange;

    private String sVinNo;

    private String sConfirmYn;

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
     * @return the sStockDt
     */
    public Date getsStockDt() {
        return sStockDt;
    }

    /**
     * @param sStockDt the sStockDt to set
     */
    public void setsStockDt(Date sStockDt) {
        this.sStockDt = sStockDt;
    }

    /**
     * @return the sAgingCntRange
     */
    public String getsAgingCntRange() {
        return sAgingCntRange;
    }

    /**
     * @param sAgingCntRange the sAgingCntRange to set
     */
    public void setsAgingCntRange(String sAgingCntRange) {
        this.sAgingCntRange = sAgingCntRange;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sConfirmYn
     */
    public String getsConfirmYn() {
        return sConfirmYn;
    }

    /**
     * @param sConfirmYn the sConfirmYn to set
     */
    public void setsConfirmYn(String sConfirmYn) {
        this.sConfirmYn = sConfirmYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
