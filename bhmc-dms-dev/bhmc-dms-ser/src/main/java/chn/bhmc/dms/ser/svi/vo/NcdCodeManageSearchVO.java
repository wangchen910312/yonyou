package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdCodeManageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class NcdCodeManageSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2530304597566686415L;

    /**
     * 현상코드 레벨
     */
    private String sPhenDstinCd;
    /**
     * 현상코드 대분류
     */
    private String sPhenLclsCd;
    /**
     * 현상코드 중분류
     */
    private String sPhenMclsCd;
    /**
     * 현상코드
     */
    private String sPhenCd;
    /**
     * 사용여부
     */
    private String sDelYn;

    /**
     * 현상코드 명칭
     */
    private String sPhenNm;

    /**
     * @return the sPhenDstinCd
     */
    public String getsPhenDstinCd() {
        return sPhenDstinCd;
    }

    /**
     * @param sPhenDstinCd the sPhenDstinCd to set
     */
    public void setsPhenDstinCd(String sPhenDstinCd) {
        this.sPhenDstinCd = sPhenDstinCd;
    }

    /**
     * @return the sPhenLclsCd
     */
    public String getsPhenLclsCd() {
        return sPhenLclsCd;
    }

    /**
     * @param sPhenLclsCd the sPhenLclsCd to set
     */
    public void setsPhenLclsCd(String sPhenLclsCd) {
        this.sPhenLclsCd = sPhenLclsCd;
    }

    /**
     * @return the sPhenMclsCd
     */
    public String getsPhenMclsCd() {
        return sPhenMclsCd;
    }

    /**
     * @param sPhenMclsCd the sPhenMclsCd to set
     */
    public void setsPhenMclsCd(String sPhenMclsCd) {
        this.sPhenMclsCd = sPhenMclsCd;
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

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

    /**
     * @return the sPhenNm
     */
    public String getsPhenNm() {
        return sPhenNm;
    }

    /**
     * @param sPhenNm the sPhenNm to set
     */
    public void setsPhenNm(String sPhenNm) {
        this.sPhenNm = sPhenNm;
    }
 
    
}
