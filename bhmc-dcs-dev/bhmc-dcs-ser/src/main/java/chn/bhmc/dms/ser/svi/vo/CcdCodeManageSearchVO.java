package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CcdCodeManageSearchVO.java
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

public class CcdCodeManageSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6811131845550002435L;

    /**
     * 원인코드
     */
    private String sCauCd;
    /**
     * 원인코드명
     */
    private String sCauNm;
    /**
     * 사용유무
     */
    private String sDelYn;
    
    /**
     * 원인/페인트 구분
     */
    private String sCauDstinCd;
    
    /**
     * @return the sCauCd
     */
    public String getsCauCd() {
        return sCauCd;
    }
    /**
     * @param sCauCd the sCauCd to set
     */
    public void setsCauCd(String sCauCd) {
        this.sCauCd = sCauCd;
    }
    /**
     * @return the sCauNm
     */
    public String getsCauNm() {
        return sCauNm;
    }
    /**
     * @param sCauNm the sCauNm to set
     */
    public void setsCauNm(String sCauNm) {
        this.sCauNm = sCauNm;
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
     * @return the sCauDstinCd
     */
    public String getsCauDstinCd() {
        return sCauDstinCd;
    }
    /**
     * @param sCauDstinCd the sCauDstinCd to set
     */
    public void setsCauDstinCd(String sCauDstinCd) {
        this.sCauDstinCd = sCauDstinCd;
    }
    
    



}
