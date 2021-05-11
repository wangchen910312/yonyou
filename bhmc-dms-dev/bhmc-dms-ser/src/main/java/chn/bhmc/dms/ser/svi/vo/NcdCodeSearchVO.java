package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdCcdCodeSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 1.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class NcdCodeSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2017025572287725370L;


    private String sItemCd;

    private String sClsCd;

    private String sPhenCd;

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sClsCd
     */
    public String getsClsCd() {
        return sClsCd;
    }

    /**
     * @param sClsCd the sClsCd to set
     */
    public void setsClsCd(String sClsCd) {
        this.sClsCd = sClsCd;
    }

    /**
     * @return the sPhenCd
     */
    public String getsPhenCd() {
        return sPhenCd;
    }

    /**
     * @param sPhenCd the sPhenCd to set
     */
    public void setsPhenCd(String sPhenCd) {
        this.sPhenCd = sPhenCd;
    }

     





}
