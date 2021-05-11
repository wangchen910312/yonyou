package chn.bhmc.dms.dply.dms.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DmsProfileSaveVO extends BaseSaveVO<DmsProfileVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1218559747934403674L;

    /**
     * Dms Dealer의 Deploy 대상 여부
     *
     */

    private String flag;

    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }

}
