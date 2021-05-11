package chn.bhmc.dms.cmm.apr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DocSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DocSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5660874674170362322L;

    /**
     * 결재양식 ID
     */
    private String sSignDocId;

    /**
     * 결재양식명
     */
    private String sSignDocNm;

    /**
     * 상신알람여부
     */
     private String sSignAlrtYn;

     /**
      * 콜백알람여부
      */
     private String sSignCallBackAlrtYn;

    /**
     * 사용여부
     */
    private String sUseYn;

    /**
     * @return the sSignDocId
     */
    public String getsSignDocId() {
        return sSignDocId;
    }

    /**
     * @param sSignDocId the sSignDocId to set
     */
    public void setsSignDocId(String sSignDocId) {
        this.sSignDocId = sSignDocId;
    }

    /**
     * @return the sSignDocNm
     */
    public String getsSignDocNm() {
        return sSignDocNm;
    }

    /**
     * @param sSignDocNm the sSignDocNm to set
     */
    public void setsSignDocNm(String sSignDocNm) {
        this.sSignDocNm = sSignDocNm;
    }

    /**
     * @return the sSignAlrtYn
     */
    public String getsSignAlrtYn() {
        return sSignAlrtYn;
    }

    /**
     * @param sSignAlrtYn the sSignAlrtYn to set
     */
    public void setsSignAlrtYn(String sSignAlrtYn) {
        this.sSignAlrtYn = sSignAlrtYn;
    }

    /**
     * @return the sSignCallBackAlrtYn
     */
    public String getsSignCallBackAlrtYn() {
        return sSignCallBackAlrtYn;
    }

    /**
     * @param sSignCallBackAlrtYn the sSignCallBackAlrtYn to set
     */
    public void setsSignCallBackAlrtYn(String sSignCallBackAlrtYn) {
        this.sSignCallBackAlrtYn = sSignCallBackAlrtYn;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
}
