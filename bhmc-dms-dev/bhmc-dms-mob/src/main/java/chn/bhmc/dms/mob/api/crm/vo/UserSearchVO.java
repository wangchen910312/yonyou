package chn.bhmc.dms.mob.api.crm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class UserSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 443699297954731896L;

    /**
     * 검색필드
     * USRID : 사용자ID
     * USRNM : 사용자명
     * EMPNO : 사원번호
     */
    private List<String> sFields;

    /**
     * 활성여부
     */
    private String sEnabledYn;

    /**
     * 삭제여부
     */
    private String sDelYn;

    /**
     * 사용자ID
     */
    private String sUsrId;

    /**
     * 사용자명
     */
    private String sUsrNm;

    /**
     * 사원번호
     */
    private String sEmpNo;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 딜러코드-조회 제외
     */
    private String sExcludeDlrCd;

    /**
     * 부서코드
     */
    private String sDeptCd;

    /**
     * 직무코드
     */
    private String sTskCd;

    /**
     * 직무상세
     */
    private String sTskDetl;

    /**
     * 부서명칭
     */
    private String sDeptNm;

    /**
     * 직무명칭
     */
    private String sTskNm;

    /**
     * 클레인 신청 권한 여부
     */
    private String sClaimReqPermYn;

    /**
     * @return the sFields
     */
    public List<String> getsFields() {
        return sFields;
    }

    /**
     * @param sFields the sFields to set
     */
    public void setsFields(List<String> sFields) {
        this.sFields = sFields;
    }

    /**
     * @return the sEnabledYn
     */
    public String getsEnabledYn() {
        return sEnabledYn;
    }

    /**
     * @param sEnabledYn the sEnabledYn to set
     */
    public void setsEnabledYn(String sEnabledYn) {
        this.sEnabledYn = sEnabledYn;
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
     * @return the sExcludeDlrCd
     */
    public String getsExcludeDlrCd() {
        return sExcludeDlrCd;
    }

    /**
     * @param sExcludeDlrCd the sExcludeDlrCd to set
     */
    public void setsExcludeDlrCd(String sExcludeDlrCd) {
        this.sExcludeDlrCd = sExcludeDlrCd;
    }

    /**
     * @return the sDeptCd
     */
    public String getsDeptCd() {
        return sDeptCd;
    }

    /**
     * @param sDeptCd the sDeptCd to set
     */
    public void setsDeptCd(String sDeptCd) {
        this.sDeptCd = sDeptCd;
    }

    /**
     * @return the sTskCd
     */
    public String getsTskCd() {
        return sTskCd;
    }

    /**
     * @param sTskCd the sTskCd to set
     */
    public void setsTskCd(String sTskCd) {
        this.sTskCd = sTskCd;
    }

    /**
     * @return the sTskDetl
     */
    public String getsTskDetl() {
        return sTskDetl;
    }

    /**
     * @param sTskDetl the sTskDetl to set
     */
    public void setsTskDetl(String sTskDetl) {
        this.sTskDetl = sTskDetl;
    }

    /**
     * @return the sClaimReqPermYn
     */
    public String getsClaimReqPermYn() {
        return sClaimReqPermYn;
    }

    /**
     * @param sClaimReqPermYn the sClaimReqPermYn to set
     */
    public void setsClaimReqPermYn(String sClaimReqPermYn) {
        this.sClaimReqPermYn = sClaimReqPermYn;
    }

    /**
     * @return the sDeptNm
     */
    public String getsDeptNm() {
        return sDeptNm;
    }

    /**
     * @param sDeptNm the sDeptNm to set
     */
    public void setsDeptNm(String sDeptNm) {
        this.sDeptNm = sDeptNm;
    }

    /**
     * @return the sTskNm
     */
    public String getsTskNm() {
        return sTskNm;
    }

    /**
     * @param sTskNm the sTskNm to set
     */
    public void setsTskNm(String sTskNm) {
        this.sTskNm = sTskNm;
    }
}
