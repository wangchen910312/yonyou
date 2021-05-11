package chn.bhmc.dms.sal.inv.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InventoryDueDiligenceSearchVO.java
 * @Description : 재고실사 조회 조건 VO
 * @author Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     Bong              최초 생성
 * </pre>
 */

public class InventoryDueDiligenceSearchVO extends SearchVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6190006800224766581L;

    private String sStockDdYyMm;          // 재고년월
    private String sStockDdDstinCd;       // 실사구분
    private String sVinNo;                // VIN_NO
    private String sConfirmYn;            // 확인여부
    private List<?> barcodeList;


    /**
     * @return the barcodeList
     */
    public List<?> getBarcodeList() {
        return barcodeList;
    }
    /**
     * @param barcodeList the barcodeList to set
     */
    public void setBarcodeList(List<?> barcodeList) {
        this.barcodeList = barcodeList;
    }
    /**
     * @return the sStockDdYyMm
     */
    public String getsStockDdYyMm() {
        return sStockDdYyMm;
    }
    /**
     * @param sStockDdYyMm the sStockDdYyMm to set
     */
    public void setsStockDdYyMm(String sStockDdYyMm) {
        this.sStockDdYyMm = sStockDdYyMm;
    }
    /**
     * @return the sStockDdDstinCd
     */
    public String getsStockDdDstinCd() {
        return sStockDdDstinCd;
    }
    /**
     * @param sStockDdDstinCd the sStockDdDstinCd to set
     */
    public void setsStockDdDstinCd(String sStockDdDstinCd) {
        this.sStockDdDstinCd = sStockDdDstinCd;
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
