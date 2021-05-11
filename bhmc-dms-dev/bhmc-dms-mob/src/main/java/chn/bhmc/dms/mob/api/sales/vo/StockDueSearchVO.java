package chn.bhmc.dms.mob.api.sales.vo;

import java.util.ArrayList;
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

    private String eStockDt;

    // 모바일 바코드 리스트
    private String sIsBarCode;
    private List<String> barcodeList = new ArrayList<String>();

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
     * @return the eStockDt
     */
    public String geteStockDt() {
        return eStockDt;
    }

    /**
     * @param eStockDt the eStockDt to set
     */
    public void seteStockDt(String eStockDt) {
        this.eStockDt = eStockDt;
    }

    /**
     * @return the sIsBarCode
     */
    public String getsIsBarCode() {
        return sIsBarCode;
    }

    /**
     * @param sIsBarCode the sIsBarCode to set
     */
    public void setsIsBarCode(String sIsBarCode) {
        this.sIsBarCode = sIsBarCode;
    }

    /**
     * @return the barcodeList
     */
    public List<String> getBarcodeList() {
        return barcodeList;
    }

    /**
     * @param barcodeList the barcodeList to set
     */
    public void setBarcodeList(List<String> barcodeList) {
        this.barcodeList = barcodeList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
