package chn.bhmc.dms.sal.orm.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderChartVO
 * @Description : 오더 자원표VO
 * @author Kim JinSuk
 * @since 2017. 12. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 12. 15.   Kim JinSuk               최초 생성
 * </pre>
 */

public class OrderChartSearchVO extends BaseSearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5374593523765652037L;

    private String sOrdYymm;
    private String sOrdWeek;
    private String strYn;
    private String tUseYn;
    private String sCarlineCd;
    private String sOcnCd;
    private String sOcnDesc;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sOrdTp;

    private int    sOrdSeq;

    /**
     * @return the sOrdYymm
     */
    public String getsOrdYymm() {
        return sOrdYymm;
    }
    /**
     * @param sOrdYymm the sOrdYymm to set
     */
    public void setsOrdYymm(String sOrdYymm) {
        this.sOrdYymm = sOrdYymm;
    }
    /**
     * @return the sOrdWeek
     */
    public String getsOrdWeek() {
        return sOrdWeek;
    }
    /**
     * @param sOrdWeek the sOrdWeek to set
     */
    public void setsOrdWeek(String sOrdWeek) {
        this.sOrdWeek = sOrdWeek;
    }
    /**
     * @return the strYn
     */
    public String getStrYn() {
        return strYn;
    }
    /**
     * @param strYn the strYn to set
     */
    public void setStrYn(String strYn) {
        this.strYn = strYn;
    }
    /**
     * @return the tUseYn
     */
    public String gettUseYn() {
        return tUseYn;
    }
    /**
     * @param tUseYn the tUseYn to set
     */
    public void settUseYn(String tUseYn) {
        this.tUseYn = tUseYn;
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
     * @return the sOcnDesc
     */
    public String getsOcnDesc() {
        return sOcnDesc;
    }
    /**
     * @param sOcnDesc the sOcnDesc to set
     */
    public void setsOcnDesc(String sOcnDesc) {
        this.sOcnDesc = sOcnDesc;
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
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }
    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
    }
    /**
     * @return the sOrdSeq
     */
    public int getsOrdSeq() {
        return sOrdSeq;
    }
    /**
     * @param sOrdSeq the sOrdSeq to set
     */
    public void setsOrdSeq(int sOrdSeq) {
        this.sOrdSeq = sOrdSeq;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}