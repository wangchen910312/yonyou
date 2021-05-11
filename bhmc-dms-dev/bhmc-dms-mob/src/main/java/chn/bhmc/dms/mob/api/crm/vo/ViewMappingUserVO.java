package chn.bhmc.dms.mob.api.crm.vo;


/**
 * <pre>
 * 화면-사용자 매핑 사용자 정보
 * </pre>
 *
 * @ClassName   : ViewAuthoritiesUserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 16.  Kang Seok Han     최초 생성
 * </pre>
 */

public class ViewMappingUserVO extends UserVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3325823232815611178L;

    /**
     * 마스크
     */
    private int mask;

    /**
     * @return the mask
     */
    public int getMask() {
        return mask;
    }

    /**
     * @param mask the mask to set
     */
    public void setMask(int mask) {
        this.mask = mask;
    }
}
