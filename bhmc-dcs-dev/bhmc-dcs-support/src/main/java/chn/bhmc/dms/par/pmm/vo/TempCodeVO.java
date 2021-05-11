package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TempCodeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public class TempCodeVO {

    /**
     * 사용자코드
     */
    @NotEmpty
    private String usrCd;

    /**
     * 사용자명
     */
    @NotEmpty
    private String usrNm;

    /**
     * @return the usrCd
     */
    public String getUsrCd() {
        return usrCd;
    }

    /**
     * @param usrCd the usrCd to set
     */
    public void setUsrCd(String usrCd) {
        this.usrCd = usrCd;
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

}
