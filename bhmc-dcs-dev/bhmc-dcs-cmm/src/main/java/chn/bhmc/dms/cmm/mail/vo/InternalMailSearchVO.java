package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class InternalMailSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6121440888570163054L;

    private String sIntMailId;
    private String sIntMailTitleNm;
    private String sResvDt;
    private String sStartResvDt;
    private String sEndResvDt;
    private String sResvSendYn;

    /**
     * @return the sIntMailId
     */
    public String getsIntMailId() {
        return sIntMailId;
    }
    /**
     * @param sIntMailId the sIntMailId to set
     */
    public void setsIntMailId(String sIntMailId) {
        this.sIntMailId = sIntMailId;
    }
    /**
     * @return the sIntMailTitleNm
     */
    public String getsIntMailTitleNm() {
        return sIntMailTitleNm;
    }
    /**
     * @param sIntMailTitleNm the sIntMailTitleNm to set
     */
    public void setsIntMailTitleNm(String sIntMailTitleNm) {
        this.sIntMailTitleNm = sIntMailTitleNm;
    }
    /**
     * @return the sResvDt
     */
    public String getsResvDt() {
        return sResvDt;
    }
    /**
     * @param sResvDt the sResvDt to set
     */
    public void setsResvDt(String sResvDt) {
        this.sResvDt = sResvDt;
    }
    /**
     * @return the sStartResvDt
     */
    public String getsStartResvDt() {
        return sStartResvDt;
    }
    /**
     * @param sStartResvDt the sStartResvDt to set
     */
    public void setsStartResvDt(String sStartResvDt) {
        this.sStartResvDt = sStartResvDt;
    }
    /**
     * @return the sEndResvDt
     */
    public String getsEndResvDt() {
        return sEndResvDt;
    }
    /**
     * @param sEndResvDt the sEndResvDt to set
     */
    public void setsEndResvDt(String sEndResvDt) {
        this.sEndResvDt = sEndResvDt;
    }
    /**
     * @return the sResvSendYn
     */
    public String getsResvSendYn() {
        return sResvSendYn;
    }
    /**
     * @param sResvSendYn the sResvSendYn to set
     */
    public void setsResvSendYn(String sResvSendYn) {
        this.sResvSendYn = sResvSendYn;
    }
}