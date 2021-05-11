package chn.bhmc.dms.sal.dsc.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AuthorityFixSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 18.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class AuthorityFixSaveVO extends BaseSaveVO<Object>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2181529109220739399L;

    private String copyUsrId;


    private BaseSaveVO<AuthorityFixVO> subGridVO;

    /**
     * @return the copyUsrId
     */
    public String getCopyUsrId() {
        return copyUsrId;
    }

    /**
     * @param copyUsrId the copyUsrId to set
     */
    public void setCopyUsrId(String copyUsrId) {
        this.copyUsrId = copyUsrId;
    }

    /**
     * @return the subGridVO
     */
    public BaseSaveVO<AuthorityFixVO> getSubGridVO() {
        return subGridVO;
    }

    /**
     * @param subGridVO the subGridVO to set
     */
    public void setSubGridVO(BaseSaveVO<AuthorityFixVO> subGridVO) {
        this.subGridVO = subGridVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
