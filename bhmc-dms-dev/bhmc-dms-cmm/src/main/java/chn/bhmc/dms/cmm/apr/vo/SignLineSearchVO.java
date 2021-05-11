package chn.bhmc.dms.cmm.apr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SecuredResourceSearchVO.java
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

public class SignLineSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 검색구분
     */

    private String sSignDocId;

    /**
     * 검색구분
     */

    private String sSignDocNo;

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
     * 검색값
     */

    private String sSignDocNm;

    /**
     * 결재자 Id
     */

    private String sSignUsrId;


    /**
     * 사용유무
     */

    private String sUseYn;



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
