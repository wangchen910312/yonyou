package chn.bhmc.dms.cmm.apr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 결재문서 결재선 조회 VO
 * </pre>
 *
 * @ClassName   : SignLineSearchVO.java
 * @Description : 결재문서 결재선 조회 VO
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

public class SignLineSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 결재양식 ID
     */
    private String sSignDocId;

    /**
     * 결재양식명
     */
    private String sSignDocNm;

    /**
     * 결재문서번호
     */
    private String sSignDocNo;

    /**
     * 결재자 ID
     */
    private String sSignUsrId;

    /**
     * 사용유무
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
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sSignDocNo the sSignDocNo to set
     */
    public void setsSignDocNo(String sSignDocNo) {
        this.sSignDocNo = sSignDocNo;
    }

    /**
     * @return the sSignDocNo
     */
    public String getsSignDocNo() {
        return sSignDocNo;
    }

    /**
     * @param sSignUsrId the sSignUsrId to set
     */
    public void setsSignUsrId(String sSignUsrId) {
        this.sSignUsrId = sSignUsrId;
    }

    /**
     * @return the sSignUsrId
     */
    public String getsSignUsrId() {
        return sSignUsrId;
    }
}