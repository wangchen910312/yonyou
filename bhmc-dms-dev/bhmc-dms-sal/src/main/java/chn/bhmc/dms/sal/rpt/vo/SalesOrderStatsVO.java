package chn.bhmc.dms.sal.rpt.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesOrderStatsVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 20.     Choi Kyung Yong     최초 생성
 * </pre>
 */

public class SalesOrderStatsVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2746474176724737217L;

    private String CarlineCD;
    private String CarlineNm;
    private int MSale;
    private int MnOrd;
    private int OrdCnt;
    /**
     * @return the carlineCD
     */
    public String getCarlineCD() {
        return CarlineCD;
    }
    /**
     * @param carlineCD the carlineCD to set
     */
    public void setCarlineCD(String carlineCD) {
        CarlineCD = carlineCD;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return CarlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        CarlineNm = carlineNm;
    }
    /**
     * @return the mSale
     */
    public int getMSale() {
        return MSale;
    }
    /**
     * @param mSale the mSale to set
     */
    public void setMSale(int mSale) {
        MSale = mSale;
    }
    /**
     * @return the mnOrd
     */
    public int getMnOrd() {
        return MnOrd;
    }
    /**
     * @param mnOrd the mnOrd to set
     */
    public void setMnOrd(int mnOrd) {
        MnOrd = mnOrd;
    }
    /**
     * @return the ordCnt
     */
    public int getOrdCnt() {
        return OrdCnt;
    }
    /**
     * @param ordCnt the ordCnt to set
     */
    public void setOrdCnt(int ordCnt) {
        OrdCnt = ordCnt;
    }


}
