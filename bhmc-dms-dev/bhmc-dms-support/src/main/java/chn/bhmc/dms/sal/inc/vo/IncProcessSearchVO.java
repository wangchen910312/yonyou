package chn.bhmc.dms.sal.inc.vo;


import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * @ClassName   : IncProcessSearchVO
 * @Description : 보험추적 검색 VO
 * @author Kim Jin Suk
 * @since 2017. 02. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 02. 02.    Kim Jin Suk            최초 생성
 */

public class IncProcessSearchVO extends BaseSearchVO {
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 2336627086286171980L;
    
    /**
     * 딜러코드    
     **/
    private  String           sDlrCd;           
     
    /**
     * 보험번호    
     **/
    private  String           sIncNo;           
     
    /**
     * 일련번호    
     **/
    private  String           sSeq;

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
     * @return the sIncNo
     */
    public String getsIncNo() {
        return sIncNo;
    }

    /**
     * @param sIncNo the sIncNo to set
     */
    public void setsIncNo(String sIncNo) {
        this.sIncNo = sIncNo;
    }

    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}