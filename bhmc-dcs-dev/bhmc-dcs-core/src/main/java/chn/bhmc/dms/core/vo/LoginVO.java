package chn.bhmc.dms.core.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserVO.java
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

public class LoginVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -832290369504446480L;

    /**
     * 아이디
     */
    private String usrId;

    /**
     * 이름
     */
    private String usrNm;

    /**
     * 비밀번호
     */
    private String usrPw;

    /**
     * 활성여부
     * Y : 활성
     * N : 비활성
     */
    private String enabledYn;

    /**
     * 삭제여부
     * Y : 활성
     * N : 비활성
     */
    private String delYn;

    /**
     * 언어코드
     */
    private String langCd;

    /**
     * 사원번호
     */
    private String empNo;

    /**
     * 테마 ID
     */
    private String themeId;

    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the usrPw
     */
    public String getUsrPw() {
        return usrPw;
    }

    /**
     * @param usrPw the usrPw to set
     */
    public void setUsrPw(String usrPw) {
        this.usrPw = usrPw;
    }

    /**
     * @return the enabledYn
     */
    public String getEnabledYn() {
        return enabledYn;
    }

    /**
     * @param enabledYn the enabledYn to set
     */
    public void setEnabledYn(String enabledYn) {
        this.enabledYn = enabledYn;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }

    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

}
