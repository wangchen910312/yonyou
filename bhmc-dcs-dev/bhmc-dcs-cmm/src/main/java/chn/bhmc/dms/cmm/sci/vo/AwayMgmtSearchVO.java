package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayMgmtSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class AwayMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1852628199456183911L;

    private String sSearchDt;
    private String sUsrId;
    private String sUsrNm;
    private String sEmpNo;

    /**
     * @return the sSearchDt
     */
    public String getsSearchDt() {
        return sSearchDt;
    }
    /**
     * @param sSearchDt the sSearchDt to set
     */
    public void setsSearchDt(String sSearchDt) {
        this.sSearchDt = sSearchDt;
    }
    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }
    /**
     * @return the sUsrNm
     */
    public String getsUsrNm() {
        return sUsrNm;
    }
    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
    }
    /**
     * @return the sEmpNo
     */
    public String getsEmpNo() {
        return sEmpNo;
    }
    /**
     * @param sEmpNo the sEmpNo to set
     */
    public void setsEmpNo(String sEmpNo) {
        this.sEmpNo = sEmpNo;
    }
}