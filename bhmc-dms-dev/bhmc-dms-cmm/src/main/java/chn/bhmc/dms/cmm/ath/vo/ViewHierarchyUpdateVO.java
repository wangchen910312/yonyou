package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewHierarchyUpdateVO.java
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
public class ViewHierarchyUpdateVO extends BaseVO {



	/**
	 *
	 */
	private static final long serialVersionUID = -5589660058848327053L;

    /**
     * 변경전 화면계층 정보
     */
    private ViewHierarchyVO oldVO;

    /**
     * 변경후 화면계층 정보
     */
    private ViewHierarchyVO newVO;

    public ViewHierarchyVO getOldVO() {
        return oldVO;
    }
    public void setOldVO(ViewHierarchyVO oldVO) {
        this.oldVO = oldVO;
    }
    public ViewHierarchyVO getNewVO() {
        return newVO;
    }
    public void setNewVO(ViewHierarchyVO newVO) {
        this.newVO = newVO;
    }

}
