package chn.bhmc.dms.sal.inv.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalSearchVO.java
 * @Description : 재고상태관리 조회 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockStateSearchVO extends SearchVO{

    private static final long serialVersionUID = -8306720351425909864L;

    private String sStockTpDS;          // 재고유형
    private String sCmpCarYn;           // 회사차여부
    private String sCmpCarDstinCd;      // 회사차구분
    private String sVinNo;              // 차대번호
    private String sStrgeCd;            // 창고
    private String sLocCd;              // 위치
    private String sCarlineCd;          // 차종
    private String sModelCd;            // 모델
    private String sOcnCd;              // OCN
    private String sExtColorCd;         // 외장색
    private String sIntColorCd;         // 내장색
    private String sDlrCd;              // 딜러코드
    private String salMng;              // 판매고문

    /**
     * @return the sStockTpDS
     */
    public String getsStockTpDS() {
        return sStockTpDS;
    }
    /**
     * @param sStockTpDS the sStockTpDS to set
     */
    public void setsStockTpDS(String sStockTpDS) {
        this.sStockTpDS = sStockTpDS;
    }
    /**
     * @return the sCmpCarYn
     */
    public String getsCmpCarYn() {
        return sCmpCarYn;
    }
    /**
     * @param sCmpCarYn the sCmpCarYn to set
     */
    public void setsCmpCarYn(String sCmpCarYn) {
        this.sCmpCarYn = sCmpCarYn;
    }
    /**
     * @return the sCmpCarDstinCd
     */
    public String getsCmpCarDstinCd() {
        return sCmpCarDstinCd;
    }
    /**
     * @param sCmpCarDstinCd the sCmpCarDstinCd to set
     */
    public void setsCmpCarDstinCd(String sCmpCarDstinCd) {
        this.sCmpCarDstinCd = sCmpCarDstinCd;
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
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }
    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }
    /**
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }
    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
    }
    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }
    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }
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
     * @return the salMng
     */
    public String getSalMng() {
        return salMng;
    }
    /**
     * @param salMng the salMng to set
     */
    public void setSalMng(String salMng) {
        this.salMng = salMng;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
